function [estado]=balance_energia(energia_inicial,energia_actualizada,temperatura)
    estado=0;
    if(energia_inicial>=energia_actualizada)
        estado=1;
    else
        nro_aleatorio=rand();
        aux=exp((energia_inicial-energia_actualizada)/temperatura);
        if (aux>nro_aleatorio)
            estado=1;
        end
    end
    
        