%dong hoc nguoc vi tri
function output=vantoc(input)
global l1 l2 L c;
global q1 q2 q3;
l1=3; l2=2.5; L=9; c=3;


x=input(1);
y=input(2);
phi=input(3);

    function F=ham(inputs)
     q1=inputs(1);    
     q2=inputs(2) ;   
     q3=inputs(3);

     %cac phuong trinh rang buoc
     F = zeros(3,1);
     F=[(x+sqrt(3)/3*c*cos(phi+7*pi/6)-l1*cos(q1))^2+(y+sqrt(3)/3*c*sin(phi+7*pi/6)-l1*sin(q1))^2-l2^2;
        (x+sqrt(3)/3*c*cos(phi+11*pi/6)-l1*cos(q2)-L)^2+(y+sqrt(3)/3*c*sin(phi+11*pi/6)-l1*sin(q2))^2-l2^2;
        (x+sqrt(3)/3*c*cos(phi+pi/2)-l1*cos(q3)-L/2)^2+(y+sqrt(3)/3*c*sin(phi+pi/2)-l1*sin(q3)-sqrt(3)*L/2)^2-l2^2];
    end 
%giai q
q0=[7.2588    1.9303    4.2617];

q_t=fsolve(@ham, q0);
output=[q_t];
end
