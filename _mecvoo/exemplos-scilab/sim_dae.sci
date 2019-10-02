function err = fi(xponto, x, u) // f implita
// Define os parametros do sistema
a = 1; 
b = -1;
d = 0.2;

// Desempacota os estados, suas derivadas, e a entrada
x1 = x(1);
x2 = x(2);
x1ponto = xponto(1);
x2ponto = xponto(2);
u1 = u(1);

// Calcula o erro da solucao
err1 = x1ponto - x2;
err2 = x2ponto + d*x2 + b*x1 + a*x1^3 - u1;

// Monta o vetor erro
err = [err1; err2];
endfunction

//////////////////////////////////////////
function [err, ires] = fim_ent_nula(t, x, xponto)
u = 0;
err = fi(xponto, x, u);
ires = 0; //Variavel indicadora de erro
endfunction

//////////////////////////////////////////
function [err, ires] = fim_ent_sen(t, x, xponto)
u = 0.3 * sin(t);
err = fi(xponto, x, u);
ires = 0; //Variavel indicadora de erro
endfunction

//////////////////////////////////////////
tsim = 0:0.05:30; // Tempo da simulacao
xini = [0; 1];     // Valor inicial do vetor de estados
xpini = [1; -0.2]; // Valor inicial de x ponto

xsim_nula = dae([xini, xpini], 0, tsim, fim_ent_nula);
xsim_sen = dae([xini, xpini], 0, tsim, fim_ent_sen);

// Mostra os resultados no espaco de estados
plot(xsim_nula(1, :), xsim_nula(2, :), ...
     xsim_sen(1, :), xsim_sen(2, :))
xlabel('x1')
ylabel('x2')
legend('entrada nula', 'entrada senoidal')

