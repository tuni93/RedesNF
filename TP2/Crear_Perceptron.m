function [Perceptron]=Crear_Perceptron(Nro_entradas)  
    W_max=2;%Maximo valor aleatorio de la matriz W
    Perceptron=W_max*rand(Nro_entradas+1,1);   
end