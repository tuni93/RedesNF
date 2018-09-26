clear all
clc
close all
%% Armo los patrones aleatorios.
    Nro_neuronas=10;
    indice_v=1;
    aux=0.5*ones(Nro_neuronas,Nro_neuronas);
    matriz_original=sign(rand(Nro_neuronas,Nro_neuronas)-aux)
    Nro_vueltas=12;
    
    
        matriz=matriz_original;
        nro_unos=numel(find(matriz==1))
    for(temperatura=5:-1:0)
        for(n=1:Nro_vueltas)
            Vector_aleatorio=randperm(length(matriz_original(:)));
            longitud_vector=length(Vector_aleatorio);
                for(k=1:longitud_vector)
                    [j,i] = ind2sub(Nro_neuronas,Vector_aleatorio(k));
                    energia_previa=funcion_energia_paramagnetica(matriz);
                    matriz_actualizada=generar_cambio(matriz,i,j);
                    energia_actual=funcion_energia_paramagnetica(matriz_actualizada);
                    estado=balance_energia(energia_previa,energia_actual,temperatura);
                    if(estado==1)
                        matriz=matriz_actualizada;
                    end
                end
        end
        
        nro_unos=numel(find(matriz==1))
        vector_energia(k)=energia_previa;
        vector_M(indice_v)=sum(matriz(:));
        vector_temperatura(indice_v)=temperatura;
        indice_v=indice_v+1;
    end

    figure(1)
    plot(vector_temperatura,(vector_M))
    figure(2)
    plot(vector_energia)