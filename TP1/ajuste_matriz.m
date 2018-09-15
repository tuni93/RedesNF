function [B]=ajuste_matriz(A)
    [N_fil N_col]=size(A);
    aux=ones(N_fil,N_fil);
    B=2*(A-0.5*aux);
   
end