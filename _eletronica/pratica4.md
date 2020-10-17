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

Abaixo temos o diagrama de circuito da montagem a ser realizada nesta prática.
O circuito é alimentado por meio de duas baterias de 9V, ligadas para funcionar
como fonte simétrica, com as tensões de $$+9\si{V}$$ e $$-9\si{V}$$. A tensão
entre essas duas baterias é a nossa referência, ou terra. Todos os pontos do
diagrama de circuito indicados como terra deverão ser conectados entre si.


{%
   include figure.html
   file="pratica4.svg"
   caption="Diagrama de circuito do filtro passa-baixas inversor."
%}

O amplificador operacional utilizado é o [741]. O número de cada um dos seus 
pinos, para o encapsulamento PDIP de 8 pinos, está indicado no diagrama em azul.
Essa informação também está disponível na [folha de dados][741] do dispositivo.
O osciloscópio permite ver a forma de onda da saída e sua escala de tempo deve
ser ajustada conforme a frequência da tensão de entrada varia.
A entrada será fornecida por um gerador de sinais,

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

[741]: /datasheet/ua741_opamp.pdf
