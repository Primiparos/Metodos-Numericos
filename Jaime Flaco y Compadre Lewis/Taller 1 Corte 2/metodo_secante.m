clc 
clear all


%Pedimos la funci�n, los puntos y el error aproximado
%----------------------------------------------------
w = input("Ingresa una funcion: ", "S");
fun = inline(w);
disp("Ingrese el intervalo: ");
a = input("Ingrese el primer valor del intervalo: ");
b = input("Ingrese el segundo valor del intervalo: ");
e_usuario = input("ingrese el error inicial: ");
%----------------------------------------------------


ite = 1;
fprintf("i       Xn-1         Xn         Xn+1       f(Xn+1)        |Ea|\n");

%Comenzamos con las iteraciones:
%----------------------------------------------------
while(true)
% Evaluamos los puntos Xi y Xi+1
  fa = fun(a); 
  fb = fun(b);
% ------------------------------

% Hallamos a Xi+1 y f(Xi+1)
  xs = b - (((fb)*(a - b))/((fa)-(fb)));
  fxs = fun(xs);
%--------------------------
  
% Verificamos si el error es menor que el del usuario
  eaprox = abs(((xs - b)/xs))*100;
  fprintf("%d    %0.5f     %0.5f    %0.5f    %0.5f     %0.5f\n", i, a, b, xs, fxs, eaprox);
  i = i + 1; 
  if(eaprox<=e_usuario)
    break;
  end
% ---------------------------------------------------
  
% Definimos as� a Xi-1, Xi & Xi+1 
  a = b;
  b = xs;
%--------------------------------
end
%----------------------------------------------------
fprintf("La raiz aproximada es X%d = %0.7f con un |Ea| = %0.7f",i,xs,eaprox);


