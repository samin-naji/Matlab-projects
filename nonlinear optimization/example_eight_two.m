% example 8.2 by Samin Naji
clc
clear
close all
f = @(x1,x2) x1^2 + x2^2;
g = @(x1,x2) [2*x1; 2*x2];

% Set the initial point, step size, tolerance and maximum iterations
x0 = [1; 1]; % initial point (you can change this to any value)
tol = 1e-6; % tolerance
maxiter = 1000; % maximum iterations

% Initialize the iteration counter and the norm of the gradient
gnorm = inf;
x = x0;
k = 0;

% Loop until convergence or maximum iterations
while gnorm > tol && k < maxiter
    % Calculate gradient
    gk = g(x(1), x(2));
    gnorm = norm(gk);
        % Choose descent direction (negative gradient)
    dk = -gk;
        % Define a function handle for line search
    phi = @(alpha) f(x(1) + alpha*dk(1), x(2) + alpha*dk(2));
        % Find the optimal step size by minimizing phi
    alpha = fminbnd(phi, 0,1);
     % Take step
    x = x + alpha*dk;
        % Update termination metrics
    k = k + 1;
    
end

% Display the results
disp('The minimizer is:')
disp(x)
disp('The minimum value is:')
disp(f(x(1), x(2)))
disp('The number of iterations is:')
disp(k)