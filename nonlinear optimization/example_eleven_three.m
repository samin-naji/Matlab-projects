clc
clear
close all
% Define the function and its gradient 
A = [4 2; 2 2]; 
b = [-1; 1]; 
f = @(x) 0.5*x'*A*x - x'.*b; 
g = @(x) A*x - b;

% Set the initial point and the initial Hessian approximation 
x0 = [0; 0]; 
H0 = eye(2);

% Set the tolerance and the maximum number of iterations 
tol = 1e-6; 
maxiter = 100;

% Initialize some variables 
x = x0; 
H = H0; 
k = 0; 
converged = false;

% Loop until convergence or maximum iterations 
while ~converged && k < maxiter 
    % Find the descent direction by solving H*p = -g 
    p = -H \ g(x);
    % Find the step size by using backtracking line search with Armijo rule
alpha = 1;
c = 1e-4;
while f(x + alpha*p) > f(x) + c*alpha*g(x)'*p
    alpha = alpha / 2;
end

% Update the next iterate by x = x + alpha*p
x_new = x + alpha*p;

% Update the Hessian approximation by using DFP formula
s = x_new - x;
y = g(x_new) - g(x);
gamma = 1 / (y'*s);
H_new = (eye(2) - gamma*s*y')*H*(eye(2) - gamma*y*s') + gamma*s*s';

% Check the convergence criterion by using the norm of the gradient
if norm(g(x_new)) < tol
    converged = true;
end

% Update the variables for the next iteration
x = x_new;
H = H_new;
k = k + 1;
end
% Display the results 
if converged 
    fprintf('The algorithm converged in %d iterations.\n', k); 
else 
    fprintf('The algorithm reached the maximum number of iterations.\n'); 
end 
fprintf('The minimum value is %.4f at (%.4f, %.4f).\n', f(x), x(1), x(2));