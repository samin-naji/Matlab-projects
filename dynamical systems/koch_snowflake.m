k = 10;
q = [0, pi/3, -pi/3, 0];
n = 4^k;
W2 = zeros(k,n);
W2(1,:) = reshape(repmat(q,1,4^(k-1)),n,1);
for i=2:k
    W2(i,:) = reshape(repmat(q,4^(i-1),4^(k-i)),n,1);
end
W = sum(W2);
x0 = 0;
y0 = 0;
x=x0;y=y0;
for i=1:length(W)
    
    theta = W(i);
    x(i+1)=x(i)+cos(theta);
    y(i+1)=y(i)+sin(theta);
    
end
line(x,y)
axis equal