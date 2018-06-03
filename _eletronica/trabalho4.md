---
layout: default
title: Eletrônica -- Trabalho 4
---

{{page.title}}
==============

Este trabalho é um estudo dirigido para se analisar o regulador boost, um
regulador de tensão chaveado de alta eficiência. O boost é um conversor CC--CC
aumentador de tensão, seu circuito está mostrado abaixo.

{%
   include figure.html
   file="boost.svg"
   caption="Regulador boost."
%}

A tensão de entrada é $$V_e$$, e a de saída é $$V_s$$. A carga está 
representada pela resistência $$R$$, mas com controle adequado da razão
cíclica do acionamento do transistor, pode ser qualquer outro dispositivo.

Atividades
----------

Para as atividades, considere que o diodo é ideal e a resistência do MOSFET 
operando como chave fechada é nula.

1. Para o MOSFET operando como chave fechada, obtenha a equação diferencial
   da corrente no indutor em função da tensão de entrada $$V_e$$, a tensão
   no capacitor $$V_s$$ e os parâmetros do circuito.
2. Para o MOSFET operando como chave aberta e corrente $$i_L>0$$, obtenha
   a equação diferencial da corrente no indutor em função da tensão de entrada
   $$V_e$$, a tensão no capacitor $$V_s$$ e os parâmetros do circuito.
3. Quando a porta do MOSFET é acionado por uma onda quadrada de razão cíclica
   $$D \in [0,1]$$ e período $$T$$, ele opera como chave fechada por um 
   tempo $$TD$$ e como chave aberta por um tempo $$T(1-D)$$. Quando a frequência
   de chaveamento é alta o suficiente, a variação da corrente em cada etapa
   do ciclo é dada por

$$
\begin{align*}
  \Delta i_{L\operatorname{on}} &= 
  \left.\frac{di_L}{dt}\right|_{\operatorname{on}}
  \Delta t_{\operatorname{on}} &
  \qquad\Delta i_{L\operatorname{off}} &= 
  \left.
  \frac{di_L}{dt}\right|_{\operatorname{off}}
  \Delta t_{\operatorname{off}}.
\end{align*}
$$

  Sabendo que, no equilíbrio, 
  
$$
  \Delta i_{\operatorname{on}}+\Delta i_{\operatorname{off}} = 0,
$$

  encontre a expressão da tensão de saída $$V_s$$ de equilíbrio em função da
  tensão de entrada $$V_e$$ e a razão cíclica $$D$$.

Entrega
-------

O trabalho deverá ser entregue por escrito no escaninho do professor na 
secretaria do departamento de engenharia mecânica até o dia 4 de julho de 2018.
