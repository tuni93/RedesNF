%% Estados espurios

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

nro_patrones=3;
%% Armo el vector S
Vector_S=[S_patron_A S_patron_B S_patron_C];

dimension=length(Vector_S);

Matriz_W=(Vector_S*Vector_S')-nro_patrones*eye(dimension,dimension);


%% Producto w s
S_patron=S_patron_C;
Patron_double=Patron_C_double;
S_patron_invertido=S_patron*-1;
Patron_estimado=sign_myversion(Matriz_W*S_patron_invertido);
imagen_reconstruida=generar_imagen(S_patron_invertido,sqrt(dimension),sqrt(dimension));
figure(1)
imshow(Patron_double)
figure(2)
imshow(imagen_reconstruida)









