 function [salida]=derivada_funcion_g(beta,entrada)
        g=funcion_g(beta,entrada);
        salida=beta*(1-(g^2)); 
 end