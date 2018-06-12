---
layout: default
title: Mecânica do voo -- Trabalho de Análise do Sistema Linear
---

{{ page.title }}
================

Considere o modelo não linear do movimento longitudinal de uma aeronave,
como implementado na etapa de simulação do trabalho, acrescido do modelo
de tração abaixo:

$$
T = T_{\operatorname{ref}} + T_V \Delta V_c + T_{\delta_T}\Delta\delta_T.
$$

Os parâmetros da aeronave estão listados abaixo.

$$
\begin{gather*}
  \begin{aligned}
    S &= \num[output-decimal-marker={,}]{16}\si{m^2} & 
    \bar c &= \num[output-decimal-marker={,}]{1.5}\si{m} &
    \\
    \epsilon_T &= 0\si{\degree} &
    g_0 &= \num[output-decimal-marker={,}]{9,80665}\si{m/s^2} &
    \\
    T_V & = \num[output-decimal-marker={,}]{0.22}\si{N.s/m} &
    T_{\delta_T} &= \num[output-decimal-marker={,}]{1500}\si{N}
  \end{aligned}
  \\
  \begin{aligned}
    m &= \num[output-decimal-marker={,}]{1200}\si{kg} &
    I_y&=\num[output-decimal-marker={,}]{1825}\si{kg.m^2} &
    \rho &= \num[output-decimal-marker={,}]{1}\si{kg/m^3}
  \end{aligned}
  \\
  \begin{aligned}
    C_{L_\alpha} &= \num[output-decimal-marker={,}]{4.4} &
    C_{L_{\dot\alpha}} &= \num[output-decimal-marker={,}]{1.7} &
    C_{L_q} &= \num[output-decimal-marker={,}]{4} &
    C_{L_{\delta_e}} &= \num[output-decimal-marker={,}]{0.4}
    \\
    C_{m_\alpha} &= \num[output-decimal-marker={,}]{-0.6} &
    C_{m_{\dot\alpha}} &= \num[output-decimal-marker={,}]{-7} &
    C_{m_q} &= \num[output-decimal-marker={,}]{-12} &
    C_{m_{\delta_e}} &= \num[output-decimal-marker={,}]{-1.1}
    \\
    C_{D_0} &= \num[output-decimal-marker={,}]{0.03} &
    C_{D_\alpha} &= \num[output-decimal-marker={,}]{0.1} &
    C_{L_0} &= \num[output-decimal-marker={,}]{0.3}&
    C_{m_0} &= \num[output-decimal-marker={,}]{0.04}.
  \end{aligned}
\end{gather*}
$$

Utilize como entrada do modelo a deflexão de profundor $$\delta_e$$ e a posição
do comando propulsivo $$\delta_T$$. Utilize como estados do modelo a velocidade
total do CG da aeronave $$V_c$$, o ângulo de ataque $$\alpha$$, a velocidade
de arfagem da aeronave $$q$$ e o ângulo de arfagem $$\theta$$.

Linearização
------------
Obtenha os valores numéricos das matrizes $$A$$ e $$B$$ do modelo linearizado

$$
\begin{equation*}
  \Delta \dot x(t) = A \Delta x(t) + B \Delta u(t).
\end{equation*}
$$

Linearize o modelo em torno da condição de referência:

$$
\begin{align*}
  \alpha_{\operatorname{ref}}
  &=\num[output-decimal-marker={,}]{0.5}\si{\degree} &
  \theta_{\operatorname{ref}}
  &=\num[output-decimal-marker={,}]{0.5}\si{\degree} \\
  {V_c}_{\operatorname{ref}}
  &=\num[output-decimal-marker={,}]{64.7}\si{m/s} &
  q_{\operatorname{ref}}
  &=\num[output-decimal-marker={,}]{0}\si{\degree/s} \\
  {\delta_e}_{\operatorname{ref}}
  &=\num[output-decimal-marker={,}]{1.81}\si{\degree} &
  T_{\operatorname{ref}}
  &=\num[output-decimal-marker={,}]{1034.2}\si{N} \\
\end{align*}
$$

Modos do sistema
----------------

Encontre e identifique cada um dos modos do sistema do movimento longitudinal
(fugóide e período curto). Obtenha a frequência natural, a frequência 
amortecida, e o fator de amortecimento de cada modo. Para cada modo, calcule
os ângulos de fase entre as respostas de cada variável de estado.

Pulso de profundor
-------------------

Simule o modelo não linear e o modelo linear para uma entrada de pulso de
profundor e força propulsiva constante:

$$
\begin{align*}
  \delta_e(t) &= 
    \begin{cases}
      \num[output-decimal-marker={,}]{0.81}\si{\degree} &
      \text{se } 1 \leq t \leq 2 \\
      \num[output-decimal-marker={,}]{1.81}\si{\degree} &
      \text{caso contrário}
    \end{cases}
   \\
  T(t) &= \num[output-decimal-marker={,}]{1034.2}\si{N}.
\end{align*}
$$

Gere três gráficos para a simulação do intervalo de $$t\in [0, 60\si{s}]$$:

* um gráfico contendo o ângulo de ataque $$\alpha$$, o ângulo de arfagem 
$$\theta$$ e o ângulo de trajetória $$\gamma$$, em graus;
* um gráfico contendo a velocidade de arfagem $$q$$ em $$\si{\degree/s}$$;
* um gráfico contendo a velocidade $$V_c$$ em $$\si{m/s}$$.

Plote os resultados do sistema linear com linha tracejada e do sistema não
linear com linha contínua.

Entrega
-------
Entregue no Moodle os códigos fonte das funções e scripts de simulação e um
documento em formato PDF contendo os gráficos gerados e uma pequena 
análise dos resultados. Compacte todos os arquivos em um único arquivo .zip ou 
similar para entrega.
O trabalho deverá ser entregue até o dia 26 de junho.
