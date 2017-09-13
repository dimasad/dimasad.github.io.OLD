---
layout: default
---

Exemplo: modulação por largura de pulso para alterar o brilho de um led
=======================================================================


Este exemplo utiliza o circuito representado no diagrama esquemático abaixo.
O circuito de um LED é alimentado pela saída digital número 9 do Arduino.
Quando a razão cíclica da onda PWM no pino 9 for 0% o LED irá apagar e quando
for 100% o LED estará no brilho máximo.

![schem-pwm-led]

O código altera a razão cíclica periodicamente de 0 a 100% e de volta a 0%.

```
int pino_led = 9; // Número do pino do LED

void setup() {
  pinMode(pino_led, OUTPUT); // Define o pino do LED como saída
}

void loop() {
  for (int rc=0; rc<255; rc++) {
    analogWrite(pino_led, rc);
    delay(10);
  }

  for (int rc=255; rc>0; rc--) {
    analogWrite(pino_led, rc);
    delay(10);
  }
}
```


[schem-pwm-led]: /schem/pwm-led.svg
