function y=eliminiacion(A,B)
%Tomamos el tamaño de la matriz n n, tomando de forma cuadrada
[n n]=size(A);
%aqui converrimos las dos matrices en una, en su inversa.
A=[A';B']';
%agregamos una vector de zeros
x=zeros(n,1);
%y de esta forma hacemos que la matriz se redusca por la teoria de gauss
for p=1:n
    for k=[1:p-1,p+1:n];
        m= -A(k,p)/A(p,p);
        A(k,:)=A(k,:)+m*A(p,:)
    end
end
%tomamos la diagonal de la matriz A
z=diag(A);
%Y tomamos los valores que contiene la matriz A
a=A(:,n+1);
%iteramos los resultados, y los motramos en r
for i=1:n;
    r(i)=z(i,1)/a(i,1);
end
r'