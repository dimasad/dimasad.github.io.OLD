---
layout: default
title: Eletrônica -- Familiarização com o Laboratório
---

Eletrônica -- Familiarização com o Laboratório
==============================================
{:.no_toc}

As práticas iniciais de eletrônica consistem em vários procedimentos guiados
para explorar funções do Arduino ou o uso de dispositivos. Após as explicações
e procedimentos há desafios (com múltipas soluções possíveis) para exercitar
o conteúdo abordado. Caso haja dificuldade não exitem em chamar o professor.

**Procedimentos:**
* Procedimento x
{:toc}

Hello World com Arduino
-----------------------

**O que é um Arduino?**
Arduino é uma plataforma de hardware e software livre para prototipagem e 
desenvolvimento de projetos eletrônicos.
É desenvolvida em torno de um microcontrolador ATmega328P, um processador
programável com interfaces para conectar com dispositivos, sensores e circuitos
de diversos tipos.
O _firmware_ do microcontrolador é atualizado através da porta USB,
que também serve para alimentar o circuito.
O Arduino Uno, modelo utilizado nas práticas, pode ser visto na 
Figura abaixo.

{%
   include figure.html
   file="arduino_uno.png"
   caption="Um Arduino Uno. 
            Fonte: [learn.sparkfun.com](learn.sparkfun.com), licença Creative
            Commons Attribution Share-Alike."
%}

**Como se programa o Arduino?**
O Arduino é programado na linguagem C++, podendo também ser programado em C
ou diretamente em linguagem de máquina.
O aplicativo Arduino IDE é um ambiente de desenvolvimento integrado que pode ser
utilizado para escrever o código, carregar os programas e monitorar sua 
execução.
No computador do laboratório, deve haver um atalho para sua execução na
área de trabalho ou no menu iniciar.

A tela de início da IDE está mostrada na figura abaixo.
Ela possui o esqueleto de um programa vazio.
O código que estiver no corpo da função `setup` será executado
uma vez, quando a placa for energizada, para configurar a placa e inicializar
o programa.
O código que estiver no corpo da função `loop` será executado 
repetidamente até a placa ser desenergizada; esse código contém a lógica de
execução da placa.
Todo o texto que estiver depois dos caracteres `//` será considerado
como comentário do código.

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
}
```

**Carregando o código no Arduino.**
Para carregar o programa, conecte o Arduino com o cabo USB e selecione a
porta em que o dispositivo está conectado no menu
_Tools $$\to$$ Serial Port $$\to$$ COMx (Arduino Uno)_.
Geralmente o Arduino aparece como porta COM5, mas às vezes pode ser reconhecido
com outro número.
Digite então o código listado acima na IDE e carregue no Arduino com
opção do menu _File $$\to$$ Upload_ ou com o atalho `Ctrl+U`.

**Monitorando a porta serial.**
A saída do Arduino pode ser vista no monitor serial, disponível no
menu _Tools $$\to$$ Serial Monitor_.
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
Digite, em seguida o código abaixo na IDE do Arduino.

```
int i = 0; // Define uma variavel global

void setup() {
  Serial.begin(230400); // Inicializa a porta Serial
  Serial.println("Hello world"); // Imprime um texto
}

void loop() {
  Serial.print("O valor de i = ");  // Imprime um texto
  Serial.println(i); // Imprime o valor da variavel
  i = i + 1; // Incrementa a variavel

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

### Diretamente na fonte

### Com uma Saída Digital


[arduino_uno]: /assets/images/arduino_uno.png
[learn.sparkfun.com]: http://learn.sparkfun.com/