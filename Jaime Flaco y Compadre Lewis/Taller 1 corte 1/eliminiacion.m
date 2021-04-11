function y=eliminiacion(A,B)
[n n]=size(A);
A=[A';B']';
x=zeros(n,1);
for p=1:n
    for k=[1:p-1,p+1:n];
        m= -A(k,p)/A(p,p);
        A(k,:)=A(k,:)+m*A(p,:)
    end
end
z=diag(A);
a=A(:,n+1);
for i=1:n;
    r(i)=z(i,1)/a(i,1);
end
r'