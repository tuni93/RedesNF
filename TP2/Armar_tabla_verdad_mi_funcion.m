function [Tabla_verdad]=Armar_tabla_verdad_mi_funcion()
    separacion = 10;
    x = linspace(0, 2*pi, separacion);  
    y = linspace(0, 2*pi, separacion);
    z = linspace(-1, 1, separacion);
    Entradas = combvec(x, y, z)';
    size(Entradas)
    Salidas = ResultadosFuncionEj3(Entradas);
    size(Salidas)
    Tabla_verdad=[Entradas Salidas'];
end
