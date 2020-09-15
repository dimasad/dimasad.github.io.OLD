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
Essas aplicações são representativas do acionamento de cargas de potência
com dispositivos eletrônicos. Variações desses circuitos são utilizados, por
exemplo, para acionamento de placas de Peltier para aquecimento ou resfriamento,
solenóides, motores de passo, e motores de corrente alternada _brushless_
ou de indução.

**Tópicos:**
* Procedimento x
* Procedimento y
{:toc}


Circuito de acionamento com um transistor NPN
---------------------------------------------

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

Se utilizarmos o modelo de chave para o transistor, o circuito acima é 
equivalente a este mostrado abaixo. Observe que com este circuito, só é
possível acionar o motor em um sentido. Isso porque o torque, em um motor
de corrente contínua de ímã permanente, é proporcional à corrente. Para se
inverter o sentido do torque, é necessário inverter o sentido da corrente,
o que não é possível com este circuito.

{%
   include figure.html
   file="motor-chave.svg"
   caption="Circuito equivalente ao de acionamento do motor, 
            com o transistor modelado como uma chave."
%}

Monte esse circuito em um protoboard, utilizando o transistor [BC639] e o diodo
[1N4007]. Para saber qual a função de cada pino do dispositivo (pinagem), 
consulte a folha de dados, onde há um diagrama como o da figura abaixo.
No Tinkercad, há somente um transistor NPN genérico, e sua pinagem é indicada
no próprio dispositivo. No diodo, a banda marca o catodo, como indicado na sua
folha de dados. Por fim, ambos terminais do motor tem a mesma função, se forem
trocados a única coisa que vai alterar será o sentido da rotação mecânica que,
nesta prática, não faz diferença. Com esse circuito, faça as atividades abaixo.

{%
   include figure.html
   file="pinagem_bc639.png"
   caption="Identificação dos pinos do transistor BC639."
%}


> ## Montagem: Teste do acionamento
>
> A função da primeira montagem é testar as conexões do circuito. Consiste
> simplesmente em testar a funcionalidade básica do sistema: abrir e fechar
> a chave. Faça então um código para o Arduino que liga o motor, aguarda 1s, 
> desliga o motor, aguarda 1s e repete o processo do início. Esse é o programa
> mais simples que testa se tudo está ligado corretamente.
>
> **Dica:** Lembre de configurar o pino 9 como saída com a função `pinMode`.


> ## Montagem: Aceleração e desaceleração gradual
>
> Utilizando modulação por largura de pulso, como na prática anterior, é 
> possível fornecer uma tensão média no motor entre 0V e 5V. Para o segundo 
> teste, faça um programa que, periodicamente, varie a tensão média no motor
> gradualmente de 0V a 5V e depois de 5V a 0V.
> 
> **Dica:** Utilize a função [analogWrite], como feito com o LED na prática
> anterior.


> ## Atividade: Comando pelo potenciômetro
>
> Faça agora a atividade para a entrega, que combina elementos testados 
> nas duas montagens anteriores. Adicione um potenciômetro ao circuito, leia
> a tensão com uma entrada analógica e utilize esse valor para comandar a 
> tensão média no motor, através da modulação por largura de pulso. A tensão 
> média no motor deverá ser igual à tensão medida no potenciômetro.
> 
> Para quem fizer esta prática no Tinkercad, salve o circuito com o nome
> "Prática 3: NPN". Para quem fizer a prática com montagem física, envie uma
> foto da montagem e o código utilizado.
> 
> **Dica:** Utilize as funções [analogRead] e [analogWrite] como feito na 
> prática anterior.

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
em nível lógico baixo a saída Y está aberta. Quando a ponte está habilitada 
(entrada EN em nível lógico alto), a tensão na saída Y é VCC2 quando A está em
nível lógico alto e 0V quando A está em nível lógico baixo.

### Montagem

Nesta prática, utilizaremos a mesma fonte para alimentar o CI e o motor,
por isso VCC1 e VCC2 devem estar ligados na fonte de 5V do Arduino.
Conecte também o terra do CI no terra do Arduino. Como manteremos a ponte
habilitada o tempo todo, conecte também a entrada 1,2EN no 5V. Para comandar a
ponte, conecte as entradas 1A e 2A da ponte às saídas digitais 9 e 10 do
Arduino, respectivamente. Por fim, conecte as saídas da ponte 1Y e 2Y aos 
terminais do motor.

> ### Teste do acionamento
>
> O primeiro teste consiste em ligar o motor em um sentido, aguardar 1s, 
> desligar o motor, aguardar 1s, ligar o motor no outro sentido, aguardar 1s,
> desligar o motor, aguardar 1s e repetir. Esse programa serve para ver se a
> montagem foi feita corretamente e se é possível acionar o motor nos dois 
> sentidos.


> ### Aceleração e desaceleração gradual
>
> O segundo teste consiste em acionar o motor com uma tensão gradual de -5V a
> 5V, utilizando modulação por largura de pulso, depois acionar com tensão
> de 5V a -5V e repetir o ciclo. O motor deverá parar suavemente e trocar de
> sentido de rotação.


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
