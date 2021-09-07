clc;
clear;
syms x

%-------------------VALORES-------------------%
grado = input("Ingrese el grado del polinomio");
x0 = input("Ahora ingresa x0");
f = input("Ingresa la función: ", 'S');
f = str2sym(f);
%---------------------------------------------%

%---------FUNCIÓN Y DERIVADAS------------%
for i = 1:grado+1
    if(i == 1)
        vecfun(i) = f;
    else
        vecfun(i) = diff(vecfun(i-1));
    end
    
    fx = inline(vecfun(i));
    vecval(i) = fx(x0);

end
%---------FUNCIÓN Y DERIVADAS------------%


%---------POLINOMIO DE TAYLOR------------%
pol = vecval(1);
for i = 1:grado
    pol = pol + vecval(i+1) * ((((x-x0)^(i)))/(factorial(i)));
end
%---------POLINOMIO DE TAYLOR------------%

disp("Su polinomio es: ")
simplyPol = simplify(pol);
disp(simplyPol);

%---------FUNCIÓN FACTORIAL--------------%
function y = factorial(numero)
    n = 1;
    while(numero~=1)
    n = n*numero;
    numero = numero -1 ;
    end
    y = n;
end
%---------FUNCIÓN FACTORIAL--------------%