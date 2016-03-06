function [ boundimage ] = bound( image )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    [m,n]=size(image);
    left=0;up=0;
    right = n;down=m;
    for i=1:m
        for j=1:n
            if image(i,j)==1
                up = i;
              %  fprintf('%d ',up);
                break;
            end
        end
        if j<n
            break
        end
    end
    for i=1:n
        for j=1:m
            if image(j,i)==1
                left = i;
               %  fprintf('%d ',left);
                break
            end
        end
        if j<m
            break
        end
    end
    for i=1:m
        for j=1:n
            if image(m+1-i,n+1-j)==1
                down = m+1-i;
            %     fprintf('%d ',down);
             break
            end
        end
        if j<n
            break
        end
    end
    for i=1:n
        for j=1:m
            if image(m+1-j,n+1-i)==1
                right = n+1-i;
            %     fprintf('%d ',right);
                break
            end
        end
        if j<m
            break
        end
    end
    boundimage = imcrop(image,[left,up,right-left,down-up]);

end

