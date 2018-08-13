---
layout: default
title: Mecânica do voo -- Notação e lista de símbolos
---

{{ page.title }}
================

Notação
-------

Na disciplina de mecânica do voo, a notação abaixo será utilizada.
Essa notação é semelhante à do Livro texto (Durham), com pequenas alterações
para remover ambiguidades ou facilitar a escrita no quadro.

* Vetores serão representados com uma seta por cima da variável, como
  $$\vec r$$. No livro texto vetores são representados em negrito. Vetores
  que representam uma grandeza em relação a outra indicam isso com subscritos e
  sobreescritos à direita da variável. A velocidade angular do referencial
  $$B$$ em relação ao referencial $$E$$, por exemplo, é representada por
  $$\vec \omega_B^E$$. A omissão do sobrescrito se refere ao referencial
  inercial.

* Os vetores unitários dos eixos $$x$$, $$y$$ e $$z$$ serão representados
  por $$\hat i$$, $$\hat j$$ e $$\hat k$$.

* A representação de um vetor em um sistema de coordenadas é indicada por
  chaves. O vetor $$\vec r$$ representado no referencial $$E$$, por exemplo, é

  $$
  \{\vec r\}_E = \begin{bmatrix} r_{x_E} \\ r_{y_E} \\ r_{z_E} \end{bmatrix}.
  $$

* O referencial do qual a derivada temporal de um vetor é observada é
  representado ao lado do ponto, em cima da variável. Se o vetor $$\vec r$$,
  representado no sistema de coordenadas $$B$$, é dado por

  $$\vec r = r_{x_B} \hat i_B + r_{j_B} \hat j_B + r_{z_B} \hat k_B,$$

  então sua derivada do observada do referencial $$B$$, é 
  
  $$
  \overset{\scriptscriptstyle \bullet B}{\vec r} =
  \dot r_{x_B} \hat i_B + \dot r_{j_B} \hat j_B + \dot r_{z_B} \hat k_B.
  $$
  
  Um detalhe importante é que, como qualquer vetor,
  $$\overset{\scriptscriptstyle \bullet B}{\vec r}$$ existe independentemente
  do referencial $$B$$ e poder ser representado em qualquer outro sistema
  de coordenadas.

Lista de símbolos e variáveis
-----------------------------

#### Variáveis do alfabeto romano

* $$\bar c$$ corda média aerodinâmica
* $$g_0$$ aceleração da gravidade padrão, 
  $$g_0=\num[output-decimal-marker={,}]{9.80665}\si{m/s^2}$$
* $$\vec h$$ momento angular da aeronave em relação ao CG
* $$h$$ altitude da aeronave
* $$\ell$$ momento de rolamento em relação ao CG, em torno de $$x_B$$
* $$\emm$$ momento de arfagem em relação ao CG, em torno de $$y_B$$
* $$m$$ massa da aeronave
* $$\vec M_A$$ momento aerodinâmico em relação ao CG da aeronave
* $$\vec M_T$$ momento propulsivo em relação ao CG da aeronave
* $$\enn$$ momento de guinada em relação ao CG, em torno de $$z_B$$
* $$p$$ velocidade de rolamento, velocidade angular do corpo em torno de $$x_B$$
* $$q$$ velocidade de arfagem, velocidade angular do corpo em torno de $$y_B$$
* $$\bar q$$ pressão dinâmica
* $$r$$ velocidade de guinada, velocidade angular do corpo em torno de $$z_B$$
* $$S$$ área alar
* $$\vec T$$ força propulsiva
* $$T$$ módulo da força propulsiva
* $$u$$ velocidade linear do CG na direção de $$x_B$$
* $$v$$ velocidade linear do CG na direção de $$y_B$$
* $$\vec v$$ vetor da velocidade inercial do CG da aeronave
* $$V_c$$ ou $$V$$ módulo da velocidade total do CG, $$V_c = \Vert\vec v\Vert$$
* $$w$$ velocidade linear do CG na direção de $$z_B$$
* $$\vec W$$ vetor peso
* $$X$$ força aerodinâmica na direção $$x_B$$
* $$X_T$$ força propulsiva na direção $$x_B$$
* $$Y$$ força aerodinâmica na direção $$y_B$$
* $$Y_T$$ força propulsiva na direção $$y_B$$
* $$Z$$ força aerodinâmica na direção $$z_B$$
* $$Z_T$$ força propulsiva na direção $$z_B$$

#### Letras gregas:

* $$\alpha$$ ângulo de ataque
* $$\beta$$ ângulo de derrapagem
* $$\gamma$$ ângulo de trajetória
* $$\theta$$ ângulo de arfagem
* $$\phi$$ ângulo de rolamento
* $$\psi$$ ângulo de guinada
* $$\mu$$ ângulo de rolamento do eixo do vento
* $$\chi$$ ângulo de rumo

