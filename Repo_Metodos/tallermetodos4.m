clc
clear all

a = input("Ingresa el primer punto: ");
b = input("Ingresa el segundo punto: ");
% Para resolver este problema, hacemos la suposici�n de
% tener un trapecio al reflejar la figura en el eje x
L = 2*a(2);
l = 2*b(2);
h = b(1) - a(1);
% Hallamos el area el "trapecio" y lo dividimos a la
% mitad para obtener el area de la figura entre los dos puntos

function A = Area(Lado1,lado2,altura)
  A = ((Lado1+lado2)*altura)/4;
end

n = Area(L,l,h);

if n<=0
  n= n*-1;
end

fprintf('El area entre los puntos (%0.2f, %0.2f) y (%0.2f, %0.2f) es: %0.2f ',a,b,n);
