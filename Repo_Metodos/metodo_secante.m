clc 
clear all

%Pedimos la función, los puntos y el error aproximado
w = input("Ingresa una funcion: ", "S");
fun = inline(w);
disp("Ingrese los puntos: ");
a = input("Ingrese el primer valor: ");
b = input("Ingrese el segundo valor: ");
e_usuario = input("Ingrese el error inicial: ");

i = 1;
fprintf("i       Xn-1         Xn           Xn+1           f(Xn+1)         |Ea|\n");

%Comenzamos con las iteraciones:
while(true)

  % Evaluamos los puntos Xi y Xi-1
  % a --> Xi-1
  % b --> Xi
  fa = fun(a); 
  fb = fun(b);

  % Hallamos a Xi+1 y f(Xi+1)
  xs = b - (((fb)*(a - b))/((fa)-(fb)));
  fxs = fun(xs);
  
  % Verificamos si el error es menor que el del usuario
  eaprox = abs(((xs - b)/xs))*100;
  fprintf("%d      %0.5f       %0.5f      %0.5f      %0.5f       %0.5f\n", i, a, b, xs, fxs, eaprox);
  i = i + 1; 
  if(eaprox<=e_usuario)
    break;
  end  
  % Definimos así a Xi-1, Xi & Xi+1 
  a = b;
  b = xs;
end
disp("");
fprintf("La raiz aproximada es X%d = %0.7f con un |Ea| = %0.7f",i,xs,eaprox);
disp('%');

