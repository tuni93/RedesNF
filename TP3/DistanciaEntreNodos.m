function [distancia]=DistanciaEntreNodos(posicionActual,posicion,CantidadNodos)
    distanciaDirecta=abs(posicionActual-posicion);
    distanciaInversa1=abs((CantidadNodos-posicionActual)+posicion);
    distanciaInversa2=abs((CantidadNodos-posicion)+posicionActual);
    distanciaInversa=min(distanciaInversa1,distanciaInversa2);
    if(distanciaDirecta>distanciaInversa)
        distancia=distanciaInversa;
    else 
        distancia=distanciaDirecta;
    end
    distancia;
    


end