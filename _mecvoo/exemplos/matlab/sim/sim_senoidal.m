%% Simulacao do sistema
tinterv = [0, 30]; % Intervalo de tempo da simulacao
xinicial = [0; 1]; % Valor inicial do vetor de estados

% Simula o sistema dinamico
[tsim, xsim] = ode45(@fs, tinterv, xinicial);

%% Plota simulacao no tempo
figure(1);
plot(tsim, xsim);
title('Evolucao temporal dos estados')
legend({'x_1', 'x_2'})
xlabel('t')

%% Plota simulacao no espaço de estados
figure(2);
plot(xsim(:, 1), xsim(:, 2));
title('Trajetoria no espaco de estados')
xlabel('x_1')
ylabel('x_2')
