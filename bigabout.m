function [bgabout]=bigabout(gabout)% %ÿ�ķ���ȡ���Ͻǣ���128*128�ֳ�64*64������64*64��ֵ��
[m,n]=size(gabout);
bgabout=zeros(fix(m/2),fix(n/2));
sum=0;
for i=1:fix(m/2)
    for j=1:fix(n/2)
        sum=sum+gabout(2*i-1,2*j-1);
    end
end
avg=sum/((fix(m/2))*(fix(n/2)));
for i=1:fix(m/2)
    for j=1:fix(n/2)
         if(gabout(2*i-1,2*j-1)<=avg)
            bgabout(i,j)=0;
        else
            bgabout(i,j)=1;
        end
        
    end
end

