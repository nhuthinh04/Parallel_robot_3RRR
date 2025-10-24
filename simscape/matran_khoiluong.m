%ma tran khoi luong M(q)
function M=Mq()
global l1 l2 L c;
global q1 q2 q3 x y phi q1c q2c q3c;
global m1 mC m2;
l1=3; l2=2.5; L=9; c=3;
m1=1; mC=1; m2=0;

M=diag([(m1*l1^2)/3+(m2*l1^2)/2, (m1*l1^2)/3+(m2*l1^2)/2,(m1*l1^2)/3+(m2*l1^2)/2,mC+3*m2/2,mC+3*m2/2,(mC*c^2)/12]+3/2*m2*(sqrt(3)*c/3)^2);
end
