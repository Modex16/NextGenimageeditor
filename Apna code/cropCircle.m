function [ output ] = cropCircle(input)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[rows, cols, color]=size(input);
a = rows/2;
b = cols/2;
r = min(a,b);
output = input;
%fprintf('%d %d %d\n',a,b,r);
for x=1:rows
    for y=1:cols
        if ((x-a)^2 + (y-b)^2) > r^2
           output(x,y,:) = 255; 
        end
    end
end
end

