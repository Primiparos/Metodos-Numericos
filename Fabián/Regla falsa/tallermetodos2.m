clc
clear all

w = input("Ingrese su funcion: ", "S");
fuc = inline(w);
d = input("Ingrese el dominio: "); %se ingresa un arreglo lineal
[a b] = size(d); %se separa la primera posición y la ultima;
x= linspace(d(a),d(b)); %se genera un vector espaciado linealmente, con la finalidad de tener una grafica con trazos limpios
plot(x,fuc(x));
title(['Grafica de: ' , char(w)]);
xlabel('Eje X');
ylabel('Eje Y');
grid on