function y=newton(fun,x0,tol)
syms x
f=inline(fun)
dfun=diff(fun,x)
df=inline(dfun)
disp(' n xi error');
n=1;
error=1000;
while error>=tol
a=x0-f(x0)/df(x0);
error =abs(a-x0);
fprintf('\t%i\t%3.5f\t%3.5f\n', n , a , error);
x0=a;
n=n+1;
end