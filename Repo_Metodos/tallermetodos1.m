clc
clear all
%a = [2 1 2; 1 2 3; 2 3 2];
n = input("Ingrese el tamaio de su matriz n x n: ");
matriz = zeros(1, n);

for i = 1:n
 for j = 1:n
  fprintf("Ingrese el numero en la posicion %d,%d :",i,j);
  temp = input("");
  matriz(i,j) = temp;
  end
end

bool = 1;
for i = 1:n
  for j = 1:n
    if not(matriz(i,j)==matriz(j,i))
      bool = 0;
    end
  end
end
disp("\n");
disp(matriz);
disp("\n");
if bool == 1
  disp("La matriz es simetrica");
else
  disp("La matriz no es simetrica");
end