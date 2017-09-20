---
layout: default
---

Uso de interrupções no Arduino
==============================

#### Exemplo: detecção de um evento com interrupções

```
void evento() {
  Serial.println("Evento!");
}

void setup() {
  Serial.begin(230400);
  attachInterrupt(digitalPinToInterrupt(2), evento, RISING);
}

void loop() {
}

```

#### Exemplo: contagem de eventos de um botão

```
int num_evt = 0;

void evento() {
  num_evt++;
}

void setup() {
  Serial.begin(230400);
  attachInterrupt(digitalPinToInterrupt(2), evento, RISING);
}

void loop() {
  noInterrupts(); // Desabilita interrupções
  int num_evt_copia = num_evt;
  interrupts();  // Reabilita interrupções
  
  Serial.println(num_evt_copia);
  delay(100);
}
```


#### Exemplo: contagem de eventos de um botão com anti-repique

```
int num_evt = 0;
long millis_ultimo_evt = 0;

void evento() {
  if (millis() - millis_ultimo_evt > 5)
    num_evt++;
  
  millis_ultimo_evt = millis();
}

void setup() {
  Serial.begin(230400);
  attachInterrupt(digitalPinToInterrupt(2), evento, RISING);
}

void loop() {
  noInterrupts(); // Desabilita interrupções
  int num_evt_copia = num_evt;
  interrupts();  // Reabilita interrupções
  
  Serial.println(num_evt_copia);
  delay(100);
}
```
