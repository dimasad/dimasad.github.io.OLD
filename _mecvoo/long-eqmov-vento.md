---
layout: default
title: Mecânica do voo -- Equações do movimento nos eixos do vento
---

{{ page.title }}
================
{:.no_toc}

> **Conteúdo:**
> * Tópico 1
> * Tópico 2 ...
> {:toc}


Nesta seção iremos ver como representar nos eixos do vento as equações do
movimento da dinâmica longitudinal de um avião, obtidas na 
[seção anterior][long-eqmov]. A derivação dessas equações pode ser interpretada
de duas maneiras:
* aplicação da da segunda lei de Newton em coordenadas polares, ou
* aplicação da da segunda lei de Newton em um referencial não inercial.

As equações serão derivadas aqui das duas maneiras. Para realização do 
[trabalho 1] qualquer uma das duas abordagens pode ser utilizada.
Nosso ponto de partida é a segunda lei de Newton,

$$
\begin{align}
  \label{lei-newton-terra}
  m\dot v_{x_E} &= \textstyle\sum F_{x_E}, &
  \textstyle
  m\dot v_{z_E} &= \textstyle\sum F_{z_E},
\end{align}
$$

ou, na forma vetorial,

$$
\begin{equation}
  \label{lei-newton-terra-vec}
  m\overset{\scriptscriptstyle \bullet E}{\vec v} = \sum_i \vec F_i.
\end{equation}
$$

Lei de Newton em Coordenadas Polares
------------------------------------

A velocidade da aeronave nos eixos da terra é dada pelos componentes 
$$v_{x_E}$$, a velocidade de solo (_ground speed_), e $$v_{z_E}$$, a razão
de descida. Convertendo para coordenadas polares temos 

$$
\begin{align}
\label{V}
V &= \sqrt{v_{x_E}^2 + v_{z_E}^2} \\
\label{gamma-atan}
\gamma &= -\operatorname{atan}\left(\frac{v_{z_E}}{v_{x_E}}\right)
        = -\operatorname{atan2}\left(v_{z_E}, v_{x_E}\right).
\end{align}
$$

Inicialmente, iremos ater nossa análise ao intervalo de $$ v_{x_E} > 0 $$,
logo a podemos usar tanto a função arco tangente ($$\operatorname{atan}$$) 
ou arco tangente duplo ($$\operatorname{atan2}$$) na Equação \eqref{gamma-atan}.
De qualquer maneira, a função arcotangente duplo é mais bem condicionada 
numericamente e preferida para implementações computacionais. Para mais
informações sobre essa função e suas propriedades, veja sua 
[página na Wikipedia][atan2-wiki].

Aplicando a derivada temporal na Eq. \eqref{V} e a regra da cadeia, temos que
$$
\begin{align}
  \dot V &= \frac12 \frac{1}{\sqrt{v_{x_E}^2 + v_{z_E}^2}} 
            \left(2v_{x_E}\dot v_{x_E} + 2v_{z_E}\dot v_{z_E} \right)
            \nonumber\\
  \label{V-cadeia}
         &= \frac1V \left(v_{x_E}\dot v_{x_E} + v_{z_E}\dot v_{z_E} \right) 
\end{align}
$$

A transformação inversa, de coordenadas polares para coordenadas cartesianas, é
$$
\begin{align}
  \label{polar-cart}
  v_{x_E} &= V\cos\gamma,  &
  v_{z_E} &= -V\sin\gamma.
\end{align}
$$
Substituindo as relações da Eq. \eqref{polar-cart} na Eq. \eqref{V-cadeia},
temos
$$
\begin{align}
  \dot V &= \frac1V 
            \left(V\cos(\gamma)\dot v_{x_E} - V\sin(\gamma)\dot v_{z_E}\right)
            \nonumber\\
         &= \cos(\gamma)\dot v_{x_E} - \sin(\gamma)\dot v_{z_E}.
\end{align}
$$
Por fim, substituindo a lei de Newton, \eqref{lei-newton-terra}, temos

$$
\begin{equation}
  \label{Vdot-FE}
  m\dot V = \cos(\gamma)\textstyle\sum F_{x_E} - \sin(\gamma)\sum F_{z_E}.
\end{equation}
$$

Aplicando a rotação de coordenadas nas forças da aeronave, temos que

$$
\textstyle
\sum F_{x_W} = \cos(\gamma)\sum F_{x_E} - \sin(\gamma)\sum F_{z_E},
$$

logo 

$$
\begin{equation}
  \label{Vdot-FW}
  m\dot V = \textstyle\sum F_{x_W}.
\end{equation}
$$

Tomando a derivada temporal da Equação \eqref{gamma-atan} e aplicando a regra da
cadeia, temos que 

$$
\begin{align}
  \dot \gamma &= \frac{v_{z_E}}{v_{x_E}^2 + v_{z_E}^2}\dot v_{x_E}
     - \frac{v_{x_E}}{v_{x_E}^2 + v_{z_E}^2}\dot v_{z_E},
  \nonumber\\
  &= -\frac{V\sin\gamma}{V^2}\dot v_{x_E}
     -\frac{V\cos\gamma}{V^2}\dot v_{z_E},
  \nonumber\\
  &= -\frac{\sin\gamma}{V}\dot v_{x_E}
     -\frac{\cos\gamma}{V}\dot v_{z_E},
  \nonumber\\
  &= -\frac{\sin\gamma}{mV}{\textstyle\sum} F_{x_E}
     -\frac{\cos\gamma}{mV}{\textstyle\sum} F_{z_E},
  \nonumber\\
  &= -\frac{1}{mV}\textstyle\sum F_{z_W}.
\end{align}
$$

Lei de Newton em Referencial Não Inercial
-----------------------------------------

Para relacionar a derivada de um vetor $$\vec r$$ observada de dois referenciais
que possuem velocidade angular entre si, temos a seguinte relação:

$$
\begin{equation}
  \overset{\scriptscriptstyle \bullet A}{\vec r} = 
  \overset{\scriptscriptstyle \bullet B}{\vec r} + \vec\omega_B^A\times\vec r,
\end{equation}
$$

onde $$\overset{\scriptscriptstyle \bullet A}{\vec r}$$ é a derivada do vetor
observada do referencial $$A$$, 
$$\overset{\scriptscriptstyle \bullet B}{\vec r}$$ é a derivada do vetor
observada do referencial $$B$$ e $$\vec\omega_B^A$$ é o vetor da velocidade
angular do referencial $$B$$ em relação ao $$A$$.

Usando essa relação, temos que 

$$
\begin{equation}
  \overset{\scriptscriptstyle \bullet E}{\vec v} = 
  \overset{\scriptscriptstyle \bullet W}{\vec v} 
  +\vec\omega_W^E \times \vec v.
\end{equation}
$$

Os eixos do vento são definidos de forma que $$\hat i_w$$ está sempre alinhado
com o vetor velocidade, de forma que

$$
\begin{equation*}
  \vec v = V\hat i_w.
\end{equation*}
$$

Isso implica que 

$$
\begin{equation}
  \overset{\scriptscriptstyle \bullet W}{\vec v} = \dot V\hat i_w.
\end{equation}
$$

Por fim, temos que a velocidade angular dos eixos do vento em relação aos 
da terra é dada pela variação do ângulo entre eles, $$\gamma$$:

$$
\begin{equation*}
  \vec\omega_W^E = \dot\gamma \hat j_W,
\end{equation*}
$$

de modo que 

$$
\begin{align*}
  \vec\omega_W^E \times \vec v &= 
   (\dot\gamma \hat j_W) \times (V\hat i_W), \\
   &= V\dot\gamma (\hat j_W \times \hat i_W), \\
   &= -V\dot\gamma \hat k_W.
\end{align*}
$$

Substituindo na lei de Newton na forma vetorial, temos que

$$
\begin{equation*}
  \label{lei-newton-vento-vec}
  m(\dot V\hat i_W -V\dot\gamma \hat k_W) = \sum_i \vec F_i
\end{equation*}
$$

ou, para cada componente, 

$$
\begin{align*}
  m\dot V &= \textstyle\sum F_{x_W},\\
  mV\dot\gamma &= -\textstyle\sum F_{z_W}.
\end{align*}
$$

Explicitando as forças
----------------------

Como vimos nas seções anteriores, para nosso modelo longitudinal simplificado
as [forças externas que agem sobre o veículo][forcas-long] são o peso 
$$\vec W$$, a força aerodinâmica $$\vec F_A$$ e a força propulsiva $$\vec T$$.

Se aplicarmos as [mudanças de sistemas de coordenada] nas forças, temos que

$$
\begin{align*}
  \textstyle\sum F_{x_W} &= 
  {\color{red}
   \overbrace{\color{black}T\cos(\alpha)}^{\color{red}\text{propulsiva}} 
  } 
  {\color{blue}
    \underbrace{\color{black}\phantom{Al}- D \phantom{A}}_{
      \color{blue}\text{aerodinâmica}
    }
  } 
  { \color{darkgreen} \overbrace{\color{black}- mg_0 \sin(\gamma)}^{\text{peso}}
  } ,\\
  \textstyle\sum F_{z_W} &= 
  {\color{red}
   \overbrace{\color{black}-T\sin(\alpha)}^{\text{propulsiva}} 
  } 
  {\color{blue}
    \underbrace{\color{black}\phantom{Al}- L \phantom{AA}}_{
      \color{blue}\text{aerodinâmica}
    }
  } 
  { \color{darkgreen} \overbrace{\color{black}+ mg_0 \cos(\gamma)}^{\text{peso}}
  }.
\end{align*}
$$

Logo, as equações do movimento são

$$
\begin{align*}
  m\dot V &= T\cos(\alpha) - D - mg_0\sin(\gamma),\\
  mV\dot\gamma &= T\sin(\alpha) + L - mg_0\cos(\gamma).
\end{align*}
$$

Reescrevendo em função de alfa
------------------------------

Para o modelo longitudinal, temos que $$\theta = \gamma + \alpha$$.
Tomando a derivada, temos que

$$
\begin{align*}
  \dot \alpha &= \dot \theta - \dot \gamma \\
  \dot \alpha &= q -\frac{ T\sin(\alpha) + L}{mV} + \frac{g_0\cos(\gamma)}{V} \\
\end{align*}
$$

[forcas-long]: /mecvoo/forcas-long/
[long-eqmov]: /mecvoo/long-eqmov/
[mudanças de sistemas de coordenada]: /mecvoo/rot-long/
[trabalho 1]: /mecvoo/trabalho1/
[atan2-wiki]: https://en.wikipedia.org/wiki/Atan2