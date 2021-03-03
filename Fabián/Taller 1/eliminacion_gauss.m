%------------------------------Taller N°1---------------------------------
%---------------------------Métodos Númericos-----------------------------
%
% 3.- Crear un algoritmo en octave que resuelva el sistema por dos de los 
%        siguientes métodos (sustitución, igualación, suma / resta, 
%        reducción y sarrus / determinantes). 
%        
%        [1,2,3;1,-2,4;0,-2,1][a,b,c] = [2;7;3]
%
%   Presentado por:-Fabián Alberto Sánchez Ruiz
%                  -Jose Daniel Muñoz Gomez 
%
%-------------------------------------------------------------------------
%---------------------Método de eliminación de Gauss-----------------------
%-------------------------------------------------------------------------

clc;
clear all;

fprintf("Bienvenido al programa para solucionar sistemas de ecuaciones lineales por el método de eliminación de gauss\n")

a = input("Ingrese la matriz con los coeficientes :>_ ");

b = input("Ingrese el vector con las soluciones :>_ ");

%La matriz debe ser cuadrada

%Guardamos el tamaño de la matriz a
[~, n] = size(a);
%Juntamos las dos matrices (a y b) para crear la matriz aumentada
a = [a';b']';
%Creamos la matriz que va a ir guardando todas las soluciones
x=zeros(n,1);

%Empezamos a hacer el procedimiento para obtener las soluciones
%Empezamos con un ciclo for con el parametro p -> pivote la cual
%ira de 1 hasta n

for p=1:n
    %k podrá ser todas las filas de una n, con excepción de la fila pivote
    for k = [1:p-1,p+1:n]
        %m será el factor de multiplicación al pivote, tal que al sumarlo a la
        %fila, haga ceros en la columna que se necesite
        m = -a(k,p)/a(p,p);
        %Ahora, se actualiza a la fila k
        a(k,:) = a(k,:) + m*a(p,:);
    end
end
r=a(:, n + 1);
x = a(:, n + 1)./diag(a);

fprintf("La solución de su matriz es:\n")

disp(x)

%
%