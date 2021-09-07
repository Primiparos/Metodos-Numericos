%declaramos la funcion
%x sera el vector 
%y sera los datos del vector
%a sera un punto cualquiera donde se pueda evaluar
 x=[1 3 5 7];
 f=[-2 1 2 -3];
 a=0;

%tomamos el tamano del vector
n=length(x);
disp(" ");
%optenemos el grado del polinomio inicial
disp('El grado del polinomio es:')
np=n-1
%y inicializamos una varibale simbolica
syms t;
%iniciamos el polinomio en 0
p=0;
%hacemos un dibujo de los puntos
plot(x,f,'o')
grid on; 

%iniciamos el primer recorrido
for i=1:n
    L=1;
    for j=1:n
        if i~=j
            L=L*(t-x(j))/(x(i)-x(j));
        end
    end
    p=p+L*f(i);
end
%simplificamos el polinomio
disp("Expresion del polinomio")
p=expand(p)
hold on;
%dibujamos la funcion
ezplot(p,[0,10])
t=a;
%evaluamos la funcion en un punto dado (a)
disp("El valor de la funcion evaludado en el punto a")
p=eval(p)
