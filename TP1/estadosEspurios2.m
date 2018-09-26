%% Estos espurios combinacion de estados

%% Abro los archivos. 
Patron_A=imread('patronA.bmp');
Patron_B=imread('patronB.bmp');
Patron_C=imread('patronC.bmp');

%% Hago la conversion de las matrices de logic a double.
Patron_A_double=double(Patron_A);
Patron_A_01=Patron_A_double;
Patron_B_double=double(Patron_B);
Patron_B_01=Patron_B_double;
Patron_C_double=double(Patron_C);
Patron_C_01=Patron_C_double;
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


%% Combinacion de estados
matriz_selectora_1=(rand(sqrt(dimension))>0);
matriz_selectora_2=(rand(sqrt(dimension))>0);
matriz_selectora_3=(rand(sqrt(dimension))>0);
A=Patron_A_01.*matriz_selectora_1;
B=Patron_B_01.*matriz_selectora_2;
C=Patron_C_01.*matriz_selectora_3;
Patron=double(A & B & C);% (Patron_B_01.*matriz_selectora_1) %& (Patron_C_01.*matriz_selectora_3);
Patron(Patron==0)=-1;
figure(1)
imshow(Patron)

%% Calculo el w * s
S_Patron=Patron(:);
Patron_estimado=sign_myversion(Matriz_W*S_Patron);
imagen_reconstruida=generar_imagen(Patron_estimado,sqrt(dimension),sqrt(dimension));

figure(2)
imshow(imagen_reconstruida)