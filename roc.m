load hosp.mat;
load hodp.mat;
%�����ÿ��0.01ͳ��һ�Σ���ΧΪ0~0.5��һ����ʮ���㣬������λС��
s=size(hosp);
d=size(hodp);
numhosp=zeros(1,0.5/0.01);
numhodp=zeros(1,0.5/0.01);
%ͳ�Ƹ���
for i=1:s(1,2)
    numhosp(1,fix(100*hosp(1,i)))=numhosp(1,fix(100*hosp(1,i)))+1;
end
for i=1:d(1,2)
    numhodp(1,fix(100*hodp(1,i)))=numhodp(1,fix(100*hodp(1,i)))+1;
end
x=0.01:0.01:0.50;
figure(1),
hs=numhosp(1,fix((x*100)))/s(1,2);
hd=numhodp(1,fix((x*100)))/d(1,2);
plot(x,hs,x,hd);
xlabel('��������');
ylabel('�ٷֱ�(%)');
title(' Genuine and imposter distributions');

figure(2),
FRR=zeros(1,50);
FAR=zeros(1,50);
eer=0;
eerx=0;
mindis=1;
for i=1:1:50
    FRR(i)=1-sum(hs(1:i));
    FAR(i)=sum(hd(1:i));
    if abs(FRR(i)-FAR(i))<mindis
        mindis=FRR(i)-FAR(i);
        eer=FRR(i);
        eerx=0.01*(i-1);
    end
end
FRR(FRR<0)=0;
x=0.01:0.01:0.50;
plot(x,FRR(fix((x*100))),x,FAR(fix((x*100))));
title(' FRR(b)��FAR(r)');
%ROC
figure(3),
x=0.01:0.01:0.50;
semilogx(100*FAR(fix((x*100))),100*(1-FRR(fix((x*100)))));
xlabel('FAR((%))');
ylabel('GAR(%)');
title('ROC');

