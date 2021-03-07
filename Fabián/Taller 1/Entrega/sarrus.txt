%------------------------------Taller N°1----------------------------------
%---------------------------Métodos Númericos------------------------------
%
% 3.- Crear un algoritmo en octave que resuelva el sistema por dos de los 
%        siguientes métodos (sustitución, igualación, suma / resta, 
%        reducción y sarrus / determinantes). 
%        
%        [1,2,3;1,-2,4;0,-2,1][a,b,c] = [2;7;3]
%
%   Presentado por:-Fabián Alberto Sánchez Ruiz
%                  -Jose Daniel Muñoz Gomez 
%
%--------------------------------------------------------------------------
%---------------------Método de eliminación de Sarrus----------------------
%--------------------------------------------------------------------------

clc;
clear all;

fprintf("Bienvenido al programa para solucionar sistemas de ecuaciones lineales por el método de Cramer/Sarrus\n");

a = input("Ingrese la matriz con los coeficientes :>_ ");

b = input("Ingrese el vector con las soluciones :>_ ");

%Sacamos el tamaño (número de componentes) de b.
n = length(b);
%Creamos el vector que guardara los resultados de la solución.
x = zeros(n,1);

%Empezamos el ciclo con la variable k, la cual ira tornando las columnas
%de la matriz
for k=1:n
    %Igualamos la matriz a ak para trabajar con ella sin perderla
    ak=a;
    %Ahora, remplazamos la columna k con el vector de resultados b
    ak(:,k) = b;
    %Y procedemos a hacer la división de la determinante de la matriz
    %cambiada ak, sobre el determinante de la matriz normal.
    %Los determinantes lo hallamos con la función determinante() la cual
    %implementamos abajo. Guardamos el resultado en la variable x.
    x(k) = determinante(ak)/determinante(a);
end

fprintf("La solución de su matriz es:\n")

disp(x)

%--------------------------------------------------------------------------

function d=determinante(a)
%implementamos una función para hallar las determinantes de matrices, donde
%   a -> es la matriz a la cual se le va a hallar la determinante
%   d -> es la determinante de la matriz

    %Guardamos el tamaño de la matriz
    n = 1:size(a,1);
    
    %k será el indentificador de las columnas, por lo tnato, lo haremos 
    %recorrer desde 1 hasta el tamaño de la matriz
    for k=1:size(a,1)
        %Si la matriz es de 1x1
        if size(a,1) == 1
            %Entonces sus determinante será la propia matriz 1x1
            d=a;
        else
            %Restringimos la fila 1 porque solo la vamos a usar para
            %mostrar los coeficientes de las submatrices
            f=n(n~=1);
            %Además, la columna debe ser diferente a la columna en k
            c = n(n~=k);
            %Ahora, podemos definir los determinantes termino por termino
            d(k)=((-1)^(1+k))*a(1,k)*determinante(a(f,c));
            
            d=sum(d);
        end
    end
end

%
%