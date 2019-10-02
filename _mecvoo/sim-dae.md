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
livre como  [NumPy], [Julia] ou [R] podem ser utilizados, muitos deles com 
desempenho até superior ao Matlab.

**Índice:**
* ítem 1
* ítem 2
{:toc}


Sistema de exemplo
------------------

O primeiro sistema que será simulado nos exemplos é o [oscilador de Duffing], 
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
\eff\big(t, x(t), \dot x(t)\big) = 0.
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


Implementação em Python
-----------------------

Computação científica em python é geralmente implementada utilizando dois 
pacotes bem consolidados: [NumPy] e [Scipy]. Existem várias maneiras de
instalar esses pacotes, a mais simples (na minha opinião) é utilizando a 
distribuição [Anaconda] ou [Enthought Canopy]. O interpretador pode ser 
executado em um terminal ou em um ambiente integrado de desenvolvimento
como [Spyder] ou [PyCharm].

Assim como o Matlab, o SciPy também possui vários 
[métodos de simulação][scipy-integ] de equações diferenciais ordinárias.
Uma interface unificada para esses métodos é a função [solve_ivp]. O método
de [Dormand--Prince] (`RK45`) é o padrão, mas outros podem ser selecionados com
o argumento `method` da função.

Abaixo temos exemplos de como utilizar o Python para realizar integração 
numérica de equações diferenciais ordinárias. O código desses exemplos está
[disponível para download][ex-python]. O primeiro passo é fazer a importação
dos pacotes e módulos que serão utilizados. O _namespace_ no python é organizado
em módulos e pacotes, evitando assim conflitos de nomes e facilitando a 
manutenção de projetos grandes com múltiplas bibliotecas.


```python
import numpy as np
from matplotlib import pyplot
from scipy import integrate
```

As funções de simulação do SciPy esperam receber uma função para simulação
$$\mathbf{f}_m:\reals\times\reals^n\to\reals^n$$ que codifica a equação
diferencial

$$
\dot {\mathbf{x}}(t) = \mathbf{f}_m\big(t, \mathbf{x}(t)\big).
$$

Como nossos sistemas podem receber múltiplas entradas, para evitar duplicar
código iremos fazer uma função $$\mathbf f(\mathbf x, \mathbf u)$$ genérica
e depois uma implementação de $$\mathbf f_m(t, \mathbf x)$$ para
cada entrada, chamando a função $$\mathbf f$$. Isso é feito com o código
abaixo.

```python
def f(x, u):
    """Função de simulação do oscilador de Duffing."""
    
    # Define os parâmetros do sistema
    a = 1 
    b = -1
    d = 0.2
    
    # Desempacota os vetores
    x1, x2 = x
    u1, = u
    
    # Calcula a derivada das variáveis de estado
    x1ponto = x2
    x2ponto = -d*x2 - b*x1 - a*x1**3 + u1
    
    # Monta o vetor x ponto, saída da função
    return [x1ponto, x2ponto]
    

def fm_ent_sen(t, x):
    """Função de simulação para entrada senoidal."""
    u = [0.3 * np.sin(t)]
    return f(x, u)


def fm_ent_nula(t, x):
    """Função de simulação para entrada nula."""
    u = [0]
    return f(x, u)
```

Em seguida, temos somente que chamar a função `solve_ivp` para as duas
funções de simulação.

```python
# Simula os sistemas
tint = [0, 30]
xini = [0, 1]
opt = {'max_step': 0.05}
sol_nula = integrate.solve_ivp(fm_ent_nula, tint, xini, **opt)
sol_sen = integrate.solve_ivp(fm_ent_sen, tint, xini, **opt)
```

A plotagem dos gráficos pode ser feita com a biblioteca [Matplotlib].

```python
# Plota o gráfico
pyplot.plot(sol_nula.y[0], sol_nula.y[1],
            sol_sen.y[0], sol_sen.y[1])
pyplot.xlabel('t [s]')
pyplot.title('Evolução temporal dos estados')
pyplot.legend(['$u=0$', r'$u=0.3 \sin(t)$'])

# Salva o gráfico
pyplot.savefig('sim-duffing-py.svg')
```

{%
   include figure.html
   file="sim-duffing-py.svg"
   caption="Gráfico gerado pelo exemplo `sim.py`."
%}


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
[Spyder]: https://pythonhosted.org/spyder/
[scipy-integ]: https://docs.scipy.org/doc/scipy/reference/integrate.html
[solve_ivp]: https://docs.scipy.org/doc/scipy/reference/generated/scipy.integrate.solve_ivp.html
[ex-python]: http://github.com/dimasad/dimasad.github.io/tree/master/_mecvoo/exemplos-python/sim.py
[Matplotlib]: https://matplotlib.org/
