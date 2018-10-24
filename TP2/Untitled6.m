clear all;
clc;
close all;
%% Guia 2
%Defino el nro de entradas
N_entradas=4;
% Defino mi vector de pesos W
W_max=2;
W=W_max*rand(N_entradas,1);
%W=[W;1];
%Defino nu
nu=1;
%Defino tolerancia
Tolerancia=0.001;
%Defino mi vector de entrada

entrada=[-1 -1];
entrada=[entrada 1];
W_previo=W;
Delta_W=1;

while (abs(Delta_W)>Tolerancia)
    salida_deseada=funcion_OR(entrada(1),entrada(2));
    salida=signmyversion(entrada*W_previo) 
    Delta_W=obtener_delta(entrada,salida_deseada,salida,nu);
    W_actualizado=W_previo+Delta_W';
    W_previo=W_actualizado;
end