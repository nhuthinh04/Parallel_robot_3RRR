function R_dot = matran_dot(input, input_dot)
    
    global l1 l2 L c;
    global q1 q2 q3 x y phi;
    l1=3; l2=2.5; L=9; c=3;
    
    % vitri
    x = input(1);
    y = input(2);
    phi = input(3);
    q1 = input(4);
    q2 = input(5);
    q3 = input(6);
    
    % dao ham vi tri
    x_dot = input_dot(1);
    y_dot = input_dot(2);
    phi_dot = input_dot(3);
    q1_dot = input_dot(4);
    q2_dot = input_dot(5);
    q3_dot = input_dot(6);
    
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

    
    % dao ham theo toa do suy rong
    t1_dot = -sqrt(3)/3*c*sin(phi+7*pi/6)*phi_dot;
    t2_dot = sqrt(3)/3*c*cos(phi+7*pi/6)*phi_dot;
    t3_dot = -l1*sin(q1)*q1_dot;
    t4_dot = l1*cos(q1)*q1_dot;
    t5_dot = -sqrt(3)/3*c*sin(phi+11*pi/6)*phi_dot;
    t6_dot = sqrt(3)/3*c*cos(phi+11*pi/6)*phi_dot;
    t7_dot = -l1*sin(q2)*q2_dot;
    t8_dot = l1*cos(q2)*q2_dot;
    t9_dot = -sqrt(3)/3*c*sin(phi+pi/2)*phi_dot;
    t10_dot = sqrt(3)/3*c*cos(phi+pi/2)*phi_dot;
    t11_dot = -l1*sin(q3)*q3_dot;
    t12_dot = l1*cos(q3)*q3_dot;
    
    % tao Jx và dao ham
    Jx = zeros(3,3);
    Jx_dot = zeros(3,3);
    

    Jx(1,1) = 2*(x+t1-t3);
    Jx(1,2) = 2*(y+t2-t4);
    Jx(1,3) = -2*t2*(x+t1-t3)+2*t1*(y+t2-t4);
    
    Jx(2,1) = 2*(x+t5-t7-L);
    Jx(2,2) = 2*(y+t6-t8);
    Jx(2,3) = -2*t6*(x+t5-t7-L)+2*t5*(y+t6-t8);
    
    Jx(3,1) = 2*(x+t9-t11-L/2);
    Jx(3,2) = 2*(y+t10-t12-sqrt(3)*L/2);
    Jx(3,3) = -2*t10*(x+t9-t11-L/2)+2*t9*(y+t10-t12-sqrt(3)*L/2);
    
    % Các phần tử của Jx_dot
    Jx_dot(1,1) = 2*(x_dot+t1_dot-t3_dot);
    Jx_dot(1,2) = 2*(y_dot+t2_dot-t4_dot);
    Jx_dot(1,3) = -2*t2_dot*(x+t1-t3) - 2*t2*(x_dot+t1_dot-t3_dot) + 2*t1_dot*(y+t2-t4) + 2*t1*(y_dot+t2_dot-t4_dot);
    
    Jx_dot(2,1) = 2*(x_dot+t5_dot-t7_dot);
    Jx_dot(2,2) = 2*(y_dot+t6_dot-t8_dot);
    Jx_dot(2,3) = -2*t6_dot*(x+t5-t7-L) - 2*t6*(x_dot+t5_dot-t7_dot) + 2*t5_dot*(y+t6-t8) + 2*t5*(y_dot+t6_dot-t8_dot);
    
    Jx_dot(3,1) = 2*(x_dot+t9_dot-t11_dot);
    Jx_dot(3,2) = 2*(y_dot+t10_dot-t12_dot);
    Jx_dot(3,3) = -2*t10_dot*(x+t9-t11-L/2) - 2*t10*(x_dot+t9_dot-t11_dot) + 2*t9_dot*(y+t10-t12-sqrt(3)*L/2) + 2*t9*(y_dot+t10_dot-t12_dot);
    
    % tao Jq va dao ham
    Jq = zeros(3,3);
    Jq_dot = zeros(3,3);
    

    Jq(1,1) = 2*t4*(x+t1-t3)-2*t3*(y+t2-t4);
    Jq(2,2) = 2*t8*(x+t5-t7-L)-2*t7*(y+t6-t8);
    Jq(3,3) = 2*t12*(x+t9-t11-L/2)-2*t11*(y+t10-t12-sqrt(3)*L/2);
    
   
    Jq_dot(1,1) = 2*t4_dot*(x+t1-t3) + 2*t4*(x_dot+t1_dot-t3_dot) - 2*t3_dot*(y+t2-t4) - 2*t3*(y_dot+t2_dot-t4_dot);
    Jq_dot(2,2) = 2*t8_dot*(x+t5-t7-L) + 2*t8*(x_dot+t5_dot-t7_dot) - 2*t7_dot*(y+t6-t8) - 2*t7*(y_dot+t6_dot-t8_dot);
    Jq_dot(3,3) = 2*t12_dot*(x+t9-t11-L/2) + 2*t12*(x_dot+t9_dot-t11_dot) - 2*t11_dot*(y+t10-t12-sqrt(3)*L/2) - 2*t11*(y_dot+t10_dot-t12_dot);
    
    % A 
    A = eye(3);
    A_dot = zeros(3,3);
    
    % nghich dao Jx
    Jx_inv = pinv(Jx);
    
    % dao ham nghich dao Jx: d(A^-1)/dt = -A^-1 * dA/dt * A^-1
    Jx_inv_dot = -Jx_inv * Jx_dot * Jx_inv;
  
    
    % tinh dao ham R_dot
    R_dot = [A_dot; Jx_inv_dot * (-Jq) + Jx_inv * (-Jq_dot)];
end