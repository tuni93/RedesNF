function [W_nueva]=generarWConCambio(W)
    perturbacion_W=0.1;
    W_nueva = W;
    [filas, columnas] = size(W);
    fila = floor(rand() * filas) + 1;
    columna = floor(rand() * columnas) + 1;
    W_nueva(fila, columna) = W_nueva(fila, columna) + randn() * perturbacion_W;
end

