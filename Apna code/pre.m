vid=videoinput('winvideo', 1, 'YUY2_640x480');
vPlayer= vision.VideoPlayer('Name','IMAGE','Position',[10 100 660 500]);
fun= vision.VideoPlayer('Name','Segmented Image','Position',[740 100 660 500]);
src = getselectedsource(vid);
set(vid, 'ReturnedColorspace', 'rgb')
preview(vid);
hello=0;
im1=imread('Ankit1.jpg');
im1 = imresize(im1,[480 640]);
% imtool(k);
% [a,b,c]=size(im);
i1=0;
j1=0;
k1=640;
l1=480;
count1=0;
count2=0;
count=0;
temp123=im1;
while 1
    tic
    if count2~=0
        im1=temp123;
        count2=count2+1;
    end
    im=getsnapshot(vid);
    [a,b,c]=size(im);
    temp12345=b;
for i=1:a
     for j=1:b
         if im(i,j,3)>140 && im(i,j,1)<40 && im(i,j,2)<120
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
     tempangle=atand((a2(2)-a1(2))/(a2(1)-a1(1)));
    difangle=(tempangle-resangle);
    tempangle=difangle;
%     if (abs(difangle))>150
%         difangle=-1*difangle -140;
%     end
    
    %disp(difangle);
    if abs(tempangle-difangle)>100
        difangle=difangle+abs(tempangle);
    end
    dif=temp-res;
    i1=dif;
    j1=dif;
    k1=640-dif;
    l1=480-dif;
    
    a=imcrop(im1,[i1+difx j1+dify 640-2*i1 480-2*j1]);
    
    
   
%
%     a=imcrop(im1,[i1+tmidx j1+tmidy 640-2*i1 480-2*j1]);
    rot=imrotate(a,difangle);
  % c = makeSpot(rot,a1,a2);
    b=imresize(rot,[480 640]);
    p=b;
end
if num==3
    detectFace(b);
end
if num>=2 
step(vPlayer,b);
end
if num==1
        
       hello=hello+1;
       if hello==25
           imwrite(p,'image.jpg','jpg');
           tts('Image Saved in the final frame');
           close all force;
           imtool(p);
           break;
       end
end
q=fliplr(q);
step(fun,q);
toc
end

           