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
implementado com amplificador operacional. Será utilizado um
um osciloscópio, um gerador de funções e uma fonte simétrica composta de duas
baterias.

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
   caption="Diagrama de circuito do filtro inversor."
%}

O amplificador operacional utilizado é o [741]. O número de cada um dos seus 
pinos, para o encapsulamento PDIP de 8 pinos, está indicado em azul no diagrama.
Essa informação também está disponível na [folha de dados][741] do dispositivo.
O osciloscópio permite ver a forma de onda da saída e sua escala de tempo deve
ser ajustada conforme a frequência da tensão de entrada varia.
A entrada será fornecida por um gerador de sinais, também conhecido como gerador
de função, que deverá ser programado para fornecer uma senóide de amplitude 
$$100\si{mV}$$ e média (deslocamento CC) nula.
A frequência será variada para se observar a variação do ganho do filtro.

O filtro é inversor pois, mesmo nas frequências passantes, o sinal de saída tem 
a polaridade oposta do sinal de entrada. 
Por ser ativo, esse filtro também pode amplificar o sinal de entrada, podendo
cumprir várias funções nos circuitos em que é utilizado.

> ## Atividade: Resposta em frequência
>
> Monte o circuito no ambiente de simulação e meça seu ganho (razão entre a
> amplitude da saída e da entrada)  para o sinal de entrada nas frequências de 
> $$1\si{Hz}$$, $$5\si{Hz}$$, $$10\si{Hz}$$, $$20\si{Hz}$$, 
> $$50\si{Hz}$$,  $$100\si{Hz}$$,  $$200\si{Hz}$$,  $$500\si{Hz}$$ e 
> $$1\si{kHz}$$ e $$2\si{kHz}$$. Baseado na resposta obtida, classifique o
> filtro, qualitativamente, como passa-baixas, passa-altas, passa-faixa ou 
> rejeita-faixa.
>
> Aumente gradativamente a amplitude da tensão de entrada até observar a
> saturação da saída, em uma frequência em que o filtro tenha alto ganho.
> Qual o valor da tensão de saturação? Esse valor é coerente com o informado
> na folha de dados?
>
> Entregue um breve relatório com os dados obtidos e a análise. Salve a
> montagem no Tinkercad como "Prática 4".

[741]: /datasheet/ua741_opamp.pdf
