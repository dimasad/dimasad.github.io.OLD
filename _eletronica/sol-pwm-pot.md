---
layout: default
---

Possível solução para o acionamento PWM comandando por potenciômetro
--------------------------------------------------------------------

```
int pino_pwm = 9; // Número do pino do saída PWM
int pino_pot = A0;// Número do pino do potenciômetro

void setup() {
  pinMode(pino_pwm, OUTPUT); // Define o pino do LED como saída
}

void loop() {
  int pos_pot = analogRead(pino_pot);

  // pos_pot varia de 0 a 1023. Dividindo por 4
  // a razao cíclica irá variar de 0 a 255
  int razao_ciclica = pos_pot / 4;

  analogWrite(pino_pwm, razao_ciclica);
}
```