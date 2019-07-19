function [picgaborcode]=singletest(picnumber)
PathRoot='C:\Users\hasee\Desktop\03Polyu_Pamprin\Polyu_Pamprint_600\';
list=dir(PathRoot);
fileNum=size(list); 
for k=2+picnumber:2+picnumber%k=36 
    k=2+picnumber
	disp(list(k).name)  % ������ļ�������������ļ��У���Ҳ���������档
%f1=imread('1479305870650c.jpg');
f1=imread(strcat('C:\Users\hasee\Desktop\03Polyu_Pamprin\Polyu_Pamprint_600\',list(k).name));
    %figure(1);
      %subplot(221),imshow(f1);title('ԭʼͼ��');
    f=double(f1);
    f=fft2(f);
    f=fftshift(f);
    [m,n]=size(f);  %
    d0=7;
    m1=fix(m/2);
    n1=fix(n/2);
    for i=1:m
        for j=1:n
            d=sqrt((i-m1)^2+(j-n1)^2);
            h(i,j)=exp(-d^2/2/d0^2);
        end
    end
    g=f.*h;
    g=ifftshift(g);
    g=ifft2(g);
    g=mat2gray(real(g));
    bwI=im2bw(g,0.2);
   % figure(1);
    %subplot(222),imshow(g);title('��˹ƽ����Ҷ�ͼ��');
    %figure(2);
    level=graythresh(g);%ʹ��graythresh����Ҷ��ż�
    bw=im2bw(g,level);%bwΪ��ֵͼ��
    %imshow(bw);
    dim=size(bw);
    col=round(dim(2)/2)-90;         %������ʼ��������
row=find(bw(:,col),1);          %������ʼ��������
connectivity=8;
num_points=1800;
contour=bwtraceboundary(bw,[row,col],'N',connectivity,num_points);
%��ȡ�߽�
%figure(4)
% imshow(bw);
%hold on;
%plot(contour(:,2),contour(:,1), 'g','LineWidth' ,2);
%title('�߽����ͼ��');
[M,N]=size(bw);
[x,y]=size(bw);
[x2,y2]=size(bw);
[x3,y3]=size(bw);
[MM,NN]=size(bw);
[r, c] = size(bw);
flogx=0;
flogy=0;
for i = 1 : r;
    flogx=flogx+1;
end
for j = 1 : c;
    flogy=flogy+1;
end
flogx=flogx/2;%flogxΪ��ֱ�����ϵ����ĵ�
flogy=flogy/2;%flogyΪˮƽ��������ĵ�
%% 
B=bwboundaries(bw);%Ѱ������,BΪ�洢������Ϣ�Ľṹ��
im1=zeros(M,N);
for i=1:length(B)
    boundary=B{i};%��k���������洢��������������
    
    %��ע��k��������������λ��Ϊ1
    for l=1:length(boundary)
        im1(boundary(l,1),boundary(l,2))=1;
    end
    
end
figure(5);imshow(im1);title('����ͼ')%��������ͼ
BB=bwboundaries(bw);
im2=zeros(MM,NN);
for kk=1:length(BB)
    boundary=BB{kk};%��k���������洢��������������
    
    %��ע��k��������������λ��Ϊ1
    for l=1:length(boundary)
        im2(boundary(l,1),flogy)=1;
    end
    
end
%figure(6);imshow(im2);title('������ͼ')%����������
im3=im1&im2;
im3=double(im3);
figure(7);imshow(im3);%�����غϵ�ͼ
%�������ҳ���������
[mm,nn]=find(im3==1);
zuobiao=[mm,nn];
zb1=zuobiao(1,1)+5;
zb2=zuobiao(2,1)-5;
im4=zeros(x,y);
B4=bwboundaries(bw);%Ѱ������,B4Ϊ�洢������Ϣ�Ľṹ��
for kkk=1:length(B4)
    boundary=B4{kkk};%��k���������洢��������������
    
    %��ȥ�ұ�
    for l=1:length(boundary)
        if boundary(l,2)>flogy
             im4(boundary(l,1),boundary(l,2))=0;
        end
         if boundary(l,2)<=flogy
             im4(boundary(l,1),boundary(l,2))=1;
        end
    end
    
end
figure(8);imshow(im4);%��������ͼ
im5=zeros(x,y);
im6=zeros(x2,y2);
im7=zeros(x3,y3);
B5=bwboundaries(im4);
tag=0;
tag1=0;
flag=0;
flag1=0;
for kkkk=1:length(B5)
    boundary=B5{kkkk};%B5Ϊ�������Ʊ߽��
    
    %��ע��k��������������λ��Ϊ1
    for l=1:length(boundary)
        if boundary(l,1)<=zb1||boundary(l,1)>=zb2&&boundary(l,2)<110
             im5(boundary(l,1),boundary(l,2))=0;
        end
        if boundary(l,1)>zb1&&boundary(l,1)<zb2&&boundary(l,2)>110
             im5(boundary(l,1),boundary(l,2))=1;
        end
        if boundary(l,1)>110&&boundary(l,1)<=zb1||boundary(l,1)>=zb2&&boundary(l,2)<110
           im6(boundary(l,1),boundary(l,2))=0;
        end
         if boundary(l,1)<95&&boundary(l,1)>zb1  %110��
           im6(boundary(l,1),boundary(l,2))=1;
           if boundary(l,2)>tag %�����ң�������ָ���ű�ɾ����>zb1��
               tag=boundary(l,2);
               flag=boundary(l,1);
           end
         end
          if boundary(l,1)<200&&boundary(l,1)<=zb1||boundary(l,1)>=zb2&&boundary(l,2)<110
           im7(boundary(l,1),boundary(l,2))=0;
         end
         if boundary(l,1)>200&&boundary(l,1)<zb2
           im7(boundary(l,1),boundary(l,2))=1;
            if boundary(l,2)>tag1
               tag1=boundary(l,2);
               flag1=boundary(l,1);
           end
         end
    end
    
end
figure(12),imshow(f1);
hold on
p1 = [flag,tag];
p2 = [flag1,tag1];
pmid = [(flag1+flag)/2,(tag1+tag)/2];
kfa=-((p2(2)-p1(2))/(p2(1)-p1(1)));%����б��
kl=-(1/kfa);%l��б��
xfaend=300;%�Զ��巨�߳��ȣ�ͨ��ָ����β��xֵ
yfaend=kfa*(xfaend-pmid(2));
plot([pmid(2),xfaend],[pmid(1),yfaend+pmid(1)],'Color','g','LineWidth',2);
plot([p1(2),p2(2)],[p1(1),p2(1)],'Color','r','LineWidth',2);
xawaypmid=20;%����ROI�������
pROIacross1=[pmid(1)+xawaypmid*kfa,pmid(2)+xawaypmid];
at=atand(kfa);
sat=sind(at);
cat=cosd(at);
xROIlt=pROIacross1(2)+sat*64;
yROIlt=pROIacross1(1)-cat*64;
xROIlb=pROIacross1(2)-sat*64;
yROIlb=pROIacross1(1)+cat*64; 
pROIacross2=[pmid(1)+xawaypmid*kfa+128*sat,pmid(2)+xawaypmid+128*cat];
xROIrt=pROIacross2(2)+sat*64; 
yROIrt=pROIacross2(1)-cat*64;
xROIrb=pROIacross2(2)-sat*64;
yROIrb=pROIacross2(1)+cat*64; 
plot([xROIlt,xROIlb],[yROIlt,yROIlb],'Color','b','LineWidth',2);
plot([xROIrt,xROIrb],[yROIrt,yROIrb],'Color','b','LineWidth',2);
plot([xROIrt,xROIlt],[yROIrt,yROIlt],'Color','b','LineWidth',2);
plot([xROIrb,xROIlb],[yROIrb,yROIlb],'Color','b','LineWidth',2);
hold off;  
%%%��ת��
%%
%%
f1=imrotate(f1,at,'bilinear','crop');
[m,n]=size(f1);
x2=sqrt((tag-n/2)*(tag-n/2)+(flag-m/2)*(flag-m/2))*cosd(atand((m/2-flag)/(tag-n/2))+at); 
y2=sqrt((tag-n/2)*(tag-n/2)+(flag-m/2)*(flag-m/2))*sind(atand((m/2-flag)/(tag-n/2))+at); 
tag=n/2-x2;
flag=0;
tag1=tag;
flag1=m;
figure(20),imshow(f1);
hold on
p1 = [flag,tag];
p2 = [flag1,tag1];
pmid = [(flag1+flag)/2,(tag1+tag)/2];
kfa=-((p2(2)-p1(2))/(p2(1)-p1(1)));%����б��
kl=-(1/kfa);%l��б��
xfaend=300;%�Զ��巨�߳��ȣ�ͨ��ָ����β��xֵ
yfaend=kfa*(xfaend-pmid(2));
plot([pmid(2),xfaend],[pmid(1),yfaend+pmid(1)],'Color','g','LineWidth',2);
plot([p1(2),p2(2)],[p1(1),p2(1)],'Color','r','LineWidth',2);
xawaypmid=20;%����ROI�������
pROIacross1=[pmid(1)+xawaypmid*kfa,pmid(2)+xawaypmid];
at=atand(kfa);
sat=sind(at);
cat=cosd(at);
xROIlt=pROIacross1(2)+sat*64;
yROIlt=pROIacross1(1)-cat*64; 
xROIlb=pROIacross1(2)-sat*64;
yROIlb=pROIacross1(1)+cat*64; 
pROIacross2=[pmid(1)+xawaypmid*kfa+128*sat,pmid(2)+xawaypmid+128*cat];
xROIrt=pROIacross2(2)+sat*64; 
yROIrt=pROIacross2(1)-cat*64;
xROIrb=pROIacross2(2)-sat*64;
yROIrb=pROIacross2(1)+cat*64; 
plot([xROIlt,xROIlb],[yROIlt,yROIlb],'Color','b','LineWidth',2);
plot([xROIrt,xROIrb],[yROIrt,yROIrb],'Color','b','LineWidth',2);
plot([xROIrt,xROIlt],[yROIrt,yROIlt],'Color','b','LineWidth',2);
plot([xROIrb,xROIlb],[yROIrb,yROIlb],'Color','b','LineWidth',2);
saveas(gcf,['C:\Users\hasee\Desktop\03Polyu_Pamprin\preprocessresult\',list(k).name]);
hold off; 
%%
%��ȡ
RGB=f1;
RGB1=imcrop(RGB,[xROIlt,yROIlt,127,127]);
figure(22),
imshow(RGB1);
saveas(gcf,['C:\Users\hasee\Desktop\03Polyu_Pamprin\ROIresult\',list(k).name]);
%ROI������ȡ
figure(111),
subplot(231);imshow(uint8(RGB1));title('ROI');
Sx=5;
Sy=5;
sigma=5.6179;
theta=pi/4;
u=0.0916;
I=RGB1;
[complexGabout,realGabout,imagGabout]=gaborfilter(I,Sx,Sy,theta,u,sigma);
figure(111),
subplot(233);imshow(im2bw(realGabout));title('realGabout');
subplot(234);imshow(im2bw(imagGabout));title('imagGabout');
[biRealGabout]=bigabout(realGabout);
subplot(236);imshow(im2bw(biRealGabout));title('biRealGabout');
[m,n]=size(biRealGabout);
% picgaborcode=reshape(biRealGabout,1,m*n) ;
picgaborcode=biRealGabout;
end


