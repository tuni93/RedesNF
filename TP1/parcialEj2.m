
%% Ejercicio 2
close all;
clear all;
clc;
%% Armo los patrones aleatorios.
Nro_patrones=10;
Nro_neuronas=200;
aux=0.5*ones(Nro_neuronas,Nro_patrones);
Vector_S=sign_myversion(rand(Nro_neuronas,Nro_patrones)-aux);

%% Armo la matriz W
Matriz_W=(Vector_S*Vector_S')-Nro_patrones*eye(Nro_neuronas,Nro_neuronas);


%% Genero desconexiones en la red
nro_modificaciones=0.6;
aux=(rand(Nro_neuronas)>nro_modificaciones);
Matriz_W_modificada=Matriz_W.*aux;


%% Actualizacion asincronica
aux=0.5*ones(Nro_neuronas,1);
vector=sign_myversion(rand(Nro_neuronas,1)-aux);
[vector_actualizado, energia_obtenida]=actualizacion_asincronica(Matriz_W,vector);
[vector_actualizado, energia_obtenida_modificada]=actualizacion_asincronica(Matriz_W_modificada,vector);
i=1:length(energia_obtenida);
figure(1)
hold on
plot(i,energia_obtenida)
plot(i,energia_obtenida_modificada,'r')