function [salida]=mi_exor(matriz)
for i=1:length(matriz)
    if(matriz(i,1)==matriz(i,2))
        salida(i)=-1;
    else 
        salida(i)=1;
    end
    salida=salida';
 end