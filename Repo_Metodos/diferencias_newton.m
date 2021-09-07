clc;
clear;
syms x;

p0 = input("Ingresa elr primer punto cartesiano");
p1 = input("Ingresa el segundo punto cartesiano");
p2 = input("Ingresa el tercer punto cartesiano");
p3 = input("Ingresa el cuarto punto cartesiano");
%p0 = [1,-2];
%p1 = [3,1];
%p2 = [5,2];
%3 = [7,-3];
%------- Se hallan los b -------%
vecb(1) = p0(2);
vecb(2) = funcionf(p0,p1);
vecb(3) = (funcionf(p2,p1)-funcionf(p1,p0))/(p2(1)-p0(1));
vecb(4) = (((funcionf(p3,p2) - funcionf(p2,p1))/(p3(1)-p1(1)))- ... 
      ((funcionf(p2,p1) - funcionf(p1,p0))/(p2(1)-p0(1))))/(p3(1)-p0(1));
%------- Se hallan los b -------%

%-------------------CREACIÓN DEL POLINOMIO---------------------%
f = vecb(1) + vecb(2)*(x-p0(1)) + vecb(3)*(x-p0(1))*(x-p1(1)) + ... 
    vecb(4)*(x-p0(1))*(x-p1(1))*(x-p2(1));
%-------------------CREACIÓN DEL POLINOMIO---------------------%

%------------Mostrar--------%
disp("¡¡¡Su polinomio es!!!: ")
g = simplify(f);
disp(g);
%------------Mostrar--------%

%------------Funcion para calcular: f[xn,...xn-1]--------%
function f = funcionf(pun1,pun0)
    f = (pun1(2) - pun0(2))/(pun1(1) - pun0(1));
end
%------------Funcion para calcular: f[xn,...xn-1]--------%
