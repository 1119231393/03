function [complexGabout,realGabout,imagGabout]=gaborfilter(I,Sx,Sy,theta,u,sigma)
if isa(I,'double')~=1
    I=double(I);
end
for x = -fix(Sx):fix(Sx)
    for y = -fix(Sy):fix(Sy)
        G(fix(Sx)+x+1,fix(Sy)+y+1) = ((1/(2*pi*sigma.^2)).*exp(-.5*(x.^2+y.^2)/sigma.^2).*exp(2*pi*sqrt(-1)*(u*x*cos(theta)+u*y*sin(theta))));
    end
end
complexG=G-mean(mean(G));
realG=real(G)-mean(mean(real(G)));
imagG=imag(G)-mean(mean(imag(G)));
complexGabout = conv2(I,double(complexG),'same');
realGabout = conv2(I,double(realG),'same');
imagGabout = conv2(I,double(imagG),'same');