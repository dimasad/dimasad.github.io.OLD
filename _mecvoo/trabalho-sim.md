---
layout: default
title: Mecânica do voo -- Trabalho de Simulação
---

{{ page.title }}
================

Implemente um modelo de simulação não linear do movimento longitudinal de uma
aeronave com os parâmetros abaixo:

$$
\begin{gather*}
  \begin{aligned}
    S &= \num[output-decimal-marker={,}]{16}\si{m^2} & 
    \bar c &= \num[output-decimal-marker={,}]{1.5}\si{m} &
    \\
    \epsilon_T &= 0\si{\degree} &
    g_0 &= \num[output-decimal-marker={,}]{9,80665}\si{m/s^2} &
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

Utilize como entrada do modelo a deflexão de profundor $$\delta_e$$ e a força
propulsiva $$T$$. O estado inicial das simulações deverá ser:

$$
\begin{align*}
  \alpha&=\num[output-decimal-marker={,}]{0.5}\si{\degree} &
  \theta&=\num[output-decimal-marker={,}]{0.5}\si{\degree} \\
  V_c&=\num[output-decimal-marker={,}]{64.71}\si{m/s} &
  q&=\num[output-decimal-marker={,}]{0}\si{\degree/s} &
\end{align*}
$$


Degrau de profundor
-------------------


Entregue um documento escrito com todos cálculos e equações utilizadas 
indicados. O trabalho deverá ser entregue em sala na aula do dia 12 de abril.
