%% Simulacao do sistema
tinterv = [0, 30]; % Intervalo de tempo da simulacao
xinicial = [0; 1.5]; % Valor inicial do vetor de estados

% Simula o sistema dinamico para entrada nula
[tsim_nula, xsim_nula] = ode45(@fm_ent_nula, tinterv, xinicial);

% Simula o sistema dinamico para entrada senoidal
[tsim_sen, xsim_sen] = ode45(@fm_ent_senoidal, tinterv, xinicial);

%% Plota as simulacao no espaço de estados
plot(xsim_nula(:, 1), xsim_nula(:, 2), ...
     xsim_sen(:, 1), xsim_sen(:, 2));
title('Trajetorias no espaco de estados')
xlabel('x_1')
ylabel('x_2')
legend({'entrada nula', 'entrada senoidal'})
