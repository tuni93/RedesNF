 function [salida]=gprima(h,beta)
    g=tanh(beta*h);
    salida=beta*(1-g^2);
 end