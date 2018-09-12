---
layout: default
title: Eletrônica -- Prática 3
---

{{ page.title }}
================
{:.no_toc}

#### Acionamento de um Motor CC
{:.no_toc}


O objetivo da prática desta prática é fazer o acionamento de um motor de 
corrente contínua com o Arduino. Inicialmente, o motor será acionado em 
somente um sentido, utilizando um transistor NPN. Em seguida, será acionado
nos dois sentidos utilizando a ponte H do circuito integrado [L293D].

**Tópicos:**
* Procedimento x
* Procedimento y
{:toc}


Acionamento com um transistor NPN
---------------------------------

Abaixo temos o diagrama de um circuito para acionamento de um motor de corrente
contínua com um Arduino usando um transistor NPN. Os terminais do transistor
(coletor, emissor e base) estão indicados. Em antiparalelo com o motor temos
um diodo de roda livre para proteger a chave, pois o motor é uma carga indutiva.
O acionamento da base do transistor é feito pelo pino digital 9 do Arduino.
Quando a saída está em nível lógico alto (5V) o transistor está saturado,
operando como chave fechada. Quando a saída está em nível lógico baixo (0V) o
transistor está em corte, operando como chave aberta.

{%
   include figure.html
   file="motor-npn.svg"
   caption="Circuito para acionamento do motor com um transistor NPN."
%}

Monte esse circuito em um protoboard, utilizando o transistor [BC639] e o diodo
[1N4007]. Atenção para a pinagem do transistor, confira na folha de dados.
No diodo, a banda marca o catodo, como indicado na sua folha de dados.
Com esse circuito, faça as atividades abaixo.

> ### Teste do acionamento
>
> O primeiro teste consiste em ligar o motor, aguardar 1s, desligar o motor,
> aguardar 1s e repetir. Esse programa serve para ver se a montagem foi feita
> corretamente.
>
> **Dica:** Lembre de configurar o pino 9 como saída com a função `pinMode`.


> ### Aceleração e desaceleração gradual
>
> O segundo teste consiste em acionar o motor com uma tensão gradual de 0V a 5V,
> utilizando modulação por largura de pulso, e depois desenergizar o motor 
> também de maneira gradual.
> 
> **Dica:** Utilize a função [analogWrite] como na prática anterior.


> ### Comando pelo potenciômetro
>
> Utilize um potenciômetro e uma entrada analógica do Arduino para comandar a
> tensão no motor. A tensão média no motor deverá ser igual à tensão medida no
> potenciômetro.
> 
> **Dica:** Utilize as funções [analogRead] e [map] como na prática anterior.

Acionamento com a ponte H L293D
-------------------------------

O circuito integrado [L293D] contém uma ponte H dupla ou, alternativamente,
quatro meia pontes. Esse circuito pode ser utilizado para acionar um motor de
corrente contínua nos dois sentidos. A pinagem do CI pode ser vista na seção 5
da sua folha de dados.

Esse circuito possui duas entradas de alimentação, VCC1 e VCC2. A alimentação
VCC1 supre a lógica interna do dispositivo e deve ter uma tensão de 5V e a
entrada VCC2 alimenta a carga, aceitando uma tensão de 4,5V a 36V. As duas
fontes de alimentação devem ter uma referência comum, que é o pino terra.

Cada meia ponte do L293D possui 2 entradas (EN e A) e uma saída (Y). A entrada
EN (enable) serve para habilitar ou desabilitar a meia ponte. Quando ela está
em nível lógico baixo a saída Y está aberta. Quando a entrada EN está nível
lógico alto, a tensão na saída Y é VCC2 quando A está em nível lógico alto
e 0V quando A está em nível lógico baixo.

### Montagem

Nesta prática, utilizaremos a mesma fonte para alimentar o CI e o motor,
por isso VCC1 e VCC2 devem estar ligados na fonte de 5V do Arduino.
Conecte também o terra do CI no terra do Arduino. Como manteremos a ponte
habilitada o tempo todo, conecte também a entrada 1,2EN no 5V. Para comandar a
ponte, conecte as entradas 1A e 2A da ponte, às saídas digitais 9 e 10 do
Arduino, respectivamente. Por fim, conecte as saídas da ponte 1Y e 2Y aos 
terminais do motor.

> ### Teste do acionamento
>
> O primeiro teste consiste em ligar o motor em um sentido, aguardar 1s, 
> desligar o motor, aguardar 1s, ligar o motor no outro sentido, aguardar 1s,
> desligar o motor, aguardar 1s e repetir. Esse programa serve para ver se a
> montagem foi feita corretamente e é possível acionar o motor nos dois 
> sentidos.


> ### Aceleração e desaceleração gradual
>
> O segundo teste consiste em acionar o motor com uma tensão gradual de -5V a
> 5V, utilizando modulação por largura de pulso, e depois acionar com tensão
> de 5V a -5V. O motor deverá parar suavemente e trocar de sentido de rotação.


> ### Comando pelo potenciômetro
>
> Utilize um potenciômetro e uma entrada analógica do Arduino para comandar a
> tensão no motor. Quando o potenciômetro estiver na posição central o motor
> deverá estar parado, quando estiver em um extremo o motor deverá ser acionado
> com 5V e quando estiver no outro extremo o motor deverá ser acionado com 
> tensão -5V. Nas posições intermediárias a tesão no motor deverá ser
> proporcional à posição do potenciômetro.

[BC639]: /datasheet/BC639.pdf
[L293D]: /datasheet/L293D.pdf
[1N4007]: /datasheet/1N4007.pdf

[analogWrite]: https://www.arduino.cc/en/Reference/AnalogWrite
[analogRead]: https://www.arduino.cc/en/Reference/AnalogRead
[map]: https://www.arduino.cc/en/Reference/map
