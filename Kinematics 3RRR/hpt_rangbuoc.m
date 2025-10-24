%phuong trinh rang buoc 5.0000    1.6340         0    7.2588    1.9303    4.2617

function F=Forward_Kinematics(inputs)
global l1 l2 L c;
global q1 q2 q3 x y phi;
l1=3; l2=2.5; L=9; c=3;

x=inputs(1);    
y=inputs(2) ;   
phi=inputs(3);

q1=inputs(4);   
q2= inputs(5);   
q3=inputs(6);

%cac phuong trinh rang buoc
F(1)=(x+sqrt(3)/3*c*cos(phi+7*pi/6)-l1*cos(q1))^2+(y+sqrt(3)/3*c*sin(phi+7*pi/6)-l1*sin(q1))^2-l2^2;
F(2)=(x+sqrt(3)/3*c*cos(phi+11*pi/6)-l1*cos(q2)-L)^2+(y+sqrt(3)/3*c*sin(phi+11*pi/6)-l1*sin(q2))^2-l2^2;
F(3)=(x+sqrt(3)/3*c*cos(phi+pi/2)-l1*cos(q3)-L/2)^2+(y+sqrt(3)/3*c*sin(phi+pi/2)-l1*sin(q3)-sqrt(3)*L/2)^2-l2^2;
end 