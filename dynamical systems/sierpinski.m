a=zeros(1001,2001);
a(1,1001)=1;
for k=2:1000
    for l=2:2000
        if a(k-1,l-1)==0 && a(k-1,l)==0 &&a(k-1,l+1)==1
            a(k,l)=1;
        elseif a(k-1,l-1)==1 && a(k-1,l)==0 && a(k-1,l+1)==0
            a(k,l)=1;
        end
    end
end
spy(a)