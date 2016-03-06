tts('loading an image with text');
i = imread('text.jpg');
str = urlread('http://localhost/try/try.php?url=ankitmishra2215.hostoi.com/acfg1332dhf.jpg');
imtool(i);
imwrite(i,'Ankit9.jpg','jpg');
tts('The image contains the text.');
tts(str);
disp(str);