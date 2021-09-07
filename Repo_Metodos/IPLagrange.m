%CODIGO DE JAIME FLACO
function [yi, pol]=IPLagrange(xs,ys,x)
%interpolacion por el polinomio de lagrange
%obtener la logitud del vector x
n=length(xs);
%validar longitud igual
if length(ys)~=n, error('x e y deben de ser la misma logitud');end
yi=0;pol='0';
%calcular los n factores de lagrange
for i=1:n
    %cada factor es el producto de (x-xj)/(xi-xj) donde i~=j
    producto=ys(i);
    termino=num2str(ys(i));
    for j=1:n
       if i~=j
           producto=producto*(x-xs(j))/(xs(i)-xs(j));
           termino=strcat(termino,'*(x-',num2str(xs(j)),...
               ')/(', num2str(xs(i)),'-',num2str(xs(j)), ')');
       end
    end
    %sumar cada termino
    yi=yi+producto;
    pol=strcat(pol,'+',termino);
end
%solo si se cuenta con el toolbox de symbolic math
pol=str2sym(pol);
pol=simplify(pol);
pol=inline(char(pol));
ezplot(pol,[0,100]);
           
        
