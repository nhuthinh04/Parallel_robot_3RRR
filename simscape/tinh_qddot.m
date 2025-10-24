%tinh gia toc khop 

function Qddot=tinhqddot(inputs)

global l1 l2 L c;
global q1 q2 q3 x y phi x_dot y_dot phi_dot q1_dot q2_dot q3_dot;
global m1 mC m2 ;

l1=3; l2=2.5; L=9; c=3;
m1=1; mC=1; m2=0;


x=inputs(1);
y=inputs(2);
phi=inputs(3);
q1=inputs(4);
q2=inputs(5);
q3=inputs(6);
x_dot=inputs(7);
y_dot=inputs(8);
phi_dot=inputs(9);
q1_dot=inputs(10);
q2_dot=inputs(11);
q3_dot=inputs(12);
u=inputs(13:15);


%Ma tran R
R=matran_R([x, y, phi, q1, q2, q3]);

%ma tran Rdot
R_dot=matran_R_dot([x, y, phi, q1, q2, q3],[ x_dot, y_dot, phi_dot, q1_dot, q2_dot, q3_dot]);

%Ma tran khoi luong
M=matran_khoiluong();

%Ma tran B
B = [eye(3); zeros(3)];

%vecto qdot
q_dot=[q1_dot; q2_dot; q3_dot];

%tinh qdotdot
Qddot=pinv(R'*M*R)*(R'*B*u-R'*M*R_dot*q_dot);
end