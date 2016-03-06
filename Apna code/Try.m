vid=videoinput('winvideo', 1, 'YUY2_640x480');
vPlayer= vision.VideoPlayer;
fun= vision.VideoPlayer;
src = getselectedsource(vid);
set(vid, 'ReturnedColorspace', 'rgb')
preview(vid);
% pause(3);
% result1=getsnapshot(vid);
while 1
result=getsnapshot(vid);
for i=1:480
    for j=1:640
        if result(i,j,3)<110 && result(i,j,1)>150 &&  result(i,j,2)<110 && result(i,j,2)>70 && result(i,j,2)>70
            result(i,j,:)=255;
        else
            result(i,j,:)=0;
        end
    end
end
 step(vPlayer,result);
end