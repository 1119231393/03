I=imread('PolyU_00_1.bmp');
bwI=im2bw(I,0.2);
figure(1);
subplot(321),imshow(I);title('ԭʼͼ��');
subplot(322),imshow(bwI);title('��ֵͼ��');

%��ֵ�˲�
H=medfilt2(I,[9,9]); 
bwH=im2bw(H,0.2);
figure(1);
subplot(323),imshow(H);title('��ֵ�˲����ͼ��');
subplot(324),imshow(bwH);title('��ֵ�˲���Ķ�ֵͼ��');


bwIsl=~bwI;%�Զ�ֵͼ��ȡ��
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
subplot(325),imshow(bim);title('�߽����');
figure;
imshow(bim);title('�߽����');