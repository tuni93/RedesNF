function [Salida]=sign_myversion(A)
    Salida=sign(A);
    Salida(Salida==0)=-1;
end