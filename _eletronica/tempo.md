---
layout: default
title: Eletrônica -- Medição de tempo e comando de servos de rádiocontrole
---

{{ page.title }}
================
{:.no_toc}

O Arduino possui funções para medir e contar tempo que tem muitas aplicações
e podem ser utilizadas para comandar vários tipos de dispositivos. Nesta
prática essas funções serão apresentadas e serão utilizadas para o controle
de um servomotor de radiocontrole.

**Índice:**
* ítem 1
* ítem 2
{:toc}

Funções do Arduino
------------------

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
Para entender melhor seu uso dessas, veja a documentação oficial das funções
[millis] e [micros]. Abaixo temos alguns exemplos também. Execute-os e veja
seu funcionamento.

### Exemplo: Arduino como cronômetro

No código abaixo, o tempo atual, como retornado pela função `millis()` é
impresso repetidamente na porta serial.

```
void setup() {
  // Inicia a porta serial
  Serial.begin(230400);
}

void loop() {
  // Imprime o tempo atual na porta serial
  Serial.println(millis());
}
```

Como não há atrasos entre as invocações da função `Serial.println`, o
mesmo tempo pode ser impresso várias vezes na tela.
Uma maneira de se modificar isso é fazer como abaixo, em que a cada segundo
o tempo é impresso.

```
// Valor do último segundo que foi impresso
int ultimo_seg = -1;

void setup() {
  // Inicia a porta serial
  Serial.begin(230400);
}

void loop() {
  // Obtém o tempo (em segundos) desde que Arduino foi ligado
  int seg = millis() / 1000;

  // Testa se o segundo atual já foi impresso
  if (seg != ultimo_seg) {
    Serial.println(seg);

    // Salva o segundo atual como o último que foi impresso
    ultimo_seg = seg;
  }
}
```

### Exemplo: Uso do relógio para piscar um led

Olhando o relógio podemos piscar um LED deixando tempo para o processador
realizar outras funções, o que não é possível quando a função `delay` é
utilizada.
Considere o exemplo abaixo, que usa o LED embutido na placa do Arduino.


```
// O pino do LED que será utilizado no exemplo.
// No arduino UNO a constante LED_BUILTIN é igual a 13.
int pino_led = LED_BUILTIN;

void setup() {
  // Define o pino do led como saída
  pinMode(pino_led, OUTPUT);
}

void loop() {
  // t_ciclo é o resto da divisão inteira de millis() por 1000
  // (operador modulo). Ou seja, se millis for 123456 t_ciclo
  // será igual a 456.
  int t_ciclo = millis() % 1000;

  if (t_ciclo >= 500) {
    digitalWrite(pino_led, HIGH); // Acende o LED
  } else {
    digitalWrite(pino_led, LOW); // Apaga o LED
  }
}
```

O exemplo acima usa a função modulo (operador `%`) para obter o resto da
divisão inteira de um número.
Para mais informações sobre esse operador confira sua
[documentação oficial][mod-doc].
Abaixo temos duas soluções equivalentes para esse problema.
O primeiro exemplo calcula o resto da divisão inteira utilizando a divisão.

```
// O pino do LED que será utilizado no exemplo.
// No arduino UNO a constante LED_BUILTIN é igual a 13.
int pino_led = LED_BUILTIN;

void setup() {
  // Define o pino do led como saída
  pinMode(pino_led, OUTPUT);
}

void loop() {
  // Calcula o resto da divisão inteira utilizando o operador de divisão
  long seg = millis() / 1000; 
  int t_ciclo = millis() - seg*1000;
  
  if (t_ciclo >= 500) {
    digitalWrite(pino_led, HIGH); // Acende o LED
  } else {
    digitalWrite(pino_led, LOW); // Apaga o LED
  }
}
```

O exemplo abaixo usa uma variável global para definir o início de
cada ciclo liga/desliga.

```
// O pino do LED que será utilizado no exemplo.
// No arduino UNO a constante LED_BUILTIN é igual a 13.
int pino_led = LED_BUILTIN;

long t_base = 0;

void setup() {
  // Define o pino do led como saída
  pinMode(pino_led, OUTPUT);
}

void loop() {
  int t_ciclo = millis() - t_base;
  
  if (t_ciclo >= 500) {
    digitalWrite(pino_led, HIGH); // Acende o LED
  } else {
    digitalWrite(pino_led, LOW); // Apaga o LED
  }

  // Inicia o próximo ciclo
  if (t_ciclo >= 1000) {
    t_base += 1000;
  }
}
```

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
servomotores é o [tutorial de servos da Sparkfun].

Desafios
--------

**Posição constante.**
Como primeiro teste, conecte um servo ao Arduino e o comande para uma posição
constante utilizando 3 métodos.
Primeiro, enviando pulsos com a função `delayMicroseconds`.
Depois, enviando  pulsos com a função `micros`.
Por fim, utilizando a [biblioteca Servo].
Altere o valor da posição com cada método e veja se o servo se move como
esperado.

**Varredura com velocidade constante.**
Conecte um servomotor ao Arduino e faça sua posição variar continuamente
de 0 a 180 graus e de volta a 0 graus, com velocidade em torno de
60 graus por segundo.
Tente resolver esse problema utilizando cada um dos três métodos sugeridos
acima.

[delay]: https://www.arduino.cc/en/Reference/Delay
[delayMicroseconds]: https://www.arduino.cc/en/Reference/DelayMicroseconds
[millis]: https://www.arduino.cc/en/Reference/Millis
[micros]: https://www.arduino.cc/en/Reference/Micros
[mod-doc]: https://www.arduino.cc/en/Reference/Modulo

[analogRead]: https://www.arduino.cc/en/Reference/AnalogRead
[attachInterrupt]: https://www.arduino.cc/en/Reference/AttachInterrupt

[biblioteca Servo]: https://www.arduino.cc/en/Reference/Servo
[tutorial Blink]: https://www.arduino.cc/en/Tutorial/Blink

[tutorial de servos da Sparkfun]: https://learn.sparkfun.com/tutorials/hobby-servo-tutorial

[sol-servo1]: ../sol-servo1
[exemplos-relogio]: ../exemplos-relogio