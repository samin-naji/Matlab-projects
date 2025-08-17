clc
clear
close all
% Define the system of ODEs
odefun = @(t,x) [x(2); -x(1) + 0.5*(1 - x(1)^2)*x(2)]; % Van der Pol equation

% Define the range of state values
xmin = -5;
xmax = 5;
ymin = -5;
ymax = 5;

% Define the grid size for plotting the vector field
gridsize = 20;

% Create a grid of points
[x,y] = meshgrid(linspace(xmin,xmax,gridsize),linspace(ymin,ymax,gridsize));

% Evaluate the system of ODEs at each grid point
u = zeros(size(x));
v = zeros(size(y));
t = 0; % dummy variable for time
for i = 1:numel(x)
    xdot = odefun(t,[x(i); y(i)]);
    u(i) = xdot(1);
    v(i) = xdot(2);
end

% Plot the vector field using quiver function
figure;
quiver(x,y,u,v,'r'); % vector field in red
xlabel('x');
ylabel('y');
axis tight equal;

% Choose a set of initial conditions for plotting the trajectories
hold on;
ic = [-4 4; -3 3; -2 2; -1 1; -0.5 0.5; 0.01 0.01]; % each row is an initial condition

% Define the time span for solving the ODE
tspan = [-10 10]; % integrate backwards and forwards in time

% Loop over the initial conditions
for r = 1:size(ic,1)
    % Solve the ODE using ode45 function
    [t,x] = ode45(odefun,tspan,ic(r,:));
    
    % Plot the trajectory
    plot(x(:,1),x(:,2),'b') % trajectory in blue
    plot(x(1,1),x(1,2),'bo') % starting point in blue
    
end

hold off;
