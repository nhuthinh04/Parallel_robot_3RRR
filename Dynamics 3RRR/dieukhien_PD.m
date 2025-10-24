%dieu khien vi tri-dieu khien PD+bu trong luc
function u=control(inputs)

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

q1t=inputs(7);
q2t=inputs(8);
q3t=inputs(9);

%dao ham
q1_dot=inputs(10);
q2_dot=inputs(11);
q3_dot=inputs(12);

q1t_dot=inputs(13);
q2t_dot=inputs(14);
q3t_dot=inputs(15);

%ma tran R
R=matran_R([x y phi q1 q2 q3]);

%Ma tran B
B = [eye(3); zeros(3)];

%e
qd=[q1; q2; q3];
q=[q1t; q2t; q3t];
e=q-qd;

%e_dot 

qd_dot=[q1_dot; q2_dot; q3_dot];
q_dot=[q1t_dot; q2t_dot; q3t_dot];
e_dot=q_dot-qd_dot;

%Kp
Kp=220000*diag([1, 1, 1]);

%Kd
Kd=800*diag([1, 1, 1]);
%u
u=pinv(R'*B)*(-Kp*e-Kd*e_dot);
end
