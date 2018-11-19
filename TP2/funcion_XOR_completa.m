 function [salida]=funcion_XOR_completa(entrada)
    [nro_filas , nro_columnas] = size(entrada);
    for i=1:nro_filas
        cantidad_unos=((numel(find(entrada(i,:)==1))));
        if(rem(cantidad_unos,2)==0)    
            salida(i)=-1;
        else salida(i)=1;
        end
    end
    salida=salida';
 end