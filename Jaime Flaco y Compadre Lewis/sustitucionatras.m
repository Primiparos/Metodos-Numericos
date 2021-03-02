function x=sustitucionatras(A,b)
A=[A b];
[n,m]=size(A);
x=zeros(n, 1);
x(n)=A(n,n+1)/A(n,n);
for i=n-1:-1:1
    s=0;
    for j=n:-1:i+1
        s=s+A(i,j)*x(j);
    end
    x(i)=(A(i, n+1)-s)/A(i,i);
end


x