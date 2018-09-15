%% Abro los archivos. 
Patron_A=imread('patronA.bmp');
Patron_B=imread('patronB.bmp');
Patron_C=imread('patronC.bmp');

%% Hago la conversion de las matrices de logic a double.
Patron_A_double=double(Patron_A);
Patron_B_double=double(Patron_B);
Patron_C_double=double(Patron_C);
%% Convierto los 0 a -1 de la matriz
Patron_A_double(Patron_A_double==0)=-1;
Patron_B_double(Patron_B_double==0)=-1;
Patron_C_double(Patron_C_double==0)=-1;

%% Convierto las matrices a vectores
S_patron_A=Patron_A_double(:);
S_patron_B=Patron_B_double(:);
S_patron_C=Patron_C_double(:);

%% Armo el vector S
Vector_S=[S_patron_A S_patron_B S_patron_C];

[N_filas_Vector_S N_columnas_Vector_S]=size(Vector_S);

Matriz_W=(Vector_S*Vector_S')-N_columnas_Vector_S*eye(N_filas_Vector_S,N_filas_Vector_S);%Esto es equivalente a patron1*patron1+patron2*patron2+patron3*patron3
                                                                                         %con la anulacion de la diagonal
%% Imagenes con ruido
%% Abro los archivos. 
Patron_A_ruido=imread('patronA_ruido.bmp');
Patron_A_double_ruido=double(Patron_A_ruido);
Patron_A_double_ruido(Patron_A_double_ruido==0)=-1;
S_patron_A_ruido=Patron_A_double_ruido(:);

vector_aleatorio=randperm(N_filas_Vector_S);%Vector permutado con las posiciones

for i=1:N_filas_Vector_S
    posicion=vector_aleatorio(i);
    S_patron_A_ruido(posicion)=sign(Matriz_W(posicion,:)*S_patron_A_ruido);
    imagen=generar_imagen(S_patron_A_ruido,50,50);
end
imshow(imagen);
if(S_patron_A_ruido==S_patron_A)
    fprintf('iguales');
end


%Patron_B_estimado=sign(Matriz_W*S_patron_B);
%Patron_C_estimado=sign(Matriz_W*S_patron_C);
%Test_A=Patron_A_estimado-S_patron_A;
%Test_B=Patron_B_estimado-S_patron_B;
%Test_C=Patron_C_estimado-S_patron_C;


