function [imagen]=generarWConCambio(MatrizW,indice)
    [filas columnas]=size(MatrizW);
    perturbacion=randn();
    VectorW=MatrizW(:);
    VectorW(indice)=VectorW(indice)+perturbacion;

    j=1;
    for(i=1:columnas)
        imagen(:,i)=VectorW([j:j+filas-1],1);
        j=j+filas;
    end
end