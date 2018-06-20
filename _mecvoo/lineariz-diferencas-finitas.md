---
layout: default
title: Mecânica do voo -- Linearização por diferenças finitas
---

{{ page.title }}
================
{:.no_toc}

Nesta página será detalhado como realizar a linearização de sistemas dinâmicos 
não lineares por diferenças finitas. 

**Índice:**
* ítem 1
* ítem 2
{:toc}

Definição de matriz jacobiana
-----------------------------

Dada uma função $$h:\reals^n\to\reals^m$$, sua matriz jacobiana $$\nabla h$$ é
definida como

$$
\nabla_z h = 
\begin{bmatrix}
  \frac{\partial h_1}{\partial z_1} & 
  \frac{\partial h_1}{\partial z_2} &
  \cdots &
  \frac{\partial h_1}{\partial z_n} \\
  \frac{\partial h_2}{\partial z_1} & 
  \frac{\partial h_2}{\partial z_2} &
  \cdots &
  \frac{\partial h_2}{\partial z_n} \\
  \vdots & \vdots & \ddots & \vdots \\
  \frac{\partial h_m}{\partial z_1} & 
  \frac{\partial h_m}{\partial z_2} &
  \cdots &
  \frac{\partial h_m}{\partial z_n}
\end{bmatrix}.
$$

O elemento da linha $$i$$ e coluna $$j$$ da matriz jacobiana é a derivada 
parcial

$$
(\nabla_z h)_{ij} =  
\frac{\partial h_i}{\partial z_j}.
$$

Cálculo da matriz jacobiana por diferenças finitas
--------------------------------------------------

Dada uma função $$h:\reals^n\to\reals^m$$ podemos aproximar sua matriz jacobiana
por diferenças finitas em torno de um valor de referência 
$$z_{\operatorname{ref}}$$. Para isso, definimos a variável $$z$$ com o j-ésimo
elemento perturbado, $$z_p^{(j)}$$, como 

$$
z_p^{(j)} =
\begin{bmatrix}
  z_{1\operatorname{ref}} \\
  z_{2\operatorname{ref}} \\
  \vdots \\
  z_{j-1\operatorname{ref}} \\
  z_{j\operatorname{ref}} + \delta\\
  z_{j+1\operatorname{ref}} \\
  \vdots \\
  z_{n\operatorname{ref}}
\end{bmatrix},
$$

ou seja, o j-ésimo elemento está perturbado por um fator de $$\delta$$ enquanto
todos os demais estão nos valores de referência. Definimos então o valor de
referência da função

$$h_{\operatorname{ref}} = h(z_{\operatorname{ref}})$$

e seu valor para as variávies perturbadas

$$h_p^{(j)} = h(z_p^{(j)}).$$

Temos então que a matriz jacobiana pode ser aproximada por

$$
\nabla_z h|_{z_{\operatorname{ref}}} \approx
\begin{bmatrix}
  \frac1\delta(h_p^{(1)} - h_{\operatorname{ref}}) &
  \frac1\delta(h_p^{(2)} - h_{\operatorname{ref}}) &
  \dotsc &
  \frac1\delta(h_p^{(n)} - h_{\operatorname{ref}})
\end{bmatrix}.
$$

Isso pode ser feito com o seguinte código de Matlab

```matlab
% Arquivo <jac.m>
function J = jac(h, zref)
% Calcula matriz jacobiana por diferencas finitas

delta = 1e-7;
href = h(zref);

nh = length(href);
nz = length(zref);

J = zeros(nh, nz);
for j = 1:nz
    z_pert = zref;
    z_pert(j) = zref(j) + delta;
    
    h_pert = h(z_pert);
    J(:, j) = (h_pert - href) / delta;
end
```

Sistema de exemplo
-------------------

O sistema que será linearizado no exemplo é o [oscilador de Duffing], 
um sistema caótico muito utilizado na análise de sistemas não lineares. Ele 
possui dois estados, $$x_1$$ e $$x_2$$, e uma entrada, $$u_1$$. Sua dinâmica,
no espaço de estados, é dada por

$$
\begin{align}
  \dot x_1 &= x_2
  \\
  \dot x_2 &= -dx_2 - bx_1 - ax_1^3 + u_1,
\end{align}
$$

onde $$a=1$$, $$b=-1$$ e $$d=\tfrac15$$ são os parâmetros do sistema.
Iremos linearizar esse sistema em torno da condição de referência 
$$x_{1\operatorname{ref}}=1$$, $$x_{2\operatorname{ref}}=0$$ e 
$$u_{1\operatorname{ref}}=0$$.

As matrizes $$A$$ e $$B$$ desse sistema linearizado são

$$
\begin{align*}
  A &=
  \begin{bmatrix}
    0 & 1 \\ -b -3ax_{1\operatorname{ref}}^2 & -d
  \end{bmatrix} &
  B &=
  \begin{bmatrix}
   0 \\ 1
  \end{bmatrix}
\end{align*}
$$

Linearização do Sistema
-----------------------

Para linearização de um sistema dinâmico não linear no espaço de estados
representado da forma

$$
\dot x(t) = f\big(x(t), u(t)\big),
$$

o primeiro passo é implementar a função $$f$$ da dinâmica não linear. Para o
oscilador de Duffing, isso pode ser implementado como no código abaixo.

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

Para encontrar as matrizes $$A$$ e $$B$$ do sistema linear da forma

$$
\Delta \dot x(t) = A\Delta x(t) + B\Delta u(t),
$$

podemos utilizar o código abaixo.

```matlab
xref = [1;0];
uref = 0;

fx = @(x) f(x, uref);
fu = @(u) f(xref, u);

A = jac(fx, xref);
B = jac(fu, uref);
```

Os códigos deste exemplo estão [disponíveis para download][ex]. Baixe todos os arquivos
e coloque na mesma pasta. Esse exemplo utiliza [funções anônimas](fa), uma
funcionalidade do Matlab que permite simplificar muitos programas. Confira na
[documentação](fa) mais detalhes sobre sua sintaxe e utilização.


[ex]: http://github.com/dimasad/dimasad.github.io/tree/master/_mecvoo/exemplos-matlab/lin
[fa]: https://www.mathworks.com/help/matlab/matlab_prog/anonymous-functions.html
[oscilador de Duffing]: http://www.scholarpedia.org/article/Duffing_oscillator
