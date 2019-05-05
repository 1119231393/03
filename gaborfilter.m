function [G,gabout]=gaborfilter(I,Sx,Sy,sigma,theta)
if isa(I,'double')~=1
    I=double(I);
end
% xPrime=x*cos(theta)+y*sin(theta);
% yPrime=y*cos(theta)-x*sin(theta);
for x = -fix(Sx):fix(Sx)
    for y = -fix(Sy):fix(Sy)
%             xPrime=x*cos(theta)+y*sin(theta);
%         yPrime=y*cos(theta)-x*sin(theta);
%         G(fix(Sx)+x+1,fix(Sy)+y+1) = ((1/(2*pi*sigma.^2)).*exp(-.5*(xPrime.^2+yPrime.^2)/sigma.^2).*exp(2*pi*sqrt(-1)*(xPrime*cos(theta)+yPrime*sin(theta))));
        G(fix(Sx)+x+1,fix(Sy)+y+1) = ((1/(2*pi*sigma.^2)).*exp(-.5*(x.^2+y.^2)/sigma.^2).*exp(2*pi*sqrt(-1)*(x*cos(theta)+y*sin(theta))));
    end
end
Imgabout = conv2(I,double(imag(G)),'same');
Regabout = conv2(I,double(real(G)),'same');
gabout = sqrt(Imgabout.*Imgabout+Regabout.*Regabout);