clc
clear
close all
% Define the matrix Q and the vector b
Q = [3, 0, 1; 0, 4, 2; 1, 2, 3];
b = -[0; 0; 0];

% Define the quadratic function and its gradient
f = @(x) 1/2*x'*Q*x - b'*x;
grad_f = @(x) Q*x - b;

% Initialize x0
x0 = [0; 0; 0];

% Calculate r0 and p0
r0 = b - Q * x0;
p0 = r0;

% Set a tolerance and a maximum number of iterations
tol = 1e-6;
max_iter = 100;

% Initialize k
k = 0;

% Start the loop
while norm(r0) > tol && k < max_iter
    
    % Calculate alpha_k
    alpha_k = -r0' * p0 / (p0' * Q * p0);
    
    % Update x_k+1
    x_kp1 = x0 + alpha_k * p0;
    
    % Calculate r_k+1
    r_kp1 = r0 - alpha_k * Q * p0;
    
    % Calculate beta_k+1
    beta_kp1 = r_kp1' * Q * p0 / (p0' * Q * p0);
    
    % Update p_k+1
    p_kp1 = -r_kp1 + beta_kp1 * p0;
    
    % Update x0, r0 and p0 for the next iteration
    x0 = x_kp1;
    r0 = r_kp1;
    p0 = p_kp1;
    
    % Increment k
    k = k + 1;
    
end

% Print the final result
fprintf('The minimizer is [%g; %g; %g] and the minimum value is %g\n', x0, f(x0));