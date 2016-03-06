vid=videoinput('winvideo', 1, 'YUY2_640x480');
vPlayer= vision.VideoPlayer('Name','IMAGE IN GALLERY','Position',[10 100 660 500]);
fun= vision.VideoPlayer('Name','GESTURE DETECTOR','Position',[740 100 660 500]);
src = getselectedsource(vid);
set(vid, 'ReturnedColorspace', 'rgb')
preview(vid);
hello=0;
j5=1;
filename=strcat('Ankit',num2str(j5),'.jpg');
    im1=imread(filename);
    im1=imresize(im1,[480 640]);
% imtool(k);
% [a,b,c]=size(im);
i1=0;
kd=0;
a5=0;
j1=0;
k1=640;
l1=480;
timeC=0;
iniTime=clock;
t1=iniTime(5)*60+iniTime(6);
count1=0;
count2=0;
count=0;
bright1=0;
bright=im1;
while 1
    a5=0;
   % bright1=0;
    im=getsnapshot(vid);
    [a,b,c]=size(im);
for i=1:a
     for j=1:b
          if im(i,j,3)>100 && im(i,j,1)<40 && im(i,j,2)<120
             im(i,j,:)=255;
             
            % im1(i,j,:)=0;
         else
             im(i,j,:)=0;
         end
      end
end

%imtool(t)
q=im2bw(im);
q = imdilate(q,strel('diamond',10));
q=bwareaopen(q,500);
[w,num]=bwlabel(q,4);
e=regionprops(w,'Centroid');
if num~=0
    iniTime=clock;
    t1=iniTime(5)*60+iniTime(6);
   
end
if num>=2
    [a1,a2]=e.Centroid;
    if count==0
        res=abs(a2(2)-a1(2))+abs(a2(1)-a1(1));
        initx=(a1(1)+a2(1))/2;
        
    inity=(a1(2)+a2(2))/2;
        res1=abs(a2(1)-a1(1));
        count=count+1;
        resangle=atand((a2(2)-a1(2))/(a2(1)-a1(1)));
    end
    temp=abs(a2(2)-a1(2))+abs(a2(1)-a1(1));
     tempx=(a1(1)+a2(1))/2;
     tempy=(a1(2)+a2(2))/2;
     difx=tempx-initx;
    dify=tempy-inity;
%     dmidx=tmidx-midx;
%     dmidy=tmidy-midy;
%    temp1=abs(a2(1)-a1(1));
%      tempangle=atand((a2(2)-a1(2))/(a2(1)-a1(1)));
%     difangle=(tempangle-resangle);
%     tempangle=difangle;
%     if (abs(difangle))>150
%         difangle=-1*difangle -140;
%     end
    
    %disp(difangle);
%     if abs(tempangle-difangle)>100
%         difangle=difangle+abs(tempangle);
%     end
    dif=temp-res;
    i1=dif;
    j1=dif;
    k1=640-dif;
    l1=480-dif;
    
    a=imcrop(im1,[i1+difx j1+dify 640-2*i1 480-2*j1]);
    
    
   
%
%     a=imcrop(im1,[i1+tmidx j1+tmidy 640-2*i1 480-2*j1]);
   % rot=imrotate(a,difangle);
  % c = makeSpot(rot,a1,a2);
    b=imresize(a,[480 640]);
    p=b;
    bright=b;
end
if num==0
    
        curTime=clock;
    t2=curTime(5)*60+curTime(6);
    if t2-t1>=7
        tts('exiting gallery');
        close all force;
        tts('thank you');
        hFig = figure('Name','APP',...
    'Numbertitle','off',...
    'Position', [0 -170 1936 1964   ],...
    'WindowStyle','modal',...
    'Color',[0.5 0.5 0.5],...
    'Toolbar','none');
img = imread('thank_you.jpg');
img = imresize(img,[864 1536]);
fpos = get(hFig,'Position');
axOffset = (fpos(3:4)-[size(img,2) size(img,1)])/2;
ha = axes('Parent',hFig,'Units','pixels',...
            'Position',[axOffset size(img,2) size(img,1)]);
 
hImshow = imshow(img,'Parent',ha);
        %imtool('thank_you.jpg');
        pause(50);
    end
end

if num==1
   % kd=kd+1;
    [qw]=e.Centroid;
    %bright=p;
       if bright1==0
           initb=qw(1);
        
           bright1=bright1+1;
       end
       tempb=qw(1);
       
       difb=tempb-initb;
       if (difb>100 && j5~=1)
           j5=j5-1;
           filename=strcat('Ankit',num2str(j5),'.jpg');
           a5=a5+1;
           bright=imread(filename);
           bright=imresize(bright,[480 640]);
           b=bright;
           bright1=0;
           tts('previous image');
          % pause(2);
       end
       if (difb<-100 && j5~=11)
           j5=j5+1;
           a5=a5+1;
           filename=strcat('Ankit',num2str(j5),'.jpg');
           bright=imread(filename);
           bright=imresize(bright,[480 640]);
           b=bright;
           bright1=0;
           tts('next image');
         %  pause(2);
       end
         
       b=bright;
      % b=imresize(bright,[480 640]);
       %imresize(b,[480 640]);
%        hello=hello+1;
%        if hello==25
%            imwrite(p,'image.jpg','jpg');
%            tts('Image Saved in the final frame');
%            close all force;
%            imtool(p);
%            break;
%        end
end
if num>=1 
step(vPlayer,b);
end
if num==8
    step(fun,br);
end
q=fliplr(q);
step(fun,q);
if a5==1
    pause(1.5);
end
end

           