clc 
clear all
syms x
% Usamos la libreria Symbolics

%Capturamos las funciones f(x) y g(x) y derivamos a g(x)
fu = input("Ingrese a f(x): ", 'S');
f = inline(fu);
w = input("Ingrese a g(x): ", 'S');
gx = inline(w);
wprima = diff(gx(x));
gprimax = inline(wprima);

% Pedimos a x inicial y el error inicial
xn = input("Ingrese el valor de x inicial: "); 
e_usuario = input("Ingrese el error inicial: ");

i = 1;
Ea = 100;
fprintf("i       Xn         g(Xn)           f(Xn)                |Ea|\n");

% Verificamos que la función converge
if(abs(gprimax(xn))<1)
    % Si converge comenzamos a iterar.
    while(true)
        
        % Calculamos a Xi+1 y el error aproximado
        xs = gx(xn);
        Ea = abs(((xs - xn)/xs))*100;
        
        fprintf("%d       %0.5f         %0.5f           %0.5f          %0.5f\n",i, xn, gx(xn), f(xn), Ea);
        if(Ea<=e_usuario)
            break;
        end  
        % Asignamos un nuevo xn
        xn = xs;
        i = i + 1;
    end
    disp("");
    fprintf("La raiz aproximada es X%d = %0.7f con un |Ea| = %0.7f",i,xs,Ea);
    disp('%');
else
    % En caso de que no converge, finaliza el programa
    disp("No converge");
end
