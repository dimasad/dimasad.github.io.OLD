---
layout: default
title: Eletrônica -- Familiarização com o Laboratório
---

Eletrônica -- Familiarização com o Laboratório
==============================================
{:.no_toc}

As práticas iniciais de eletrônica consistem em vários procedimentos guiados
para explorar funções do Arduino e o uso de dispositivos. Após as explicações
e procedimentos há alguns desafios (com múltipas soluções possíveis) para
exercitar
o conteúdo abordado. Caso haja dificuldade não exitem em chamar o professor.

**Procedimentos:**
* Procedimento x
* Procedimento y
{:toc}

Primeiros Passos com Arduino
----------------------------

Este procedimento mostra os primeiros passos e alguns exemplos simples de
como carregar um programa no Arduino e usar a comunicação serial para
monitorar seu funcionamento.

**O que é um Arduino?**
Arduino é uma plataforma de hardware e software livre para prototipagem e 
desenvolvimento de projetos eletrônicos.
É desenvolvida em torno de um microcontrolador [ATmega328P], um processador
programável com interfaces para conectar com dispositivos, sensores e circuitos
de diversos tipos.
O _firmware_ do microcontrolador é atualizado através da porta USB,
que também pode ser usada para alimentar o circuito.
O Arduino Uno, modelo utilizado nas práticas, pode ser visto na 
Figura abaixo.

{%
   include figure.html
   file="arduino_uno.png"
   caption="Um Arduino Uno. 
            Fonte: [learn.sparkfun.com], licença Creative
            Commons Attribution Share-Alike."
%}

**Como se programa o Arduino?**
O Arduino é programado na linguagem C++, podendo também ser programado em C
ou diretamente em linguagem de máquina.
O aplicativo Arduino IDE é um ambiente de desenvolvimento integrado que pode ser
utilizado para escrever o código, carregar os programas e monitorar sua 
execução.
No computador do laboratório haverá um atalho para execução da IDE na
área de trabalho ou no menu iniciar.

A tela de início da IDE está mostrada na figura abaixo.
Ela possui o esqueleto de um programa vazio.
O código que estiver no corpo da função `setup` será executado
uma vez, quando a placa for energizada, para configurar a placa e inicializar
o programa.
O código que estiver no corpo da função `loop` será executado 
repetidamente até a placa ser desenergizada; esse código contém a lógica de
execução da placa.
Todo o texto que estiver depois dos caracteres `//` são comentários do código.

{%
   include figure.html
   file="arduino_ide_windows_comentado.svg"
   caption="IDE do Arduino e alguns de seus elementos importantes."
%}

**Exemplo de comunicação com o Arduino.**
Abaixo temos um código simples que mostra o uso da porta serial
do Arduino, uma interface básica de comunicação com o computador ou outros
dispositivos.
Antes de utilizá-la, é necessário chamar a função `Serial.begin`
para inicializá-la e definir a taxa de transmissão de dados (_baud rate_).
Essa inicialização geralmente é feita na função `setup`.
Uma vez inicializada, a função `Serial.println` pode ser chamada
para imprimir um texto ou variável seguido por uma quebra de linha.

```
void setup() {
  Serial.begin(230400); // Inicializa a porta Serial
  Serial.println("Hello World"); // Imprime um texto
}

void loop() {
  // Não faz nada no resto do programa
}
```

**Carregando o código no Arduino.**
Para carregar o programa, conecte o Arduino no computador com o cabo USB
e selecione a porta em que o dispositivo está conectado no menu
_Tools $$\to$$ Serial Port $$\to$$ COMx (Arduino Uno)_.
Geralmente o Arduino aparece como porta COM5, mas às vezes pode ser reconhecido
com outro número.
Digite então o código listado acima na IDE e carregue no Arduino com
opção do menu _File $$\to$$ Upload_ ou com o atalho `Ctrl+U`.

**Monitorando a porta serial.**
Os dados enviados pelo Arduino com a função `Serial.println` podem, ser vistos
com o monitor serial, disponível no menu _Tools $$\to$$ Serial Monitor_.
O _baud rate_ da porta deve ser escolhido com o mesmo valor utilizado
na função `Serial.begin`, como mostrado na figura abaixo,
ou os caracteres não serão interpretados
corretamente.
Quando o monitor serial é aberto, o microcontrolador é reiniciado e a função 
`setup` invocada.
Se tudo ocorreu corretamente, o texto "Hello World" deverá ser recebido.

{%
   include figure.html
   file="serial_monitor_comentado.svg"
   caption="Monitor serial do Arduino."
%}

**Executando um programa um pouco mais complexo.**
Carregue o código abaixo no Arduino.

```
int i = 0; // Define uma variável global

void setup() {
  Serial.begin(230400); // Inicializa a porta Serial
  Serial.println("Hello world"); // Imprime um texto
}

void loop() {
  Serial.print("O valor de i = ");  // Imprime um texto
  Serial.println(i); // Imprime o valor da variável
  i = i + 1; // Incrementa a variável

  delay(250); // Pausa a execucao por 250ms
}
```

No início do código, uma variável global do tipo `int` (número inteiro) é
declarada.
Na função `setup`, a porta serial é inicializada e 
o texto "Hello World" é enviado.
Em seguida, na função `loop`, o valor da variável é impresso,
incrementado, e a execução do programa pausada por 250 ms até 
a função ser re-executada novamente.
Carregue o código e observe sua saída com o monitor serial.


Acionamento de um LED
---------------------

Neste procedimento, será mostrado como fazer uma montagem no protoboard
para acionamento de um LED.
Em um primeiro momento, o LED será ligado diretamente á fonte e, posteriormente,
será acionado programaticamente com uma saída digital do Arduino.

**O que é um protoboard?**
Protoboards, também denominados matrizes de contato, são placas para a
construção de protótipos de circuitos eletrônicos.
São compostos de uma placa com orifícios sobre faixas de condutores metálicos,
como mostrado na figura abaixo.
Dessa forma, os terminais sobre a mesma faixa de condutores estão todos 
conectados eletricamente, sem a necessidade de solda.
As trilhas verticais nas bordas da placa, marcadas com linhas contínuas 
vermelhas e azuis, são geralmente utilizadas para os terminais da fonte de
alimentação.

{%
   include figure.html
   file="protoboard.jpg"
   caption="Um protoboard e sua matriz interna de contatos.
            Fonte: [learn.sparkfun.com], licença Creative
            Commons Attribution Share-Alike."
%}

**LEDs.**
Os diodos emissores de luz (_light-emitting diode_, LED) são dispositivos
semicondutores que convertem energia elétrica em energia luminosa com alta
eficiência.
Os LEDs possuem polaridade, caso seja conectado ao circuito com seus
terminais invertidos ele não acenderá.
Os terminais do LED podem ser identificados como mostrado na figura abaixo.
O pino do catodo é mais curto e marcado por um chanfro no encapsulamento
do componente, que pode ser identificado na vista superior do dispositivo.
Os terminais também podem ser identificados com a função de teste de diodo do
multímetro.

{%
   include figure.html
   file="led.svg"
   img_class="max-width-200px"
   caption="Como identificar os terminais de um LED.
            
            Fonte: [commons.wikimedia.org], imagem liberada em domínio público."
%}


**Identificando resistores.**
Para acionar um LED também é necessário o uso de um resistor.
O valor da resistência de resistores de furo passante é indicado com o código
de cores mostrado na figura abaixo, no qual cada cor equivale a um dígito.
As duas primeiras faixas indicam os algarismos significativos da resistência,
a terceira faixa indica a um multiplicador e a quarta indica a faixa de
tolerância do valor.

{%
   include figure.html
   file="codigo_de_cores_resistores.png"
   caption="Código de cores para identificação da resistência de resistores.
            Fonte: [www.digikey.com]."
%}

### Diretamente na fonte

O diagrama do circuito e uma possível maneira de montá-lo no protoboard
estão representados na figura abaixo.
O Arduino será utilizado como fonte de tensão.
Para iniciar, separe os seguintes materiais:

* um resistor de 180Ω,
* um LED,
* um protoboard,
* um Arduino,
* fios para montagem.

{%
   include figure.html
   file="led_direto_fonte.png"
   caption="Diagrama esquemático do circuito para acionamento do LED direto
            com a fonte e um exemplo de como montá-lo no protoboard."
%}

Monte o circuito  e conecte o Arduino na porta USB do computador.
O LED deverá acender.

### Com uma Saída Digital

O comportamento dos pinos do Arduino pode ser definido e controlado por
software.
Quando um pino é configurado como saída digital, ele se torna uma fonte de
tensão que pode assumir dois valores: nívelo lógico baixo (0V) ou 
alto (5V).
Neste procedimento, vamos utilizar uma saída digital do Arduino para acionar
o LED.

**Funções para uso das saídas digitais.**
Para configurar o pino como saída, a função `pinMode` deve ser utilizada.
Geralmente essa configuração é feita na função `setup`, que é executada
toda vez que o dispositivo é ligado.
O nível de tensão do pino é então definido com a função `digitalWrite`.
Abaixo temos um código que exemplifica o uso das saídas digitais.

**Montagem.**
Para testar esse código, monte o circuito representado na 
figura abaixo, que é acionado pela saída digital do Arduino.
Quando a saída estiver em nível lógico alto, o LED irá acender.
Quando estiver em nível lógico baixo, o LED irá apagar.
Carregue o código no Arduino e observe seu funcionamento.
Altere os tempos que o LED permanece ligado e desligado e veja como o circuito
responde.

```
void setup() {
  pinMode(10, OUTPUT); // Define o pino digital 10 como saída
}

void loop() {
  digitalWrite(10, HIGH); // Define a tensão do pino 10 em 5V
  delay(100);  // Aguarda 100ms

  digitalWrite(10, LOW); // Define a tensão do pino 10 em 0V
  delay(900); // Aguarda 900ms
}
```

{%
   include figure.html
   file="led_porta_digital.png"
   caption="Montagem para acionamento do LED com uma saída digital do Arduino."
%}

Utilizando um laço _for_, na mesma montagem, podemos fazer o LED 
piscar várias vezes.
A sintaxe desse comando na linguagem C pode ser vista no código abaixo.
O código que será executado no corpo do `for` é delimitado por
chaves `{}`.
Carregue o código no Arduino, veja seu funcionamento, e veja como alterá-lo
para mudar seu comportamento.


```
void setup() {
  pinMode(10, OUTPUT); // Define o pino digital 10 como saída
}

void loop() {
  // A variavel inteira i ira começar de 0 e incrementar de 1
  // enquanto for menor que 5
  for (int i=0; i<5; i=i+1) {
      digitalWrite(10, HIGH); // Acende o LED
      delay(100);  // Aguarda 100ms

      digitalWrite(10, LOW); // Apaga o LED
      delay(100);  // Aguarda 100ms
  }
  
  delay(1000); // Aguarda 1s
}
```

[arduino_uno]: /assets/images/arduino_uno.png
[ATmega328P]: http://www.microchip.com/wwwproducts/en/ATmega328p
[commons.wikimedia.org]: http://commons.wikimedia.org
[www.digikey.com]: http://www.digikey.com
[learn.sparkfun.com]: http://learn.sparkfun.com/
