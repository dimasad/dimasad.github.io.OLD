---
layout: default
title: Mecânica do voo -- Equações do movimento nos eixos do vento
---

{{ page.title }}
================

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
  m\dot v_{z_E} &= \textstyle\sum F_{z_E}.
\end{align}
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
\gamma &= \operatorname{atan}\left(\frac{v_{z_E}}{v_{x_E}}\right)
        = \operatorname{atan2}\left(v_{z_E}, v_{x_E}\right).
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
  \dot V = \cos(\gamma)\textstyle\sum F_{x_E} - \sin(\gamma)\sum F_{z_E}.
\end{equation}
$$

Lei de Newton em Referencial Não Inercial
-----------------------------------------

**\<Mais conteúdo em breve\>**



[long-eqmov]: /mecvoo/long-eqmov/
[trabalho 1]: /mecvoo/trabalho1/
[atan2-wiki]: https://en.wikipedia.org/wiki/Atan2