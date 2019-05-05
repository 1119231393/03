I=imread('PolyU_00_1.bmp');
bwI=im2bw(I,0.2);
figure(1);
subplot(321),imshow(I);title('原始图像');
subplot(322),imshow(bwI);title('二值图像');

%中值滤波
H=medfilt2(I,[9,9]); 
bwH=im2bw(H,0.2);
figure(1);
subplot(323),imshow(H);title('中值滤波后的图像');
subplot(324),imshow(bwH);title('中值滤波后的二值图像');


bwIsl=~bwI;%对二值图像取反
h=fspecial('average');
bwIfilt=imfilter(bwIsl,h);
bwIfiltfh=imfill(bwIfilt,'holes');
bdI=boundaries(bwIfiltfh,4,'cw');
d=cellfun('length',bdI);
[dmax,k]=max(d);
B4=bdI{k(1)};
[m,n]=size(bwIfiltfh);
xmin=min(B4(:,1));ymin=min(B4(:,2));
bim=bound2im(B4,m,n,xmin,ymin);
figure(1);
subplot(325),imshow(bim);title('边界跟踪');
figure;
imshow(bim);title('边界跟踪');