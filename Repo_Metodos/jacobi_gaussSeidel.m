clc;
clear all;
syms x y z w


%Creamos las matrices
%declaramos el tamano
tam= 2;
%creamos la matriz
%matc = [10,5,6,0; 5,10,-1,0; 0,-4,8,-1; 0,0,-1,5];
%y sus valores correspondientes
%vec_inde = [16,25,-11,-11];

matc = [1,-2; 1, 4];
vec_inde = [1,4]

        disp("Cargaremos este sistema: ");
        disp("Coeficientes: ")
        fprintf("\n");
        disp(matc);
        disp("Terminos independientes: ")
        fprintf("\n");
        disp(vec_inde);
        disp("⚡--------------------------⚡");
        fprintf("\n");

            %Hacemos la prueba de convergencia
            res = converge(matc,tam);
            disp("Verificaremos si converge...");
            pause(2);
            disp("");

if(res == 0)
    fprintf("\n");
        disp("  -----------");
        disp("⇉ No converge ⇇");
        disp("  -----------");
        fprintf("\n");
        return;
elseif(res == 1)
    fprintf("\n");
        disp("  -----------");
        disp("⇉ Si converge ⇇");
        disp("  -----------");
        fprintf("\n");
        
end


   

        %Función que evalua la convergencia del SEL
        function res = converge(matr,tam)
        sum = 0;
        num = 0;
        res = 0;
        for i=1:tam
            for j=1:tam
                if(i~=j)
                    sum = sum + abs(matr(i,j));
                end
                if(i==j)
                    num = matr(i,j);
                end
                if(j==tam)
                    if(abs(num)>=sum)
                        res = 1;
                    end
                end
            end
        end
        end