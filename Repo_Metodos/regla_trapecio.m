clc;
clear;
syms x;

a = 0;
b = 1;
n=4;
delta = (b-a)/n;
fun = (x)/(sqrt(1+x^2)); 
vecx(1) = a;
for i = 2:n+1
    vecx(i) = vecx(i-1) + delta;
end

formula = 0;
fx = inline(fun);
for i=1:n+1
    if(i==1) || (i==n+1)
        formula = formula + fx(vecx(i));
    else
        formula = formula + 2*fx(vecx(i));
    end
end

formula = delta/2 * formula;

formula