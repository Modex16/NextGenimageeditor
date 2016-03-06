vid=videoinput('winvideo', 1, 'YUY2_640x480');
vPlayer= vision.VideoPlayer('Name','IMAGE','Position',[500 100 760 600]);
fun= vision.VideoPlayer('Name','Segmented Image','Position',[740 100 660 500]);
src = getselectedsource(vid);
set(vid, 'ReturnedColorspace', 'rgb');
preview(vid);
image = imread('Ankit1.jpg');
a=zeros(480,640);
im1=getsnapshot(vid);
im1=rgb2gray(im1);
[m,n]= size(im1);
count=1;
time = 1;
c = clock;
t1 = c(5)*60+c(6);
while time
    d = clock;
    t2 = d(5)*60+d(6);
    if t2-t1>=7
        time = 0;
    end    
    im= getsnapshot(vid);
    k=im;
    im=rgb2gray(im);
    l=im1-im;
    l(:,1:80)=0;
    l(:,560:640)=0;
    l(1:80,:)=0;
    l(440:480,:)=0;
    l = fliplr(l);
 for i=1:m
     for j=1:n
         if l(i,j)>20
             l(i,j)=255;
         else
             l(i,j)=0;
         end
     end
 end
     l=im2bw(l);
    l=bwareaopen(l,1000);
 for i=1:m-21
     for j=40:600
         if l(i,j)==1
             count1=0;
             for k=1:20
                 if l(i+k,j)==1
                     count1=count1+1;
                 end
                 if count1==20
                     w1=i+k;
                     l(:,:)=0;
                     for p=w1-20:w1
                         l(p,j:j+20)=1;
                     end
                     i=m-21;
                     j=600;
                    % step(vPlayer,l);
                 end
             end
         end
     end
 end
      a=a+l;
      
     % imtool(a);
    
    step(vPlayer,l);
%    step(vPlayer,im-im1);
%    step(fun, imIllusion);
    %step(fun, fliplr(imGray));

end
a = imdilate(a,strel('diamond',10));
close all force;
imtool(a);
%%
    imA=bound(a);
    imtool(imA);
     im=imresize(imA,[50 50]);
     imtool(im);
     im1 = (im(:))';
     im1 = [1 im1];
     pred = predictOneVsAll(theta2,im1);
    % tts(pred);
     disp(pred);
%       if pred==1
%           tts('You have ordered to crop the image circularly.');
%           ip = cropCircle(image);
%           imtool(ip);
%       end
% %       if pred==2
% %           tts('You have ordered to save the image');
% %       end
%       if pred==8
%           extract_text;
%       end
%       if pred==4
%           tts('You have ordered to detect the faces');
%           facePhoto;
%       end
%       if pred==3
%           tts('You have ordered to bisect the image vertically')
%           divide;
%       end
%       if pred==10
%           cap;
%       end
%%
 % imwrite(a,strcat('F:\workshop related\Mosaic16\dataset\',num2str(1),'.png'),'png');