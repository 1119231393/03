%ROI������ȡ
f1=imread('C:\Users\hasee\Desktop\03Polyu_Pamprin\ROIresult\PolyU_00_1.bmp');
figure(1),
subplot(231);imshow(f1);title('ROI');
Sx=5;
Sy=5;
sigma=[5,10];
theta=[0,pi/2];
I=rgb2gray(f1);
subplot(236);imshow(uint8(I));title('rgb2gray(f1)');
[G1,gabout1]=gaborfilter(I,Sx,Sy,sigma(1),theta(1));
[G2,gabout2]=gaborfilter(I,Sx,Sy,sigma(1),theta(2));
[G3,gabout3]=gaborfilter(I,Sx,Sy,sigma(2),theta(1));
[G4,gabout4]=gaborfilter(I,Sx,Sy,sigma(2),theta(2));
figure(1),
subplot(232);imshow(uint8(gabout1));title('gabout1');
subplot(233);imshow(uint8(gabout2));title('gabout2');
subplot(234);imshow(uint8(gabout3));title('gabout3');
subplot(235);imshow(uint8(gabout4));title('gabout4')