function [salida]=Calcular_salida_Perceptron(W,Entradas)
    salida=0;
   [nro_filas,nro_columnas] = size(Entradas);
   for i=1:nro_columnas
        salida=salida+W(i)*Entradas(i);
   end
   salida=salida+W(end);
   salida=signmyversion(salida);
end