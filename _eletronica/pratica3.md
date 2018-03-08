---
layout: default
---

Prática 3 - Controle de velocidade de uma hélice
================================================

O objetivo da prática de hoje será realizar o controle de velocidade de uma
hélice.
A prática pode ser dividida em três etapas:

 1. acionamento proporcional do motor com modulação por largura de pulso,
    utilizando um transistor;
 2. medição da velocidade da hélice com um interruptor ótico;
 3. implementação do controle, fechando a malha.

Cada uma dessas etapas é detalhada abaixo.
Para ajudar na implementação são fornecidos exemplos para ajudar a entender
o uso das funções e funcionalidades do Arduino.

Modulação por largura de pulso
------------------------------

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
[1N4007]: /datasheet/1N4007.pdf
[ITR9608]: /datasheet/ITR9608.pdf
[pwm-img]: /assets/images/pwm_sparkfun.jpg
[schem-motor-npn-pot]: /schem/motor-npn-pot.svg

[sol-pwd-pot]: ../sol-pwm-pot
[ex-pwm-led]: ../exemplo-pwm-led


[analogWrite]: https://www.arduino.cc/en/Reference/AnalogWrite
[analogRead]: https://www.arduino.cc/en/Reference/AnalogRead

[Tutorial PWM]: https://learn.sparkfun.com/tutorials/pulse-width-modulation

[CC BY-SA 4.0]: https://creativecommons.org/licenses/by-sa/4.0/
