function [Salidas]=ResultadosFuncionEj3(Entradas)
    filas=length(Entradas);
    for i=1:filas
       Salidas(i)= (1/3) * (sin(Entradas(i,1)) + cos(Entradas(i,2)) +Entradas(i,3));
    end
end