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
            hamming=hammingcompare((i-1)*6+j,(i-1)*6+k);
            counthosp=counthosp+1;
            hosp(1,counthosp)=hamming;
        end
    end
end
save hosp hosp;      
 for i=1:fileNum/6-1%��ͬ������������,fileNum/6������
    for j=1:6
        for k=i*6+1:fileNum
            hamming=hammingcompare((i-1)*6+j,k);
            counthodp=counthodp+1;
            hodp(1,counthodp)=hamming;
        end
    end
end       
save hodp hodp;          
