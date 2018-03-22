---
layout: default
title: Eletrônica -- Entradas analógicas e o uso do potenciômetro
---

{{ page.title }}
================
{:.no_toc}

Nesta prática, ilustraremos o uso das entradas analógicas do Arduino e do
potenciômetro como forma de interação com o usuário.

**Índice:**
* ítem 1
* ítem 2
{:toc}

Leitura analógica
-----------------

O Arduino Uno, utilizado nas práticas, possui 6 entradas analógicas.
Essas entradas funcionam como voltímetros digitais que medem níveis de tensão
entre 0V e 5V.
O conversor analógico/digital do Arduino possui resolução de 10 bits, o que
significa que os valores lidos variam de 0 a 1023 ($$2^{10}$$ valores
possíveis).
A função `analogRead(pino)` retorna a leitura analógica do canal especificado.
Confira a documentação oficial [dessa função][analogRead] para
mais informações.

### Exemplo: Arduino como voltímetro

O código abaixo mostra como transformar o Arduino em um voltímetro com fundo de
escala 5 V. A tensão entre o terra e o pino analógico será impressa na porta
Serial. Teste esse circuito medindo a tensão em um divisor de tensão com
resistores.

```c++
void setup() {
  Serial.begin(230400);
}

void loop() {
  int medida = analogRead(A0);
  
  //medida será um inteiro de 0 a 1023
  //o fator de conversão para volts é 0.0048828125
  
  Serial.print(0.0048828125 * medida); 
  Serial.println(" V");
}
```

Desafios
--------

**Comando do servo pelo potenciômetro.**

Conecte um potenciômetro ao Arduino e comande a posição do servo de acordo
com a posição do potenciômetro: quando o potenciômetro estiver na posição
central o servo também deverá estar, e o acompanhar em qualquer giro.

[analogRead]: https://www.arduino.cc/en/Reference/AnalogRead
