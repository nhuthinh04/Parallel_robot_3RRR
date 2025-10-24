clc; close all; clear all;

L = 9; c = 3; l1 = 3; l2 = 2.5; phi=0;

%do thi q tu dong luc hoc nguoc
load('q.mat');
%load('q123.mat');
tq = ans.Data;

t = tq(:,1);
q1 = tq(:,2);
q2 = tq(:,3);
q3 = tq(:,4);
n = length(t);

% Vi tri cac khop
O1 = [0, 0];
O2 = [L, 0];
O3 = [L/2, sqrt(3)*L/2];
de = [O1; O2; O3; O1]; % de co dinh

% Lưu quỹ đạo tâm bàn động
x_C = [];
y_C = [];

figure;
hold on;
grid on;
xlabel('x(m)');
ylabel('y(m)');

for i = 1:3:n
    % Xác định tọa độ các điểm A1, A2, A3
    A1 = O1 + [l1 * cos(q1(i)), l1 * sin(q1(i))];
    A2 = O2 + [l1 * cos(q2(i)), l1 * sin(q2(i))];
    A3 = O3 + [l1 * cos(q3(i)), l1 * sin(q3(i))];

    % Hệ phương trình phi tuyến tìm (xC, yC)
    fun=@(C)  [
(C(1)+sqrt(3)/3*c*cos(phi+7*pi/6)-l1*cos(q1(i)))^2+(C(2)+sqrt(3)/3*c*sin(phi+7*pi/6)-l1*sin(q1(i)))^2-l2^2;
(C(1)+sqrt(3)/3*c*cos(phi+11*pi/6)-l1*cos(q2(i))-L)^2+(C(2)+sqrt(3)/3*c*sin(phi+11*pi/6)-l1*sin(q2(i)))^2-l2^2;
(C(1)+sqrt(3)/3*c*cos(phi+pi/2)-l1*cos(q3(i))-L/2)^2+(C(2)+sqrt(3)/3*c*sin(phi+pi/2)-l1*sin(q3(i))-sqrt(3)*L/2)^2-l2^2];

    
    % Giá trị khởi tạo cho (xC, yC)
    C0 = [5.0000    1.6340 ];
    C_t = fsolve(fun , C0);
    
    xC = C_t(1);
    yC = C_t(2);

    % Xác định tọa độ các điểm B1, B2, B3 dựa vào bàn động
    B1 = [xC + sqrt(3)/3*c*cos(phi + 7*pi/6), yC + sqrt(3)/3*c*sin(phi + 7*pi/6)];
    B2 = [xC + sqrt(3)/3*c*cos(phi + 11*pi/6), yC + sqrt(3)/3*c*sin(phi + 11*pi/6)];
    B3 = [xC + sqrt(3)/3*c*cos(phi + pi/2), yC + sqrt(3)/3*c*sin(phi + pi/2)];

    % Cập nhật quỹ đạo tâm bàn động
    x_C = [x_C, xC];
    y_C = [y_C, yC]
 

    % Xóa và vẽ lại
    clf;
    hold on;
    grid on;
    axis equal;
    axis([-1, L+1, -1, L]); % Mở rộng không gian quan sát
    
    xlabel('x(m)');
    ylabel('y(m)');

    % Vẽ đế tam giác
    plot(de(:,1), de(:,2), 'k', 'LineWidth', 1.5);

    % Vẽ các khâu
    plot([O1(1), A1(1)], [O1(2), A1(2)], 'k', 'LineWidth', 1.5);
    plot([O2(1), A2(1)], [O2(2), A2(2)], 'k', 'LineWidth', 1.5);
    plot([O3(1), A3(1)], [O3(2), A3(2)], 'k', 'LineWidth', 1.5);
    plot([A1(1), B1(1)], [A1(2), B1(2)], 'k', 'LineWidth', 1.5);
    plot([A2(1), B2(1)], [A2(2), B2(2)], 'k', 'LineWidth', 1.5);
    plot([A3(1), B3(1)], [A3(2), B3(2)], 'k', 'LineWidth', 1.5);

    % Vẽ bàn động tam giác
    bandong = [B1; B2; B3; B1];
    plot(bandong(:,1), bandong(:,2), 'b', 'LineWidth', 1.5);

    % Vẽ quỹ đạo của tâm bàn động
    plot(x_C, y_C, 'r-', 'LineWidth', 2);

    % Vẽ tâm bàn động
    scatter(xC,yC,20);
 
    % Tạm dừng để hiển thị chuyển động
    pause(0.05);
end
