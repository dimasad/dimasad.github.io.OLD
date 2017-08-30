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

As soluções abaixo utilizam uma montagem com o comando do servo no canal 9.

#### Utilizando delayMicroseconds

```
void setup() {
  pinMode(9, OUTPUT);
}

void loop() {
  int ang = 60; // ângulo desejado (no caso, 60 graus)
  int duracao = map(ang, -90, 90, 600, 2400); // Converte para
                                              // duração do pulso.
  digitalWrite(9, HIGH);
  delayMicroseconds(duracao);
  digitalWrite(9, LOW);
  delay(20);
}

```

#### Utilizando micros

```
void setup() {
  pinMode(9, OUTPUT);
}

void loop() {
  int ang = 60; // ângulo desejado (no caso, 60 graus)
  int duracao = map(ang, -90, 90, 600, 2400); // Converte para
                                              // duração do pulso.

  int tciclo = micros() % 20000;
  digitalWrite(9, tciclo < duracao);
}

```

[biblioteca Servo]: https://www.arduino.cc/en/Reference/Servo
