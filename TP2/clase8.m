%% Algoritmo annealing

%% Ejercicio 2 Perceptron multicapa.

clear all;
clc;
close all;
%% Defino mi vector de pesos W y dimensiones
N_entradas=2;
N_Capas=2;
W_max=1;
W=W_max*randn(N_entradas+1,N_entradas);
W_union=W_max*randn(N_Capas+1,1);
W_General=[W W_union]
N_combinaciones=2^N_entradas;
%% Armo mi tabla de verdad 
Tabla_verdad=Armar_tabla_verdad_XOR(N_entradas)
entrada_original=Tabla_verdad(:,[1:end-1])
vector_unos=ones(N_combinaciones,1);
entrada=[entrada_original vector_unos];
salida_tabla=Tabla_verdad(:,end)

%% Calculo la salida de la red
Beta=1;
K=0.01;
T=10;
iteracion=0;
ECMS=[];
 while (T>0) 
     ECM_Previo=0;   
 %Calculo el error cuadratico medio antes de un cambio
     for i=1:N_combinaciones
         %Mi vector H es la suma de las entradas por los wij
          W_previo=W;
          H=(entrada(i,:)*W_previo)';
         %Mi vector V es el vector H aplicandole la tangh
          V=[tanh(Beta*H); 1];
          %Hs es el vector V por los wij
          Hs=V'*W_union;
          %La salida es la tangh de Hs
          Salida=tanh(Beta*Hs);
          ECM_Previo=ECM_Previo+(Salida-salida_tabla(i))^2;
           end
 ECM_Previo=ECM_Previo/2;
 %Genero un cambio aleatorio

    W_nuevo=generarWConCambio(W);
    W_union_nuevo=generarWConCambio(W_union);
    ECM_Nuevo=0;
 %Recalculo el ECM para la nuevo W
     for i=1:N_combinaciones
         %Mi vector H es la suma de las entradas por los wij
          H=(entrada(i,:)*W_nuevo)';
         %Mi vector V es el vector H aplicandole la tangh
          V=[tanh(Beta*H); 1];
          %Hs es el vector V por los wij
          Hs=V'*W_union_nuevo;
          %La salida es la tangh de Hs
          Salida=tanh(Beta*Hs);
          ECM_Nuevo=ECM_Nuevo+(Salida-salida_tabla(i))^2;
     end
     ECM_Nuevo=ECM_Nuevo/2;

      % Veo si acepto cambios.
    if(ECM_Nuevo <= ECM_Previo)
        W = W_nuevo;
        W_union=W_union_nuevo;
    else
        p = exp(-(ECM_Nuevo - ECM_Previo)/(T*K));
        if(rand < p)
        	 W = W_nuevo;
             W_union=W_union_nuevo;
        end
    end
   
    
    T=T-0.0005;
    ECMS = [ECMS, ECM_Previo];
    iteracion=iteracion+1;
 end
 
  for i=1:N_combinaciones
         W_previo=W;
          H=(entrada(i,:)*W_previo)';
         %Mi vector V es el vector H aplicandole la tangh
          V=[tanh(Beta*H); 1];
          %Hs es el vector V por los wij
          Hs=V'*W_union;
          %La salida es la tangh de Hs
          Salida=tanh(Beta*Hs)
       
     end
 
 plot(ECMS);
 