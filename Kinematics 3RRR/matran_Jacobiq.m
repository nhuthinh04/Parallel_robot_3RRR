%ma tran Jacobi Jq
function Jacoq=Jacobiq(inputs)
global l1 l2 L c;
global q1 q2 q3 x y phi;
l1=3; l2=2.5; L=9; c=3;

x=inputs(1);
y=inputs(2);
phi=inputs(3);

q1=inputs(4);
q2=inputs(5);
q3=inputs(6);

Jx=zeros(3,3);
Jq=zeros(3,3);

t1=sqrt(3)/3*c*cos(phi+7*pi/6);
t2=sqrt(3)/3*c*sin(phi+7*pi/6);
t3=l1*cos(q1);
t4=l1*sin(q1);

t5=sqrt(3)/3*c*cos(phi+11*pi/6);
t6=sqrt(3)/3*c*sin(phi+11*pi/6);
t7=l1*cos(q2);
t8=l1*sin(q2);

t9=sqrt(3)/3*c*cos(phi+pi/2);
t10=sqrt(3)/3*c*sin(phi+pi/2);
t11=l1*cos(q3);
t12=l1*sin(q3);

%tinh ma tran Jx
Jx(1,1)=2*(x+t1-t3);
Jx(1,2)=2*(y+t2-t4);
Jx(1,3)=-2*t2*(x+t1-t3)+2*t1*(y+t2-t4);
Jx(2,1)=2*(x+t5-t7-L);
Jx(2,2)=2*(y+t6-t8);
Jx(2,3)=-2*t6*(x+t5-t7-L)+2*t5*(y+t6-t8);
Jx(3,1)=2*(x+t9-t11-L/2);
Jx(3,2)=2*(y+t10-t12-sqrt(3)*L/2);
Jx(3,3)=-2*t10*(x+t9-t11-L/2)+2*t9*(y+t10-t12-sqrt(3)*L/2);

%tinh ma tran Jq
Jq(1,1)=2*t4*(x+t1-t3)-2*t3*(y+t2-t4);
Jq(2,2)=2*t8*(x+t5-t7-L)-2*t7*(y+t6-t8);
Jq(3,3)=2*t12*(x+t9-t11-L/2)-2*t11*(y+t10-t12-sqrt(3)*L/2);

Jacoq=Jq;
end

