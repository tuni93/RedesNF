function [errores]=tabla_errores(Nro_patrones,Nro_neuronas)
    %% Armo los patrones aleatorios.
    aux=0.5*ones(Nro_neuronas,Nro_patrones);
    Vector_S=sign(rand(Nro_neuronas,Nro_patrones)-aux);

    %% Armo la matriz W
    Matriz_W=(Vector_S*Vector_S')-Nro_patrones*eye(Nro_neuronas,Nro_neuronas);

    %% Calculo el error (Ingreso mi patron, veo la diferencia con el patron original)
    Vector_S_Transformado=sign_myversion(Matriz_W*Vector_S);
    errores=0;
        for i=1:Nro_neuronas
            for j=1:Nro_patrones
                if(Vector_S(i,j) ~= Vector_S_Transformado(i,j))
                    errores=errores+1;
                end
            end
        end
    %% Promedio por el numero de patrones y neuronas
   errores=errores/Nro_patrones;
   errores=errores/Nro_neuronas;
end
