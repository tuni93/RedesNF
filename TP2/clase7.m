%% Ejercicio 3 Perceptron multicapa con funcion real

clear all;
clc;
close all;
%% Defino mi vector de pesos W y dimensiones
N_entradas=3;
NNeuronasPrimerCapa=10;
W_max=1;
W=W_max*rand(N_entradas+1,NNeuronasPrimerCapa);
W_union=W_max*rand(NNeuronasPrimerCapa+1,1)
%% Armo mi tabla de verdad 
Tabla_verdad=Armar_tabla_verdad_mi_funcion();
N_combinaciones=length(Tabla_verdad);
entrada_original=Tabla_verdad(:,[1:end-1])
vector_unos=ones(N_combinaciones,1);
entrada=[entrada_original vector_unos];
salida_tabla=Tabla_verdad(:,end)

%% Genero mi vector aleatorio
vector_aleatorio=randperm(N_combinaciones);

%% Calculo la salida de la red
W_previo=W;
Beta=1;
%Defino nu
nu=0.1;

ECM=10;
Tolerancia_ECM=0.1;
iterador=0;
MAX_ITERADOR=500;
while (ECM>Tolerancia_ECM && iterador<=MAX_ITERADOR) 


    for i=1:N_combinaciones
        %Mi vector H es la suma de las entradas por los wij
         H=(entrada(vector_aleatorio(i),:)*W_previo)';
        %Mi vector V es el vector H aplicandole la tangh
         V=[tanh(Beta*H); 1];
         %Hs es el vector V por los wij
         Hs=V'*W_union;
         %La salida es la tangh de Hs
         Salida=tanh(Beta*Hs);
        %% Calculo el back-propagation

        Delta_s=gprima(Hs,Beta)*(salida_tabla(vector_aleatorio(i))-Salida);

        %Calculo los delta i 

        for j=1:(length(H))
             Delta_i(j)=gprima(H(j),Beta)*W_union(j)*Delta_s;
        end
        Delta_i=Delta_i';
        % Calculo el delta en los w de la union
        Delta_W_union=nu*Delta_s*V;

        % Calculo el delta en los w 
        [nfilasw , ncolumnasw]=size(W);
        for fila_i=1:nfilasw
            for columna_i=1:ncolumnasw      
                 Delta_W(fila_i,columna_i)=nu*Delta_i(columna_i)* entrada(vector_aleatorio(i),fila_i);                  
            end
        end
        %Actualizo los pesos w
        W_union=W_union+Delta_W_union;
        W_previo=W_previo+Delta_W;
       end

     iterador=iterador+1;
     ECM=0;
    for j=1:N_combinaciones
        H=(entrada(j,:)*W_previo)';
        V=[tanh(H); 1];
        Hs=V'*W_union;
        salida=tanh(Hs);
        ECM=ECM+(salida-salida_tabla(j))^2;
        end
    ECM=ECM/N_entradas; 
end
for j=1:N_combinaciones
        H=(entrada(j,:)*W_previo)';
        V=[tanh(H); 1];
        Hs=V'*W_union;
        salida(j)=tanh(Hs);
end



 
    figure()
    plot(salida_tabla,'r')
    hold on
    plot(salida,'b')
    xlabel('Patron')
    ylabel('Perceptron')
    