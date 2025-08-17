% example 8.1 by Samin Naji
clc
clear
close all
% Define the objective function and its gradient
f = @(x1,x2,x3) (x1 - 4)^4 + (x2 - 3)^2 + 4*(x3 + 5)^4;
g = @(x1,x2,x3) [4*(x1 - 4)^3; 2*(x2 - 3); 16*(x3 + 5)^3];

% Define the initial point
x0 = [4; 2; -1];

% Define the termination tolerance and maximum iterations
tol = 1e-6;
maxiter = 1000;

% Initialize gradient norm, optimization vector, iteration counter
gnorm = inf;
x = x0;
k = 0;

% Gradient descent algorithm with line search
while gnorm >= tol && k <= maxiter
    % Calculate gradient
    gk = g(x(1), x(2), x(3));
    gnorm = norm(gk);
    
    % Choose descent direction (negative gradient)
    dk = -gk;
    
    % Define a function handle for line search
    phi = @(alpha) f(x(1) + alpha*dk(1), x(2) + alpha*dk(2), x(3) + alpha*dk(3));
    
    % Find the optimal step size by minimizing phi
    alpha = fminbnd(phi, 0, 1);
    
    % Take step
    x = x + alpha*dk;
    
    % Update termination metrics
    k = k + 1;
end

% Display results
disp('The minimizer is:')
disp(x)
disp('The minimum value is:')
disp(f(x(1), x(2), x(3)))
disp('The number of iterations is:')
disp(k)