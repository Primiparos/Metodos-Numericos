% Punto 5
% Implemente un algoritmo que realice la división sintética entre dos polinomios. Aplique las restricciones que este método implica.

clc 
clear all

grado1 = input('Ingrese el grado de su primer polinomio: ');

  for i = 1 :(grado1+1)
    fprintf('Ingrese el coeficiente %d: ', i);
    vari1 = input("");
    vec_coef1(i)=vari1;
  end
  
disp("\n");
disp('Ingrese los coeficientes su polinomio de grado 1:');

for i = 1:(2)
    fprintf('Ingrese el coeficiente %d: ', i);
    vari2 = input("");
    vec_coef2(i)=vari2;
end

x = -(vec_coef2(2)/vec_coef2(1));
n = vec_coef1(1);

for i=1:grado1+1
 
  if i<grado1+1
   vec_sol(i)=n;
   n = (n*x)+ vec_coef1(i+1);  
  end
  
end
disp("SOLUCION\n");

disp("El vector de coeficientes del cociente es: ");

fprintf("q(x) = [ ");

for i=1:length(vec_sol)
  fprintf("%d ",vec_sol(i));
end

fprintf("]\n");
disp("El Residuo es: ");
fprintf("r(x)= %d\n",n);

