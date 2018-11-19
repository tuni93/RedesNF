function salida=signmyversion(entrada)
    salida=sign(entrada);
    if(salida==0)
        salida=1;
    end
end