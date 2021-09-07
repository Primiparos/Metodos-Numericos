clc;
clear;

syms t y
fxy = (1/3)*(sin(t) - 5*y^2);
fxyp = diff(fxy);
%fxyp = inline(fxyp);
fxy = inline(fxy);
t0 = 0;
y0 = 5;
tf=0.9;
h = 0.3;

ti = t0;
yi = y0;
ys = 0;
%for j = (1:n+1)
%    ys = ys + ((h^n)/(factorial(n)))*diff(fxy,n);
%end

fprintf("t           y            f(x,y)\n");
for i = 1:(((tf-t0)/h) + 1)
    fprintf("%.5f     %.5f      %.5f\n",ti,yi,fxy(ti,yi));
    ys = yi +h*fxy(ti,yi);
    ti = ti + h;
    yi = ys;
end


