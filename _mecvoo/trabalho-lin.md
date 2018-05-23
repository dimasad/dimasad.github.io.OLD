---
layout: default
title: Mecânica do voo -- Trabalho de Linearização do Modelo Longitudinal
---

{{ page.title }}
================

Considere o modelo não linear do movimento longitudinal de uma aeronave,
como implementado na etapa de simulação do trabalho, acrescido do modelo
linear de propulsão abaixo:

$$
T = T_{\operatorname{ref}} + T_V \Delta V_c + T_{\delta_T}\Delta\delta_T,
$$

no qual $$T_{\operatorname{ref}}$$ é a força propulsiva de referência,
$$T_V$$ é a derivada da força em relação à velocidade e $$T_{\delta_T}$$
é a derivada da força em relação à posição do comando propulsivo $$\delta_T$$.

Utilize como entrada do modelo a deflexão de profundor $$\delta_e$$ e a posição
do comando propulsivo $$\delta_T$$. Utilize como estados do modelo a velocidade
total do CG da aeronave $$V_c$$, o ângulo de ataque $$\alpha$$, a velocidade
de arfagem da aeronave $$q$$ e o ângulo de arfagem $$\theta$$.

Tarefa
------

Este trabalho consiste na obtenção das expressões das matrizes do modelo
linearizado da aeronave. Na próxima etapa do trabalho essas matrizes serão
calculadas para uma aeronave específica e o sistema linear será analisado.

### Obtenção das equações do movimento

Escreva as equações não lineares do movimento longitudinal da aeronave.
Escreva também as expressões das variáveis auxiliares utilizadas na expressão
das equações do movimento, como $$\bar q$$, $$\hat q$$, $$C_L$$, $$L$$, etc.

### Linearização

Considerando o modelo não linear na forma implícita, 

$$
\tilde f(\dot x, x, u) = 0,
$$

como no capítulo 8 do livro-texto, obtenha as matrizes do modelo linear 
implícito 

$$
\begin{align*}
  \mathscr A &= \nabla_x \tilde f &
  \mathscr B &= \nabla_u \tilde f &
  \mathscr E &= \nabla_{\dot x} \tilde f. \\
\end{align*}
$$

Esse modelo gera a equação diferencial linear implícita

$$
  \mathscr E \Delta{\dot x} +
  \mathscr A \Delta x +
  \mathscr B \Delta u
  = 0.
$$

Escreva essas matrizes em função das derivadas dimensionais de estabilidade
e controle nos eixos da estabilidade,

$$
\begin{align*}
  Z_V &= -\left.\frac{\partial L}{\partial V_c}\right|_{\operatorname{ref}} &
  Z_\alpha &= -\left.\frac{\partial L}{\partial \alpha}
  \right|_{\operatorname{ref}} &
  Z_q &= -\left.\frac{\partial L}{\partial q}\right|_{\operatorname{ref}}
  & \dots \\
  M_V &= \left.\frac{\partial \emm}{\partial V_c}\right|_{\operatorname{ref}} &
  M_\alpha &= \left.\frac{\partial \emm}{\partial \alpha}
  \right|_{\operatorname{ref}} &
  M_q &= \left.\frac{\partial \emm}{\partial q}
  \right|_{\operatorname{ref}}  &\dots
\end{align*}
$$

Além disso, escreva as expressões de cada derivada dimensional de estabilidade
e controle utilizada em função dos parâmetros do modelo, 
dos estados de referência
$${V_c}_{\operatorname{ref}}$$, $$\alpha_{\operatorname{ref}}$$,
$$\theta_{\operatorname{ref}}$$ e das variáveis auxiliares de referência como
pressão dinâmica $$\bar q_{\operatorname{ref}}$$, ângulo de trajetória 
$$\gamma_{\operatorname{ref}}$$ e coeficientes aerodinâmicos
$$C_{D_{\operatorname{ref}}}$$, $$C_{L_{\operatorname{ref}}}$$ e
$$C_{\emm_{\operatorname{ref}}}$$.
Utilize como velocidades angulares
de referência $$q_{\operatorname{ref}} = 0$$ e 
$$\dot \alpha_{\operatorname{ref}} = 0$$.

Entrega
-------

Entregue um documento escrito com o desenvolvimento da linearização. 
As equações não lineares do movimento são pedidas apenas saber a partir de
qual expressão as matrizes do sistema linearizado foram obtidas.
O trabalho deverá ser entregue em sala de aula no dia 29 de maio.
