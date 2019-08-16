---
layout: default
title: Mecânica do voo -- Trabalho de Análise do Sistema Linear
---

{{ page.title }}
================

Linearize o modelo do movimento longitudinal de uma aeronave,
com os parâmetros abaixo, iguais aos do trabalho de simulação:

$$
\begin{gather*}
  \begin{aligned}
    S &= \num[output-decimal-marker={,}]{16}\si{m^2} & 
    \bar c &= \num[output-decimal-marker={,}]{1.5}\si{m} &
    g_0 &= \num[output-decimal-marker={,}]{9.80665}\si{m/s^2}
    \\
    m &= \num[output-decimal-marker={,}]{1000}\si{kg} &
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
    C_{L_0} &= \num[output-decimal-marker={,}]{0.35} &
    C_{m_0} &= \num[output-decimal-marker={,}]{0.04}.
  \end{aligned}
\end{gather*}
$$

Considere como entrada do modelo a deflexão de profundor $$\delta_e$$ e 
assuma que a força propulsiva é constante e independente da velocidade.
A condição de referência para a linearização é

$$
\begin{align*}
  \alpha_{\operatorname{ref}}
  &=\num[output-decimal-marker={,}]{0}\si{\degree} &
  \theta_{\operatorname{ref}}
  &=\num[output-decimal-marker={,}]{0}\si{\degree} \\
  V_{\operatorname{ref}}
  &=\num[output-decimal-marker={,}]{58}\si{m/s} &
  q_{\operatorname{ref}}
  &=\num[output-decimal-marker={,}]{0}\si{\degree/s} \\
  {\delta_e}_{\operatorname{ref}}
  &=\num[output-decimal-marker={,}]{2.0835}\si{\degree} &
  T_{\operatorname{ref}} &= 807 \si{N}.
\end{align*}
$$

Obtenha os valores numéricos das matrizes $$A$$ e $$B$$ do modelo linearizado

$$
\begin{equation*}
  \Delta \dot x(t) = A \Delta x(t) + B \Delta u(t).
\end{equation*}
$$

Modos do sistema
----------------

Encontre e identifique cada um dos modos do sistema do movimento longitudinal
(fugóide e período curto). Obtenha a frequência natural, a frequência 
amortecida, e o fator de amortecimento de cada modo. Para o modo fugóide, qual
é o ângulo de fase entre a velocidade e o ângulo de arfagem?

Pulso de profundor
-------------------

Simule o modelo não linear e o modelo linear para uma entrada de pulso de
profundor:

$$
\begin{align*}
  \delta_e(t) &= 
    \begin{cases}
      \num[output-decimal-marker={,}]{1}\si{\degree} &
      \text{se } 1 \leq t \leq 2 \\
      \num[output-decimal-marker={,}]{2.0835}\si{\degree} &
      \text{caso contrário}
    \end{cases}
\end{align*}
$$

Gere três gráficos para as simulações do intervalo de $$t\in [0, 60\si{s}]$$:

* um gráfico contendo o ângulo de ataque $$\alpha$$, o ângulo de arfagem 
$$\theta$$ e o ângulo de trajetória $$\gamma$$, em graus;
* um gráfico contendo a velocidade de arfagem $$q$$ em $$\si{\degree/s}$$;
* um gráfico contendo a velocidade $$V_c$$ em $$\si{m/s}$$.

Plote os resultados do sistema linear com linha tracejada e do sistema não
linear com linha contínua, ambos em todos os gráficos.

Entrega
-------

Entregue no Moodle os códigos fonte das funções e scripts de simulação e um
documento em formato PDF contendo os gráficos gerados e uma pequena 
análise dos resultados. Compacte todos os arquivos em um único arquivo .zip ou 
similar para entrega. O trabalho deverá ser entregue até o dia 11 de novembro.
