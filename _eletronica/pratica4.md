---
layout: default
title: Eletrônica -- Prática 4
---

{{ page.title }}
================
{:.no_toc}

#### Filtro ativo e amplificador operacional
{:.no_toc}


O objetivo da prática desta prática é construir e analisar um filtro ativo
passa-baixas implementado com amplificador operacional. Será utilizada uma
fonte simétrica composta de duas baterias, um osciloscópio e um gerador de 
funções. É importante saber como conectar esses vários dispositivos para que 
tenham a mesma tensão de referência.

**Tópicos:**
* Procedimento x
* Procedimento y
{:toc}


Circuito
--------

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

Circuito de acionamento com a ponte H
-------------------------------------

Para operar o motor nos dois sentidos, é necessário um circuito que possibilite
aplicar a tensão da fonte no motor nos dois sentidos, isto é, invertendo os
terminais do motor. A ponte H é um dispositivo com 4 chaves que permite isso,
como mostrado no circuito abaixo. 
Suas saídas são os nós 1Y e 2Y, que estão conectados aos terminais do motor.
Cada metade da ponte é composta de duas chaves e uma saída, indicados na figura
pelos números 1 ou 2.
Quando a chave alta (H) está fechada, o nó de saída é conectado ao terminal 
de alimentação $$V_{\operatorname{CC}}$$.
Quando a chave baixa (L) está fechada, o nó de saída é conectado ao terminal 
ao terra.
Note que as chaves superior e inferior de uma mesma meia ponte não podem ser
fechadas ao mesmo tempo, ou temos um curto-circuito.

{%
   include figure.html
   file="ponte-h-chave.svg"
   caption="Ponte H para acionamento de um motor, representada com chaves."
%}

Desta forma, quando as chaves $$S_{1H}$$ e $$S_{2L}$$ estão fechadas,
é aplicada tensão no motor em um sentido. Já quando as chaves $$S_{1L}$$ 
e $$S_{2H}$$ são fechadas, é aplicada tensão no motor no outro sentido. 
Com isso, é possível fazer com que o motor gire em ambos sentidos de
rotação.


É possível construir uma ponte H com pelo menos 4 transistores bipolares,
mas iremos, para esta prática, utilizar o circuito integrado [L293D] que
possui 4 meia-ponte já implementadas, o que simplifica nossa montagem.
Com um L293D é possível fazer 2 ponte H, o que pode ser utilizado para acionar
2 motores CC ou um motor de passo bipolar de duas fases, por exemplo. 
O circuito com 
transistores da saída de cada meia ponte é mostrado na Figura 5 da folha de 
dados. Observe que o dispositivo já tem os diodos de roda livre para proteção
contra cargas indutivas como motores. A folha de dados também mostra vários
exemplos de aplicação.

Esse circuito possui duas entradas de alimentação, VCC1 e VCC2. A alimentação
VCC1 supre a lógica interna do dispositivo e deve ter uma tensão de 5V; a
entrada VCC2 alimenta a carga, aceitando uma tensão de 4,5V a 36V. As duas
fontes de alimentação devem ter uma referência comum, que é o pino terra.
Há vários terra no CI para melhorar a dissipação de calor.
Não é necessário conectar todos, pois eles são conectados internamente, mas 
isso é boa prática em montagens mais permanentes. 

Cada meia ponte do L293D possui 2 entradas (EN e A) e uma saída (Y). A entrada
EN (enable) serve para habilitar ou desabilitar a meia ponte. Quando ela está
em nível lógico baixo a saída Y está aberta. Quando a ponte está habilitada 
(entrada EN em nível lógico alto), a tensão na saída Y é VCC2 quando A está em
nível lógico alto e 0V quando A está em nível lógico baixo. Observe também
que temos só duas entradas de enable, uma para cada par de meia ponte.

A montagem desta parte da prática está mostrada na figura abaixo.
Utilizaremos a mesma fonte para alimentar o CI e o motor,
por isso VCC1 e VCC2 devem estar ligados na fonte de 5V do Arduino.
Conecte também os pinos terra do CI no terra do Arduino. Como manteremos a ponte
habilitada o tempo todo, conecte também a entrada 1,2EN no 5V. 
Um detalhe é que, novamente, a tradução automática dos nomes dos
pinos no Tinkercad ficou esquisita, _terra_ foi traduzido como _solo_.
Para comandar a
ponte, conecte as entradas 1A e 2A da ponte às saídas digitais 9 e 10 do
Arduino, respectivamente. Por fim, conecte as saídas da ponte 1Y e 2Y aos 
terminais do motor. Os demais pinos não precisam ser conectados.

{%
   include figure.html
   file="l293-montagem.svg"
   caption="Montagem para acionamento do motor com a ponte H integrada L293D."
%}

> ## Montagem: Teste do acionamento
>
> O primeiro teste consiste em ligar o motor em um sentido, aguardar 1s, 
> desligar o motor, aguardar 1s, ligar o motor no outro sentido, aguardar 1s,
> desligar o motor, aguardar 1s e repetir. Esse programa serve para ver se a
> montagem foi feita corretamente e se é possível acionar o motor nos dois 
> sentidos.
>
> Para ligar o motor em um sentido, deve-se colocar a saída 10 em nível lógico
> alto e a 9 em baixo. Para inverter o sentido, basta inverter as saídas: 10 em
> nível baixo e 9 em alto. O motor é parado quando ambas as saídas estão no 
> mesmo nível lógico, alto ou baixo.


> ## Montagem: Aceleração e desaceleração gradual
>
> O segundo teste consiste em acionar o motor com uma tensão gradual de -5V a
> 5V, utilizando modulação por largura de pulso, depois acionar com tensão
> de 5V a -5V e repetir o ciclo. O motor deverá parar suavemente e trocar de
> sentido de rotação.
> 
> Para fazer modulação por largura de pulso com a ponte H, eu sugiro manter
> um dos seus lados em nível lógico zero enquanto o outro é acionado com 
> uma onda em PWM. Para inverter o sentido, faça a mesma coisa trocando os
> lados da ponte, o que estava em PWM fica em zero enquanto o que estava em
> zero envia uma onda com modulação por largura de pulso.


> ## Atividade: Comando pelo potenciômetro
>
> Utilize um potenciômetro e uma entrada analógica do Arduino para comandar a
> tensão no motor. Quando o potenciômetro estiver na posição central o motor
> deverá estar parado, quando estiver em um extremo o motor deverá ser acionado
> com 5V e quando estiver no outro extremo o motor deverá ser acionado com 
> tensão -5V. Nas posições intermediárias a tesão no motor deverá ser
> proporcional à posição do potenciômetro.
>
> Observe que o ponteciômetro deverá somente servir como interface para o
> comando do usuário, sua conexão com a ponte H é feita exclusivamente por 
> software. Para quem fizer por meio de simulação, salve no Tinkercad com o
> nome de "Prática 3: Ponte". Quem fizer as montagens com os componentes
> reais, envie uma foto do circuito e o código do Arduino no Moodle.

[BC639]: /datasheet/BC639.pdf
[L293D]: /datasheet/L293D.pdf
[1N4007]: /datasheet/1N4007.pdf

[analogWrite]: https://www.arduino.cc/en/Reference/AnalogWrite
[analogRead]: https://www.arduino.cc/en/Reference/AnalogRead
[map]: https://www.arduino.cc/en/Reference/map
