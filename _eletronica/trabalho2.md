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

Atividade
---------


Entrega
-------

