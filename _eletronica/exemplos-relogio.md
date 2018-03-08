---
layout: default
title: Exemplos do uso das funções millis e micros
---

Exemplos do uso das funções millis e micros
===========================================

As funções `millis()` e `micros()` mostram o tempo decorrido desde que o
processador foi iniciado em milissegundos e microssegundos, respectivamente.
Seu uso mais simples é fazer do Arduino um cronômetro, como mostrado abaixo.

### Arduino como cronômetro

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

### Uso do relógio para piscar um led

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


[mod-doc]: https://www.arduino.cc/en/Reference/Modulo