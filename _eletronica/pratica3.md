---
layout: default
title: Eletrônica -- Prática 3
---

{{ page.title }}
================
{:.no_toc}

#### Acionamento de um Motor CC
{:.no_toc}


O objetivo da prática desta prática é fazer o acionamento de um motor de 
corrente contínua com o Arduino. Inicialmente, o motor será acionado em 
somente um sentido, utilizando um transistor NPN. Em seguida, será acionado
nos dois sentidos utilizando a ponte H do circuito integrado [L293D].

**Tópicos:**
* Procedimento x
* Procedimento y
{:toc}


Acionamento com um transistor NPN
---------------------------------

Abaixo temos o diagrama de um circuito para acionamento de um motor de corrente
contínua com um Arduino usando um transistor NPN. Os terminais do transistor
(coletor, emissor e base) estão indicados. Em antiparalelo com o motor temos
um diodo de roda livre para proteger a chave, pois o motor é uma carga indutiva.
O acionamento da base do transistor é feito pelo pino digital 9 do Arduino.
Quando a saída está em nível lógico alto (5 V) o transistor está saturado,
operando como chave fechada. Quando a saída está em nível lógico baixo (0 V) o
transistor está em corte, operando como chave aberta.

{%
   include figure.html
   file="motor-npn.svg"
   caption="Circuito para acionamento do motor com um transistor NPN."
%}

Monte esse circuito em um protoboard, utilizando o transistor [BC639] e o diodo
[1N4007]. Atenção para a pinagem do transistor, confira na folha de dados.
No diodo, a banda marca o catodo, como indicado na sua folha de dados.
Com esse circuito, faça as atividades abaixo.

> ### Teste do acionamento
>
> O primeiro teste consiste em ligar o motor, aguardar 1s, desligar o motor,
> aguardar 1s e repetir. Esse programa serve para ver se a montagem foi feita
> corretamente.
>
> **Dica:** Lembre de configurar o pino 9 como saída com a função `pinMode`.


> ### Aceleração e desaceleração gradual
>
> O segundo teste consiste em


A modulação por largura de pulso é uma técnica para se variar a tensão média
fornecida para um componente (no nosso caso o motor) utilizando chaves.
Como chaves possuem somente dois estados, aberto e fechado, seu estado é
variado em alta frequência para que, na média, a carga perceba uma tensão
média entre os estados discretos possíveis.

Considere a imagem abaixo.
A razão cíclica (_duty cycle_) é o fração do período em que a onda permanece
no nível lógico alto.
Se uma onda de tensão com razão cíclica de 75% for aplicada a um componente,
a tensão média é 75% da tensão máxima.
Dessa forma, a tensão _média_ no componente pode ser variada entre 0
e a tensão do nível lógico alto.
A razão cíclica de 0% corresponde ao nível lógico baixo de de 100% corresponde
ao nível lógico alto.

![pwm-img]
Fonte: [Sparkfun][Tutorial PWM], licença [CC BY-SA 4.0]

O microcontrolador do Arduino possui um periférico para gerar onda com
modulação por largura de pulso (PWM, do inglês _pulse width modulation_)
em hardware, sem intervenção do usuário.
A função `analogWrite(pino, razao_ciclica)` é usada para gerar uma onda com
PWM.
O argumento `razao_ciclica` é um número de 0 a 255, correspondendo a uma razão
de 0% a 100%.
Antes de utilizá-la é necessário configurar o pino como saída através da função
`pinMode(pino, OUTPUT)`.

Confira a documentação oficial da função [analogWrite] para maiores informações.
Para ilustrar o uso da modulação por largura de pulso, veja a
[página de exemplo][ex-pwm-led] da modulação por largura de pulso para alterar
o brilho de um led.

#### Acionamento do motor por PWM

Abaixo temos um circuito para acionamento de um motor com o Arduino.
Quando o transistor está no modo de saturação uma tensão próxima de 3,3V
é aplicada no motor.
Há um diodo de roda livre em paralelo com o motor para proteger a chave, já
que o motor é uma carga indutiva.
Há também um potenciômetro que será utilizado como entrada analógica.

![schem-motor-npn-pot]

Para montar esse circuto utilize o transistor NPN [BC639] e o diodo [1N4007].

**Atividade:**
Implemente o acionamento do pino 9 do Arduino com modulação por
largura de pulso para que a razão cíclica seja proporcional à posição do
potenciômetro.
Caso tenha dificuldade nesta tarefa, veja [uma solução possível][sol-pwd-pot]
para esse problema.

Tacômetro ótico
---------------

Junto com cada motor está um conjunto de interruptor ótico [ITR9608],
que possui um par LED-fototransistor.
Quando a luz do LED chega no fototransistor, ele opera como chave fechada,
quando a luz é interrompida pela hélice o fototransistor opera no modo corte,
como chave aberta.
Dessa forma, é possível medir a velocidade da hélice contando o tempo entre
mudanças de estado do fototransistor.

Para medir esse tempo, é necessário o uso de interrupções.

[BC639]: /datasheet/BC639.pdf
[L293D]: /datasheet/L293D.pdf
[1N4007]: /datasheet/1N4007.pdf

[analogWrite]: https://www.arduino.cc/en/Reference/AnalogWrite
[analogRead]: https://www.arduino.cc/en/Reference/AnalogRead
