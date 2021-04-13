%---------------------Taller 1 - 2do Cohorte - Grupo A---------------------
%---------------------------Métodos Númericos------------------------------
%
%   2.- El siguiente script aplicara el método de la Secante para hallar
%        la raiz de la función que se ingrese, entre los dos intervalos
%        que se ingresen y con el margen de error que se ingrese.
%   
%   Grupo conformado por:
%           -Jose Daniel Muñoz Gomez
%           -Fabián Alberto Sánchez Ruiz
%
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------

clc, clear all;

disp ("Programa para calcular la raiz de una función usando el método de la Secante");

x = input("Ingrese su función:>_ ", "S");

fun = inline(x);

x0 = input("Ingrese el primer valor inicial:>_ ");
x1 = input("Ingrese el segundo valor inicial:>_ ");

erU = input("Ingrese el margen de error:>_ ");
x2 = 0;
i = 0;
er = 100;
fprintf("┌-------------------------------------------┐\n");
fprintf("│ No.   Xn-1   Xn   Xn+1  f(Xn+1)   |Ea| \n");

while(er > erU)
    fprintf("├-------------------------------------------┤\n");
    x2 = x1 - ((fun(x1).*(x0 - x1))/(fun(x0)-(fun(x1))));
    
    er = abs((x2-x1)/(x2))*100;
    
    fprintf("│ %0.0f    %0.2f  %0.2f  %0.2f   %0.2f    %0.2f \n", (i+1), x0, x1, x2, fun(x2), er);
   
   if(er > erU)
        x0 = x1;
        x1 = x2;
   end
   i=i+1;
end
fprintf("└-------------------------------------------┘\n");
fprintf("La raíz aproximada es x%0.0f = %0.5f con una |Ea| = %0.5f%s\n",i,x2,er,"%");
