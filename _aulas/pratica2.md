---
layout: default
title: Prática 2
---

Introdução
----------

Esta prática consistirá de vários procedimentos curtos para explorar
funções do Arduino e o uso de dispositivos.
Há uma descrição de algumas funcionalidades do Arduino e de sua linguagem,
com exemplos que podem ser executados para ilustrar sua aplicação e alguns
conceitos subjacentes.
Junto com as explicações há pequenos desafios (com múltiplas soluções possíveis)
para exercitar os conteúdo e seu uso.
A ordem em que os procedimentos devem ser feitos ou o material consultado
é livre.
Caso tenham dificuldade podem pedir ajuda ao professor ou ver
algumas soluções possíveis para os problemas apontados no final de cada desafio.

Funções do Arduino
------------------

#### Medição e atraso de tempo

A função `delay(x)` utilizada na primeira prática é a maneira mais simples
de se controlar o tempo e sincronizar ações utilizando o Arduino.
Para atrasos rápidos temos também a função `delayMicroseconds(x)`, cuja
única diferença é que o argumento especifica um atraso em microsegundos.
Para mais detalhes confira a documentação oficial da função
[delay](https://www.arduino.cc/en/Reference/Delay) e da
[delayMicroseconds](https://www.arduino.cc/en/Reference/DelayMicroseconds)
no site do Arduino.

É possível também consultar o relógio interno do Arduino para fim de
temporização.
As funções `millis()` e `micros`
Confira também a documentação oficial dessas funções:
[millis](https://www.arduino.cc/en/Reference/Millis) e da
[micros](https://www.arduino.cc/en/Reference/Micros).


