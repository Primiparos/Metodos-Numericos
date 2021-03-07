%------------------------------Taller N°1---------------------------------
%---------------------------Métodos Númericos-----------------------------
%
% 5.- Implemente un algoritmo que realice la división sintética entre dos 
%       polinomios. Aplique las restricciones que este método implica. 
%
%   Presentado por:-Fabián Alberto Sánchez Ruiz
%                  -Jose Daniel Muñoz Gomez     
%
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------

function polinomio
    clear all;
    clc;
    %aqui le pedimos al usuario que ingrese los coeficientes que acompañen a
    %las x
    x=input("ingrese los coeficientes del primer polinomio:");
    y=input("ingrese los coeficientes del segundo polinomio:");
    %Asignamos a una variable el tamaño del segundo polinomio debido a que solo
    %si el coeficiente tiene un 1 de primer coeficiente podemos realizar la
    %division
    n=length(y);
    %Este if revisa si es 1 el coeficiente del denominador
    if n-1==1
        %aqui volvemos negativo el ultimo coeficiente del denominador
        %proceder a resolver
        a=-y(end);
        %este ciclo va a resolver hasta que llegue al ultimo coeficiente del primer polinomio 
        for i=1:length(x)
            %aqui resolvemos la multiplicacion del ultimo coeficiente del
            %denominador con el coeficiente del numerador en la posicion (i)
            b(i)=a*x(i);
            %Este if es para que resuelva la suma del resultado de la
            %multiplicacion con el siguiente coeficiente del numerador
            if length(b)~= length(x)
                x(i+1)=x(i+1)+b(i);
            else 
                break
            end
        end    
    end    
 
    %Ahora, ponemos a dividir la constante de nuestro vector resultante
    %sobre la constante del dividendo
    
    x(end) = x(end)/y(end)
    
    %Codigo para mostrar el vector en su forma polinomica

    i = length(x);
    cadena = "";
    j = 1;
    while i ~= 0 
        if i - 2 >= 1
            cadena = x(i)+" + "+cadena + " ";
        else
            cadena = x(i)+ " X^" +(j) + " " + cadena + " ";
            j = j + 1;
        end
        i = i - 1;
    end

    fprintf("El polinomio resultante de la división sintetica es: " + cadena);

%
%