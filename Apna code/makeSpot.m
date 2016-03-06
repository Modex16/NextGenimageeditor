function [ output ] = makeSpot( input ,c1, c2)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here;
output = input;
%fprintf('%d %d',size(output));
%fprintf('%d %d %d\n',a,b,r);
a1 = floor(c1);
a2 = floor(c2);
% for x=floor(c1(1))-5:floor(c1(1))+5
%     for y=floor(c1(2))-5:floor(c1(2))+5
%         output(y,x,1)=255;
%         output(y,x,2:3)=0;
%     end
% end
% %fprintf('%d %d',size(output));
% for x=floor(c2(1))-5:floor(c2(1))+5
%     for y=floor(c2(2))-5:floor(c2(2))+5
%         output(y,x,1)=255;
%         output(y,x,2:3)=0;
%     end
% end
for x=a1-5:a1+5
    for y=a2-5:a2+5
        output(y,x,1)=255;
        output(y,x,2:3)=0;
    end
end
%fprintf('%d %d',size(output));
end

