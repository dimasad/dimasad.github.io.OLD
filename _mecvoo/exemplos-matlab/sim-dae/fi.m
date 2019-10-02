function err = fi(xponto, x, u) % f implita
% Define os parametros do sistema
a = 1; 
b = -1;
d = 0.2;

% Desempacota os estados, suas derivadas, e a entrada
x1 = x(1);
x2 = x(2);
x1ponto = xponto(1);
x2ponto = xponto(2);
u1 = u(1);

% Calcula o erro da solucao
err1 = x1ponto - x2;
err2 = x2ponto + d*x2 + b*x1 + a*x1^3 - u1;

% Monta o vetor erro
err = [err1; err2];
