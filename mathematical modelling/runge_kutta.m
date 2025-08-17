h=1.0;
x = 0:h:10;
Y = zeros(0,length(x)); 
y(1) = 2;
F_xy = @(t,r) 0.25.*t.*r;
for i=1:(length(x)-1)
    k_1 = h*F_xy(x(i),y(i));
    k_2 = h*F_xy(x(i)+0.5*h,y(i)+0.5*k_1);
    k_3 = h*F_xy((x(i)+0.5*h),(y(i)+0.5*k_2));
    k_4 = h*F_xy((x(i)+h),(y(i)+k_3));
    y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4);
  
end
tspan = [0,10]; y1 = 2;
[tx, yx] = ode45(F_xy, tspan, y1);
plot(x,y,'o-', tx, yx, '--')