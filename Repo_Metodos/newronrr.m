clear 
clc
%% 
%Algoritmo newton-raphson
%Realizado por JAIME ANDRES RUIZ MELENDRES
%METODOS NUMERICOS
%
%% CREAMOS LA FUNCION CON LOS SIGUIENTES PARAMETROS
%FUN = FUNCION,
%X0 = PUNTO INICIAL,
%TOL = TOLERACIA 
%
function y=newtonrr(fun,x0,tol)
%esto convertira la funcion en su derivada de tipo simbolica

dfun=diff(sym(fun));

%evaluamos la funcion en un puto "x0"

f=subs(fun,x0);
%la derivada de la funcion derivada evaluada en x0 

df=subs(dfun,x0);
%el conteo de iteraciones

c=1;

while (abs(f)>tol)
    a=x0-f/df;
    %aproximamos nuevamente y actulizar para ser evaluados en el nuevo
    %punto
    
    f=subs(fun,a);
    
    df=subs(dfun,a);
    
    %y actulizamos a x0;
    
    x0=a;
    
    %incrimientamos a c+1
    
    c=c+1;
    
    
end

c

a

end
 
    