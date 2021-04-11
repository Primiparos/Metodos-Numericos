%function x=sarrus(A,b)
clc
clear all


A=[1 2 3; 1 -2 4; 0 -2 1];
b=[2;7;3];
%tomamos el tamaño de la matriz. 
n=length(b);

%De estas forma tomamos el valor punto a punto de la matriz
%
    p11=A(1,1);
    p12=A(1,2);   
    p13=A(1,3);    
    p21=A(2,1);    
    p22=A(2,2);
    p23=A(2,3);    
    p31=A(3,1);    
    p32=A(3,2);
    p33=A(3,3); 
    %De esta forma aplicamos la teoria de sarrus, para la matriz original
    ResulD= (p11*p22*p33)+(p21*p32*p13)+(p31*p12*p23)-(p13*p22*p31)-(p23*p32*p11)-(p33*p12*p21);
    %imprimimos le resultado
    ResulD
%de esta forma cambiemos las columnas de la matriz para cada uno de los terminos a hallar.
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
%De esta forma aplicamos la teoria de sarrus, para la matriz con los valores a hallar
    ResultM=(p11*p22*p33)+(p21*p32*p13)+(p31*p12*p23)-(p13*p22*p31)-(p23*p32*p11)-(p33*p12*p21);
    ResultM
    %con esto tomamos el resultado de dividir los dos metodos anteriores.
    RestulT= ResultM/ResulD;
    }
    %aqui mostramos la matriz con su respectivo resultado. 
    fprintf('el resultado de los valores de la matriz son %d', k) 
    RestulT
    
    
    
end