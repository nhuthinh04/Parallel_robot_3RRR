%5.0000    1.6340         0    7.2588    1.9303    4.2617
%A=[1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 2 0 0 0; 1 t t^2 t^3 t^4 t^5; 0 1 2*t 3*t^2 4*t^3 5*t^4; 0 0 2 6*t 12*t^2 20*t^3]
function output=vitri_x(in) 
t=in(1);
global L;
L=9;
T1=6;
%tam cung tron
xC = [L/2    L/3.6   0]; 
r=1;

%vi tri ban dong theo t
if(t<=T1)
    x = xC(1) + r*cos(-pi/3+5*pi/27*t^3-5*pi/108*t^4+pi/324*t^5);
    y = xC(2) + r*sin(-pi/3+5*pi/27*t^3-5*pi/108*t^4+pi/324*t^5);
    phi=xC(3);
else 
    x=xC(1)+r*cos( -pi/3);
    y=xC(2)+r*sin( -pi/3);
    phi=xC(3);
end
output=[x y phi];
end