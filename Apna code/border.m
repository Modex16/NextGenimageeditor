ix = imread('Ankit2.jpg');
ix = imresize(ix,[1024 576]);
bod1 = imread('2.jpg');
bod2 = imread('3.jpg');
bod3 = imread('4.jpg');
bod4 = imread('5.jpg');
bod5 = imread('6.jpg');
bod6 = imread('7.jpg');
set(figure, 'Position', [10, 10, 1900, 700]);
subplot(1,6,1),subimage(bod1),set(gca,'XTick',[]);set(gca,'YTick',[]);
subplot(1,6,2),subimage(bod2);set(gca,'XTick',[]);set(gca,'YTick',[]);
subplot(1,6,3),subimage(bod3),set(gca,'XTick',[]);set(gca,'YTick',[]);
subplot(1,6,4),subimage(bod4),set(gca,'XTick',[]);set(gca,'YTick',[]);
subplot(1,6,5),subimage(bod5),set(gca,'XTick',[]);set(gca,'YTick',[]);
subplot(1,6,6),subimage(bod6),set(gca,'XTick',[]);set(gca,'YTick',[]);
pause(1);
tts('select the border you want through gesture');
choose;
close all force;
bod1 = bod1+ix;
bod2 = bod2+ix;
bod3 = bod3+ix;
bod4 = bod4+ix;
bod5 = bod5+ix;
bod6 = bod6+ix;
if pred==1
    tts('you selected border number two. Displaying the saved image');
    bod2 = imresize(bod2,[1024 1976]);
    imwrite(bod2,'Ankit10.jpg','jpg');
imtool(bod2);
elseif pred==2
        tts('you selected border number three. Displaying the saved image');
        bod3 = imresize(bod3,[1224 1976]);
        imwrite(bod3,'Ankit10.jpg','jpg');
       imtool(bod3); 
elseif pred==3
            tts('you selected border number four. Displaying the saved image');
           bod4 = imresize(bod4,[1024 1976]);
           imwrite(bod4,'Ankit10.jpg','jpg');
           imtool(bod4); 
end