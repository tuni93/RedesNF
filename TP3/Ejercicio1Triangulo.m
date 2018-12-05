% Algoritmo Kohonen Triangulo
clear all;
clc;
close all;

N = 15; 
M = 1000; 
aprendizaje = 0.02;
sigma = N/2;
limite = 1e-5;
w = rand(N,N, 2);
%% Grafico los pesos wij iniciales
figure(1)
plot(w(:,:,1),w(:,:,2),'o');

%% Defino mi entrada
x=rand(1,M);
y=rand(1,M);
for f=1:M
    if(y(f)>x(f))
        y(f)=y(f)*x(f);
    end
end
figure(2)
plot(x,y,'o')
%% Arranco con el algoritmo
iteracion = 1;
while sigma > limite   
    for k=1:M
 %Defino mi entrada como un par xy dentro del circulo unitario

 actual = [x(k) y(k)];

 % Busco la neurona ganadora
        min = Inf;
        for i = 1:size(w,1)
            for j = 1:size(w,2)
                peso_actual = [w(i,j,1) w(i,j,2)];
                aux = norm(peso_actual - actual);
                if aux < min
                    min = aux;
                    pos = [i j];
                end
            end 
        end
        
%Aplico la correccion de pesos
        for i = 1:size(w,1)
            for j = 1:size(w,2)
                peso_actual = [w(i,j,1) w(i,j,2)];
                pos_actual = [i j];
                vecindad = exp(-(norm(pos_actual-pos)^2)/(2*sigma^2));
                incremento = aprendizaje * vecindad * (actual-peso_actual);
                w(i,j,:) = peso_actual + incremento;
            end 
        end
        
    end
    iteracion = iteracion + 1;
    
    sigma = sigma*0.9;
end

 figure(3)
    plot(w(:,:,1),w(:,:,2),'o');
        
        
        
        
  
