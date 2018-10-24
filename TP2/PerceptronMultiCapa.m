%% Ejercicio 2 Perceptron multicapa.

clear all;
clc;
close all;
%% Defino mi vector de pesos W y dimensiones
N_entradas=2;
N_Capas=2;
W_max=1;
W=W_max*rand(N_entradas+1,N_entradas);
W_union=W_max*rand(N_Capas+1,1)
N_combinaciones=2^N_entradas;
%% Armo mi tabla de verdad 
Tabla_verdad=Armar_tabla_verdad_XOR(N_entradas)
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
nu=10;

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

        for j=i:(length(H))
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




 if(N_entradas==2)  
    x1=-2:0.25:2;
    x2=((W_previo(1,1)*x1)+W_previo(3,1))/(-W_previo(2,1));
    x3=((W_previo(1,2)*x1)+W_previo(3,2))/(-W_previo(2,2));
    figure()
    plot(x1,x2,'r')
    hold on
    plot(x1,x3,'b')
    xlabel('x1')
    ylabel('x2 y x3')
    axis([-2 2 -2 2])
    hold on
    for n=1:N_combinaciones
        if(Tabla_verdad(n,3)==1)
            plot(Tabla_verdad(n,1),Tabla_verdad(n,2),'o')
        else   
            plot(Tabla_verdad(n,1),Tabla_verdad(n,2),'x')
        end
    end 
  end