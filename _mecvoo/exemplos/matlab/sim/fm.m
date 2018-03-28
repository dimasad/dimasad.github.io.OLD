function xponto = fm(t, x)
% Define os parametros do sistema
a = 1; 
b = -1;
d = 0.2;

% Desempacota os estados e calcula a entrada
x1 = x(1);
x2 = x(2);
u1 = 0.3 * cos(t);

% Calcula a derivada das variaveis de estado
x1ponto = x2;
x2ponto = -d*x2 - b*x1 - a*x1^3 + u1;

% Monta o vetor x ponto
xponto = [x1ponto; x2ponto];
