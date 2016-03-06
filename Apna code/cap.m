FDetect = vision.CascadeObjectDetector;

%Read the input image
I = imread('Ankit1.jpg');
%I = imresize(I,[1936,2592]);

%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);
%im = imread('Ankit1.jpg');
ip = imread('caps.jpg');
imtool(ip);
tts('select the cap you want through gesture');
choose;
if pred==1
    tts('you selected cap two. Displaying the saved image');
capy = imread('cap5.jpg');
elseif pred==2
         tts('you selected cap three. Displying the saved image');
       capy = imread('cap.jpg'); 
elseif pred==3
             tts('you selected cap four. Displaying the saved image');
           capy = imread('cap7.jpg');
end
capy = imresize(capy,[400 400]);
a=BB(2,1);
b=BB(2,2);
im = imread('Ankit1.jpg');
%im = imresize(im, [1936 2592]);
for i=b-399:b
    for j=a:a+399
if capy(i-b+400,j-a+1,2:3)<240
    im(i,j,:)= capy(i-b+400,j-a+1,:);
end
    end
end
a = BB(1,1);
b = BB(1,2);
for i=b-399:b
    for j=a:a+399
if capy(i-b+400,j-a+1,2:3)<240
    im(i,j,:)= capy(i-b+400,j-a+1,:);
end
    end
end
a = BB(3,1);
b = BB(3,2);
for i=b-399:b
    for j=a:a+399
if capy(i-b+400,j-a+1,2:3)<240
    im(i,j,:)= capy(i-b+400,j-a+1,:);
end
    end
end
imwrite(im,'Ankit11.jpg','jpg');
imtool(im);
%tts('Placing caps ,wait for a while');