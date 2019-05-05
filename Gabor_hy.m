function Gabor=Gabor_hy(Sx,Sy,f,theta,sigma)
%f������Ƶ�ʣ�theta���˲����ķ���sigma�Ǹ�˹���ķ���,Sx,SyΪ�ռ������ص�λ��
x=-fix(Sx):fix(Sx);%Gabor�任�˺����Ĵ��ڳ���,
y=-fix(Sy):fix(Sy);
[x,y]=meshgrid(x,y);
xPrime=x*cos(theta)+y*sin(theta);
yPrime=y*cos(theta)-x*sin(theta);
%Gabor�任�˺���
%Gabor=-((1/(2*pi*sigma.^2)).*exp(-.5*(xPrime.^2+yPrime.^2)/sigma.^2).*(exp(j*f*xPrime)-exp(-(f*sigma)^2/2)));
% Gabor=((1/(2*pi*sigma.^2)).*exp(-.5*(xPrime.^2+yPrime.^2)/sigma.^2).*exp(2*pi*sqrt(-1)*(f*xPrime*cos(theta)+f*yPrime*sin(theta))));
Gabor=((1/(2*pi*sigma.^2)).*exp(-.5*(xPrime.^2+yPrime.^2)/sigma.^2).*exp(2*pi*sqrt(-1)*(xPrime*cos(theta)+yPrime*sin(theta))));
%Gabor=((1/(2*pi*sigma.^2)).*exp(-.5*(xPrime.^2+yPrime.^2)/sigma.^2).*cos(2*pi*sqrt(-1)*(f*xPrime*cos(theta)+f*yPrime*sin(theta))));%ʵ��