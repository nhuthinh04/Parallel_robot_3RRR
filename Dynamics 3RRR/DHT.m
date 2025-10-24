%dong hoc thuan vi tri
function output=vantoc(input)
global l1 l2 L c;
global x y phi ;
q1=input(1);
q2=input(2);
q3=input(3);

  %phuong trinh rang buoc 
   function F=ham(inputs)

    x=inputs(1);    
    y=inputs(2) ;   
    phi=inputs(3);

    %cac phuong trinh rang buoc
    F=[(x+sqrt(3)/3*c*cos(phi+7*pi/6)-l1*cos(q1))^2+(y+sqrt(3)/3*c*sin(phi+7*pi/6)-l1*sin(q1))^2-l2^2;
       (x+sqrt(3)/3*c*cos(phi+11*pi/6)-l1*cos(q2)-L)^2+(y+sqrt(3)/3*c*sin(phi+11*pi/6)-l1*sin(q2))^2-l2^2;
       (x+sqrt(3)/3*c*cos(phi+pi/2)-l1*cos(q3)-L/2)^2+(y+sqrt(3)/3*c*sin(phi+pi/2)-l1*sin(q3)-sqrt(3)*L/2)^2-l2^2];
    end 

%giai x
x0=[5.0000    1.6340    0];
x_t=fsolve(@ham, x0);
output=[x_t];
end
