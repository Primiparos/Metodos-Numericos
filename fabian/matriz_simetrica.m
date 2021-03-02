%------------------------------Taller N°1---------------------------------
%---------------------------Métodos Númericos-----------------------------
%
% 1.- Comprobar si una matriz es simétrica
%    *Una matriz es simétrica cuando es igual a su traspuesta
%    *La matriz debe ser una matriz cuadrada (el número de filas debe ser
%     igual al número de columnas NxN)
%    *los elementos de la diagonal principal deberán permanecer fijos
%     despues de haber hecho la transposición
%    *Todos los elementos deben ser iguales
%
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------

clc;
clear all;

disp("Binvenido al programa para comprobar si una matriz es simetrica...")

m = input("Ingrese la matriz :>_ ");

%Primero, comprobamos si la matriz es una matriz cuadrada

[tamX, tamY] = size(m);

if tamX == tamY
   %Una vez comprabado que la matriz es cuadrada, hacemos su transposición
   mt = m';
   %Ahora, comprobamos que la matriz sea igual a su transpuesta
   if mt == m
       fprintf("La matriz que ingreso es simétrica.\n")
   else
    fprintf("La matriz NO es simétrica.\n")
   end

else
    fprintf("La matriz no es cuadrada, por lo tanto, no puede ser simétrica.\n")
end

fprintf("fin\n")

