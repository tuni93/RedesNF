%% Script para errores de la red hopfield
clear all
clc 
close all
Nro_patrones=[105 138 185 370 610];
Nro_neuronas=[1000 1000 1000 1000 1000];
errores=[0.001 0;0.0036 0;0.01 0;0.05 0;0.1 0];
Nro_pruebas=length(Nro_patrones);
for i=1:Nro_pruebas
    errores(i,2)=tabla_errores(Nro_patrones(i),Nro_neuronas(i));
end
errores
Nro_conexiones_eliminadas=0:0.05:1;
Nro_pruebas=length(Nro_conexiones_eliminadas);
errores_eliminando_conexiones=zeros(length(Nro_conexiones_eliminadas),2);
errores_eliminando_conexiones(:,1)=errores(1);
for i=1:Nro_pruebas
    errores_eliminando_conexiones(i,2)=tabla_errores_eliminando_conexiones(Nro_patrones(1),Nro_neuronas(1),Nro_conexiones_eliminadas(i));
end
errores_eliminando_conexiones
figure(1)
plot(Nro_conexiones_eliminadas,errores_eliminando_conexiones);
title 'ERROR VS PORCENTAJE DE CONEXIONES ELIMINADAS '

