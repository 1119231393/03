function Gabor=Gabor_hy(Sx,Sy,f,theta,sigma)
%f是中心频率，theta是滤波器的方向，sigma是高斯窗的方差,Sx,Sy为空间域像素的位置
x=-fix(Sx):fix(Sx);%Gabor变换核函数的窗口长度,
y=-fix(Sy):fix(Sy);
[x,y]=meshgrid(x,y);
xPrime=x*cos(theta)+y*sin(theta);
yPrime=y*cos(theta)-x*sin(theta);
%Gabor变换核函数
%Gabor=-((1/(2*pi*sigma.^2)).*exp(-.5*(xPrime.^2+yPrime.^2)/sigma.^2).*(exp(j*f*xPrime)-exp(-(f*sigma)^2/2)));
% Gabor=((1/(2*pi*sigma.^2)).*exp(-.5*(xPrime.^2+yPrime.^2)/sigma.^2).*exp(2*pi*sqrt(-1)*(f*xPrime*cos(theta)+f*yPrime*sin(theta))));
Gabor=((1/(2*pi*sigma.^2)).*exp(-.5*(xPrime.^2+yPrime.^2)/sigma.^2).*exp(2*pi*sqrt(-1)*(xPrime*cos(theta)+yPrime*sin(theta))));
%Gabor=((1/(2*pi*sigma.^2)).*exp(-.5*(xPrime.^2+yPrime.^2)/sigma.^2).*cos(2*pi*sqrt(-1)*(f*xPrime*cos(theta)+f*yPrime*sin(theta))));%实部