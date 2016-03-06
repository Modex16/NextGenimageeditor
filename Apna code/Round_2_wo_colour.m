vid=videoinput('winvideo', 1, 'YUY2_640x480');
vPlayer= vision.VideoPlayer('Name','Fingure tip tracker','Position',[10 100 660 500]);
fun= vision.VideoPlayer('Name','Image editor','Position',[740 -100 1060 800]);
src = getselectedsource(vid);
set(vid, 'ReturnedColorspace', 'rgb')
preview(vid);
image=imread('ie.jpg');
image=imresize(image,[480 640]);
im1=getsnapshot(vid);
im1=rgb2gray(im1);
[m,n]= size(im1);
count=0;
while 1
%     im=getsnapshot(vid);
%     [a,b,c]=size(im);
% for i=1:a
%      for j=1:b
%          if im(i,j,3)<50 && im(i,j,3)>20  && im(i,j,1)<150 && im(i,j,1)>100 && im(i,j,2)<80 && im(i,j,2)>20
%              im(i,j,:)=255;
%          else
%              im(i,j,:)=0;
%          end
%       end
% end
% q=im2bw(im);
% q = imdilate(q,strel('diamond',10));
% q=bwareaopen(q,500);
im= getsnapshot(vid);
    k=im;
    im=rgb2gray(im);
    l=im1-im;
    l(:,1:80)=0;
   % l(:,560:640)=0;
    l(1:80,:)=0;
   % l(440:480,:)=0;
   % l = fliplr(l);
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



l=fliplr(l);
[w,num]=bwlabel(l,4);
e=regionprops(w,'Centroid');
if num==1
[a1]=e.Centroid;
c1=a1(1);
c2=a1(2);
if (c2>388 && c2<443 && c1>410 && c1<610)
    image(388:440,410:610,:)=image(388:440,410:610,:)-40;
    count=count+1;
    disp(count);
    if count>=5
      tts('Exiting the editor with slideshow');
      close all force;
      slide_show;
      break;
    end
elseif (c2>204 && c2<257 && c1>410 && c1<610)
    image(204:257,410:610,:)=image(204:257,410:610,:)-40;
    count=count+1;
    if count>=5
        tts('Starting the innovative image editor');
      Continuous_output1;
      close all force;
      break;
    end
elseif (c2>45 && c2<98 && c1>410 && c1<610)
    image(45:98,410:610,:)=image(45:98,410:610,:)-40;
    count=count+1;
    disp(count);
    if count>=5
        tts('Starting the basic image editor');
      Continuous_output;
      close all force;
      break;
    end
else
    count=0;
end
imag=makeSpot(image,c1,c2);
step(fun,imag);
end
step(vPlayer,l);
end