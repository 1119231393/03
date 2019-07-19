load hosp.mat;
load hodp.mat;
%�����ÿ��0.01ͳ��һ�Σ���ΧΪ0~0.5��һ����ʮ���㣬������λС��
s=size(hosp);
d=size(hodp);
numhosp=zeros(1,0.5/0.01);
numhodp=zeros(1,0.5/0.01);
for i=1:s(1,2)
    numhosp(1,fix(100*hosp(1,i)))=numhosp(1,fix(100*hosp(1,i)))+1;
end
for i=1:d(1,2)
    numhodp(1,fix(100*hodp(1,i)))=numhodp(1,fix(100*hodp(1,i)))+1;
end
x=0:0.01:0.49;
figure(1),
hs=numhosp(1,fix((x*100))+1)/s(1,2);
hd=numhodp(1,fix((x*100))+1)/d(1,2);
plot(x,hs*100,x,hd*100);
xlabel('��������');
ylabel('�ٷֱ�(%)');
title(' Genuine and imposter distributions');