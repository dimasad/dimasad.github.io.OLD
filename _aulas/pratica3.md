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

![pwm img]
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
[página de exemplo][ex pwm led] da modulação por largura de pulso para alterar
o brilho de um led.

#### Acionamento do motor por PWM




[pwm img]: /assets/images/pwm_sparkfun.jpg
[ex pwm led]: /aulas/exemplo-pwm-led

[analogWrite]: https://www.arduino.cc/en/Reference/AnalogWrite

[Tutorial PWM]: https://learn.sparkfun.com/tutorials/pulse-width-modulation

[CC BY-SA 4.0]: https://creativecommons.org/licenses/by-sa/4.0/
