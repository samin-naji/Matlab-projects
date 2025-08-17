function [root,iter] = fibonacci_method(f,a,b,tol,max_iter)
% Fibonacci method for root finding
% Input: f = function handle
%        a,b = initial interval containing the root
%        tol = tolerance for stopping criterion
%        max_iter = maximum number of iterations allowed
% Output: root = approximate root of f
%         iter = number of iterations performed

% Check if f changes sign on [a,b]
if f(a)*f(b) > 0
    error('f must change sign on [a,b]')
end

% Initialize Fibonacci numbers
F(1) = 1;
F(2) = 1;
n = 2;

% Find the smallest Fibonacci number that satisfies F(n) > (b-a)/tol
while F(n) <= (b-a)/tol
    n = n + 1;
    F(n) = F(n-1) + F(n-2);
end

% Set the maximum number of iterations
if nargin < 5 % if max_iter is not given, use n as default
    max_iter = n;
else % if max_iter is given, use the minimum of n and max_iter
    max_iter = min(n,max_iter);
end

% Start the iteration
iter = 0; % iteration counter
while iter < max_iter && b-a > tol
    iter = iter + 1;
    % Find the left and right subintervals using Fibonacci numbers
    L = a + F(n-iter-1)/F(n-iter+1)*(b-a);
    R = a + F(n-iter)/F(n-iter+1)*(b-a);
    % Evaluate f at L and R
    fL = f(L);
    fR = f(R);
    % Decide which subinterval to keep
    if fL*fR < 0 % root is in [L,R]
        a = L;
        b = R;
    elseif f(a)*fL < 0 % root is in [a,L]
        b = L;
    else % root is in [R,b]
        a = R;
    end    
end

% Return the midpoint of the final interval as the root
root = (a+b)/2;
%example: f = @(x) x^3 - 2*x - 5; a = 1; b = 3; tol = 1e-6; max_iter = 100; fibonacci_method(f,a,b,tol,max_iter) ans = 2.0946
