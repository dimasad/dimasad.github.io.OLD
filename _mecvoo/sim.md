---
layout: default
title: Mecânica do voo -- Simulação de sistemas dinâmicos
---

{{ page.title }}
================
{:.no_toc}

Nesta página será detalhado como realizar a simulação de sistemas dinâmicos 
com alguns sistemas computacionais, em especial o Matlab. No entanto, vale 
ressaltar que as idéias básicas são as mesmas para qualquer linguagem de
programação. Além do Matlab, vários pacotes de computação numérica de software
livre como  [NumPy], [Julia] ou [R] podem ser utilizados, muitos deles com 
desempenho até superior ao Matlab.

**Índice:**
* ítem 1
* ítem 2
{:toc}


Sistemas de exemplo
-------------------

O primeiro sistema que será simulado nos exemplos é o [oscilador de Duffing], 
um sistema caótico muito utilizado na análise de sistemas não lineares. Ele 
possui dois estados, $$x_1$$ e $$x_2$$, e uma entrada, $$u_1$$. Sua dinâmica,
no espaço de estados, é dada por

$$
\begin{align}
  \dot x_1 &= x_1 
  \\
  \dot x_2 &= -dx_2 - bx_1 - ax_1^3 + u_1,
\end{align}
$$

onde $$a=1$$, $$b=-1$$ e $$d=\tfrac15$$ são os parâmetros do sistema.
Iremos simular esse sistema dinâmico para a entrada $$u_1(t) = 0$$ e 
$$u_1(t) = \num[output-decimal-marker={,}]{0.3}\cos(t)$$.

Implementação em Matlab
-----------------------

O Matlab possui [vários métodos](matlab-solvers) de simulação de equações
 diferenciais ordinárias. A função [ode45], que é uma implementação do método
de [Dormand--Prince], é o recomendado para a maior parte dos casos. Essa função
utiliza o método de [Runge--Kutta] de quarta e quinta ordens para simular e 
estimar o erro de integração. Quando o erro está acima da tolerância, o passo de
integração é diminuído. Quando o erro está muito abaixo da tolerância, o passo
de integração é aumentado para acelerar a simulação. Para maiores informações
sobre os outros métodos de simulação do Matlab e suas vantagens, veja a 
[documentação oficial sobre a escolha do método](matlab-choose-solver).

Abaixo temos exemplos de como utilizar o Matlab para realizar integração 
numérica de equações diferenciais ordinárias. O código desses exemplos está
[disponível para download][ex1]. Baixe todos os scripts e coloque na mesma pasta.

### Simulação com entrada senoidal

Os métodos de simulação do Matlab esperam receber uma função para simulação
$$\mathbf{f}_m:\reals\times\reals^n\to\reals^n$$ que codifica a equação
diferencial

$$
\dot {\mathbf{x}}(t) = \mathbf{f}_m\big(t, \mathbf{x}(t)\big).
$$

Para o oscilador  de Duffing com a entrada inicial, essa função pode ser
implementada como mostrado abaixo.

```matlab
% Arquivo <fm.m>
function xponto = fm(t, x)
% Define os parametros do sistema
a = 1; 
b = -1;
d = 0.2;

% Desempacota os estados e calcula a entrada
x1 = x(1);
x2 = x(2);
u1 = 0.3 * cos(t);

% Calcula a derivada das variáveis de estado
x1ponto = x2;
x2ponto = -d*x2 - b*x1 - a*x1^3 + u1;

% Monta o vetor x ponto
xponto = [x1ponto; x2ponto];
```

Para a simulação com a função `ode45`, podemos utilizar o código abaixo, com
o arquivo `fm.m` no diretório atual ou algum outro diretório no caminho de busca
do Matlab.

```matlab
tinterv = [0, 30]; % Intervalo de tempo da simulacao
xinicial = [0; 1]; % Valor inicial do vetor de estados

% Simula o sistema dinamico
[tsim, xsim] = ode45(@fm, tinterv, xinicial);
```

Os argumentos de entrada da função `ode45` são
* `fm`, o [function handle] da função 
  $$\mathbf{f}_m\big(t, \mathbf{x}(t)\big)$$ que representa a dinâmica do
  sistema; 
* `tinterv`, o intervalo de tempo da simulação, com o primeiro elemento
  definindo o tempo inicial e o segundo elemento definindo o tempo final; e
* `xinicial` o valor inicial do vetor de estados. 

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

Esse exemplo de simulação está no script `sim_senoidal.m` que gera os gráficos mostrados
abaixo.

{%
   include figure.html
   file="sim_senoidal.m.plot1.svg"
   caption="Primeiro gráfico gerado pelo script `sim_senoidal.m`"
%}

{%
   include figure.html
   file="sim_senoidal.m.plot2.svg"
   caption="Segundo gráfico gerado pelo script `sim_senoidal.m`"
%}


### Simulação com as duas entradas

Quando queremos simular o sistema para várias entradas diferentes, é boa
prática implementar a função $$\mathbf f(\mathbf x, \mathbf u)$$ genérica
e depois fazer uma implementação de $$\mathbf f_m(t, \mathbf x)$$ para
cada entrada, chamando a função $$\mathbf f$$. Isso evita a duplicação de 
código e simplifica o desenvolvimento e depuração do software.


Abaixo temos um exemplo da  simulação do oscilador de Duffing para entrada nula
e senoidal. A dinâmica do sistema é implementada na função `f.m` e as função
de simulação no formato esperado pelo `ode45` são `fm_ent_nula.m` para entrada
nula e `fm_ent_senoidal.m` para entrada senoidal.

```matlab
% Arquivo <f.m>
function xponto = f(x, u)
% Define os parametros do sistema
a = 1; 
b = -1;
d = 0.2;

% Desempacota os estados e calcula a entrada
x1 = x(1);
x2 = x(2);
u1 = u(1);

% Calcula a derivada das variáveis de estado
x1ponto = x2;
x2ponto = -d*x2 - b*x1 - a*x1^3 + u1;

% Monta o vetor x ponto
xponto = [x1ponto; x2ponto];
```

```matlab
% Arquivo <fm_ent_nula.m>
function xponto = fm_ent_nula(t, x)
u = 0;
xponto = f(x, u);
```

```matlab
% Arquivo <fm_ent_senoidal.m>
function xponto = fm_ent_senoidal(t, x)
u = 0.3 * cos(t);
xponto = f(x, u);
```

Com os arquivos acima no caminho de busca do Matlab, as simulações podem ser 
realizadas com o código abaixo.

```matlab
% Arquivo <sim2.m>
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
```

A execução desse código gera o gráfico abaixo, com a trajetória das duas
simulações no espaço de estados.

{%
   include figure.html
   file="sim2.m.plot.svg"
   caption="Gráfico gerado pelo script `sim2.m`"
%}

{::comment}

Implementação em Python
-----------------------

Computação científica em python é geralmente implementada utilizando dois 
pacotes bem consolidados: NumPy e Scipy. Existem várias maneiras de
instalar esses pacotes, a mais simples (na minha opinião) é utilizando a 
distribuição [Anaconda] ou [Enthought Canopy].

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
[Dormand--Prince]: https://en.wikipedia.org/wiki/Dormand-Prince_method
[Enthought Canopy]: https://store.enthought.com/downloads/
[ex1]: http://github.com/dimasad/dimasad.github.io/tree/master/_mecvoo/exemplos-matlab/sim
[function handle]: https://www.mathworks.com/help/matlab/function-handles.html
[instalação de pacotes]: http://docs.julialang.org/en/stable/manual/packages/
[Julia]: http://julialang.org
[matlab-solvers]: https://www.mathworks.com/help/matlab/ordinary-differential-equations.html
[matlab-choose-solver]: http://www.mathworks.com/help/matlab/math/choose-an-ode-solver.html
[NumPy]: http://www.numpy.org/
[ode45]: http://www.mathworks.com/help/matlab/ref/ode45.html
[oscilador de Duffing]: http://www.scholarpedia.org/article/Duffing_oscillator
[R]: http://www.r-project.org/
[Runge--Kutta]: http://en.wikipedia.org/wiki/Runge-Kutta_methods
[tutorial de indexação]: http://www.mathworks.com/help/matlab/learn_matlab/array-indexing.html
