load hosp.mat;
load hodp.mat;
%差异度每隔0.01统计一次，范围为0~0.5，一共五十个点，保留两位小数
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
xlabel('汉明距离');
ylabel('百分比(%)');
title(' Genuine and imposter distributions');