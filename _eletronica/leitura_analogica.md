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
Serial.

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

Teste esse código medindo a tensão em um divisor de tensão com resistores,
como mostrado na figura abaixo. Compare o resultado com a medição pelo
multímetro.

{%
   include figure.html
   file="divisor-tensao.svg"
   caption="Divisor de tensão para medição da tensão na porta analógica."   
%}

Potenciômetro
-------------

Potenciômetros são resistores de três terminais com um terminal móvel.
Sua construção está representada no diagrama da abaixo.
Há uma tira de material resistivo entre os terminais _A_ e _B_,
e sobre ela desliza um terminal móvel conectado ao pino _m_ do
potenciômetro.
Como a resistência de um material é proporcional ao seu comprimento,
a resistência entre os terminais fixos é fixa e a resistência entre os 
terminais fixos e o móvel depende da distância entre eles.

{%
   include figure.html
   file="pot.svg"
   caption="Diagrama da construção de um potenciômetro."
%}

{%
   include figure.html
   file="pot-simb.svg"
   caption="Simbolo de um potenciômetro, mostrando os terminais fixos (A, B)
            e o móvel (m)."
   img_class="width-200px"
%}


Representando a posição do terminal móvel por $$p\in[0,1]$$, onde $$p=0$$
corresponde ao terminal móvel sobre o terminal _A_ e $$p=1$$  correponde
ao terminal móvel sobre o terminal _B_, o potenciômetro equivale ao
circuito da figura abaixo, no qual $$R_{AB}$$ é a resistência 
fixa do material entre os terminais _A_ e _B_.


{%
   include figure.html
   file="pot-circuito.svg"
   caption="Circuito equivalente ao potenciômetro, em função da posição 
            do terminal móvel $$p\in[0,1]$$."
   img_class="width-400px"
%}


Para testar o uso de um potenciômetro, monte o circuito abaixo e teste com o
código de exemplo da seção anterior. A tensão medida pelo Arduino deverá
variar de 0 a 5V.

{%
   include figure.html
   file="potenciometro-a0.svg"
   caption="Montagem com potenciômetro para leitura analógica."   
%}


Atividade
---------

**Comando de um servo pelo potenciômetro.**

Conecte um potenciômetro ao Arduino e comande a posição de um servo de acordo
com a posição do potenciômetro: quando o potenciômetro estiver na posição
central o servo também deverá estar, e o acompanhar em qualquer giro.

[analogRead]: https://www.arduino.cc/en/Reference/AnalogRead
