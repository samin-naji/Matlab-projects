h=0.1;
t = 0:h:10;
Y = zeros(0,length(t)); 
y(1) = 2;
F_ty = @(t,y) 0.25*t.*y;
for i=1:(length(t)-1)
    k_1 = h*F_ty(t(i),y(i));
    k_2 = h*F_ty(t(i)+0.5*h,y(i)+0.5*k_1);
    k_3 = h*F_ty((t(i)+0.5*h),(y(i)+0.5*k_2));
    k_4 = h*F_ty((t(i)+h),(y(i)+k_3));
    y(i+1) = y(i) + (1/6)*(k_1+2*k_2+2*k_3+k_4);
  
end
tspan = [0,10]; y1 = 2;
[tx, yx] = ode45(F_ty, tspan, y1);
plot(t,y,'o-', tx, yx, '--')