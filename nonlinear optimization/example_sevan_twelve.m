% 7.12 gradient algorithm by Samin Naji
clc
clear
close all
% Define the function and its gradient
f = @(x) 0.5 * x' * [2 1; 1 2] * x;
g = @(x) [2 1; 1 2] * x;

% Set the initial guess and the Wolfe parameters
x0 = [0.8; -0.25];
c1 = 0.1;
c2 = 0.9;

% Initialize the iteration counter and the error tolerance
k = 0;
tol = 1e-6;

% Repeat until the gradient is small enough
while norm(g(x0)) > tol
    % Set the initial step size and the descent direction
    alpha = 1;
    d = -g(x0);
    % Perform a backtracking line search to satisfy the Wolfe condition
    while f(x0 + alpha * d) > f(x0) + c1 * alpha * g(x0)' * d || ...
          abs(g(x0 + alpha * d)' * d) > c2 * abs(g(x0)' * d)
        % Reduce the step size by half
        alpha = alpha / 2;
    end
    % Update the solution by moving along the descent direction
    x0 = x0 + alpha * d;
    % Increment the iteration counter
    k = k + 1;
end

% Display the final solution and the number of iterations
disp('The minimum point is:')
disp(x0)
disp('The number of iterations is:')
disp(k)

%%
% 7.12 b
clc
clear
close all
f = @(x) 0.5 * x' * [2 1; 1 2] * x;
% Set the initial interval [a, b]
a = -1;
b = 1;
% Set the tolerance
tol = 0.01;
% Set the golden ratio
phi = (sqrt(5) - 1) / 2;
% Initialize the subinterval endpoints
c = a + (1 - phi) * (b - a);
d = a + phi * (b - a);
% Initialize the function values
fc = f(c);
fd = f(d);
% Loop until convergence
while b - a > tol
    % Compare the function values and discard one subinterval
    if fc < fd
        b = d;
        d = c;
        fd = fc;
        c = a + (1 - phi) * (b - a);
        fc = f(c);
    else
        a = c;
        c = d;
        fc = fd;
        d = a + phi * (b - a);
        fd = f(d);
    end
end
% Display the final interval and its width
disp([a, b])
disp((b-a)/2)
%%
% 7.12 c
clc
clear
close all
f = @(x) 0.5 * x' * [2 1; 1 2] * x;
% Set the initial interval [a, b]
a = -1;
b = 1;
% Set the desired number of iterations
n = 10;
% Generate the Fibonacci numbers
F = fibonacci(1:n+2);
% Initialize the subinterval endpoints
c = a + (F(n-1)/F(n+1)) * (b - a);
d = a + (F(n)/F(n+1)) * (b - a);
% Initialize the function values
fc = f(c);
fd = f(d);
% Loop for n iterations
for i = 1:n-1
    % Compare the function values and discard one subinterval
    if fc < fd
        b = d;
        d = c;
        fd = fc;
        c = a + (F(n-i-1)/F(n-i+1)) * (b - a);
        fc = f(c);
    else
        a = c;
        c = d;
        fc = fd;
        d = a + (F(n-i)/F(n-i+1)) * (b - a);
        fd = f(d);
    end
end
% Display the final interval and its width
disp([a, b])
disp((b-a)/2)