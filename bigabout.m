% function [bgabout]=bigabout(gabout)% %ÿ�ķ���ȡ���Ͻǣ���128*128�ֳ�64*64������64*64��ֵ��
% [m,n]=size(gabout);
% bgabout=zeros(fix(m/4),fix(n/4));
% sum=0;
% for i=1:fix(m/4)
%     for j=1:fix(n/4)
%         sum=sum+gabout(4*i-3,4*j-3);
%     end
% end
% avg=sum/((fix(m/4))*(fix(n/4)));
% for i=1:fix(m/4)
%     for j=1:fix(n/4)
%          if(gabout(4*i-3,4*j-3)<=avg)
%             bgabout(i,j)=0;
%         else
%             bgabout(i,j)=1;
%          end 
%     end
% end
function [bgabout]=bigabout(gabout)% %ÿ�ķ���ȡ���Ͻǣ���128*128�ֳ�64*64������64*64��ֵ��
[m,n]=size(gabout);
bgabout=zeros(fix(m/4),fix(n/4));
for i=1:fix(m/4)
    for j=1:fix(n/4)
         if(gabout(4*i-3,4*j-3)<=0)
            bgabout(i,j)=0;
        else
            bgabout(i,j)=1;
         end 
    end
end

