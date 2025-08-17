clc
clear
close all
% Define Rosenbrock's function
f = @(x) 100*(x(2)-x(1)^2)^2 + (1-x(1))^2;

% Define the gradient of f
g = @(x) [-400*(x(2)-x(1)^2)*x(1)-2*(1-x(1)); 200*(x(2)-x(1)^2)];

% Define the Hessian of f
H = @(x) [1200*x(1)^2-400*x(2)+2, -400*x(1); -400*x(1), 200];

% Set initial condition and tolerance
x0 = [-2; 2];
tol = 1e-6;

% Initialize variables
n = length(x0); % dimension of x
k = 0; % iteration counter
x = x0; % current point
r = g(x); % current residual
d = -r; % current direction
beta = 0; % current beta value
r_old = r; % initial residual


% Conjugate gradient algorithm with secant method for line search
while norm(r) > tol % stopping criterion
    
    % Secant method for line search
    alpha = 0; % initial guess for step size
    delta = 1e-4; % small perturbation for secant method
    phi = @(a) f(x + a*d); % objective function along search direction
    dphi = @(a) g(x + a*d)'*d; % derivative of phi
    maxit = 100; % maximum number of iterations for secant method
    i = 0; % iteration counter for secant method
    
    while abs(dphi(alpha)) > tol && i < maxit % stopping criterion for secant method
        
        % Update alpha using secant method
        alpha = alpha - dphi(alpha)*(delta)/(dphi(alpha+delta)-dphi(alpha));
        
        % Increment iteration counter
        i = i + 1;
        
        
    end
    
    % Update x using alpha and d
    x = x + alpha*d;
    
    % Update r using g and x
    r = g(x);

    formula = 'PR'; % choose Polak-Ribiere formula

    
    % Choose beta formula from Polak-Ribiere, Fletcher-Reeves or Hestenes-Stiefel
    switch formula
        
        case 'PR' % Polak-Ribiere formula
            
            beta = max(0,r'*(r-r_old)/(r_old'*r_old)); % use Polak-Ribiere formula

            
        case 'FR' % Fletcher-Reeves formula
            
            beta = (r'*r)/(r_old'*r_old);
            
        case 'HS' % Hestenes-Stiefel formula
            
            beta = (r'*(r-r_old))/(d'*(r-r_old));
            
    end
    
    % Update d using r and beta
    d = -r + beta*d;
    r_old = r; % store previous residual
    
    % Reinitialize d to the negative gradient every six iterations
    if mod(k,6) == 0
        
        d = -r;
        
    end
    
    % Increment iteration counter
    k = k + 1;
    
    
end

% Display results
disp('The minimum point is:')
disp(x)
disp('The function value at the minimum point is:')
disp(f(x))
disp('The number of iterations is:')
disp(k)