---
layout: default
title: Eletrônica -- Servo
---

{{ page.title }}
================
{:.no_toc}

**Tópicos:**
* Procedimento x
* Procedimento y
{:toc}

Servomotor de radiocontrole
---------------------------

Servomotores são sistemas controlados com motores que permitem comandar a
posição do eixo de saída.
Servomotores de radiocontrole são utilizados para comando remoto de veículos
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
servomotores é o [tutorial de servos da Sparkfun][tut-servo].

### Procedimento: Comando de um Servo

Abaixo temos um código de exemplo para comando de um servomotor de 
radiocontrole utilizando a biblioteca Servo do Arduino. Nesse exemplo,
o servo é comandado entre três posições: 0, 90 e 180 graus.

```c++

// Inclui a biblioteca ao programa
#include <Servo.h> 

// Declara um objeto servo. Até 6 servos podem ser criados
Servo servo1; 

void setup() {
  servo1.attach(9);  // Define o pino 9 para o comando do servo
}

void loop() {
  servo1.write(0); // Manda para posição 0 graus
  delay(500); // Aguarda meio segundo

  servo1.write(90);
  delay(500);

  servo1.write(180);
  delay(500);

  servo1.write(90);
  delay(500);
}
```

Para executar esse exemplo, o terminal vermelho do servo deve ser conectado
ao 5V, o terminal marrom ou preto ao terra e o terminal laranja ou branco
ao pino digital 9 do Arduino, como mostrado na figura abaixo.

{%
   include figure.html
   file="montagem_servo_protoboard.png"
   caption="Montagem para comando de um servo com o Arduino.
            Fonte: [arduino.cc][servo-sweep], 
            licença Creative Commons Attribution Share-Alike."
%}

> ### Atividade: Comando do servo com potenciômetro
>
> Comande a posição do servo com um potenciômetro. Para o terminal móvel do
> potenciômetro em cada um dos extremos a haste do servo deverá estar nos seus
> extremos. Nas posições intermediárias a haste estará em uma posição
> proporcional à do potenciômetro.
> 
> **Dica:** Utilize a função [map].

> ### Atividade: Movimento constante do servo
>
> De maneira semelhante ao procedimento do LED, faça o servo ir com velocidade
> constante de 0 a 180 graus e depois de volta a 0 graus, repetidamente.

[analogRead]: https://www.arduino.cc/reference/pt/language/functions/analog-io/analogread/
[analogWrite]: https://www.arduino.cc/reference/pt/language/functions/analog-io/analogwrite/
[CC0 1.0]: https://creativecommons.org/publicdomain/zero/1.0/deed.pt
[CC BY-SA 4.0]: https://creativecommons.org/licenses/by-sa/4.0/
[map]: https://www.arduino.cc/reference/pt/language/functions/math/map/
[pot-src]: https://commons.wikimedia.org/wiki/File:Single-turn_potentiometer_with_internals_exposed,_oblique_view.jpg
[servo-sweep]: https://www.arduino.cc/en/Tutorial/Sweep
[tut-servo]: https://learn.sparkfun.com/tutorials/hobby-servo-tutorial

[Tutorial PWM]: https://learn.sparkfun.com/tutorials/pulse-width-modulation
[Tinkercad]: https://www.tinkercad.com/
[QE Protoboard]: https://youtu.be/8OzfA0GQt-c
[QE Portas]: https://youtu.be/tkKIsG-aIzA
[Potenciômetro aberto]: https://youtu.be/ZRAZAWDDxRk
[Potentiometer inside]: https://youtu.be/PDfnQIAnXpo
