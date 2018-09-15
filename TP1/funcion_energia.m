function [energia]=funcion_energia(matriz,posicion_i,posicion_j)
    dimension=length(matriz);
    matriz_auxiliar= [zeros(dimension,1) matriz];
    matriz_auxiliar= [matriz_auxiliar zeros(dimension,1)];
    matriz_auxiliar= [matriz_auxiliar ;zeros(1,dimension+2)];
    matriz_auxiliar= [zeros(1,dimension+2);matriz_auxiliar];
    
    v1=matriz_auxiliar(posicion_i+2,posicion_j+1);
    v2=matriz_auxiliar(posicion_i,posicion_j+1);
    v3=matriz_auxiliar(posicion_i+1,posicion_j+2);
    v4=matriz_auxiliar(posicion_i+1,posicion_j);
    
    energia=(-0.5)*(matriz_auxiliar(posicion_i+1,posicion_j+1))*(v1+v2+v3+v4);
    
        