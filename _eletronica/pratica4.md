---
layout: default
title: Eletrônica -- Prática 4
---

{{ page.title }}
================
{:.no_toc}

#### Sensores de proximidade
{:.no_toc}

O objetivo desta prática é usar alguns sensores de proximidade com o Arduino.
Serão utilizados o TCRT5000, um sensor infravermelho reflexivo e o HC-SR04,
um sensor de distância ultrassônico (ecotelêmetro).

**Tópicos:**
* Procedimento x
* Procedimento y
{:toc}


Sensor infravermelho
--------------------

O sensor TCRT5000 consiste de um par de LED e fototransistor infravermelho,
como pode ser visto no [seu datatasheet][TCRT5000]. Um fototransistor é como
um transistor bipolar no qual a luz detectada age como a corrente de base.
No escuro não há corrente de coletor, o transistor opera como circuito aberto.
Quando há luz suficiente, o transistor satura e a tensão coletor--emissor cai,
o transistor opera como chave fechada.

No TCRT5000, o receptor e emissor óptico estão posicionados para detectar a luz
que reflete de objetos próximos. Alguns outros dispositivos semelhantes, como o
[ITR9608], tem os dispositivos orientados como interruptores ópticos, para
detectar objetos que bloqueiam a luz entre o LED e fotodiodo.

Abaixo temos o diagrama do circuito para utilizar esse sensor. O LED é acionado 
continuamente e a tensão no coletor do fototransistor é medida pela entrada 
analógica A0. Quando a luz não é detectada pelo fototransistor ele opera 
no modo de corte, como chave aberta, e a tensão na entrada analógica é próxima 
de 5V. Quando o fototransistor recebe luz suficiente, ele opera no modo de
saturação, como chave fechada, e a tensão na entrada analógica é próxima de 0V.
Para intensidades luminosas intermediárias, a tensão fica entre esses dois
extremos, pois o transistor opera no modo ativo com a corrente de coletor 
proporcional à luz detectada.

{%
   include figure.html
   file="optical-int.svg"
   caption="Circuito para utilização dos sensores ópticos [TCRT5000] ou
            [ITR9608]."
%}

Monte esse circuito com o protoboard e Arduino e faça as atividades abaixo.

> ### Teste do sensor
>
> O primeiro teste consiste em fazer a medição analógica do sensor e observar 
> os níveis de tensão quando há e quando não há luz.
>
> **Dica:** Lembre de configurar a porta serial com a função `Serial.begin`.


> ### Detecção de um objeto
>
> Na placa do Arduino, existe um LED conectado ao pino digital 13. Para o
> segundo teste, programe o Arduino para acionar o LED quando um objeto for
> detectado.

> ### Contagem de objetos
>
> Faça um código que conte o número de objetos detectados e imprima na porta
> serial. Lembre que há ruído nas medições do sensor. Tente fazer com que o
> mesmo objeto não seja contabilizado várias vezes quando estiver parado 
> próximo ao limiar de detecção do sensor.
>
> **Dica:** Faça um comparador com histerese em software para detectar o 
> objeto.

Sensor ultrassônico
-------------------

O funcionamento do sensor ultrassônico HC-SR04 é detalhado no 
[seu datasheet][HC-SR04]. Ele possui 4 pinos:
-  VCC, a alimentação do dispositivo, que deve ser ligado no pontencial de 5V;
- GND, o terminal negativo da alimentação;
- Trig, o disparo dos pulsos ultrassônico;
- Echo, a saída do dispositivo que indica o retorno do pulso no sensor.

Quando um pulso elétrico de aproximadamente 10µs é enviado pelo Arduino ao pino
trigger, o HC-SR04 envia uma sequência de 8 pulsos ultrassônicos e coloca
o pino Echo em nível lógico alto. Quando os pulsos são detectados de volta no
sensor, o pino Echo é trazido de volta ao nível lógico baixo. A duração do
pulso, junto com a velocidade do som no ar, podem então ser utilizados para
calcular a distância do sensor ao objeto identificado.

Durações muito longas do pulso no pino Echo podem indicar que nenhum objeto foi
identificado. Esse sensor não detecta confiavelmente distâncias acima de 2 
metros. Para medição da duração do pulso, use a função [micros], que retorna
o tempo em microssegundos desde que o Arduino foi ligado.

Monte esse sensor no Arduino e faça a atividade abaixo.

> ### Atividade
>
> Imprima na porta serial se foi detectado um objeto e a distância até ele.


[micros]: https://www.arduino.cc/en/Reference/Micros
[ITR9608]: /datasheet/ITR9608.pdf
[TCRT5000]: /datasheet/TCRT5000.pdf
[HC-SR04]: /datasheet/HCSR04.pdf
