clc;
clear;
syms x;
control = true;
%MENÚ PRINCIPAL %
while(control)
    disp("::::::::::Métodos de Integración Numérica::::::::::")
    fprintf("Selecciones el metódos a aplicar: \n" + ...
        "1. Regla Trapezoidal\n" + ...
        "2. Regla Simpson 1/3\n" + ...
        "3. Regla Simpson 3/8\n" + ...
        "4. Salir...\n")
    opcion = input("Ingrese su opción: ");
    if (opcion>=1) && (opcion<=3)
        a = input("Ingrese el punto 'a' de su intervalo");
        b = input("Ingrese el punto 'b' de su intervalo");
        n = input("Ingrese el numero de segmentos");
        fun = input("Ingresa la función: ", 'S');
        fun = str2sym(fun);
    end

    switch opcion
        case 1
            disp("Trapezoide");
            numero = trapecio(fun,a,b,n);
            fprintf("El valor es: %.5f\n",numero);
            disp(" ");
            errorA = error(a,b,n,fun,2);
            fprintf("El error aproximado es: %.8f \n",errorA);
            disp(" ");
        case 2
            disp("Simpson 1/3");
            numero = simpson3(fun,a,b,n);
            fprintf("El valor es: %.5f \n",numero);
            disp("");
            errorA = error(a,b,n,fun,4);
            fprintf("El error aproximado es: %.8f \n",errorA);
            disp("");
        case 3
            disp("Simpson 3/8");
            numero = simpson8(fun,a,b,n);
            fprintf("El valor es: %.5f \n",numero);
            disp("");
            errorA = error(a,b,n,fun,4);
            fprintf("El error aproximado es: %.8f \n",errorA);
            disp("");
        case 4
            disp("Salir");
            control = false;
        otherwise
            disp("Opción no valida");
    end
end
%---------------Simpson 1/3 ------------%
function formula = simpson3(fun,a,b,n)
delta = (b-a)/n;
vecx(1) = a;
for i = 2:n+1
    vecx(i) = vecx(i-1) + delta;
end
formula = 0;
fx = inline(fun);
for i=1:n+1
    if(i==1) || (i==n+1)
        formula = formula + fx(vecx(i));
    elseif mod((i-1),2)~=0
        formula = formula + 4*fx(vecx(i));
    elseif mod((i-1),2)==0
        formula = formula + 2*fx(vecx(i));
    end
end
formula = delta/3 * formula;
end
%---------------End Simpson 1/3 ------------%


%---------------Simpson 3/8 ------------%
function formula = simpson8(fun,a,b,n)
delta = (b-a)/n;
vecx(1) = a;
for i = 2:n+1
    vecx(i) = vecx(i-1) + delta;
end
formula = 0;
fx = inline(fun);
for i=1:n+1
    if (i==1) || (i==n+1)
        formula = formula + fx(vecx(i));
    elseif mod((i-1),3)==0
        formula = formula + 2*fx(vecx(i));
    elseif mod((i-1),3)~=0
        formula = formula + 3*fx(vecx(i));
    end
end
formula = 3*delta/8 * formula;
end
%---------------End Simpson 3/8 ------------%


%---------------Regla del trapecio------------%
function formula = trapecio(fun, a,b, n)
delta = (b-a)/n;
vecx(1) = a;
for i = 2:n+1
    vecx(i) = vecx(i-1) + delta;
end
formula = 0;
fx = inline(fun);
for i=1:n+1
    if(i==1) || (i==n+1)
        formula = formula + fx(vecx(i));
    else
        formula = formula + 2*fx(vecx(i));
    end
end
formula = delta/2 * formula;
end
%---------------End Regla del trapecio------------%

%----------------Calculo del error------------%
function nerror = error(a,b,n,fun,grado)
der = diff(fun,grado);
der = inline(der);
if(der(a)>der(b))
    M = der(a);
else
    M= der(b);
end
%M es la evaluacion del punto maximo del intervalo en la enesima derivada%
switch grado
    case 2
        nerror = abs((((b-a)^3)/(12*(n^2)))*M);
    case 4
        nerror = abs((((b-a)^5)/(12*(n^4)))*M);    
end

end
%----------------End Calculo del error------------%