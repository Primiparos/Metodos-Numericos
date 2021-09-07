clc 
clear all

w = input("Ingrese su funcion: ", "S");
fuc = inline(w);
a = input("Ingrese el primer valor inicial: ");
b = input("Ingrese el segundo valor inicial: ");
e_usuario = input("ingrese el error inicial: ");
fa = fuc(a);
fb = fuc(b);
iteradora = 1;

if (fa*fb<0)
  while(true)
    xr = (a+b)/2;
    fxr = fuc(xr);
    xr
    if (iteradora < 2)
      if (fa*fxr<0)
        b = xr;
        xp = b;
      else 
        if (fa*fxr>0)
          a = xr;
          xp = a;
        end
      end
      iteradora = iteradora + 1;
    else
      Ea = abs((xr-xp)/xr)*100;
      Ea
      if(Ea<e_usuario)
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
    end
    pause(1);
  end
else
disp("a");
end
 
