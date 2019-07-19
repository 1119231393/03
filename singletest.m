function [picgaborcode]=singletest(picnumber)
PathRoot='C:\Users\hasee\Desktop\03Polyu_Pamprin\Polyu_Pamprint_600\';
list=dir(PathRoot);
fileNum=size(list); 
for k=2+picnumber:2+picnumber%k=36 
    k=2+picnumber
	disp(list(k).name)  % 这就是文件名，如果有子文件夹，则也包含在里面。
%f1=imread('1479305870650c.jpg');
f1=imread(strcat('C:\Users\hasee\Desktop\03Polyu_Pamprin\Polyu_Pamprint_600\',list(k).name));
    %figure(1);
      %subplot(221),imshow(f1);title('原始图像');
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
    %subplot(222),imshow(g);title('高斯平滑后灰度图像');
    %figure(2);
    level=graythresh(g);%使用graythresh计算灰度门槛
    bw=im2bw(g,level);%bw为二值图像
    %imshow(bw);
    dim=size(bw);
    col=round(dim(2)/2)-90;         %计算起始点列坐标
row=find(bw(:,col),1);          %计算起始点行坐标
connectivity=8;
num_points=1800;
contour=bwtraceboundary(bw,[row,col],'N',connectivity,num_points);
%提取边界
%figure(4)
% imshow(bw);
%hold on;
%plot(contour(:,2),contour(:,1), 'g','LineWidth' ,2);
%title('边界跟踪图像');
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
flogx=flogx/2;%flogx为竖直方向上的中心点
flogy=flogy/2;%flogy为水平方向的中心点
%% 
B=bwboundaries(bw);%寻找轮廓,B为存储轮廓信息的结构体
im1=zeros(M,N);
for i=1:length(B)
    boundary=B{i};%第k个轮廓，存储轮廓各像素坐标
    
    %标注第k个轮廓像素所在位置为1
    for l=1:length(boundary)
        im1(boundary(l,1),boundary(l,2))=1;
    end
    
end
figure(5);imshow(im1);title('轮廓图')%绘制轮廓图
BB=bwboundaries(bw);
im2=zeros(MM,NN);
for kk=1:length(BB)
    boundary=BB{kk};%第k个轮廓，存储轮廓各像素坐标
    
    %标注第k个轮廓像素所在位置为1
    for l=1:length(boundary)
        im2(boundary(l,1),flogy)=1;
    end
    
end
%figure(6);imshow(im2);title('中心线图')%绘制中心线
im3=im1&im2;
im3=double(im3);
figure(7);imshow(im3);%绘制重合点图
%遍历，找出这两个点
[mm,nn]=find(im3==1);
zuobiao=[mm,nn];
zb1=zuobiao(1,1)+5;
zb2=zuobiao(2,1)-5;
im4=zeros(x,y);
B4=bwboundaries(bw);%寻找轮廓,B4为存储轮廓信息的结构体
for kkk=1:length(B4)
    boundary=B4{kkk};%第k个轮廓，存储轮廓各像素坐标
    
    %除去右边
    for l=1:length(boundary)
        if boundary(l,2)>flogy
             im4(boundary(l,1),boundary(l,2))=0;
        end
         if boundary(l,2)<=flogy
             im4(boundary(l,1),boundary(l,2))=1;
        end
    end
    
end
figure(8);imshow(im4);%绘制轮廓图
im5=zeros(x,y);
im6=zeros(x2,y2);
im7=zeros(x3,y3);
B5=bwboundaries(im4);
tag=0;
tag1=0;
flag=0;
flag1=0;
for kkkk=1:length(B5)
    boundary=B5{kkkk};%B5为左半边手掌边界点
    
    %标注第k个轮廓像素所在位置为1
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
         if boundary(l,1)<95&&boundary(l,1)>zb1  %110？
           im6(boundary(l,1),boundary(l,2))=1;
           if boundary(l,2)>tag %找最右，上下手指干扰被删除（>zb1）
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
kfa=-((p2(2)-p1(2))/(p2(1)-p1(1)));%法线斜率
kl=-(1/kfa);%l的斜率
xfaend=300;%自定义法线长度，通过指定结尾点x值
yfaend=kfa*(xfaend-pmid(2));
plot([pmid(2),xfaend],[pmid(1),yfaend+pmid(1)],'Color','g','LineWidth',2);
plot([p1(2),p2(2)],[p1(1),p2(1)],'Color','r','LineWidth',2);
xawaypmid=20;%调节ROI区域距离
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
%%%旋转后
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
kfa=-((p2(2)-p1(2))/(p2(1)-p1(1)));%法线斜率
kl=-(1/kfa);%l的斜率
xfaend=300;%自定义法线长度，通过指定结尾点x值
yfaend=kfa*(xfaend-pmid(2));
plot([pmid(2),xfaend],[pmid(1),yfaend+pmid(1)],'Color','g','LineWidth',2);
plot([p1(2),p2(2)],[p1(1),p2(1)],'Color','r','LineWidth',2);
xawaypmid=20;%调节ROI区域距离
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
%截取
RGB=f1;
RGB1=imcrop(RGB,[xROIlt,yROIlt,127,127]);
figure(22),
imshow(RGB1);
saveas(gcf,['C:\Users\hasee\Desktop\03Polyu_Pamprin\ROIresult\',list(k).name]);
%ROI特征提取
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


