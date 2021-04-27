%---------------------Quiz 1 - 2do Cohorte - Grupo A---------------------
%---------------------------Métodos Númericos------------------------------
%
%   Algoritmo para hallar la raiz de una función utilizando el método del
%   punto fijo.
%   
%   Grupo conformado por:
%           -Fabián Alberto Sánchez Ruiz
%
%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
clc, clear;

disp('Programa para hallar la raiz de una función con el método del punto fijo.');

fString = input('Ingrese la función f(x) a calcular la raiz:>_ ','S');
gString = input('Ingrese la función g(x)(despeje de f(x)):>_ ','S');

%Transformamos las cadenas de caracteres en funciones inline.
fFun = inline(fString);
gFun = inline(gString);

%Creamos una variable simbolica, que va a servir para hayar la derivada
%de g(x) con respecto a x.
syms x

%Hayamos la derivada de la función g(x) con respecto a x, usando la función 
%diff, la cual resive una función inline y la variable con respecto a la 
%que se va a derivar, que debe ser simbolica.
gDiffString = diff(gFun(x));
gDiff = inline(gDiffString);    %Convertimos la función string a inline.

%Pedimos el valor inicial que tendrá x en las iteraciones.
xn = input('Ingrese el valor inical de x >:_ ');

%Usamos la función eval, para evaluar la derivada de la función g(x) el punto
%inicial y comprobar si el resultado es menor que 1.
%                        g'(x0) < 1
%si se cumple, podemos decir entonces que la función converge y se puede
%proceder, sino, la función no converge y entonces se acaba el programa.
if(abs(gDiff(xn))<1)
    eU = input('Ingrese el valor del error aproximado:>_ ');
    i = 0;
    e = 100;
    fprintf('╔═══════════════════════════════════════╗\n');
    fprintf('║   i         xn         g(xn)        f(xn)         |Ea|    \n');
    fprintf('╠═══════════════════════════════════════╣\n');
    fprintf('║   %0.0f      %0.5f      %0.5f      %0.5f      %0.5f      \n',i,xn,gFun(xn), fFun(xn), e);
    
    %mientras que el error sea mayor al error del usuario, se seguira
    %iterando
    while(e > eU)
        i = i + 1;
        xn2 = gFun(xn);
        e = abs(((xn2 - xn)/xn2))*100;
        xn = xn2;
        fprintf('╠═══════════════════════════════════════╣\n');
        fprintf('║   %0.0f      %0.5f      %0.5f      %0.5f      %0.5f     \n',i,xn,gFun(xn), fFun(xn), e);
        
    end
    fprintf('╚═══════════════════════════════════════╝\n');
    fprintf('La raiz de la función f(x) se encuentra en x%0.0f = %0.5f con un error de |Ea| = %0.5f\n',i,xn,e);
else
    disp('La función g(x) ingresada diverge, ingrese una que converga.');
end

