%����һ�� 1��6ͬһ���ֹ��ղ�ͬ��������Ϊ0.27
PathRoot='C:\Users\hasee\Desktop\03Polyu_Pamprin\Polyu_Pamprint_600\';
list=dir(PathRoot);
fileNum=(size(list)-3); %��������
fileNum=fileNum(1,1);
%hosp(hamming of same palm)
%hodp(hamming of different palm)
counthosp=0;
counthodp=0;
for i=1:fileNum/6%ͬһ���������ھ���,fileNum/6������
    for j=1:5
        for k=j+1:6
            picgaborcode1=singletest((i-1)*6+j);
            picgaborcode2=singletest((i-1)*6+k);
            [m,n]=size(picgaborcode1);
            diversitysum=0;
            %Horz��ʾͼ1ˮƽƽ�ƣ�-1��ʾ��ƽ��1��-2��ʾ��ƽ��2��0��ʾ��ƽ�ƣ�1��ʾ��ƽ��1��2��ʾ��ƽ��2
            %Vert��ʾͼ1��ֱƽ�ƣ�-1��ʾ��ƽ��1��-2��ʾ��ƽ��2��0��ʾ��ƽ�ƣ�1��ʾ��ƽ��1��2��ʾ��ƽ��2
            %��Vert=0��
            %Horz=-2ʱ��a1=1:m,b1=3:n,a2=1:m,b2=1:n-2
            %Horz=-1ʱ��a1=1:m,b1=2:n,a2=1:m,b2=1:n-1
            %Horz=0ʱ��a1=1:m,b1=1:n,a2=1:m,b2=1:n
            %Horz=1ʱ��a1=1:m,b1=1:n-1,a2=1:m,b2=2:n
            %Horz=2ʱ��a1=1:m,b1=3:n,a2=1:m,b2=1:n-2
            %��Horz=0��
            %Vert=-2ʱ��a1=1:m-2,b1=1:n,a2=3:m,b2=1:n
            %Vert=-1ʱ��a1=1:m-1,b1=1:n,a2=2:m,b2=1:n
            %Vert=0ʱ��a1=1:m,b1=1:n,a2=1:m,b2=1:n
            %Vert=1ʱ��a1=2:m,b1=1:n,a2=1:m-1,b2=1:n
            %Vert=2ʱ��a1=3:m,b1=1:n,a2=1:m-2,b2=1:n
            %�Ƚ�
            for a=1:m
                for b=1:n
                    if picgaborcode1(a,b)~=picgaborcode2(a,b)
                         diversitysum=diversitysum+1;
                    end
                end
            end
            
            hamming=diversitysum/(m*n);
            counthosp=counthosp+1;
            hosp(1,counthosp)=hamming;
        end
    end
end
save hosp hosp;      
 for i=1:fileNum/6-1%��ͬ������������,fileNum/6������
    for j=1:6
        for k=i*6+1:fileNum
             picgaborcode1=singletest((i-1)*6+j);
             picgaborcode2=singletest(k);
             [m,n]=size(picgaborcode1);
             diversitysum=0;
            for a=1:n
                if picgaborcode1(1,a)~=picgaborcode2(1,a)
                     diversitysum=diversitysum+1;
                end
            end
            hamming=diversitysum/(m*n);
            counthodp=counthodp+1;
            hodp(1,counthodp)=hamming;
        end
    end
end       
save hodp hodp;          
