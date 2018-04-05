%% Constantes
d2r = pi/180;
r2d = 180/pi;

%% Gera os dados de h x z
[a, T] = meshgrid(linspace(-1*d2r, 3*d2r, 300), ...
                  linspace(850, 1100, 300));
[h1, h2] = h_plots(a, T);

%% Trima numericamente
z0 = [0; 1200; 0];
ztrim = fsolve(@h, z0);

%% Plota os resultados
figure(1)
contour(r2d*a, T, h1);
colorbar;
hold on;
contour(r2d*a, T, h1, [0,0], 'LineWidth', 3);
hold off;
title('Erro de trimagem em d\alpha/dt')
xlabel('\alpha [\circ]')
ylabel('T [N]')

figure(2)
contour(r2d*a, T, h2, '--');
colorbar;
hold on;
contour(r2d*a, T, h2, [0,0], '--', 'LineWidth', 3);
hold off;
title('Erro de trimagem em dV_c/dt')
xlabel('\alpha [\circ]')
ylabel('T [N]')

figure(3)
contour(r2d*a, T, h1 ./ 20);
colorbar;
hold on;
contour(r2d*a, T, h2, '--');
plot(ztrim(1)*r2d, ztrim(2), 'sr', ...
     'markersize', 12, 'MarkerFaceColor', 'red');
contour(r2d*a, T, h1, [0,0], 'LineWidth', 3);
contour(r2d*a, T, h2, [0,0], '--', 'LineWidth', 3);
hold off;
title('Erro de trimagem nas duas variáveis')
xlabel('\alpha [\circ]')
ylabel('T [N]')
legend({'d\alpha/dt', 'dV_c/dt', 'pt. trim'})
