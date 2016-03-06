vid=videoinput('winvideo', 1, 'YUY2_640x480');
vPlayer= vision.VideoPlayer('Name','IMAGE','Position',[10 100 660 500]);
fun= vision.VideoPlayer('Name','Segmented Image','Position',[740 100 660 500]);
src = getselectedsource(vid);
set(vid, 'ReturnedColorspace', 'rgb')
preview(vid);
image=imread('ie.jpg');
image=imresize(image,[480 640]);
count=0;
while 1
    im=getsnapshot(vid);
    [a,b,c]=size(im);
for i=1:a
     for j=1:b
         if im(i,j,3)>140 && im(i,j,1)<40 && im(i,j,2)<120
             im(i,j,:)=255;
         else
             im(i,j,:)=0;
         end
      end
end
q=im2bw(im);
q = imdilate(q,strel('diamond',10));
q=bwareaopen(q,500);
q=fliplr(q);
[w,num]=bwlabel(q,4);
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
      tts('Exit');
      close all force;
      break;
    end
elseif (c2>204 && c2<257 && c1>410 && c1<610)
    image(204:257,410:610,:)=image(204:257,410:610,:)-20;
    count=count+1;
    disp(count);
    if count>=5
      tts('Our Innovations');
      close all force;
      Continuous_output;
      break;
    end
elseif (c2>45 && c2<98 && c1>410 && c1<610)
    image(45:98,410:610,:)=image(45:98,410:610,:)-40;
    count=count+1;
    disp(count);
    if count>=5
      tts('Basic Image Editor');
      close all force;
      break;
    end
else
    count=0;
end
imag=makeSpot(image,c1,c2);
step(fun,imag);
end
step(vPlayer,q);
end