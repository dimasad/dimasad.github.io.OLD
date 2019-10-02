%% Simulacao do sistema
tinterv = [0, 30]; % Intervalo de tempo da simulacao
xinicial = [0; 0]; % Valor inicial do vetor de estados
xpinicial = [0; 0]; % Valor inicial de x ponto

% Simula o sistema dinamico
[tsim, xsim] = ode15i(@fim, tinterv, xinicial, xpinicial);

%% Plota simulacao no tempo
figure(1);
plot(tsim, xsim);
title('Evolucao temporal dos estados')
legend({'x_1', 'x_2'})
xlabel('t')

%% Plota simulacao no espaco de estados
figure(2);
plot(xsim(:, 1), xsim(:, 2));
title('Trajetoria no espaco de estados')
xlabel('x_1')
ylabel('x_2')