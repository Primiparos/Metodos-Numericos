function eliminacionporcolumna(A)
[n,n]=size(A);
 for p=1:n
     for k=p+1:n
         mult=A(p,k)/A(p,p);
         A(:,k)=A(:,k)-mult*A(:,p);
     end
 end
x=A
end
%valores
%A=[1 2 3; 1 -2 4; 0 -2 1];
%b=[2;7;3];
