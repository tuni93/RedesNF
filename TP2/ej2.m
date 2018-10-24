%% Perceptron multicapa
clear all;
clc;
close all;
%% Armo mi tabla de verdad.
% Defino la cantidad de entradas
nro_entradas=2;
nro_patrones=(2^nro_entradas)-1;
vector_d=0:nro_patrones';
matriz = de2bi(vector_d);
matriz(matriz==0)=-1;
% Calculo la salida para las entradas
salida=mi_exor(matriz);%esta la tengo que cambiar cuando use 4 entradas
vector_unos=ones(nro_patrones+1,1);
matriz=[vector_unos matriz salida]

%% Defino mi vector de pesos W
W_max=nro_entradas;
W=W_max*rand(nro_entradas+1,nro_entradas+1)
Ws=W_max*rand(1,nro_entradas+1);

%% Calculos los hi
k=2;
Entrada=matriz(k,[1:length(matriz)-1])
Salida_deseada=matriz(k,[end]);
Vector_h=W*Entrada';% Aca esta mal

%% Calculos los vi
beta=1;
for i=1:length(Vector_h)
    Vector_v(i)=funcion_g(beta,Vector_h(i)');
end
Vector_v=Vector_v';

%% Calculo h2

h2=sum(Vector_v)

%% Calculo la y

Salida=funcion_g(beta,h2);

%% Calculo delta_s
delta_s=derivada_funcion_g(beta,h2);

%% Calculo delta i

%Vector_delta_i(i)=derivada_funcion_g(beta,Vector_h(i))**delta_s;

