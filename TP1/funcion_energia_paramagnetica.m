function [energia]=funcion_energia_paramagnetica(matriz)
    dimension=length(matriz);
    matriz_auxiliar= [zeros(dimension,1) matriz];
    matriz_auxiliar= [matriz_auxiliar zeros(dimension,1)];
    matriz_auxiliar= [matriz_auxiliar ;zeros(1,dimension+2)];
    matriz_auxiliar= [zeros(1,dimension+2);matriz_auxiliar];
    longitud_auxiliar=length(matriz_auxiliar);
    energia=0;
    for posicion_i=2:longitud_auxiliar-1
        for posicion_j=2:longitud_auxiliar-1
       
         v1=matriz_auxiliar(posicion_i+1,posicion_j);
         v2=matriz_auxiliar(posicion_i-1,posicion_j);
         v3=matriz_auxiliar(posicion_i,posicion_j+1);
         v4=matriz_auxiliar(posicion_i,posicion_j-1);
       
        energia=energia+(0.5)*(matriz_auxiliar(posicion_i,posicion_j))*(v1+v2+v3+v4);
        end
    end 
        