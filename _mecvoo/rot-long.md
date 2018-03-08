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

Considere a situação representada na figura abaixo, em que temos um vetor
$$\vec v$$ e dois sistemas de coordenadas, $$A$$ e $$B$$, rotacionados de
um ângulo $$\theta$$ entre si.

![rotacao-img]{: .center-image}

Temos que a representação de $$\vec v$$ em cada um dos sistemas é dada por

\begin{align}
  \vec v &=
  v_{x_A} \hat i_A + v_{z_A} \hat k_A,
  \label{componentes-A-v}
  \newline
  \vec v &=
  v_{x_B} \hat i_B + v_{z_B} \hat k_B.
  \label{componentes-B-v}
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
  \label{obtendo-componentes}
\end{equation}

Substituindo \eqref{componentes-A-v} em \eqref{obtendo-componentes},
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
  \label{transform-B-A}
\end{equation}

Essas equações mostram como fazer a transformação da representação do sistema
de coordenadas $$B$$ para o $$A$$. Essa transformação \eqref{transform-B-A}
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

onde $$T_{A,B}$$ é a matriz de rotação do sistema $$B$$ para o $$A$$.
Observe que, como os vetores são unitários, os elementos da matriz de rotação
são dados pelos cossenos dos ângulos entre os eixos do sistema de coordenadas.
Por essa razão, $$T_{A,B}$$ também é conhecida como a matriz de cossenos
diretores. Escrevendo esses ângulos em função de $$\theta$$, o ângulo de
rotação entre os sistemas e utilizando relações trigonométricas básicas, temos
que

\begin{equation}
  T_{A,B} =
  \begin{bmatrix}
    \cos(\theta) & \cos(\tfrac{\pi}{2} - \theta) \newline
    \cos(\tfrac{\pi}{2} + \theta) & \cos(\theta)
  \end{bmatrix}
  =
  \begin{bmatrix}
    \cos(\theta) & \sin(\theta) \newline
    -\sin(\theta) & \cos(\theta)
  \end{bmatrix}.
\end{equation}

Uma propriedade interessante dessa matriz, que pode ser verificada facilmente,
é que sua inversa é igual a sua transposta e representa a rotação reversa:

\begin{equation}
  T_{A,B}^{-1} = T_{A,B}^{\mathsf{T}} = T_{B,A}.
\end{equation}

[rotacao-img]: /assets/images/rotacao.png