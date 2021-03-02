function x=sarrus(A,b)

n=length(b);
%  for l=1:n
%         for t=1:n
%            
%             p(l,t)=A(l,t);
%             fprintf('La matriz P%d%d es', l,t)
%             p(l,t)
%         end
%     
%  end
    p11=A(1,1);
    p12=A(1,2);   
    p13=A(1,3);    
    p21=A(2,1);    
    p22=A(2,2);
    p23=A(2,3);    
    p31=A(3,1);    
    p32=A(3,2);
    p33=A(3,3); 
    ResulD= (p11*p22*p33)+(p21*p32*p13)+(p31*p12*p23)-(p13*p22*p31)-(p23*p32*p11)-(p33*p12*p21);
    ResulD
for k=1:n
    Ak=A;
    Ak(:,k)=b;
    fprintf('La matriz A%d es', k)
    Ak
    p11=Ak(1,1);
    p12=Ak(1,2);   
    p13=Ak(1,3);    
    p21=Ak(2,1);    
    p22=Ak(2,2);
    p23=Ak(2,3);    
    p31=Ak(3,1);    
    p32=Ak(3,2);
    p33=Ak(3,3); 

    ResultM=(p11*p22*p33)+(p21*p32*p13)+(p31*p12*p23)-(p13*p22*p31)-(p23*p32*p11)-(p33*p12*p21);
    ResultM
    RestulT= ResultM/ResulD;
    
    fprintf('el resultado de los valores de la matriz son %d', k) 
     RestulT
    
    
    
end
