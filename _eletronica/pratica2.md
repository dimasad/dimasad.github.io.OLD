---
layout: default
---

Prática 2
=========

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
única diferença é que o argumento especifica um atraso em microssegundos.
Para mais detalhes confira a documentação oficial da função
[delay] e da [delayMicroseconds] no site do Arduino ou o [tutorial Blink]
que usa a função delay para piscar um LED.

É possível também consultar o relógio interno do Arduino para fim de
temporização.
As funções `millis()` e `micros()` retornam o tempo decorrido em milisegundos
e microssegundos desde que o processador foi inicializado, respectivamente.
Ao utilizá-las é importante utilizar variáveis do tipo `long`, de 32 bits, ao
invés do tipo `int`, de 16 bits, pois senão a capacidade de representação
da variável é ultrapassada muito rapidamente.
Para entender melhor o uso dessas funções veja
[alguns exemplos][exemplos-relogio] que preparei.
Confira também a documentação oficial das funções [millis] e [micros].

#### Leitura de níveis analógicos de tensão

O Arduino Uno, utilizado nas práticas, possui 6 entradas analógicas.
Essas entradas funcionam como voltímetros digitais que medem níveis de tensão
entre 0V e 5V.
O conversor analógico/digital do Arduino possui resolução de 10 bits, o que
significa que os valores lidos variam de 0 a 1023 ($$2^{10}$$ valores
possíveis).
A função `analogRead(pino)` retorna a leitura analógica do canal especificado.
Confira a documentação oficial [dessa função][analogRead] para
mais informações.

Dispositivos
------------

#### Servomotor de rádio controle
Servomotores são sistemas controlados com motores que permitem comandar a
posição do eixo de saída.
Servomotores de rádio controle são utilizados para comando remoto de veículos
não tripulados como aeromodelos ou automodelos.
Eles geralmente são compostos de um pequeno motor de corrente contínua
conectado a um sistema de engrenagens cujo eixo de saída é um potenciômetro.
Dessa forma, a posição do eixo é medida e controlada por um sistema 
realimentado que atua no motor.

Esses dispositivos possuem 3 terminais: alimentação, terra e sinal.
A alimentação é o terminal central, de cor vermelha.
O terra é o terminal correspondente ao cabo preto ou marrom e o sinal
corresponde ao fio amarelo ou laranja.
A referência de posição é enviada pelo terminal de sinal como um pulso.
A duração do pulso codifica a posição desejada do eixo.
Um pulso de 1500 microssegundos corresponde à posição central do eixo, de
90 graus, enquanto
que as durações de 600 microssegundos e 2400 microssegundos correspondem, 
respectivamente, a deflexões de aproximadamente 0 graus e
180 graus.
Os pulsos devem estar espaçados de pelo menos 20 milissegundos entre si.

Usar um pulso de duração variável permite diferenciar o comando nulo de perda
de sinal de rádio.
Quando nenhum pulso é recebido o servo mantém a última referência recebida
ao invés de dar a deflexão máxima.
Esse comportamento é mais seguro para o comando de aeronaves remotamente 
pilotadas.

Um recurso adicional para mais informações sobre o funcionamento e uso de
servomotores é o [tutorial de servos da Sparkfun].

#### Sensor ultrassônico de distância HC-SR04

O sensor HC-SR04 é um medidor de distância (telêmetro) ultrassônico.
Ele possui 4 pinos, alimentação, terra, gatilho (_trigger_) e eco
(_echo_).
Quando um pulso de pelo menos 10 microssegundos é enviado ao pino de gatilho
uma série de 8 pulsos ultrassônicos é emitida.
O sensor então aguarda o eco dos pulsos seja recebido e gera um
pulso no pino echo cuja duração é igual ao tempo de voo do sinal
emitido.
A distância percorrida $$d$$ é então encontrada multiplicando a duração $$T$$
pela metade da velocidade do som $$a$$.
Se o eco não é detectado o sinal do pino de eco permanece em nível lógico alto
depois do gatilho.

Confira o [datasheet do HC-SR04] para maiores detalhes sobre seu funcionamento.


Desafios
--------

#### Servomotor

**Posição constante.**
Como primeiro teste, conecte um servo ao Arduino e o comande para uma posição
constante utilizando 3 métodos.
Primeiro, enviando pulsos com a função `delayMicroseconds`.
Depois, enviando  pulsos com a função `micros`.
Por fim, utilizando a [biblioteca Servo].
Altere o valor da posição com cada método e veja se o servo se move como
esperado.
[Veja aqui][sol-servo1] algumas soluções possíveis para esse problema.

**Varredura com velocidade constante.**
Conecte um servomotor ao Arduino e faça sua posição variar continuamente
de 0 a 180 graus e de volta a 0 graus, com velocidade em torno de
60 graus por segundo.
Tente resolver esse problema utilizando cada um dos três métodos sugeridos
acima.

**Comando do servo pelo potenciômetro.**
Conecte um potenciômetro ao Arduino e comande a posição do servo de acordo
com a posição do potenciômetro: quando o potenciômetro estiver na posição
central o servo também deverá estar, e o acompanhar em qualquer giro.
Tente resolver esse problema utilizando cada um dos três métodos sugeridos
acima.

#### Sensor ultrassônico

**Medição de posição com um programa síncrono.**
Meça a posição de um objeto utilizando o HC-SR04, implementando o código
dentro da função `loop()`.

**Medição de posição com interrupções.**
Meça a posição de um objeto utilizando o HC-SR04, utilizando interrupções
com a função [attachInterrupt].

[delay]: https://www.arduino.cc/en/Reference/Delay
[delayMicroseconds]: https://www.arduino.cc/en/Reference/DelayMicroseconds
[millis]: https://www.arduino.cc/en/Reference/Millis
[micros]: https://www.arduino.cc/en/Reference/Micros
[analogRead]: https://www.arduino.cc/en/Reference/AnalogRead
[attachInterrupt]: https://www.arduino.cc/en/Reference/AttachInterrupt

[biblioteca Servo]: https://www.arduino.cc/en/Reference/Servo
[tutorial Blink]: https://www.arduino.cc/en/Tutorial/Blink

[tutorial de servos da Sparkfun]: https://learn.sparkfun.com/tutorials/hobby-servo-tutorial

[datasheet do HC-SR04]: /datasheet/HCSR04.pdf

[sol-servo1]: ../sol-servo1
[exemplos-relogio]: ../exemplos-relogio