---
layout: default
title: Mecânica do voo -- Trabalho Final
---

{{ page.title }}
================

Para esta última etapa do trabalho, há duas alternativas: simular e analisar
o modelo de 6 graus de liberdade da aeronave leve abaixo ou propor
algum outro projeto diferente envolvendo os conteúdos aprendidos na disciplina.

Para projetos diferentes há algumas sugestões abaixo.
* Modelar algum veículo diferente, como helicóptero, foguete, avião 
  com propulsão vetorizada, dirigível. 
  Pesquise valores de parâmetros aerodinâmicos e propulsivos ou tente
  estimar com cálculos teóricos e métodos numéricos.
* Projetar e simular um sistema de controle realimentado.
  Várias das referências tem exemplos de projeto de sistemas de controle.
  Tente utilizar algumas das arquiteturas sugeridas com modelos de outras
  aeronaves.
* Simular os transitórios de alguma condição de voo específica, como estol,
  alijamento de carga, corrida e decolagem ou voo rasante com efeito de solo.

Modelo de 6 Graus de Liberdade
------------------------------
Implemente o modelo de simulação não linear da dinâmica de uma
aeronave com 6 graus de liberdade e os seguintes parâmetros:


$$
\begin{gather*}
  \begin{aligned}
    I_x&=\num{1280}\si{kg.m^2} &
    I_y&=\num{1825}\si{kg.m^2} &
    I_z&=\num{2660}\si{kg.m^2} \\
    I_{xz}&=\num[output-decimal-marker={,}]{0}\si{kg.m^2} &
    m &= \num[output-decimal-marker={,}]{1000}\si{kg} &
    \rho &= \num[output-decimal-marker={,}]{1}\si{kg/m^3}
  \end{aligned}
  \\
  \begin{aligned}
    S &= \num[output-decimal-marker={,}]{16}\si{m^2} & 
    \bar c &= \num[output-decimal-marker={,}]{1.5}\si{m} &
    b &= \num[output-decimal-marker={,}]{11}\si{m} &
    g_0 &= \num[output-decimal-marker={,}]{9,80665}\si{m/s^2} \\
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
    C_{L_0} &= \num[output-decimal-marker={,}]{0.35}&
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
  \end{aligned}
\end{gather*}
$$

Utilize como entrada do modelo as deflexões de aileron $$\delta_a$$ profundor 
$$\delta_e$$ e leme $$\delta_r$$. O estado inicial das simulações deverá ser:

$$
\begin{align*}
  \mu &=\num[output-decimal-marker={,}]{0}\si{\degree} &
  \gamma&=\num[output-decimal-marker={,}]{0}\si{\degree} &
  \chi&=\num[output-decimal-marker={,}]{0}\si{\degree} \\ 
  p &= \num[output-decimal-marker={,}]{0}\si{\degree/s} &
  q &= \num[output-decimal-marker={,}]{0}\si{\degree/s} &
  r &= \num[output-decimal-marker={,}]{0}\si{\degree/s} \\ 
  V&=\num[output-decimal-marker={,}]{58}\si{m/s} &
  \alpha&=\num[output-decimal-marker={,}]{0}\si{\degree} &
  \beta&=\num[output-decimal-marker={,}]{0}\si{\degree} \\
\end{align*}
$$


Pulso de leme
--------------

Simule o sistema para uma entrada de pulso de leme com as demais entradas
nos seus valores de referência:

$$
\begin{align*}
  \delta_a(t) &= 0\si{\degree} \\
  \delta_e(t) &= \num[output-decimal-marker={,}]{2.0835}\si{\degree} \\
  \delta_r(t) &= 
    \begin{cases}
      \num[output-decimal-marker={,}]{2}\si{\degree} &
      \text{se } 1 \leq t \leq 2 \\
      \num[output-decimal-marker={,}]{0}\si{\degree} &
      \text{caso contrário}
    \end{cases}
\end{align*}
$$

Mostre os gráficos de todos os estados para a simulação do intervalo de
$$t\in [0, 200\si{s}]$$, destacando os intervalos de interesse na resposta
transitória. Mostre, em especial, a resposta dos estados nos 10 primeiros
segundos da simulação, onde é possível visualisar melhor a dinâmica rápida
látero-direcional.

Entrega
-------
Entregue no Moodle os códigos fonte das funções e scripts de simulação e um
documento em formato PDF contendo os gráficos gerados e uma pequena 
análise dos resultados.
O trabalho deverá ser entregue até o dia 9 de dezembro.
