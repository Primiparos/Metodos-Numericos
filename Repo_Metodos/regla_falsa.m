clc 
clear all

w = input("Ingrese su funcion: ", "S");
fuc = inline(w);
disp("Ingrese el intervalo: ");
a = input("Ingrese el primer valor del intervalo: ");
b = input("Ingrese el segundo valor del intervalo: ");
e_usuario = input("ingrese el error inicial: ");
fa = fuc(a);
fb = fuc(b);
ite = 1;
xr=0;
if (fa*fb<0)
  while(true)
    xr = b - ((fb)*(a-b)/(fa - fb));
    fxr = fuc(xr);
    xr
    if (ite < 2)
      if (fa*fxr<0)
        b = xr;
        xp = b;
      else 
        if (fa*fxr>0)
          a = xr;
          xp = a;
        end
      end
      ite = ite + 1;
    else
      Ea = abs(((xr-xp)/xr))*100;
      Ea
      if(Ea<=e_usuario)
        break;
      else
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
      ite = ite + 1;
    end
    pause(1);
  end
  fprintf("Finalmente tenemos la raiz: Xr%d = %0.7f",ite,xr);
else
disp("No mijito, no se puede");
end
 

