%% Lineariza
xref = [1;0];
uref = 0;

fx = @(x) f(x, uref);
fu = @(u) f(xref, u);

A = jac(fx, xref);
B = jac(fu, uref);

%% Simula o sistema linear para uma entrada em pulso
u = @(t) (t>=1 & t<=2) * 0.5;
flin = @(t, x) A*(x-xref) + B*(u(t) - uref);
tfinal = 40;
[tlin, xlin] = ode45(flin, [0, tfinal], xref);

%% Simula o sistema nao linear para uma entrada em pulso
fnlin = @(t,x) f(x, u(t));
[tnlin, xnlin] = ode45(fnlin, [0, tfinal], xref);

%% Mostra os resultados
plot(tlin, xlin, '--', tnlin, xnlin, '-')
title('Resposta do sistema nao linear e linearizado')
xlabel('t')
ylabel('estados')

