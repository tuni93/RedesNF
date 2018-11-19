clear all;
clc;
close all;
%% Guia 2
% Defino mi vector de pesos W
N_entradas=2;
W_max=2;
W=W_max*rand(N_entradas+1,1);
%Defino nu
nu=0.1;
%Defino tolerancia
Tolerancia=0.001;
%Defino mi vector de entrada
N_combinaciones=2^N_entradas;
Tabla_verdad=Armar_tabla_verdad_AND(N_entradas)
entrada_original=Tabla_verdad(:,[1:end-1])
vector_unos=ones(N_combinaciones,1);

entrada=[entrada_original vector_unos];
salida_tabla=Tabla_verdad(:,end)

W_previo=W;
Delta_W=1;
estado=-1;
vector_aleatorio=randperm(N_combinaciones);
iterador=0;
MAX_ITERADOR=100;
while (estado==-1 && iterador<=MAX_ITERADOR)    
    for i=1:N_combinaciones
        salida_deseada=salida_tabla(vector_aleatorio(i));
        salida=signmyversion(entrada(vector_aleatorio(i),:)*W_previo);
        Delta_W=obtener_delta(entrada(vector_aleatorio(i),:),salida_deseada,salida,nu);
        W_actualizado=W_previo+Delta_W';
        W_previo=W_actualizado;
    end
    nro_aciertos=0;
    for j=1:N_combinaciones
        salida=signmyversion(entrada(j,:)*W_previo);
        if(salida==salida_tabla(j))
            nro_aciertos=nro_aciertos+1;
        end
        if(nro_aciertos==N_combinaciones)
            estado=0;
        end
        end
    iterador=iterador+1
  if(N_entradas==2)  
    x1=-2:0.25:2;
    x2=((W_previo(1)*x1)+W_previo(3))/(-W_previo(2));
    figure(iterador)
    plot(x1,x2,'r')
    xlabel('x1')
    ylabel('x2')
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
end
fprintf('La salida obtenida es');
for i=1:N_combinaciones
    salida(i)=signmyversion(entrada(i,:)*W_previo);
end
Resultado=[entrada_original salida']