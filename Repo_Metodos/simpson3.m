clc;
clear;
syms x;

a = 1;
b = 3;
n=6;
delta = (b-a)/n;
fun = (log(x)/x); 
vecx(1) = a;

for i = 2:n+1
    vecx(i) = vecx(i-1) + delta;
end

formula = 0;
fx = inline(fun);

for i=1:n+1
    if(i==1) || (i==n+1)
        formula = formula + fx(vecx(i));
    elseif mod((i-1),2)~=0
        formula = formula + 4*fx(vecx(i));
    elseif mod((i-1),2)==0
        formula = formula + 2*fx(vecx(i));
    end
end

formula = delta/3 * formula;
formula
