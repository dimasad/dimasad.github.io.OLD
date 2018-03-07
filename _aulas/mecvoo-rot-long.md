---
layout: default
title: Mecânica do voo -- Mudança de sistemas de coordenadas no plano
---

Mecânica do voo -- Mudança de sistemas de coordenadas no plano
==============================================================

No desenvolvimento das equações do movimento da aeronave surgem várias
variáveis cuja representação natural se dá em um sistema de coordenadas
diferente do escolhido para a análise. Isso torna necessário converter
a representação de um sistema de eixos para outro. Nesta seção iremos rever
como isso ocorre para vetores bidimensionais em um plano.

Considere a situação abaixo, em que temos um vetor $$\vec v$$ e dois sistemas
de coordenadas, $$A$$ e $$B$$, rotacionados de um ângulo $$\theta$$ entre si.

![rotacao-img]{: .center-image}

Temos que a representação de $$\vec v$$ em cada um dos sistemas é dada por

\begin{align}
  \vec v &=
  v_{x_A} \hat i_A + v_{z_A} \hat k_A,
  \label{eq:componentes-A-v}
  \newline
  \vec v &=
  v_{x_B} \hat i_B + v_{z_B} \hat k_B.
  \label{eq:componentes-B-v}
\end{align}

Utilizando a operação de produto escalar, podemos obter qualquer componente
de $$\vec v$$:

\begin{equation}
  \begin{aligned}
    v_{x_A} &= \vec v \cdot \hat i_A, \newline
    v_{z_A} &= \vec v \cdot \hat k_A, \newline
    \vdots & \newline
    v_{z_B} &= \vec v \cdot \hat k_B.
  \end{aligned}
  \label{eq:obtendo-componentes}
\end{equation}

Substituindo \eqref{eq:componentes-A-v} em \eqref{eq:obtendo-componentes},
temos que
\begin{equation}
  \begin{aligned}
    v_{x_A} &=
    v_{x_B} \hat i_B \cdot \hat i_A
    + v_{z_B} \hat k_B \cdot \hat i_A, \newline
    v_{z_A} &=
    v_{x_B} \hat i_B \cdot \hat k_A
    + v_{z_B} \hat k_B \cdot \hat k_A.
  \end{aligned}
  \label{eq:transform-B-A}
\end{equation}

Essas equações mostram como fazer a transformação da representação do sistema
de coordenadas $$B$$ para o $$A$$. Essa transformação \eqref{eq:transform-B-A}
pode ser colocada na forma matricial:

$$
  \overbrace{
    \begin{bmatrix}v_{x_A} \newline v_{z_A}\end{bmatrix}
  }^{\{\vec v\}_A}
  =
  \overbrace{
    \begin{bmatrix}
      \hat i_A \cdot \hat i_B & \hat i_A \cdot \hat k_B \newline
      \hat k_A \cdot \hat i_B & \hat k_A \cdot \hat k_B
    \end{bmatrix}
  }^{T_{A,B}}
  \overbrace{
    \begin{bmatrix}v_{x_B} \newline v_{z_B}\end{bmatrix}
  }^{\{\vec v\}_B}
  ,
$$

onde $$T_{A,B}$$ é a matriz de rotação do sistema $$B$$ para o $$A$$. Para
implementação computacional e análise, é importante escrever essa matriz e
a transformação em função do ângulo de rotação $$\theta$$.

[rotacao-img]: /assets/images/rotacao.png