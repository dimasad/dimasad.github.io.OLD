---
layout: default
title: Mecânica do voo -- Trabalho Final
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
    T_{\operatorname{ref}}
    &=\num[output-decimal-marker={,}]{1034.2}\si{N}
    \\
    b &= \num[output-decimal-marker={,}]{11}\si{m} &
    \epsilon_T &= 0\si{\degree} &
    g_0 &= \num[output-decimal-marker={,}]{9,80665}\si{m/s^2} &
  \end{aligned}
  \\
  \begin{aligned}
    I_x&=\num{1280}\si{kg.m^2} &
    I_y&=\num{1825}\si{kg.m^2} &
    I_z&=\num{2660}\si{kg.m^2} \\
    I_{xz}&=\num[output-decimal-marker={,}]{0}\si{kg.m^2} &
    m &= \num[output-decimal-marker={,}]{1200}\si{kg} &
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
    C_{m_0} &= \num[output-decimal-marker={,}]{0.04}
    \\
    C_{C_\beta} &= \num[output-decimal-marker={,}]{0.4} &
    C_{C_p} &= \num[output-decimal-marker={,}]{0.075} &
    C_{C_r} &= \num[output-decimal-marker={,}]{-0.2} &
    C_{C_{\delta_r}} &= \num[output-decimal-marker={,}]{-0.2}
    \\
    C_{\ell_\beta} &= \num[output-decimal-marker={,}]{-0.09} &
    C_{\ell_p} &= \num[output-decimal-marker={,}]{-0.5} &
    C_{\ell_r} &= \num[output-decimal-marker={,}]{0.08} &
    C_{\ell_{\delta_a}} &= \num[output-decimal-marker={,}]{0.23}
    \\
    C_{\ell_{\delta_r}} &= \num[output-decimal-marker={,}]{0.015} &
    C_{n_\beta} &= \num[output-decimal-marker={,}]{0.06} &
    C_{n_p} &= \num[output-decimal-marker={,}]{-0.028} &
    C_{n_r} &= \num[output-decimal-marker={,}]{-0.094} 
    \\
    C_{n_{\delta_a}} &= \num[output-decimal-marker={,}]{-0.02} & 
    C_{n_{\delta_r}} &= \num[output-decimal-marker={,}]{0.065} &
    T_V & = \num[output-decimal-marker={,}]{0.22}\si{N.s/m} &
  \end{aligned}
\end{gather*}
$$

Utilize como entrada do modelo as deflexões de aileron $\delta_a$ profundor 
$$\delta_e$$ e leme $$\delta_r$$. Utilize o modelo propulsivo

$$
T = T_{\operatorname{ref}} + T_V \Delta V_c + T_{\delta_T}\Delta\delta_T.
$$

O estado inicial das simulações deverá ser:

$$
\begin{align*}
  \mu &=\num[output-decimal-marker={,}]{0}\si{\degree} &
  \gamma&=\num[output-decimal-marker={,}]{0}\si{\degree} &
  \chi&=\num[output-decimal-marker={,}]{0}\si{\degree} \\ 
  p &= \num[output-decimal-marker={,}]{0}\si{\degree/s} &
  q &= \num[output-decimal-marker={,}]{0}\si{\degree/s} &
  r &= \num[output-decimal-marker={,}]{0}\si{\degree/s} \\ 
  V_c&=\num[output-decimal-marker={,}]{64.7}\si{m/s} &
  \alpha&=\num[output-decimal-marker={,}]{0.5}\si{\degree} &
  \beta&=\num[output-decimal-marker={,}]{0}\si{\degree} \\
\end{align*}
$$


Pulso de leme
--------------

Simule o sistema para uma entrada em degrau de profundor e força propulsiva
constante:

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

Entrega
-------
Entregue no Moodle os códigos fonte das funções e scripts de simulação e um
documento em formato PDF contendo os gráficos gerados e uma pequena 
análise dos resultados.
O trabalho deverá ser entregue até o dia 8 de maio.

