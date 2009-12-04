% Automatic noise removal using You method
% fourth order PDE 
% Author Jeny
% Ref :Yu-Li You, M. Kaveh, "Fourth Order Partial Differential Equations for Noise Removal,
% IEEE Trans. Image Processing, vol. 9, no. 10, pp 1723-1730, October 2000]
% Method : du/dt = - del^2[c(del^2(u))del^u]
% where u is the noisy input image.
function [frth]=fpdepyou(I,T)
% I = Noisy Image
% T - Threshold , Based on the threshold you will get scale sapce images. At a particular 
% value of T you will gwt the converged image. 
[x y z]=size(I);
I=double(I);
dt=0.9; % Time step
I1=I;
I2=I;
t=1;
k=0.5;
for  t=1:T
    [Ix,Iy]=gradient(I1); 
    [Ixx,Iyt]=gradient(Ix);
    [Ixt,Iyy]=gradient(Iy);
    c=1./(1.+sqrt(Ixx.^2+Iyy.^2)+0.0000001);
    [div1,divt1]=gradient(c.*Ixx);
    [divt2,div2]=gradient(c.*Iyy);
    [div11,divt3]=gradient(div1);
    [divt4,div22]=gradient(div2);
    div=div11+div22;
    I2=I1-(dt.*div);
    I1=I2;
end;
% frth=uint8(I1); % Converting to 8 bit image
frth=I1;

    