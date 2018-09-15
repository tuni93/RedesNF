%% Ejercicio 4
clear all
clc
close all
%% Armo los patrones aleatorios.
    Nro_neuronas=10;
    indice_v=1;
    aux=0.5*ones(Nro_neuronas,Nro_neuronas);
    matriz_original=sign(rand(Nro_neuronas,Nro_neuronas)-aux)
    Nro_vueltas=12;
    for n=1:Nro_vueltas
        Vectores_aleatorios(n,:)=randperm(length(matriz_original(:)));
    end
    
    
    
    for(temperatura=0:0.025:10)
        matriz=matriz_original;
        for(n=1:Nro_vueltas)
            Vector_aleatorio=Vectores_aleatorios(n,:);
            longitud_vector=length(Vector_aleatorio);
                for(k=1:longitud_vector)
                    [j,i] = ind2sub(Nro_neuronas,Vector_aleatorio(k));
                    energia_previa=funcion_energia(matriz,i,j);
                    matriz_actualizada=generar_cambio(matriz,i,j);
                    energia_actual=funcion_energia(matriz_actualizada,i,j);
                    estado=balance_energia(energia_previa,energia_actual,temperatura);
                    if(estado==1)
                        matriz=matriz_actualizada;
                    end
                end
        end
        vector_M(indice_v)=sum(matriz(:));
        vector_temperatura(indice_v)=temperatura;
        indice_v=indice_v+1;
    end
    
    plot(vector_temperatura,(vector_M))