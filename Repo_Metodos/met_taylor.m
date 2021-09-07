clc;
clear;
syms t y
fxy = t + y;
fxyp = diff(fxy);
%fxyp = inline(fxyp);
fxy = inline(fxy);
t0 = 0;
y0 = 1;
tf=1;
n = 2;
h = 0.1;

ti = t0;
yi = y0;
ys = 0;
%for j = (1:n+1)
%    ys = ys + ((h^n)/(factorial(n)))*diff(fxy,n);
%end

fprintf("t           y            f(x,y)\n");
for i = 1:(((tf-t0)/h) + 1)
    fprintf("%.5f     %.5f      %.5f\n",ti,yi,fxy(ti,yi));
    ys = yi +h*fxy(ti,yi) + ((h^2)/factorial(2))*fxyp;
    ti = ti + h;
    yi = ys;
end

function y = factorial(numero)
    n = 1;
    while(numero~=1)
    n = n*numero;
    numero = numero -1 ;
    end
    y = n;
end