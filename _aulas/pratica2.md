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
As funções `millis()` e `micros()` retornam o tempo decorrido em milisegundos
e microsegundos desde que o processador foi inicializado, respectivamente.
Ao utilizá-las é importante utilizar variáveis do tipo `long`, de 32 bits, ao
invés do tipo `int`, de 16 bits, pois senão a capacidade de representação
da variável é ultrapassada muito rapidamente.
Confira também a documentação oficial dessas funções:
[millis](https://www.arduino.cc/en/Reference/Millis) e da
[micros](https://www.arduino.cc/en/Reference/Micros).

#### Leitura de níveis analógicos de tensão

O Arduino Uno, utilizado nas práticas, possui 6 entradas analógicas.
Essas entradas funcionam como voltímetros digitais que medem níveis de tensão
entre 0V e 5V.
O conversor analógico/digital do Arduino possui resolução de 10 bits, o que
significa que os valores lidos variam de 0 a 1023 ($$2^{10}$$ valores
possíveis).
A função `analogRead(pino)` retorna a leitura analógica do canal especificado.
Confira a [documentação oficial](https://www.arduino.cc/en/Reference/AnalogRead)
dessa função para mais informações.

