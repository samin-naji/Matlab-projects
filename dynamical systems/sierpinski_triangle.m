function RST(A, B, C, n)
if n <= 0
    plot([A(1), B(1)], [A(2), B(2)], 'color', 'b');
    hold on
    plot([B(1), C(1)], [B(2), C(2)], 'color', 'b');
    plot([C(1), A(1)], [C(2), A(2)], 'color', 'b');
    title('Recursion for Sierpinski Triangle');
else  
    RST(A, (A + B) / 2, (A + C) / 2, n - 1);
    RST(B, (B + A) / 2, (B + C) / 2, n - 1);
    RST(C, (C + A) / 2, (C + B) / 2, n - 1);
end
end