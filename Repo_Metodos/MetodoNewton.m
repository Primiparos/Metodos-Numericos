clc
clear
syms x;


x0=input('Ingrese el valor inicial: ');
tol=input('Ingrese el porcentaje de error: ');
f=input('Ingrese la funcion: ');
i=1;
fx(i)=x0;
 
syms x;
f1=subs(f,x,fx(i));
z=diff(f);
d=subs(z,x,fx(i));
 
ea(1)=100;
fprintf('-------------------------------------------------------------------------------------\n');
fprintf('-----|  No |-----------| xn  |-----------| xn+1 |---------| f(xn+1) |------| Ea |----\n');
fprintf('-------------------------------------------------------------------------------------\n');

while (abs(ea(i))>=tol)
    fx(i+1)=fx(i)-f1/d; 
    f1=subs(f,x,fx(i+1)); 
    d=subs(z,x,fx(i+1));
    ea(i+1)=abs((fx(i+1)-fx(i))/fx(i+1)*100);
    i=i+1;
        fprintf('\n-----| %d |--------|%0.7f |-------|%0.5f |--------|%0.5f |-----|%0.5f |-- \n \n',i-1,fx(i),abs(d),abs(f1),ea(i));
end

fprintf('\n \n La rai­z aproximada es %11.9f con una |Ea| = %0.5f', fx(i),ea(i)); disp('%')