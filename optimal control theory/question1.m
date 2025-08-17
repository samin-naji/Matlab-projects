clc
clear
close all
% Define the integrand as a function of epsilon and x
f = @(epsilon,x) 1 + x.^epsilon + sqrt(1 + (epsilon.^2).*x.^(2*epsilon-2));

% Define the function to be minimized as a function of epsilon
g = @(epsilon) integral(@(x) f(epsilon,x), 0, 1);

% Find the minimum value of g on the interval [0, 1]
[epsilon_min, g_min] = fminbnd(g, 0, 1);

% Display the results
fprintf('The minimum value of the integral is %f at epsilon = %f\n', g_min, epsilon_min);
S=g_min*2*pi