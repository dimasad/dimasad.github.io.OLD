%% Simulacao do sistema
tint = [0, 30];    % Intervalo de tempo da simulacao
xini = [0; 1];     % Valor inicial do vetor de estados
xpini = [1; -0.2]; % Valor inicial de x ponto

% Simula o sistema dinamico para entrada nula
[tsim_nula, xsim_nula] = ode15i(@fim_ent_nula, tint, xini, xpini);

% Simula o sistema dinamico para entrada senoidal
[tsim_sen, xsim_sen] = ode15i(@fim_ent_senoidal, tint, xini, xpini);

%% Plota as simulacao no espaco de estados
plot(xsim_nula(:, 1), xsim_nula(:, 2), ...
     xsim_sen(:, 1), xsim_sen(:, 2));
title('Trajetorias no espaco de estados')
xlabel('x_1')
ylabel('x_2')
legend({'entrada nula', 'entrada senoidal'})