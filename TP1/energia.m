function [energia_obtenida]=energia(matriz_w,vector)
    energia_obtenida=0;
    n=length(matriz_w);
    for i=1:n
        for j=1:n
            energia_obtenida=energia_obtenida + matriz_w(i,j)*vector(i)*vector(j);
        end
    end
    energia_obtenida=energia_obtenida*(-0.5);
end