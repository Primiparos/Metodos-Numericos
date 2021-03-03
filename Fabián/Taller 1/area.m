%------------------------------Taller N°1---------------------------------
%---------------------------Métodos Númericos-----------------------------
%
% 4.- Desarrolle un algoritmo que calcule el área entre dos puntos [a, b] 
%       del plano cartesiano. 
%
%   Presentado por:-Fabián Alberto Sánchez Ruiz
%                  -Jose Daniel Muñoz Gomez 
%
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------

function Area
clear all;
clc;

%Aqui pediremos que el usuario ingrese las coordenadas para calcular el
%area entre ellas
v = input("Ingrese la primera coordenada:")
c = input("Ingrese la segunda coordenada:")
%este if es para que realize la operacion cuando la x de la primera
%coordenada sea mayor para poder realizar la operacion
if v(1)>c(1)
    %este if es para que realize la operacion cuando la y de la primera
    %coordenada sea mayor
    if v(2)>c(2)
        a=(((v(1)-c(1))*(v(2)+c(2)))/2);
        %este else es para cuando la y de la segunda coordenada sea mayor
    else
        a=(((v(1)-c(1))*(c(2)+v(2)))/2);       
    end
        %este else es para cuando la x en la segunda coordenada sea mayor
else
    %este if es para que realize la operacion cuando la y de la primera
    %coordenada sea mayor
    if v(2)>c(2)
        a=(((c(1)-v(1))*(v(2)+c(2)))/2);
        %este else es para cuando la y de la segunda coordenada sea mayor    
    else
        a=(((c(1)-v(1))*(c(2)+v(2)))/2);       
    end
end    

fprintf("El area entre los dos puntos es: %d\n",a)

%
%