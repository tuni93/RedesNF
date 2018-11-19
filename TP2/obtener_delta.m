function [Delta_W]=obtener_delta(entradas,salida_deseada,salida,nu)
    Delta_W=nu*entradas*(salida_deseada-salida);
end