clc
clear
close all

% Input the function to be integrated as a string
func = input('Enter a function: ','s');
f = str2func(['@' '(x)' func]);

% Input the lower and upper limits of integration
a = input('Enter the lower limit of integration: ');
b = input('Enter the upper limit of integration: ');

% Input the number of subintervals
n = input('Enter the number of subintervals: ');

% Calculate the width of each subinterval
h = (b-a)/n;

% Initialize the sum variable
sum = 0;

% Loop over the subintervals and add the area of each trapezoid
for i = 1:n-1
    x = a + i*h; % the x-coordinate of the right endpoint of the subinterval
    sum = sum + f(x); % add the function value at x to the sum
end

% Multiply the sum by h and add the contributions from the endpoints
trap = h*(f(a) + 2*sum + f(b))/2;

% Display the result
fprintf('The approximate value of the integral is %f\n', trap);


