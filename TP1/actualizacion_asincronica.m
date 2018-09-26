function [vector_actualizado , energia_obtenida]=actualizacion_asincronica(matriz_w,vector)
    n=length(vector);
    posicion_aleatoria=randperm(n);
    for i=1:n
        vector(posicion_aleatoria(i))=sign_myversion(matriz_w(posicion_aleatoria(i),:)*vector);
        energia_obtenida(i)=energia(matriz_w,vector);
    end
    vector_actualizado=vector;
end