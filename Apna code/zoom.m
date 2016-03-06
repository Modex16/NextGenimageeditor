vid=videoinput('winvideo', 1, 'YUY2_640x480');
vPlayer= vision.VideoPlayer;
fun= vision.VideoPlayer;
src = getselectedsource(vid);
set(vid, 'ReturnedColorspace', 'rgb')
preview(vid);

 im1=imread('Ankit1.jpg');
 %imtool(im1);
 im1 = imresize(im1,[480,640]);
% [a,b,c]=size(im);
i1=0;
j1=0;
k1=640;
l1=480;
count=0;
while 1
    im=getsnapshot(vid);
    [a,b,c]=size(im);
for i=1:a
     for j=1:b
         if im(i,j,3)<50 && im(i,j,3)>20  && im(i,j,1)<150 && im(i,j,1)>100 && im(i,j,2)<80 && im(i,j,2)>20
             im(i,j,:)=255;
         else
             im(i,j,:)=0;
         end
      end
end

%imtool(t)
q=im2bw(im);
q = imdilate(q,strel('diamond',30));
[w,num]=bwlabel(q,4);
e=regionprops(w,'Centroid');
if num==2
    [a1,a2]=e.Centroid;
    if count==0
        res=abs(a2(2)-a1(2))+abs(a2(1)-a1(1));
      %  res1=abs(a2(1)-a1(1));
        count=count+1;
       % resangle=atand((a2(2)-a1(2))/(a2(1)-a1(1)));
    end
    temp=abs(a2(2)-a1(2))+abs(a2(1)-a1(1));
%    temp1=abs(a2(1)-a1(1));
   % tempangle=atand((a2(2)-a1(2))/(a2(1)-a1(1)));
   % difangle=tempangle-resangle;
    dif=temp-res;
    i1=dif;
    j1=dif;
    k1=640-dif;
    l1=480-dif;
    
    
    a=imcrop(im1,[i1 j1 640-2*i1 480-2*j1]);
   % rot=imrotate(a,difangle);
    b=imresize(a,[480 640]);
    
end
if num==2
step(vPlayer,b);
end
step(fun,q);
end


    