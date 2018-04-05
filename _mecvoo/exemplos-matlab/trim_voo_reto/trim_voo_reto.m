%% Chama o metodo de newton para linearizacao
%Chute inicial da condicao de trimagem
z0 = [0; 1200; 0];

% Trimagem utilizando implementacao propria do metodo de Newton
ztrim_mn = metnewton(@h, z0);

% Trimagem utilizando implementacao do metodo de Newton do Matlab
ztrim_fs = fsolve(@h, z0);
