clc
clear
close all
% Define Rosenbrock's function
f = @(x,y) (1-x)^2 + 100*(y-x^2)^2;

% Define gradient and Hessian
grad = @(x,y) [-2*(1-x)-400*x*(y-x^2); 200*(y-x^2)];
hess = @(x,y) [2-400*y+1200*x^2, -400*x; -400*x, 200];

% Set initial point
x0 = [0;0];

% Apply two iterations of Newton's method
x1 = x0 - hess(x0(1),x0(2))\grad(x0(1),x0(2));
x2 = x1 - hess(x1(1),x1(2))\grad(x1(1),x1(2));

% Display results
disp('Initial point:')
disp(x0')
disp('First iteration:')
disp(x1')
disp('Second iteration:')
disp(x2')