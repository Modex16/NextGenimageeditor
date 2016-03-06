i = imread('Ankit2.jpg');
i = imresize(i,[968,1296]);
im = i(:,1:648,:);
im1 = i(:,649:1296,:);
imwrite(im,'Ankit5.jpg','jpg');
imwrite(im1,'Ankit6.jpg','jpg');
h = figure;
set(figure, 'Position', [350, -200, 1296, 968]);subplot(1,2,1),subimage(im),set(gca,'XTick',[]);set(gca,'YTick',[]),subplot(1,2,2),subimage(im1);set(gca,'XTick',[]);set(gca,'YTick',[]);
%savefig(h,'Ankit5.fig');