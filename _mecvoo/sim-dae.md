---
layout: default
title: Mecânica do voo -- Simulação de equações algébricas e diferenciais
---

{{ page.title }}
================
{:.no_toc}

Nesta página será detalhado como realizar a simulação de equações algébricas
e diferenciais não lineares, também conhecidas como sistemas descritores,
com alguns sistemas computacionais, em especial o Matlab. No entanto, vale 
ressaltar que as idéias básicas são as mesmas para qualquer linguagem de
programação. Além do Matlab, vários pacotes de computação numérica de software
livre como  [Scilab], [NumPy], [Julia] ou [R] podem ser utilizados, muitos
deles com desempenho até superior ao Matlab.

**Índice:**
* ítem 1
* ítem 2
{:toc}


Sistema de exemplo
------------------

O sistema que será simulado nos exemplos é o [oscilador de Duffing], 
um sistema caótico muito utilizado na análise de sistemas não lineares. Ele 
possui dois estados, $$x_1$$ e $$x_2$$, e uma entrada, $$u_1$$. Sua dinâmica,
no espaço de estados, é dada por

$$
\begin{align*}
  \dot x_1 &= x_2
  \\
  \dot x_2 &= -dx_2 - bx_1 - ax_1^3 + u_1,
\end{align*}
$$

onde $$a=1$$, $$b=-1$$ e $$d=\tfrac15$$ são os parâmetros do sistema.
Iremos simular esse sistema dinâmico para a entrada $$u_1(t) = 0$$ e 
$$u_1(t) = \num[output-decimal-marker={,}]{0.3}\sin(t)$$.

Para simulação via equação algébrica e diferencial, converteremos esse 
sistema para a forma implícita, $$\eff(\dot x, x, u) = 0$$. Cada elemento da
função de erro $$\eff$$ é dado por

$$
\begin{align*}
  \eff_1(\dot x, x, u)&=\dot x_1 - x_2
  \\
  \eff_2(\dot x, x, u)&= \dot x_2 + dx_2 + bx_1 + ax_1^3 - u_1.
\end{align*}
$$


Implementação em Matlab
-----------------------

O Matlab possui [vários métodos](matlab-solvers) de simulação de equações
diferenciais. A função [ode15i] é o método de simulação de equações algébricas
e diferenciais na forma implícita que possui a interface de programação mais
simples. Essa função realiza integração de ordem variável e escolhe o passo de
forma a garantir que o erro está dentro de uma tolerância aceitável. Quando o
erro está acima da tolerância, o passo de integração é diminuído. Quando o erro
está muito abaixo da tolerância, o passo de integração é aumentado para 
acelerar a simulação. Para maiores informações sobre os outros métodos de
simulação do Matlab e suas vantagens, veja a 
[documentação oficial sobre a escolha do método](matlab-choose-solver).

Abaixo temos exemplos de como utilizar o Matlab para realizar integração 
numérica de sistemas utilizando a função `ode15i`. O código desses exemplos está
[disponível para download][ex1]. Para testar, baixe todos os arquivos de 
extensão `.m` e coloque na mesma pasta.

### Simulação com entrada senoidal

A função `ode15i` espera receber uma função para simulação
$$\eff_m:\reals\times\reals^n\times\reals^n\to\reals^n$$ que codifica a equação
diferencial

$$
\eff_m\big(t, x(t), \dot x(t)\big) = 0.
$$

Para o oscilador  de Duffing com a entrada senoidal, essa função pode ser
implementada como mostrado abaixo.

```matlab
% Arquivo <fim.m>
function err = fim(t, x, xponto) % f implita matlab
% Define os parametros do sistema
a = 1; 
b = -1;
d = 0.2;

% Desempacota os estados, suas derivadas, e calcula a entrada
x1 = x(1);
x2 = x(2);
x1ponto = xponto(1);
x2ponto = xponto(2);
u1 = 0.3 * sin(t);

% Calcula o erro da solucao
err1 = x1ponto - x2;
err2 = x2ponto + d*x2 + b*x1 + a*x1^3 - u1;

% Monta o vetor erro
err = [err1; err2];
```

Para a simulação com a função `ode15i`, podemos utilizar o código abaixo, com
o arquivo `fim.m` no diretório atual ou algum outro diretório no caminho de
busca do Matlab.

```matlab
tinterv = [0, 30]; % Intervalo de tempo da simulacao
xinicial = [0; 0]; % Valor inicial do vetor de estados
xpinicial = [0; 0]; % Valor inicial de x ponto

% Simula o sistema dinamico
[tsim, xsim] = ode15i(@fim, tinterv, xinicial, xpinicial);
```

Os argumentos de entrada da função `ode15i` são
* `@fim`, o [function handle] da função 
  $$\eff_m\big(t, x(t), \dot x(t)\big)$$ que representa a dinâmica do
  sistema; 
* `tinterv`, o intervalo de tempo da simulação, com o primeiro elemento
  definindo o tempo inicial e o segundo elemento definindo o tempo final; e
* `xinicial` o valor inicial do vetor de estados. 
* `xpinicial` o valor inicial da derivada do vetor de estados. 

Os argumentos de saída são
* `tsim`, um vetor coluna com cada instante de tempo da simulação; e 
* `xsim`, uma matriz cujas linhas correspondem ao valor do vetor de 
  estados no instante de tempo correspondente ao respectivo elemento de `tsim`.

O código abaixo plota os dados da simulação.

```matlab
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
```

Esse exemplo de simulação está no script `sim_senoidal.m` que gera os gráficos 
mostrados abaixo.

{%
   include figure.html
   file="sim_senoidal_dae.m.plot1.svg"
   caption="Primeiro gráfico gerado pelo script `sim_senoidal.m`"
%}

{%
   include figure.html
   file="sim_senoidal_dae.m.plot2.svg"
   caption="Segundo gráfico gerado pelo script `sim_senoidal.m`"
%}


### Simulação com as duas entradas

Quando queremos simular o sistema para várias entradas diferentes, é boa
prática implementar a função $$\eff(\dot x, x, u)$$ genérica
e depois fazer uma implementação de $$\eff_m(t, x, \dot x)$$ para
cada entrada, chamando a função $$\eff$$. Isso evita a duplicação de 
código e simplifica o desenvolvimento e depuração do software.

Abaixo temos um exemplo da  simulação do oscilador de Duffing para entrada nula
e senoidal. A dinâmica do sistema é implementada na função `fi.m` e as funções
de simulação no formato esperado pelo `ode15i` são `fim_ent_nula.m` para entrada
nula e `fim_ent_senoidal.m` para entrada senoidal.

```matlab
% Arquivo <fi.m>
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
```

```matlab
% Arquivo <fim_ent_nula.m>
function err = fim_ent_nula(t, x, xponto)
u = 0;
err = fi(xponto, x, u);
```

```matlab
% Arquivo <fim_ent_senoidal.m>
function err = fim_ent_senoidal(t, x, xponto)
u = 0.3 * sin(t);
err = fi(xponto, x, u);
```

Com os arquivos acima no caminho de busca do Matlab, as simulações podem ser 
realizadas com o código abaixo.

```matlab
% Arquivo <sim2.m>
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
```

A execução desse código gera o gráfico abaixo, com a trajetória das duas
simulações no espaço de estados.

{%
   include figure.html
   file="sim2-dae.m.plot.svg"
   caption="Gráfico gerado pelo script `sim2.m`"
%}


Implementação em Scilab
-----------------------

O [Scilab] é uma alternativa de software livre ao Matlab que já vem com
funções para simulação de equações algébricas e diferenciais. Para isso,
pode ser utilizada a função [dae].

Abaixo temos exemplos de como utilizar o Scilab para simular o oscilador
de Duffing com entrada nula e entrada senoidal. O código desse exemplo está
[disponível para download][ex-scilab]. As rotinas de simulação no Scilab
esperam receber uma função para simulação 
$$\eff_s:\reals\times\reals^n\times\reals^n\to\reals^n$$ que codifica a equação
diferencial

$$
\eff_s\big(t, x(t), \dot x(t)\big) = 0.
$$

Como nossos sistemas podem receber múltiplas entradas, para evitar duplicar
código iremos fazer uma função $$\eff(\dot x, x, u)$$ genérica
e depois uma implementação de $$\eff_s(t, x, \dot x)$$ para
cada entrada, chamando a função $$\eff$$. Isso é feito com o código
abaixo.

```matlab
function err = fi(xponto, x, u) // f implita
//% Define os parametros do sistema
a = 1; 
b = -1;
d = 0.2;

//% Desempacota os estados, suas derivadas, e a entrada
x1 = x(1);
x2 = x(2);
x1ponto = xponto(1);
x2ponto = xponto(2);
u1 = u(1);

//% Calcula o erro da solucao
err1 = x1ponto - x2;
err2 = x2ponto + d*x2 + b*x1 + a*x1^3 - u1;

//% Monta o vetor erro
err = [err1; err2];
endfunction

//%////////////////////////////////////////
function [err, ires] = fim_ent_nula(t, x, xponto)
u = 0;
err = fi(xponto, x, u);
ires = 0; //Variavel indicadora de erro
endfunction

//%////////////////////////////////////////
function [err, ires] = fim_ent_sen(t, x, xponto)
u = 0.3 * sin(t);
err = fi(xponto, x, u);
ires = 0; //Variavel indicadora de erro
endfunction
```

Em seguida, temos somente que chamar a função `dae` para as duas
funções de simulação.

```matlab
tsim = 0:0.05:30; //% Tempo da simulacao
xini = [0; 1];     //% Valor inicial do vetor de estados
xpini = [1; -0.2]; //% Valor inicial de x ponto

xsim_nula = dae([xini, xpini], 0, tsim, fim_ent_nula);
xsim_sen = dae([xini, xpini], 0, tsim, fim_ent_sen);
```

A plotagem dos gráficos pode ser feita com o código abaixo

```matlab
//% Mostra os resultados no espaco de estados
plot(xsim_nula(1, :), xsim_nula(2, :), ...
     xsim_sen(1, :), xsim_sen(2, :))
xlabel('x1')
ylabel('x2')
legend('entrada nula', 'entrada senoidal')
```

{%
   include figure.html
   file="sim-duffing-scilab.svg"
   caption="Gráfico gerado pelo exemplo `sim-dae.sci`."
%}

Outras Linguagens de Programação
--------------------------------

- Em [Julia], a simulação de equações algébricas e diferenciais e equações 
diferenciais ordinárias pode ser feito com o pacote `DifferentialEquations.jl`,
cuja documentação está disponível em <http://juliadiffeq.org/>.
- Em Python existem vários pacotes, mas a instalação geralmente é mais 
complicada. No Linux, o pacote `scikits-odes` é o mais recomendado, que é
uma interface para a biblioteca Sundials. Consulte a 
[documentação](https://scikits-odes.readthedocs.io/en/latest/) para mais
informações a respeito do seu uso e instalação. Para utilizá-lo no Windows,
uma possibilidade é com máquina virtual VirtualBox ou WSL, o _Windows
Subsystem for Linux_.

{::comment}

Implementação em Julia
----------------------

Exitem alguns pacotes em Julia para simulação de sistemas dinâmicos. Neste
exemplo, será utilizado o pacote `OrdinaryDiffEq`. Esse pacote pode ser
instalado com o comando abaixo na linha de comando do Julia.

```julia
Pkg.add("OrdinaryDiffEq")
```

Os gráficos deste exemplo serão gerados com a biblioteca `Gadfly`, que pode
ser instalado com o comando abaixo.

```julia
Pkg.add("OrdinaryDiffEq")
```

Para mais informações sobre a instalação de pacotes no Julia veja a documentação
oficial da [instalação de pacotes].

{:/comment}

[Anaconda]: https://www.anaconda.com/download/
[artigo sobre indexação]: http://www.mathworks.com/company/newsletters/articles/matrix-indexing-in-matlab.html
[dae]: https://help.scilab.org/docs/6.0.2/pt_BR/dae.html
[Dormand--Prince]: https://en.wikipedia.org/wiki/Dormand-Prince_method
[Enthought Canopy]: https://store.enthought.com/downloads/
[ex1]: http://github.com/dimasad/dimasad.github.io/tree/master/_mecvoo/exemplos-matlab/sim-dae
[function handle]: https://www.mathworks.com/help/matlab/function-handles.html
[instalação de pacotes]: http://docs.julialang.org/en/stable/manual/packages/
[Julia]: http://julialang.org
[matlab-solvers]: https://www.mathworks.com/help/matlab/ordinary-differential-equations.html
[matlab-choose-solver]: http://www.mathworks.com/help/matlab/math/choose-an-ode-solver.html
[SciPy]: http://www.scipy.org/
[NumPy]: http://www.numpy.org/
[ode15i]: http://www.mathworks.com/help/matlab/ref/ode15i.html
[ode45]: http://www.mathworks.com/help/matlab/ref/ode45.html
[oscilador de Duffing]: http://www.scholarpedia.org/article/Duffing_oscillator
[R]: http://www.r-project.org/
[Runge--Kutta]: http://en.wikipedia.org/wiki/Runge-Kutta_methods
[tutorial de indexação]: http://www.mathworks.com/help/matlab/learn_matlab/array-indexing.html
[PyCharm]: https://www.jetbrains.com/pycharm/
[Scilab]: https://www.scilab.org/
[Spyder]: https://pythonhosted.org/spyder/
[scipy-integ]: https://docs.scipy.org/doc/scipy/reference/integrate.html
[solve_ivp]: https://docs.scipy.org/doc/scipy/reference/generated/scipy.integrate.solve_ivp.html
[ex-scilab]: http://github.com/dimasad/dimasad.github.io/tree/master/_mecvoo/exemplos-scilab/sim_dae.sci
[Matplotlib]: https://matplotlib.org/
