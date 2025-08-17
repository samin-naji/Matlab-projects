clc
clear
close all
% Define Powell's function
f = @(x) (x(1)+10*x(2))^2 + 5*(x(3)-x(4))^2 + (x(2)-2*x(3))^4 + 10*(x(1)-x(4))^4;

% Define gradient and Hessian
grad = @(x) [  20*(x(1)+10*x(2))+40*(x(1)-x(4))^3;
               200*(x(1)+10*x(2))+4*(x(2)-2*x(3))^3;
               10*(x(3)-x(4))-8*(x(2)-2*x(3))^3;
               -10*(x(3)-x(4))-40*(x(1)-x(4))^3];
hess = @(x) [2 + 120*(x(1) - x(4))^2, 20, 0, -120*(x(1) - x(4))^2;
          20, 200 + 12*(x(2) - 2*x(3))^2, -24*(x(2) - 2*x(3))^2, 0;
          0, -24*(x(2) - 2*x(3))^2, 10 + 48*(x(2) - 2*x(3))^2, -10;
          -120*(x(1) - x(4))^2, 0, -10, 10 + 120*(x(1) - x(4))^2];
% Set initial point
x0 = [3;-1;0;1];

% Apply three iterations of Newton's method
x1 = x0 - hess(x0)\grad(x0);
x2 = x1 - hess(x1)\grad(x1);
x3 = x2 - hess(x2)\grad(x2);

% Display results
disp('Initial point:')
disp(x0')
disp('First iteration:')
disp(x1')
disp('Second iteration:')
disp(x2')
disp('Third iteration:')
disp(x3')