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

Lei de Newton em Coordenadas Polares
------------------------------------

A velocidade da aeronave nos eixos da terra é dada pelos componentes 
$$v_{x_E}$$, a velocidade de solo (_ground speed_), e $$v_{z_E}$$, a razão
de descida. Convertendo para coordenadas polares temos 

$$
\begin{align}
V &= \sqrt{v_{x_E}^2 + v_{z_E}^2} \\
\gamma &= \operatorname{atan}\left(\frac{v_{z_E}}{v_{x_E}}\right)
        = \operatorname{atan2}\left(v_{z_E}, v_{x_E}\right).
\label{gamma-atan}
\end{align}
$$

Inicialmente, iremos ater nossa análise ao intervalo de $$ v_{x_E} > 0 $$,
logo a podemos usar tanto a função arco tangente ($$\operatorname{atan}$$) 
ou arco tangente duplo ($$\operatorname{atan2}$$) na Equação \eqref{gamma-atan}.
De qualquer maneira, a função arcotangente duplo é mais bem condicionada 
numericamente e preferida para implementações computacionais. Para mais
informações sobre essa função e suas propriedades, veja sua 
[página da Wikipedia][atan2-wiki].

**\<Mais conteúdo em breve\>**

Lei de Newton em Referencial Não Inercial
-----------------------------------------

**\<Mais conteúdo em breve\>**



[long-eqmov]: /mecvoo/long-eqmov/
[trabalho 1]: /mecvoo/trabalho1/
[atan2-wiki]: https://en.wikipedia.org/wiki/Atan2