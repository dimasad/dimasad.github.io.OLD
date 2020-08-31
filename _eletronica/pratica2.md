---
layout: default
title: Eletrônica -- Prática 2
---

{{ page.title }}
================
{:.no_toc}

#### Leitura analógica, Potenciômetro, Modelo do LED e PWM
{:.no_toc}

Nesta prática, continuaremos abordando as funcionalidades básicas do Arduino e
dispositivos comumente utilizados em projetos de eletrônica. Vamos começar com
um texto apresentando a construção, modelo, e uso do pontenciômetro, que vai
ser nosso dispositivo para enviar comandos de ajuste ao Arduino. Em seguida,
eu explico o que é leitura analógica e como utilizar no Arduino. Esses dois
assuntos são demonstrados com uma montagem de teste para vocês fazerem em casa,
utilizando os componentes ou o ambiente de simulação do [Tinkercad].

Em seguida, usamos as entradas analógicas para comparar o comportamento do LED
com os modelos aproximados que a gente usa para projetar e analisar circuitos
com diodos. Há uma atividade para escolher o resistor para acionamento de um
LED, e em seguida utilizamos as entradas analógicas para comparar o 
comportamento do LED no circuito com o esperado pelo modelo.

A prática termina com uma explicação da modulação por largura de pulso, que
é a técnica utilizada para emular saídas analógicas com saídas digitais.
Há uma demonstração do uso do PWM para variação contínua da intensidade de um
LED e a prática termina com uma atividade simples para juntar todos esses 
elementos: a utilização do potenciômetro para comandar a intensidade do LED.

Para fazer essa prática, será necessário utilizar um protoboard. Se você não
lembra o que é ou como usar um protoboard, veja o roteiro da prática anterior
ou [este vídeo][QE Protoboard] do Vinícius Alves.

**Tópicos:**
* Procedimento x
* Procedimento y
{:toc}

Potenciômetro
-------------

Potenciômetros são resistores de três terminais com um terminal móvel.
Esses dispositivos são muito utilizados em eletrônica como uma entrada contínua
do usuário ou algum ajuste como tensão, volume ou brilho.

A construção de um potenciômetro está representada no diagrama da abaixo.
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

Um potenciômetro sem a cobertura externa pode ser visto na figura abaixo.
Em primeiro plano temos o terminal móvel fazendo contato com a tira de material
resistivo. Ao fundo temos os três terminais do dispositivo. Para ver melhor
o que há dentro de um potenciômetro, você pode abrir ele e sacrificá-lo, em
nome da ciência, ou ver outra pessoa fazendo isso 
[neste vídeo][Potenciômetro aberto] ou [este outro][Potentiometer inside]
que é um pouco melhor produzido, mas em inglês.

{%
   include figure.html
   file="single-turn_potentiometer_with_internals_exposed_oblique_view.jpg"
   caption="Um potenciômetro sem a cobertura externa.
            Fonte: [Wikimedia Commons][pot-src], licença Creative Commons 
            [CC0 1.0] Universal -- Dedicação ao Domínio Público."
   img_style="width: 60%"
%}

Abaixo temos o símbolo do potenciômetro em diagramas de circuito.

{%
   include figure.html
   file="pot-simb.svg"
   caption="Simbolo de um potenciômetro, mostrando os terminais fixos (A, B)
            e o móvel (m)."
   img_class="width-200px"
%}

Existem 2 tipos principais de potenciômetros: o linear e o logarítmico.
O logarítmico geralmente é usado em aplicações analógicas de áudio, pois
a percepção humana de quase todos os estímulos segue escala logarítmica,
o que é conhecido como a [Lei de Weber-Fechner].
O comportamento do potenciômetro linear, que é o mais comum em circuitos
de uso geral, pode ser modelado de uma maneira bem simples.
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

Na aplicação mais comum com o Arduino, os terminais fixos do potenciômetro são
ligados entre o terra e o 5V. Além disso, o terminal móvel é conectado a algum
circuito de medição com alta resistência de entrada, de forma que a corrente
por ele seja desprezível. Dessa forma, a tensão no terminal móvel é
proporcional à sua posição:

$$
  V_m = p \cdot 5V.
$$

#### Aplicações aeronáuticas

O funcionamento simples do potenciômetro como divisor de tensão tem uma
aplicação interessante: medição de posição ou ângulo. Um desses dispositivos
que muitos já utilizaram é servomotor de aeromodelo. O eixo do servo é um
potenciômetro bem parecido com o da prática, e a tensão é proporcional ao
ângulo de rotação. Quando ligado
a um circuito de controle, essa medida define o acionamento de um motor de
corrente contínua que atua em uma caixa de engrenagens conectada ao eixo,
fechando a malha. O potenciômetro e os outros componentes de um pequeno servo
podem ser vistos na figura abaixo, obtida do [tutorial de servos][tut-servo]
da Sparkfun.

{%
   include figure.html
   file="sparkfun_servo_guts.jpg"
   caption="O interior de um servo sacrificado em nome da ciência.
            O potenciômetro é o dispositivo da direita, de três terminais,
            conectados nos fios preto, vermelho e branco.
            Fonte: [Sparkfun][tut-servo], licença [CC BY-SA 4.0]."
   img_style="width: 60%"
%}

Mesmo em aeronaves tripuladas, potenciômetros são sensores simples para medição
das deflexões de superfícies de comando em ensaios em voo. Nos ensaios em voo
do ACS-100 Sora, [do qual participei][ens sora] para realização do meu TCC,
utilizamos potenciômetros de deslocamento linear para medição das deflexões do
manche e da manete de potência. Apesar de maiores e um pouco mais caros que
os potenciômetros pequenos utilizados nesta prática, seu funcionamento e 
princípio de operação são idênticos. Na figura abaixo temos os potenciômetros 
instalados no avião, e eu ainda como aluno em um dos voos da campanha.

{%
   include figure.html
   file="colagem-ensaio.jpg"
   caption="Potenciômetros usados na campanha de ensaios em voo do ACS-100 Sora,
   realizada pelo Centro de Estudos Aeronáuticos da UFMG. Em sentido horário,
   a partir do canto superior direito: potenciômetros na cadeia de comando da
   aeronave para medição do comando de profundor; do pedal de leme; e da posição
   da manete de potência. Os potenciômetros estão indicados com uma linha rosa.
   No canto superior esquerdo: eu sem bigode, ainda como aluno e não professor,
   feliz de estar voando no avião do meu TCC e ao mesmo tempo apreensivo porque
   estava voando no avião do meu TCC."
%}

Conversão analógico-digital
---------------------------

Processadores digitais como o Arduino representam toda a informação disponível
na forma de números inteiros. A combinação de números inteiros em estruturas
de dados mais complexas permite, por exemplo, a representação de frações 
(como números de ponto fixo) ou de números em notação científica (chamados de
ponto flutante). No entanto, grandezas contínuas no mundo real devem ser 
convertidas para números inteiros para representação e manipulação no
processador. O dispositivo que faz isso é o conversor analógico-digital,
às vezes abreviado como conversor A/D ou ADC).

O ADC converte uma tensão contínua para um número inteiro, e é parte integral
de qualquer sistema de sensoriamento ou instrumentação digital. O conversor
do Arduino é de uso geral e funciona como um voltímetro digital que mede níveis
de tensão entre 0V e 5V, em relação ao potencial terra da placa. O conversor
analógico/digital do Arduino possui resolução de 10 bits, o que significa que
os valores lidos variam de 0 a 1023 ($$2^{10}$$ valores possíveis). A função
`analogRead(pino)` retorna a leitura analógica do canal especificado.
Confira a documentação oficial [dessa função][analogRead] para
mais informações. [Este vídeo][QE Portas] do Vinícius Alves também apresenta
o funcionamento básico das portas analógicas e a diferença entre sinais 
analógicos e digitais.

> Montagem: Arduino como voltímetro
> ---------------------------------
> 
> Vamos então fazer uma montagem (ou simulação) simples para explorar o uso
> do potenciômetro como divisor de tensão e da conversão analógico-digital:
> utilizar o Arduino como voltímetro. Este é, inclusive, um dos exemplos
> Básicos do Arduino, cujo código vem junto com a IDE e pode ser acessado
> através do menu _Arquivo_ $$\to$$ _Exemplos_ $$\to$$ _01.Basics_
> $$\to$$ _[AnalogReadSerial]_. Este procedimento mostra como utilizar
> elementos que são importantes para as outras atividades da prática.
>
> Para começar, monte no protoboard o circuito mostrado na figura abaixo, onde
> um potenciômetro tem seus terminais fixos ligados à alimentação e o terminal
> móvel (que no Tinkercad é chamado de _limpador_ devido a uma falha de 
> tradução automática) conectado na entrada analógica _A0_. A tensão no ADC
> será proporcional à posição do potenciômetro.
>
> <figure>
>   <img src="/assets/images/potenciometro-a0.svg" class="figure-img" />
>   <figcaption class="figure-caption" markdown="span">
>     Montagem com potenciômetro para leitura analógica.
>   </figcaption>
> </figure>
>
> Este circuito pode ser testado com o código abaixo, cuja lógica é explicada
> nos comentários. Os dados coletados podem ser visualizados com o 
> _Monitor Serial_ ou _Plotter Serial_, como mostrado nas figuras abaixo,
> onde eu estava girando o potenciômetro para teste. Carregue o programa no
> Arduino (real ou simulado), varie a posição do potenciômetro e veja seu 
> funcionamento. Para carregar o código no Tinkercad, escolha o formato de
> texto (o default é uma programação simplificada em blocos). Observe também
> que para utilizar o _Plotter Serial_ do Tinkercad é necessário remover o
> texto da impressão Serial, mantendo só os números com espaços para separar as
> as colunas e quebra de linha para separar as amostras (eixo x).
> 
> ```c++
> void setup() {
>   Serial.begin(230400); //Inicializa porta serial
> }
> 
> void loop() {
>   int leitura = analogRead(A0);
>   
>   //leitura será um inteiro de 0 a 1023
>   //o fator de conversão para volts é  0.0048828125, ou 5 / 1024.0
>   
>   //Imprime a leitura do conversor
>   Serial.print("leitura: ");
>   Serial.print(leitura);
>   
>   //Imprime o valor em Volts
>   Serial.print(" tensao: ");
>   Serial.print(0.0048828125 * leitura); 
>   Serial.print(" V");
>   Serial.print("\n"); //Imprime quebra de linha
>
>   delay(100); // Aguarda 100ms
> }
> ```
>
> <figure>
>   <img src="/assets/images/monitor_serial_volt.png" class="figure-img"
>        style="width: 95%"/>
>   <figcaption class="figure-caption" markdown="span">
>     Dados enviados pelo Arduino, vistos com o _Monitor Serial_.
>   </figcaption>
> </figure>
>
> <figure>
>   <img src="/assets/images/plotter_serial_volt.png" class="figure-img" 
>        style="width: 95%"/>
>   <figcaption class="figure-caption" markdown="span">
>     Dados enviados pelo Arduino, vistos com o _Plotter Serial_. A tensão
>     em Volts é mais difícil de visualizar devido à escala vertical.
>   </figcaption>
> </figure>

> Atividade: Quão realista é nosso modelo do LED?
> -----------------------------------------------
> 
> Temos agora uma atividade para dimensionamento do resistor para acionamento 
> de um LED, e depois a observação do funcionamento do dispositivo no circuito
> e avaliação do modelo utilizado para o dimensionamento. A montagem desta
> atividade é igual a da prática 1, mostrada na figura abaixo, mas agora iremos
> variar o resistor.
>
> <figure>
>   <img src="/assets/images/led-fonte.svg" class="figure-img"
>        style="width: 50%"/>
>   <figcaption class="figure-caption" markdown="span">
>     Montagem para acionamento do LED.
>   </figcaption>
> </figure>
> 
> O modelo mais comum para dimensionamento de LEDs é o modelo simplificado,
> onde o LED no modo de polarização direta é modelado como uma queda de tensão
> constante. Como LEDs não são feitos de semicondutores elementares como 
> silício, o valor da queda de tensão utilizado depende do tipo de semicondutor
> composto utilizado na construção do dispositivo, que geralmente está associado
> à cor do LED. A Tabela 1.9 do livro do Boylestad e Nashelsky tem valores
> comuns de tensão e cor.
>
> Fornecedores de componentes eletrônicos menos especializados nem sempre 
> fornecem a folha de dados ou modelo específico de LEDs, pois esses 
> componentes não são críticos na maior parte das aplicações e isso facilita sua
> logística ao permitir a troca de fabricantes. No entanto, é comum termos
> a tensão e corrente nominais do dispositivo. Também não sabemos o modelo
> dos LEDs do Tinkercad ou do laboratório, por isso iremos utilizar uma folha
> de dados de um LED circular de 5mm vermelho de uso geral, o [L-7113EC]
> da [Kingbright]. Se você sabe a tensão e corrente nominais do seu LED ou
> possui sua folha de dados, utilize essa informação.
>
> Escolha
>
> No relatório, inclua
>
> - O valor de tensão queda de tensão $$V_K$$ do modelo do LED utilizado.
> - A corrente esperada para cada resistor, e a corrente estimada.
> - O gráfico da curva de corrente e tensão do LED, da folha de dados, com
> os pontos observados sobrepostos.

Modulação por largura de pulso
------------------------------

A modulação por largura de pulso é uma técnica para se variar a tensão média
fornecida para um componente utilizando uma saída de dois estados (digital).
É a mesma técnica utilizada para se variar a luminosidade do LED na prática 1.

Como as saídas digitais do Arduino possuem somente dois estados, 0V e 5V, 
seu estado é variado em alta frequência para que, na média, a carga perceba
uma tensão média entre os estados discretos possíveis.

Considere a imagem abaixo.
A razão cíclica (_duty cycle_) é o fração do período em que a onda permanece
no nível lógico alto.
Se uma onda de tensão com razão cíclica de 75% for aplicada a um componente,
a tensão média é 75% da tensão máxima.
Dessa forma, a tensão _média_ no componente pode ser variada entre 0
e a tensão do nível lógico alto.
A razão cíclica de 0% corresponde ao nível lógico baixo de de 100% corresponde
ao nível lógico alto.

{%
   include figure.html
   file="pwm_sparkfun.jpg"
   caption="Fonte: [Sparkfun][Tutorial PWM], licença [CC BY-SA 4.0]."
%}

O microcontrolador do Arduino possui um periférico para gerar onda com
modulação por largura de pulso (PWM, do inglês _pulse width modulation_)
em hardware, sem intervenção do usuário.
A função `analogWrite(pino, razao_ciclica)` é usada para gerar uma onda com
PWM.
O argumento `razao_ciclica` é um número de 0 a 255, correspondendo a uma razão
de 0% a 100%.
Antes de utilizá-la é necessário configurar o pino como saída através da função
`pinMode(pino, OUTPUT)`.
Confira a documentação oficial da função [analogWrite] para maiores informações.

### Procedimento: modulação por largura de pulso para alterar o brilho de um led

Este procedimento utiliza o circuito representado no diagrama esquemático
abaixo. O LED é alimentado pela saída digital número 9 do Arduino.
Quando a razão cíclica da onda no pino 9 for 0% o LED irá apagar e quando
for 100% o LED estará no brilho máximo.

{%
   include figure.html
   file="pwm-led.svg"
   caption="Montagem para acionamento do LED por PWM."   
%}

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

> ### Atividade: Comando do brilho do LED com potenciômetro
>
> Comande a razão cíclica do LED com um potenciômetro. Para o terminal móvel do
> potenciômetro em cada um dos extremos o LED deverá estar com brilho máximo ou
> apagado. Nas posições intermediárias o brilho deverá ser proporcional à tensão
> medida.
>
> A montagem consiste dos circuitos das Figuras 5 e 7.


Servomotor de radiocontrole
---------------------------

Servomotores são sistemas controlados com motores que permitem comandar a
posição do eixo de saída.
Servomotores de radiocontrole são utilizados para comando remoto de veículos
não tripulados como aeromodelos ou automodelos.
Eles geralmente são compostos de um pequeno motor de corrente contínua
conectado a um sistema de engrenagens cujo eixo de saída é um potenciômetro.
Dessa forma, a posição do eixo é medida e controlada por um sistema 
realimentado que atua no motor.

Esses dispositivos possuem 3 terminais: alimentação, terra e sinal.
A alimentação é o terminal central, de cor vermelha.
O terra é o terminal correspondente ao cabo preto ou marrom e o sinal
corresponde ao fio amarelo ou laranja.
A referência de posição é enviada pelo terminal de sinal como um pulso.
A duração do pulso codifica a posição desejada do eixo.
Um pulso de 1500 microssegundos corresponde à posição central do eixo, de
90 graus, enquanto
que as durações de 600 microssegundos e 2400 microssegundos correspondem, 
respectivamente, a deflexões de aproximadamente 0 graus e
180 graus.
Os pulsos devem estar espaçados de pelo menos 20 milissegundos entre si.

Usar um pulso de duração variável permite diferenciar o comando nulo de perda
de sinal de rádio.
Quando nenhum pulso é recebido o servo mantém a última referência recebida
ao invés de dar a deflexão máxima.
Esse comportamento é mais seguro para o comando de aeronaves remotamente 
pilotadas.
Um recurso adicional para mais informações sobre o funcionamento e uso de
servomotores é o [tutorial de servos da Sparkfun][tut-servo].

### Procedimento: Comando de um Servo

Abaixo temos um código de exemplo para comando de um servomotor de 
radiocontrole utilizando a biblioteca Servo do Arduino. Nesse exemplo,
o servo é comandado entre três posições: 0, 90 e 180 graus.

```c++

// Inclui a biblioteca ao programa
#include <Servo.h> 

// Declara um objeto servo. Até 6 servos podem ser criados
Servo servo1; 

void setup() {
  servo1.attach(9);  // Define o pino 9 para o comando do servo
}

void loop() {
  servo1.write(0); // Manda para posição 0 graus
  delay(500); // Aguarda meio segundo

  servo1.write(90);
  delay(500);

  servo1.write(180);
  delay(500);

  servo1.write(90);
  delay(500);
}
```

Para executar esse exemplo, o terminal vermelho do servo deve ser conectado
ao 5V, o terminal marrom ou preto ao terra e o terminal laranja ou branco
ao pino digital 9 do Arduino, como mostrado na figura abaixo.

{%
   include figure.html
   file="montagem_servo_protoboard.png"
   caption="Montagem para comando de um servo com o Arduino.
            Fonte: [arduino.cc][servo-sweep], 
            licença Creative Commons Attribution Share-Alike."
%}

> ### Atividade: Comando do servo com potenciômetro
>
> Comande a posição do servo com um potenciômetro. Para o terminal móvel do
> potenciômetro em cada um dos extremos a haste do servo deverá estar nos seus
> extremos. Nas posições intermediárias a haste estará em uma posição
> proporcional à do potenciômetro.
> 
> **Dica:** Utilize a função [map].

> ### Atividade: Movimento constante do servo
>
> De maneira semelhante ao procedimento do LED, faça o servo ir com velocidade
> constante de 0 a 180 graus e depois de volta a 0 graus, repetidamente.

[analogRead]: https://www.arduino.cc/reference/pt/language/functions/analog-io/analogread/
[analogWrite]: https://www.arduino.cc/reference/pt/language/functions/analog-io/analogwrite/
[CC0 1.0]: https://creativecommons.org/publicdomain/zero/1.0/deed.pt
[CC BY-SA 4.0]: https://creativecommons.org/licenses/by-sa/4.0/
[map]: https://www.arduino.cc/reference/pt/language/functions/math/map/
[pot-src]: https://commons.wikimedia.org/wiki/File:Single-turn_potentiometer_with_internals_exposed,_oblique_view.jpg
[servo-sweep]: https://www.arduino.cc/en/Tutorial/Sweep
[AnalogReadSerial]: https://www.arduino.cc/en/Tutorial/AnalogReadSerial
[tut-servo]: https://learn.sparkfun.com/tutorials/hobby-servo-tutorial

[Tutorial PWM]: https://learn.sparkfun.com/tutorials/pulse-width-modulation
[Tinkercad]: https://www.tinkercad.com/
[QE Protoboard]: https://youtu.be/8OzfA0GQt-c
[QE Portas]: https://youtu.be/tkKIsG-aIzA
[Potenciômetro aberto]: https://youtu.be/ZRAZAWDDxRk
[Potentiometer inside]: https://youtu.be/PDfnQIAnXpo
[Lei de Weber-Fechner]: https://pt.wikipedia.org/wiki/Lei_de_Weber-Fechner
[ens sora]: http://ufmg-cea.blogspot.com/2010/09/right-stuff-acs100-sora-flight-tests.html
[L-7113EC]: /datasheet/L-7113EC(Ver.21A).pdf
[Kingbright]: https://www.kingbright.com/