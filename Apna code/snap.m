vid=videoinput('winvideo', 1, 'YUY2_640x480');
vPlayer= vision.VideoPlayer;
fun= vision.VideoPlayer;
src = getselectedsource(vid);
set(vid, 'ReturnedColorspace', 'rgb')
preview(vid);

im1=getsnapshot(vid);
close all force;
imtool(im1);
