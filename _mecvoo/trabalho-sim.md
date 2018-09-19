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

Considere as mesmas aproximações feitas nas aulas teóricas e nas notas de aula.
Utilize como entrada do modelo a deflexão de profundor $$\delta_e$$ e considere
e a força propulsiva constante e independente da velocidade, 
$$T = 807 \si{N}$$.
O estado inicial das simulações deverá ser:

$$
\begin{align*}
  \alpha&=\num[output-decimal-marker={,}]{0}\si{\degree} &
  \theta&=\num[output-decimal-marker={,}]{0}\si{\degree} \\
  V&=\num[output-decimal-marker={,}]{58}\si{m/s} &
  q&=\num[output-decimal-marker={,}]{0}\si{\degree/s} &
\end{align*}
$$


Pulso de profundor
-------------------

Simule o sistema para uma entrada de pulso de profundor:

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

Gere três gráficos para a simulação do intervalo de $$t\in [0, 60\si{s}]$$:

* um gráfico contendo o ângulo de ataque $$\alpha$$, o ângulo de arfagem 
$$\theta$$ e o ângulo de trajetória $$\gamma$$, em graus;
* um gráfico contendo a velocidade de arfagem $$q$$ em $$\si{\degree/s}$$;
* um gráfico contendo a velocidade $$V$$ em $$\si{m/s}$$.


Entrega
-------
Entregue no Moodle os códigos fonte das funções e scripts de simulação e um
documento em formato PDF contendo os gráficos gerados e uma pequena 
análise dos resultados.


