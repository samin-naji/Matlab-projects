clc
clear
close all

% Input the function to be integrated as a string
func = input('Enter a function: ','s');
f = str2func(['@' '(x)' func]);

% Input the lower and upper limits of integration
a = input('Enter the lower limit of integration: ');
b = input('Enter the upper limit of integration: ');

% Input the number of subintervals (must be even)
n = input('Enter the number of subintervals (must be even): ');

% Calculate the width of each subinterval
h = (b-a)/n;

% Initialize the sum variable
sum = 0;

% Loop over the subintervals and add the area of each cubic polynomial
for i = 1:3:n-2
    x1 = a + i*h; % the x-coordinate of the left endpoint of the subinterval
    x2 = a + (i+1)*h; % the x-coordinate of the first interior point of the subinterval
    x3 = a + (i+2)*h; % the x-coordinate of the second interior point of the subinterval
    x4 = a + (i+3)*h; % the x-coordinate of the right endpoint of the subinterval
    sum = sum + (3*h/8)*(f(x1) + 3*f(x2) + 3*f(x3) + f(x4)); % add the area of the cubic polynomial to the sum
end

% Display the result
fprintf('The approximate value of the integral is %f\n', sum);
