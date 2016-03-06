%d='C:\Users\Arjit\Documents\MATLAB\dataset';
clearvars -except theta2;
for j=0:4
    d=fullfile('F:\workshop related\Mosaic16\dataset',num2str(j));
    cd(d);
e=dir(fullfile('F:\workshop related\Mosaic16\dataset',num2str(j),'*.png'));



% im = imread(e(1).name);
% %imtool(im);
% im1 = bwlabel(im);
% %imtool(im1);
%  stats = regionprops(im1,'BoundingBox');
%  a5 = stats(1).BoundingBox;
% imA=imcrop(im1,a5);
% imtool(imA);
% 

for i=1:30
    path('F:\workshop related\Mosaic16\Apna code',path)
    i1=imread(e(i).name);
%     if islogical(i1)==0
     i1 = im2bw(i1);
%     end
%     l = bwlabel(i1);
%     stats = regionprops(l,'BoundingBox');
%     a5 = stats(1).BoundingBox ;
    imA=bound(i1);
%     if (j==8 && i==2)
%         imtool(imA);
%     end
%     b=bwboundaries(i1,'noholes');
%     imA=imcrop(i1,[min(b{1}(1,:)) min(b{1}(:,1)) max(b{1}(1,:)) max(b{1}(:,1))]);
% %    imA=im2bw(imA);
    im=imresize(imA,[50 50]);
%     if (j==8 && i==2)
%         imtool(im);
%     end
    im1=(im(:))';%unrolled in a row of 2500 elements
    if (i==1)
        Y=[1,im1];
    else
        Y=[Y;[1,im1]];
    end
end  
if (j==0)
    X=Y;
else
    X=[X;Y];
end
end
%fprintf('%d  %d',size(X));
for i=1:5
    for j=(30*(i-1)+1):(30*(i-1)+30)
        v(j)=i;
    end
end
%fprintf('%d  %d',size(v));
v=v';
%d=fullfile('C:\Users\LENOVO\Documents\MATLAB\dataset',num2str(j),'New folder');
    cd('F:\workshop related\Mosaic16\Apna code');
%fprintf('%d  %d',size(y));
lambda = 0.1;
[theta1] = oneVsAll(X,v,5, lambda);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 3: Predict for One-Vs-All ================
%  After ...
pred = predictOneVsAll(theta1, X);

fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == v)) * 100);

