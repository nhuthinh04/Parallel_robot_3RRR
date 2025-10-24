%hieu chinh toa do suy rong q
function hieuchinh=h(inputs)

global l1 l2 L c;

l1=3; l2=2.5; L=9; c=3;

x=inputs(1);
y=inputs(2);
phi=inputs(3);

q1_sao=inputs(4);
q2_sao=inputs(5);
q3_sao=inputs(6);

% q sau tich phan
q_sao=[q1_sao; q2_sao; q3_sao];

  function H=ham(input)
    q1=input(1);
    q2=input(2);
    q3=input(3);

    %ma tran Jq
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

    %tinh ma tran Jq
    Jq=zeros(3,3);
    Jq(1,1)=2*t4*(x+t1-t3)-2*t3*(y+t2-t4);
    Jq(2,2)=2*t8*(x+t5-t7-L)-2*t7*(y+t6-t8);
    Jq(3,3)=2*t12*(x+t9-t11-L/2)-2*t11*(y+t10-t12-sqrt(3)*L/2);

    %he phuong tirnh rang buoc
    F=[(x+sqrt(3)/3*c*cos(phi+7*pi/6)-l1*cos(q1))^2+(y+sqrt(3)/3*c*sin(phi+7*pi/6)-l1*sin(q1))^2-l2^2;
       (x+sqrt(3)/3*c*cos(phi+11*pi/6)-l1*cos(q2)-L)^2+(y+sqrt(3)/3*c*sin(phi+11*pi/6)-l1*sin(q2))^2-l2^2;
       (x+sqrt(3)/3*c*cos(phi+pi/2)-l1*cos(q3)-L/2)^2+(y+sqrt(3)/3*c*sin(phi+pi/2)-l1*sin(q3)-sqrt(3)*L/2)^2-l2^2];

    %ma tran A(nhan to phat)
    A = diag([30, 30, 30]);

    %ma tran P(ma tran trong so)
    P = diag([0.5,0.5,0.5]);
   
    % q hieu chinh
    q=[q1; q2; q3];

    %phuong trinh ham h(q,t)
    H=P*(q-q_sao)+Jq'*A*F;
   end

%giai q
H0=[q1_sao q2_sao q3_sao];
q_t=fsolve(@ham,H0);
hieuchinh=q_t;
end 
