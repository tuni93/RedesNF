 function [salida]=funcion_AND_completa(entrada)
    [nro_filas , nro_columnas] = size(entrada);
    for i=1:nro_filas
        if((numel(find(entrada(i,:)==1)))==nro_columnas)
            salida(i)=1;
        else salida(i)=-1;
        end
    end
    salida=salida';
 end