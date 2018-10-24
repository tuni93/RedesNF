clear all;
clc;
close all;
%% Guia 2
% Defino mi vector de pesos W
W_max=2;
W=W_max*rand(3,1);
%W=[W;1];
%Defino nu
nu=0.1;
%Defino tolerancia
Tolerancia=0.001;
%Defino mi vector de entrada
entrada_original=[-1 -1;-1 1;-1 1;1 1];
N_combinaciones=4;
vector_unos=ones(N_combinaciones,1);
entrada=[entrada_original vector_unos];
W_previo=W;
Delta_W=1;
estado=0;
vector_aleatorio=randperm(N_combinaciones);

while (max(abs(Delta_W)>Tolerancia) || estado==-1)    
    for i=1:N_combinaciones
        estado=0;
        salida_deseada=funcion_AND(entrada(vector_aleatorio(i),1),entrada(vector_aleatorio(i),2));
        salida=signmyversion(entrada(vector_aleatorio(i),:)*W_previo) 
        Delta_W=obtener_delta(entrada(vector_aleatorio(i),:),salida_deseada,salida,nu);
        W_actualizado=W_previo+Delta_W';
        W_previo=W_actualizado;
    end
    
    for j=1:N_combinaciones
        salida=signmyversion(entrada(j,:)*W_previo);
        salida_deseada=funcion_AND(entrada(j,1),entrada(i,2));
        if(salida~=salida_deseada)
            estado=-1;
        end
    end
    
    
end
estado
fprintf('La salida obtenida es');
for i=1:N_combinaciones
    salida(i)=signmyversion(entrada(i,:)*W_previo);
end
Resultado=[entrada_original salida']