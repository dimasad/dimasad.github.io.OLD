---
layout: default
title: Mecânica do voo -- Forças do modelo longitudinal
---

{{ page.title }}
================

Para completar as equações do movimento desenvolvidas na [seção anterior]
precisamos escrever as forças e momentos externos atuantes sobre a aeronave
em função da sua condição de voo. Para uma aeronave de asa fixa, tais forças
são a força aerodinâmica $$\vec F_A$$, a força peso $$\vec W$$ e a força
propulsiva $$\vec T$$. De maneira semelhante, os momentos externos que
consideraremos na nossa aeronave são o momentos aerodinâmico $$\vec M_A$$
e os momento propulsivo $$\vec M_T$$.


Forças Aerodinâmicas e Adimensionalização
-----------------------------------------

Para o modelo longitudinal, as forças aerodinâmicas $$\vec F_A$$ são o arrasto
$$D$$, contrária à velocidade $$\vec v$$ da aeronave, e a sustentação $$L$$,
na direção ortogonal:

\begin{equation}
  \vec F_A = - D \hat i_W - L \hat k_W.
  \label{eq:F_A}
\end{equation}

A modelagem aerodinâmica geralmente é feita utilizando a representação
adimensional das forças e momentos aerodinâmicos. As forças são
adimensionalizadas utilizando a área alar $$S$$ e a pressão dinâmica $$\bar q$$,
definida como

$$
  \bar q = \tfrac 12 \rho V^2,
$$

Onde $$\rho$$ é a densidade do ar e $$V$$ a magnitude da velocidade da
aeronave em relação à atmosfera.
O coeficiente adimensional correspondente a cada componente é designado por
$$C$$ com o subscrito idenficiando a força ou momento em questão. Dessa forma,
o coeficiente de sustentação $$C_L$$ e de arrasto $$C_D$$ são definidos pela
equação abaixo.

\begin{align}
  C_L &= \frac{L}{\bar q S}, &
  C_D &= \frac{D}{\bar q S}.
\end{align}

Modelo Aerodinâmico Linear
--------------------------

De maneira geral, a relação entre os coeficientes aerodinâmicos e as variáveis
de voo é não linear. No entanto, para pequenos desvios em torno de uma condição
de voo de referência, os coeficientes podem ser aproximados por um modelo
aerodinâmico linear. O modelo aerodinâmico aerodinâmico do coeficiente de
sustentação pode ser escrito como

$$
\begin{multline}
  C_L = C_{L_{\operatorname{ref}}} + 
  C_{L_\alpha} (\alpha - \alpha_{\operatorname{ref}}) +
  C_{L_{\dot{\alpha}}} \hat {\dot \alpha} +
  C_{L_q} \hat q
  \newline +  
  C_{L_{\delta_e}} (\delta_e - {\delta_e}_{\operatorname{ref}}) +
  C_{L_V} (\hat V - \hat {V}_{\operatorname{ref}}),
\end{multline}
$$

onde $$\operatorname{ref}$$ indica o valor de referência da variavél.
Uma outra notação mais compacta usada comumente é 

$$
\begin{equation}
  C_L = C_{L_0} +
  C_{L_\alpha} \alpha +
  C_{L_{\dot{\alpha}}} \hat {\dot \alpha} +
  C_{L_q} \hat q + 
  C_{L_{\delta_e}} \delta_e +
  C_{L_V} (\hat V - 1).
\end{equation}
$$

Os parâmetros do modelo aerodinâmico linear são conhecidos como as derivadas
de estabilidade e controle, pois

$$
\begin{align*}
  C_{L_\alpha} &=
  \left.
  \frac{\partial C_L}{\partial \alpha}\right|_{\operatorname{ref}}, &
  C_{L_{\dot \alpha}} &=
  \left.
  \frac{\partial C_L}{\partial \hat{\dot\alpha}}\right|_{\operatorname{ref}},
  \newline
  C_{L_{\delta_e}} &=
  \left.
  \frac{\partial C_L}{\partial \delta_e}\right|_{\operatorname{ref}}, &
  C_{L_q} &=
  \left.
  \frac{\partial C_L}{\partial \hat q}\right|_{\operatorname{ref}}. &
  \newline
  C_{L_V} &=
  \left.
  \frac{\partial C_L}{\partial \hat V}\right|_{\operatorname{ref}}. &
\end{align*}
$$

Um detalhe importante é que os modelos lineares dos coeficientes adimensionais
são escritos em função das variáveis de voo adimensionais. Por isso, $$\alpha$$
e $$\delta_e$$ devem estar representados em radianos e $$\hat {\dot\alpha}$$,
$$\hat q$$ e $$\hat V$$ são os adimensionais definidos como

$$
\begin{align}
  \hat{\dot\alpha} &= \frac{\bar c \dot\alpha}{2V}, &
  \hat q &= \frac{\bar c q}{2V}, &
  \hat V &= \frac{V}{V_{\operatorname{ref}}}.
\end{align}
$$

Força Propulsiva
----------------
Em nosso modelo longitudinal, consideraremos que a força propulsiva está
alinhada com eixo $$x_B$$.

{%
   include figure.html
   file="thrust_xbody.svg"
   caption="Força propulsiva $$\vec T$$ e os eixos do corpo."
   img_style="width: 100%"
%}

Além disso, assumimos que o sistema moto-propulsor não gera momentos em torno
do CG da aeronave.

[seção anterior]: ../long-eqmov