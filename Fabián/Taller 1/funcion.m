%------------------------------Taller N°1---------------------------------
%---------------------------Métodos Númericos-----------------------------
%
% 2.- Elabore un script que capture una función matemática, su dominio y 
%        la grafique con las convenciones requeridas (titulo, ejes, etc.).
%
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------

clc;
clear all;

fprintf("Bienvenido al programa para graficar funciones...\n")

%Usamos el parametro "S" en el metodo input para que se pueda guardar
%la función que ingresemos en la variable a
a = input('Ingrese la funcion que desea graficar :>_ ', "S");
%Creamos la variable fun para guardar la función y usando el método inline
%pasandole por parametro a, que fue donde guardamos la función, le
%indicamos que se comporte como una función.
fun=inline(a);

%Capturamos el valor minimo del dominio
di = input("Ingrese el rango inferior del dominio de la función :>_ ");
%Capturamos el valor maximo del dominio
ds = input("Ingrese el rango superior del dominio de la función :>_ ");

valDom = di:ds;

%Dibujamos la función con una linea continua de color rojo (-r)
plot(valDom,fun(valDom),"-r")

ylabel("Y")
xlabel("X")
title("Gráfica " + a)

%
%