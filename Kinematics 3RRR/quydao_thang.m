%5.0000    1.6340         0    7.2588    1.9303    4.2617
%A=[1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 2 0 0 0; 1 t t^2 t^3 t^4 t^5; 0 1 2*t 3*t^2 4*t^3 5*t^4; 0 0 2 6*t 12*t^2 20*t^3]
function output=vitri_x(in) 
t=in(1);
x0=[5.0000 1.6340 0];
x2=[3 1.6340 0]
h=6;
%vi tri ban dong theo t
%v=2
if(t<=6)
    x = x0(1)+((20/h^3)*t^3+(-30/h^4)*t^4+(12/h^5)*t^5)/2*(-2) ;
    y = x0(2);
    phi=x0(3);
else 
    x=x2(1);
    y=x2(2);
    phi=x2(3);
end
output=[x y phi];
end