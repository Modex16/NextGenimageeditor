% b=bwboundaries(p,'noholes');
%     imA=imcrop(p,[min(b{1}(:,1)) min(b{1}(1,:)) max(b{1}(:,1)) max(b{1}(1,:))];
%     %imA=im2bw(imA);
%     im=imresize(imA,[50 50]);
%     im1=(im(:))';
%     im2=[1 im1];
%     %im3=im2';
function im2 = inputX(imb)

    l = bwlabel(imb);
    stats = regionprops(l,'BoundingBox');
    a6 = stats(1).BoundingBox ;
    q=imcrop(imb,a6);
 
    
    im=imresize(q,[50 50]);
    im1=(im(:))';
    im2=[1 im1];
    %im3=im2';
end
    