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
programação.

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

Os métodos de simulação do Matlab esperam receber uma função para simulação
$$\mathbf{f}_s:\reals\times\reals^n\to\reals^n$$ que codifica a equação
diferencial

$$
\dot {\mathbf{x}}(t) = \mathbf{f}_s\big(t, \mathbf{x}(t)\big).
$$

Para o oscilador  de Duffing com a entrada inicial, essa função pode ser
implementada como mostrado abaixo.

```matlab
% Arquivo <fs.m>
function xponto = fs(t, x)
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
o arquivo `fs.m` no diretório atual ou algum outro diretório no caminho de busca
do Matlab.

```matlab
tinterv = [0, 30]; % Intervalo de tempo da simulacao
xinicial = [0; 1]; % Valor inicial do vetor de estados

% Simula o sistema dinamico
[tsim, xsim] = ode45(@fs, tinterv, xinicial);
```

Os argumentos de entrada da função `ode45` são
* `fs`, o [function handle] da função 
  $$\mathbf{f}_s\big(t, \mathbf{x}(t)\big)$$ que representa a dinâmica do
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

[artigo sobre indexação]: http://www.mathworks.com/company/newsletters/articles/matrix-indexing-in-matlab.html
[Dormand--Prince]: https://en.wikipedia.org/wiki/Dormand-Prince_method
[function handle]: https://www.mathworks.com/help/matlab/function-handles.html
[instalação de pacotes]: http://docs.julialang.org/en/stable/manual/packages/
[matlab-solvers]: https://www.mathworks.com/help/matlab/ordinary-differential-equations.html
[matlab-choose-solver]: http://www.mathworks.com/help/matlab/math/choose-an-ode-solver.html
[ode45]: http://www.mathworks.com/help/matlab/ref/ode45.html
[oscilador de Duffing]: http://www.scholarpedia.org/article/Duffing_oscillator
[Runge--Kutta]: http://en.wikipedia.org/wiki/Runge-Kutta_methods
[tutorial de indexação]: http://www.mathworks.com/help/matlab/learn_matlab/array-indexing.html
