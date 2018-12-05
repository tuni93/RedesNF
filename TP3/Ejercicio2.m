% Algoritmo Kohonen Salesman
clear all;
clc;
close all;

N = 150; 
M = 100; 
aprendizaje = 0.01;
sigma = N/2;
limite = 1e-5;
w = rand(N,2);
%% Grafico los pesos wij iniciales
figure(1)
plot(w(:,1),w(:,2),'o');
title('Pesos iniciales de la red')

%% Defino mi entrada
r1=0.5*rand(1,M/2);
r2=0.5*rand(1,M/2)+0.5;
r=[r1 r2];
alfa=2*pi()*rand(1,M);
%x=r.*cos(alfa);
%y=r.*sin(alfa);
x=rand(1,M);
y=rand(1,M);
figure(2)
plot(x,y,'o')
%% Arranco con el algoritmo
iteracion = 1;
while sigma > limite   
    for k=1:M
 %Defino mi entrada como un par xy dentro del circulo unitario
%  r = sqrt(rand);
%  alfa = rand.*2*pi;
%  x = r*cos(alfa);
%  y = r*sin(alfa);
 actual = [x(k) y(k)];

 % Busco la neurona ganadora
        min = Inf;
        for i = 1:size(w,1)
                peso_actual = [w(i,1) w(i,2)];
                aux = norm(peso_actual - actual);
                if aux < min
                    min = aux;
                    pos = [i];
                end
        end
        
%Aplico la correccion de pesos
        for i = 1:size(w,1)
                peso_actual = [w(i,1) w(i,2)];
                pos_actual = [i];
                distancia=DistanciaEntreNodos(pos,pos_actual,size(w,1));
                vecindad = exp(-(norm(distancia)^2)/(2*sigma^2));
                incremento = aprendizaje * vecindad * (actual-peso_actual);
                w(i,:) = peso_actual + incremento; 
        end
        
    end
    iteracion = iteracion + 1;
    sigma = sigma*0.9;
    wfinal=[w(:,1) w(:,end)];
    pause(0.08);
    figure(3)
    clf
    plot(x,y,'ob');
    legend('Ciudades');
    hold on
    plot(w(:,1),w(:,2),'-or');
    plot(wfinal(:,1),wfinal(:,2),'-or');
    axis([-0.1 1.1 -0.1 1.1])
    legend('Neuronas');
    title('Pesos finales de la red')


end
wfinal=[w(:,1) w(:,end)];
 figure(4)
    plot(x,y,'ob');
    legend('Ciudades');
    hold on
    plot(w(:,1),w(:,2),'-or');
    plot(wfinal(:,1),wfinal(:,2),'-or');
    axis([-0.1 1.1 -0.1 1.1])
    legend('Neuronas');
    title('Pesos finales de la red')
    
        
        
        
  
