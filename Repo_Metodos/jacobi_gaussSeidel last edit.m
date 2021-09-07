clc;
clear all;
syms x y z w


%Creamos las matrices
%declaramos el tamano
tam= 4;
%creamos la matriz
matc = [10,5,0,0; 5,10,-1,0; 0,-4,8,-1; 0,0,-1,5];
%y sus valores correspondientes
vec_inde = [16,25,-11,-11];

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

    exit;
elseif(res == 1)
    fprintf("\n");
        disp("  -----------");
        disp("⇉ Si converge ⇇");
        disp("  -----------");
        fprintf("\n");

end


    %Creamos las ecuaciones del sistema
    eqX_1 = matc(1,1)*x + matc(1,2)*y  == vec_inde(1);
    eqX_2 = matc(2,1)*x + matc(2,2)*y + matc(2,3)*z  == vec_inde(2);
    eqX_3 = matc(3,2)*y + matc(3,3)*z + matc(3,4)*w == vec_inde(3);
    eqX_4 = matc(4,3)*z + matc(4,4)*w == vec_inde(4);

            %Imprimimos en pantalla las ecuaciones
            fprintf("\n");
            disp("⇊⇊⇊⇊⇊⇊⇊⇊⇊⇊⇊⇊⇊");
               fprintf("\n");
                    disp(eqX_1);
                    disp(eqX_2);
                    disp(eqX_3);
                    disp(eqX_4);
            disp("⇈⇈⇈⇈⇈⇈⇈⇈⇈⇈⇈⇈⇈");
            fprintf("\n");
            
    %Despejamos cada variable
    var_x1 = solve(eqX_1,x);
    var_x2 = solve(eqX_2,y);
    var_x3 = solve(eqX_3,z);
    var_x4 = solve(eqX_4,w);

    %Convertimos de a tipo de función.
    var_x1 = inline(var_x1);
    var_x2 = inline(var_x2);
    var_x3 = inline(var_x3);
    var_x4 = inline(var_x4);
    
    
    disp("⫷⫷-------METODO DE JACOBI---------⫸⫸");
        fprintf("\n");
        fprintf("\n");
    %
    %METODO DE JACOBI
    %
    Eax = 100;
    Eay = 100;
    Eaz = 100;control = 0; i = 1;
    Eaw = 100; xa = 0;  ya = 0; za = 0; wa = 0;
    fprintf("i   |   Xn      |   Yn      |   Zn    |    Wn    |    Xn+1   |     " + ...
        "Yn+1   |     Zn+1   |    Wn+1   |    Eax   |   Eay   |   Eaz   |   Eaw\n");

            while(control==0)

                xs = var_x1(ya);
                ys = var_x2(xa,za);
                zs = var_x3(ya,wa);
                ws = var_x4(za);

                Eax = abs((xs-xa)/xs)*100;
                Eay = abs((ys-ya)/ys)*100;
                Eaz = abs((zs-za)/zs)*100;
                Eaw = abs((ws-wa)/ws)*100;

                if((Eax<10^-5) && (Eay<10^-5) && (Eaz<10^-5) && (Eaw<10^-5))
                    control = 1;
                end

                fprintf("%d   |   %.2f   |    %.2f   |    %.2f   |  %.2f  |   %.2f    |    " + ...
                    "%.2f    |   %.2f    |  %.2f   |  %.2f   |  %.2f  |  %.2f  |   %.2f\n",i,xa,ya,za,wa,xs,ys,zs,ws,Eax,Eay,Eaz,Eaw);

                i = i+1;
                xa = xs;
                ya = ys;
                za = zs;
                wa = ws;
            end

fprintf("\n");
fprintf("🠪 Por medio del metodo de Jacobi obtenemos:\n");
fprintf("\n");
disp("⇥  -----------↴");
fprintf("Finalmente, los resultados son X1 = %0.5f, X2 = %0.5f, X3 = %0.5f, X4 = %0.5f\n",xs,ys,zs,ws);
disp("⇥  -----------↴");
fprintf("Con un error de: Eax1 = %0.8f, Eax2 = %0.8f, Eax3 = %0.8f, Eax4 = %0.8f\n",Eax, Eay,Eaz, Eaw);
fprintf("\n");


  disp("⫷⫷-------GAUSS-SEIDEL---------⫸⫸");
        fprintf("\n");
        fprintf("\n");
%
% METODO DE GAUSS-SEIDEL
%

        Eax = 100;
        Eay = 100;
        Eaz = 100;control = 0; i = 1;
        Eaw = 100; xa = 0;  ya = 0; za = 0; wa = 0;
        xs = 0;  ys = 0; zs = 0; ws = 0;
        fprintf("i   |   Xn     |    Yn     |    Zn    |    Wn    |    Xn+1    |    " + ...
            "Yn+1    |   Zn+1   |    Wn+1   |    Eax   |   Eay    |  Eaz   |   Eaw\n");

        while(control==0)
            xs = var_x1(ys);
            ys = var_x2(xs,zs);
            zs = var_x3(ys,ws);
            ws = var_x4(zs);

            Eax = abs((xs-xa)/xs)*100;
            Eay = abs((ys-ya)/ys)*100;
            Eaz = abs((zs-za)/zs)*100;
            Eaw = abs((ws-wa)/ws)*100;

            if((Eax<10^-5) && (Eay<10^-5) && (Eaz<10^-5) && (Eaw<10^-5))
                control = 1;
            end

            fprintf("%d   |   %.2f    |   %.2f    |   %.2f   |  %.2f   |  %.2f    |    " + ...
                "%.2f     |  %.2f   |   %.2f  |   %.2f  |   %.2f  |  %.2f   |  %.2f\n",i,xa,ya,za,wa,xs,ys,zs,ws,Eax,Eay,Eaz,Eaw);

            i = i+1;
            xa = xs;
            ya = ys;
            za = zs;
            wa = ws;
        end

fprintf("\n");
fprintf("🠪 Por medio del metodo de Gauss-Seidel obtenemos:\n");
fprintf("\n");
disp("⇥  -----------↴");
fprintf("Finalmente, los resultados son: X1 = %0.5f, X2 = %0.5f, X3 = %0.5f, X4 = %0.5f\n",xs,ys,zs,ws);
disp("⇥  -----------↴");
fprintf("Con un error de: Eax1 = %0.8f, Eax2 = %0.8f, Eax3 = %0.8f, Eax4 = %0.8f\n",Eax, Eay,Eaz, Eaw);


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