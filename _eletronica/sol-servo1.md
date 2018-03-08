---
layout: default
---

Possíveis soluções para o comando do servo em posição constante
---------------------------------------------------------------

O desafio está abaixo.

> Como primeiro teste, conecte um servo ao Arduino e o comande para uma posição
> constante utilizando 3 métodos.
> Primeiro, enviando pulsos com a função `delayMicroseconds`.
> Depois, enviando  pulsos com a função `micros`.
> Por fim, utilizando a [biblioteca Servo].
> Altere o valor da posição com cada método e veja se o servo se move como
> esperado.

As soluções utilizam uma montagem com o comando do servo no canal 9,
como mostrado na figura abaixo.

![protoboard-servo-arduino]

Para simplificar a conversão de ângulo para duração do pulso a função [map]
foi utilizada.
Essa função realiza uma conversão linear semelhante à regra de três.
Confira sua documentação para maiores detalhes.

### Utilizando delayMicroseconds

Essa solução utiliza a função `delayMicroseconds()` de maneira semelhante
à temporização do LED da prática 1.

```
void setup() {
  pinMode(9, OUTPUT);
}

void loop() {
  int ang = 60; // ângulo desejado (no caso, 60 graus)
  int duracao = map(ang, 0, 180, 600, 2400); // Converte para
                                              // duração do pulso.
  digitalWrite(9, HIGH);
  delayMicroseconds(duracao);
  digitalWrite(9, LOW);
  delay(20);
}

```

### Utilizando micros

Nessa solução, o operador `%` ([modulo]) é utilizado para se obter o tempo
desde o ínicio de cada ciclo.
Esse operador retorna o resto da divisão inteira com um número.

```
void setup() {
  pinMode(9, OUTPUT);
}

void loop() {
  int ang = 60; // ângulo desejado (no caso, 60 graus)
  int duracao = map(ang, 0, 180, 600, 2400); // Converte para
                                              // duração do pulso.

  int tciclo = micros() % 20000;
  digitalWrite(9, tciclo < duracao);
}

```


### Utilizando a biblioteca Servo

```
// Carrega a biblioteca servo
#include <Servo.h> 

// Declara um objeto servo
Servo servo1; 

void setup() {
  // Configura o pino 9 para controle do servo1
  servo1.attach(9);
}

void loop() {
  int ang = 60; // ângulo desejado (no caso, 60 graus)
  servo1.write(ang); // Comanda o servo para o ângulo desejado
}

```


[map]: https://www.arduino.cc/en/Reference/Map
[modulo]: https://www.arduino.cc/en/Reference/Modulo
[biblioteca Servo]: https://www.arduino.cc/en/Reference/Servo

[protoboard-servo-arduino]: ../protoboard-servo-arduino.png