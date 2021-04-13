%---------------------Taller 1 - 2do Cohorte - Grupo A---------------------
%---------------------------Métodos Númericos------------------------------
%
%   1.- El siguiente script aplicara el método de Newton Raphson para 
%       hallar la raiz de la función que se ingrese, entre los dos         
%       intervalos que se ingresen y con el margen de error que se ingrese.
%   
%   Grupo conformado por:
%           -Jose Daniel Muñoz Gomez
%           -Fabián Alberto Sánchez Ruiz
%
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

clc
clear all

disp ("Programa para calcular la raiz de una función usando el método de Newton Raphson");
syms x
x=log(2-x^2)-x^2;
xf=inline(x);
Xdev=diff(x);
Xdevf=inline(Xdev)
x0=input("Ingrese el valor inicial: >_");

ErU=input("Ingrese el margen de error: >_");

x1=0;
i=0;
Er=100;

fprintf("┌------------------------------------------------------┐\n");
fprintf("│ No.     Xn       Xn+1        f(Xn+1)         |Ea| \n");

while(Er>ErU)
    fprintf("├------------------------------------------------------┤\n");
    x1= x0-((xf(x0))/(Xdevf(x0)));
    
    Er=abs((x1-x0)/x1)*100;

    
    
    fprintf("│ %0.0f    %0.5f    %0.5f     %0.5f       %0.5f \n", (i+1), x0, x1, xf(x1), Er);
    
    if(Er>ErU)
        x0=x1;
    end
    i=i+1;
end
fprintf("└------------------------------------------------------┘\n");
fprintf("La raíz aproximada es x%0.0f = %0.5f con una |Ea| = %0.5f%s\n",i,x1,Er,"%");
