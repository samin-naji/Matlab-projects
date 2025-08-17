n = 6;
a = cell(1,n);
for j = 1:n
  a{j} = linspace(0, 1, 3^j+1);
end
m = n;
for j = 1:n
  b = a{j};
  l = ones(1, length(b)) * m;
  plot(b, l, 'b*-'), hold on
  m = m - 1;
end
xlim([-0.1 1.1]), ylim([0 n+1])