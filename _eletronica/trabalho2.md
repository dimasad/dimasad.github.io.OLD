---
layout: default
title: Eletrônica -- Trabalho 2
---

{{page.title}}
==============

Este trabalho é um estudo dirigido para se analisar um circuito de acionamento
de um motor elétrico de corrente contínua com um transistor. A indutância do 
motor tem um efeito de filtro de corrente, que diminui a amplitude das 
componentes de alta frequência da tensão aplicada ao motor.
Considere o circuito de acionamento do motor de corrente contínua representado 
na figura abaixo.

{%
   include figure.html
   file="acionamento-motor.svg"
   caption="Circuito de acionamento de um motor de corrente contínua."
%}

O motor é acionado por um MOSFET comandado por um Arduino. A tensão para o motor
é provida por uma bateria e há um diodo de roda livre para proteger a chave.
O motor de corrente contínua, por sua vez, pode ser modelado pelo circuito
equivalente representado na figura abaixo. Temos uma resistência de armadura,
$$R_a$$, que é resistência total dos fios do enrolamento do motor; uma
indutância de armadura $$L_a$$; e a força contra-eletromotriz, representada
como uma fonte de tensão contrária à circulação de corrente no motor.

{%
   include figure.html
   file="circuito-eqv-motor.svg"
   caption="Circuito de equivalente de um motor de corrente contínua."
%}

A força contra-eletromotriz é a tensão induzida no enrolamento do motor quando
ele começa a girar, pois há uma variação do fluxo magnético através das espiras.
O valor da tensão induzida é dado por $$k_e \omega$$, onde $$k_e$$ é a constante
de força-contraletromotriz do motor e $$\omega$$ é sua velocidade de rotação.
Substituindo o circuito equivalente no circuito de acionamento, obtemos o
circuito abaixo, que será utilizado para se analisar o comportamento do sistema.

{%
   include figure.html
   file="acionamento-motor-circuito-eqv.svg"
   caption="Circuito de acionamento do motor com o circuito equivalente."
%}

Atividades
----------

Para as atividades, considere um motor com os seguintes parâmetros:

* $$k_e = \num[output-decimal-marker={,}]{4.5}\si{\milli\volt/RPM}$$,
* $$R_a = 500\,\si{\milli\ohm}$$, e
* $$L_a = 10 \si{\milli\henry}$$.

Além disso, considere que o diodo é ideal e a resistência do MOSFET operando
como chave fechada é nula.

### Rotor travado

Inicialmente, considere que o rotor está parado, $$\omega=0$$, como ocorre
na partida do motor.

1. Quando o pino digital 9 do Arduino está em nível lógico alto (5V), calcule
   a expressão da variação da corrente do indutor $$\tfrac{di}{dt}$$ em função
   da corrente no indutor $$i$$.
2. Assumindo que a constante de tempo do circuito é muito maior que a
   frequência de chaveamento do MOSFET, calcule a variação na corrente do 
   indutor $$\Delta i_{\operatorname{on}}$$ durante o período que a chave fica
   fechada $$\Delta t_{\operatorname{on}}$$, em função de $$i$$.
   Para fazer isso, substitua $$\tfrac{di}{dt}$$ por 
   $$\tfrac{\Delta i_{\operatorname{on}}}{\Delta t_{\operatorname{on}}}$$ e 
   encontre a expressão de $$\Delta i_{\operatorname{on}}$$ em função de todas
   as outras variáveis. Isso equivale a utilizar o [método de Euler] para
   integração de equações diferenciais, o que é uma boa aproximação para
   curtos intervalos de tempo.
3. Quando o pino digital 9 do Arduino está em nível lógico baixo (0V), calcule
   a expressão da variação da corrente do indutor $$\tfrac{di}{dt}$$ em função
   da corrente no indutor $$i$$.
4. Assumindo que a constante de tempo do circuito é muito maior que a
   frequência de chaveamento do MOSFET, calcule a variação na corrente do 
   indutor $$\Delta i_{\operatorname{off}}$$ durante o período que a chave fica
   aberta $$\Delta t_{\operatorname{off}}$$, em função de $$i$$.
5. Quando a porta do MOSFET é acionado por uma onda quadrada de razão cíclica
   $$D \in [0,1]$$ e período $$T$$, ele opera como chave fechada por um 
   tempo $$TD$$ e como chave aberta por um tempo $$T(1-D)$$. Com esse 
   acionamento, a corrente entra em regime permanente quando a soma da sua
   variação no intervalo de chave fechada $$\Delta i_{\operatorname{on}}$$
   com a variação no intervalo de corte $$\Delta i_{\operatorname{off}}$$ é
   nula. Utilizando essa relação, calcule a corrente de regime em função da
   razão cíclica $$D$$ e a oscilação de corrente em função de $$D$$ e $$T$$.
   Utilize as respostas das questões 2 e 4 para encontrar o valor de $$i$$
   que é a solução da equação 
   
   $$\Delta i_{\operatorname{off}}+\Delta i_{\operatorname{off}} = 0.$$

### Rotor em movimento

Quando a a tensão na porta do MOSFET é uma onda quadrada com frequência de
980Hz e razão cíclica de 50%, e o motor está com a rotação de 500 RPM, qual
será a corrente de regime e sua oscilação?

Entrega
-------

O trabalho deverá ser entregue por escrito na aula do dia 9 de maio de 2018.

[método de Euler]: https://en.wikipedia.org/wiki/Euler_method