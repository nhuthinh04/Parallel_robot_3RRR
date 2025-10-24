%dong hoc nguoc van toc
function output=vantoc_khop(inputs)
q    =inputs(1:3);
xvat =inputs(4:9);
xt   =xvat(1:3);
xdot =xvat(4:6);

global   L c;
global  q2 q3 x y phi;
l1=3; l2=2.5; L=9; c=3;

K=200;

Jx=matran_Jacobi([xt q]);
Jq=(-matran_Jacobiq([xt q]));
F=hpt_rangbuoc([xt q]);
qdot=pinv(Jq)*(Jx*xdot+K*F');
output=[qdot];
end
