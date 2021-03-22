%----------------Actividad Final - 1er Cohorte - Grupo A-------------------
%---------------------------Métodos Númericos------------------------------
%
%   El siguiente script fue realizado para la actividad final del 1er 
%   corte de la matería de métodos númericos. Sirve para hallar la raiz
%   de una función entre un intervalo y con un margen de error, con el
%   método de la regla falsa. La función, el intervalo y el margén de
%   error son introducidos por el usuario. Todos los puntos de la 
%   actividad fueron realizados con el siguiente código.
%   
%   Grupo conformado por:
%           -Sebastián Ricardo Cardenas
%           -Fabián Alberto Sánchez Ruiz
%
%-------------------------------------------------------------------------
%-------------------------------------------------------------------------

clc 
clear all

%Pedimos la funci�n
w = input("Ingrese su funcion: ", "S");
%Convertimos en funci�n
fuc = inline(w);
%pedimos los datos //
disp("Ingrese el intervalo: ");
a = input("Ingrese el primer valor del intervalo: ");
b = input("Ingrese el segundo valor del intervalo: ");
e_usuario = input("ingrese el error inicial: ");
%//
%Evaluamos los puntos en la funci�n
fa = fuc(a);
fb = fuc(b);
%Variable iteradora y Xr primero
ite = 1;
xr=0;

%Evaluamos esa mond�
if (fa*fb<0)
  fprintf("i   Xn-1      Xn          f(Xn)     |Ea|\n");  
  while(true)
    %Hallamos la xr y evaluamos xr
    xr = b - ((fb)*(a-b)/(fa - fb));
    fxr = fuc(xr);
  %verificamos que iteraci�n es.
  if (ite < 2)
  %hacemos el cambio de coordenadas
      if (fa*fxr<0)
        b = xr;
        xp = b;
      else 
        if (fa*fxr>0)
          a = xr;
          xp = a;
        end
      end
      %a�adimos a la tabla de datos y sumamos 1na iteraci�n
      fprintf("%d   %0.5f   %0.5f     %0.5f   ---- \n",ite,xp,xr,fxr);
      ite = ite + 1;
    else
      %Empezamos a calcular los errores
      Ea = abs(((xr-xp)/xr))*100;
      %Verificamos si cumplimos con la condicion del error del usuario
      if(Ea<=e_usuario)
        break;
      else
        %Seguimos partiendo el intervalo
        if (fa*fxr<0)
          b = xr;
          xp = b;   
        else 
          if (fa*fxr>0)
            a = xr;
            xp = a;
          end
        end
      end
      %A�adimos a la tabla y sumamos una iteraci�n
      fprintf("%d   %0.5f   %0.5f     %0.5f   %0.5f \n",ite,xp,xr,fxr,Ea);
      ite = ite + 1;
    end
    %pause(1);
  end
  fprintf("Finalmente tenemos la raiz: Xr = %0.7f",xr);
else
disp("No hay raices");
end
 