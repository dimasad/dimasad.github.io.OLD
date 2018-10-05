---
layout: default
title: Eletrônica -- Prática 4
---

{{ page.title }}
================
{:.no_toc}

#### Uso de um interruptor ótico
{:.no_toc}

O objetivo desta prática é usar um interruptor ótico para medir a velocidade
e posição de um motor CC. O interruptor ótico utilizado é o [ITR9608], composto
de um par fotodiodo e fototransistor infravermelho.

**Tópicos:**
* Procedimento x
* Procedimento y
{:toc}


Circuito do sensor
------------------

Abaixo temos o diagrama do circuito do interruptor ótico. O LED é acionado 
continuamente e a é luz emitida na direção do fototransistor. Quando o 
fototransistor recebe luz suficiente, ele opera no modo de saturação, como 
chave fechada. Quando a luz é interrompida, ele opera no modo de corte, como
chave aberta. O coletor do fototransistor é o ponto de medição do sensor,
com uma tensão próxima de 0V quando há luz e próxima de 5V quando não há.

{%
   include figure.html
   file="optical-int.svg"
   caption="Circuito com as ligações do interruptor ótico [ITR9608]."
%}

Monte esse circuito no protoboard e conecte o ponto de medição em uma entrada
analógica do Arduino.

> ### Teste do sensor
>
> O primeiro teste consiste em fazer a medição analógica do sensor e observar 
> os níveis de tensão quando há e quando não há luz.
>
> **Dica:** Lembre de configurar a porta serial com a função `Serial.begin`.


> ### Contagem de pulsos gerados por um encoder
>
> Em seguida, use um encoder conectado a um motor e faça um código para contar
> o número de pulsos (e, consequentemente, voltas) do motor. O acionamento
> do motor pode ser feito manualmente, com um botão.

> ### Medição da velocidade instantânea
>
> Com um encoder conectado a um motor, faça um código que mede o tempo entre
> pulsos ou o tempo entre as bordas de subida e descida do sensor. Converta 
> esse tempo para a velocidade do motor. Tente fazer um código que identifique
> também o caso do motor parado (velocidade nula).

> ### Controle proporcional de velocidade
> 
> Faça o acionamento do motor com um transistor NPN e implemente o controle
> proporcional de velocidade, com a velocidade de referência fornecida por um
> potenciômetro.

[ITR9608]: /datasheet/ITR9608.pdf
