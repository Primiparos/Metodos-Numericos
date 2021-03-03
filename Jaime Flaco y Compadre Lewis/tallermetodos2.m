% Punto 2
% Elabore un script que capture una función matemática, su dominio y la grafique con las convenciones requeridas (titulo, ejes, etc.).

clc
clear all

w = input("Ingrese su funcion: ", "S");
fuc = inline(w);

%se ingresa un arreglo lineal
d = input("Ingrese el dominio: "); 

%se separa la primera posición y la ultima;
[a b] = size(d); 

%se genera un vector espaciado linealmente, 
%con la finalidad de tener una grafica con trazos limpios
x= linspace(d(a),d(b)); 
%Investigada la funcion linspace en la Documentación de Matlab

plot(x,fuc(x));
title(['Grafica de: ' , char(w)]);
xlabel('Eje X');
ylabel('Eje Y');
grid on