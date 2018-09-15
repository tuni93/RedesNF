function [imagen]=generar_imagen(patron,filas,columnas)
    j=1;
    for(i=1:columnas)
        imagen(:,i)=patron([j:j+filas-1],1);
        j=j+filas;
    end
end