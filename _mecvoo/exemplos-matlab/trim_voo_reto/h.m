function err = h(z)
%% Desempacota argumentos
a = z(1);
T = z(2);
de = z(3);

%% Condicao desejada
Vc = 60;

%% Constantes do modelo
g0 = 9.80665;

S = 16;
mass = 1200;
rho = 1;

CDa = 0.1;
CD0 = 0.03;

CL0 = 0.3;
CLa = 4.4;
CLde = 0.4;

Cm0 = 0.04;
Cma = -0.6;
Cmde = -1.1;

%% Calculo das forcas aerodinamicas
qbar = 0.5 * rho * Vc.^2;

CL = CL0 + CLa*a + CLde*de;
CD = CD0 + CDa*a;
Cm = Cm0 + Cma*a + Cmde*de;

L = qbar * S * CL;
D = qbar * S * CD;

%% Cálculo do erro de trimagem
err_aeq = -T.*sin(a) - L + mass*g0;
err_Vceq = T.*cos(a) - D;

err = [err_aeq; err_Vceq; Cm];