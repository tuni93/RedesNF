function [Tabla_verdad]=Armar_tabla_verdad_XOR(Nro_entradas)
    Nro_patrones=((2^Nro_entradas)-1);
    d = (0:Nro_patrones)';
    Entradas = de2bi(d);
    Entradas(Entradas==0)=-1;
    Salidas = funcion_XOR_completa(Entradas);
    Tabla_verdad=[Entradas Salidas];
end
