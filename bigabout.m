function [bgabout]=bigabout(gabout)
[m,n]=size(gabout);
bgabout=zeros(m,n);
sum=0;
for i=1:m
    for j=1:n
        sum=sum+gabout(i,j);
    end
end
avg=sum/(m*n);
for i=1:m
    for j=1:n
         if(gabout(i,j)<=avg)
            bgabout(i,j)=0;
        else
            bgabout(i,j)=1;
        end
        
    end
end
% %·Ö³É16*16¸ö8*8
% for i=1:fix(m/8)
%     for j=1:fix(n/8)
%         subsum=0;
%         for a=1:8
%             for b=1:8
%                 subsum=subsum+gabout((i-1)*8+a,(j-1)*8+b);
%             end
%         end
%         subavg=subsum/(8*8);                    
%         if(subavg<=avg)
%             bgabout(i,j)=0;
%         else
%             bgabout(i,j)=1;
%         end
%         
%         
%         
%     end
% end