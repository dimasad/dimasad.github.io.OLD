---
layout: default
title: Mecânica do voo -- Trabalho 2
---

{{ page.title }}
================

Considere um planador (não há força de propulsão) com os parâmetros abaixo.

$$
\begin{gather*}
  \begin{aligned}
    S &= \num[output-decimal-marker={,}]{16}\si{m^2} & 
    \bar c &= \num[output-decimal-marker={,}]{1.5}\si{m} 
  \end{aligned}
  \\
  \begin{aligned}
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
    C_{L_0} &= \num[output-decimal-marker={,}]{0.3}&
    C_{m_0} &= \num[output-decimal-marker={,}]{0.04}.
  \end{aligned}
\end{gather*}
$$

Os coeficientes omitidos são nulos. Utilizando as equações do modelo
longitudinal não linear, calcule para a condição de voo abaixo o valor
de $$\dot \alpha$$, $$C_L$$, $$C_D$$ e $$C_m$$.

$$
\begin{gather*}
  \begin{aligned}
    \alpha&=\num[output-decimal-marker={,}]{2.29}\si{\degree} &
    \theta&=\num[output-decimal-marker={,}]{2.86}\si{\degree} &
    \delta_e&=\num[output-decimal-marker={,}]{5.73}\si{\degree} &
  \end{aligned}
  \\
  \begin{aligned}
    q&=\num[output-decimal-marker={,}]{14.32}\si{\degree/s} &
    V_c&=\num[output-decimal-marker={,}]{61}\si{m/s},
  \end{aligned}
\end{gather*}
$$

Entregue um documento escrito com todos cálculos e equações utilizadas 
indicados. O trabalho deverá ser entregue em sala na aula do dia 16 de setembro.

**Dica:** Lembre que o modelo aerodinâmico adimensional utiliza a condição de 
voo adimensional, ou seja, $$\alpha$$ e $$\delta_e$$ em radianos, 
$$\hat{\dot\alpha}$$ e $$\hat q$$.
