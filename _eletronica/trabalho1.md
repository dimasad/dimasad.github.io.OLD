---
layout: default
title: Eletrônica -- Trabalho 1
---

{{page.title}}
==============

Este trabalho é um estudo dirigido para se analisar um circuito de acionamento
de uma solenóide com um diodo de roda livre. Solenóides são eletroímãs
helicoidais com núcleo ferromagnético que se move quando circula corrente
no enrolamento. Dessa forma, são atuadores eletromecânicos simples que geram
movimento linear. Abaixo temos um vídeo que mostra uma mini solenóide em
funcionamento. Quando passa corrente por ela (LED aceso) é gerado um campo
magnético que puxa o êmbolo. Quando a corrente cessa, a mola retorna o êmbolo
para a posição inicial.

<center>
  <iframe width="580" height="380"
     src="https://www.youtube.com/embed/sd7xk_2BOOM?rel=0"
     frameborder="0" allow="encrypted-media" allowfullscreen>
  </iframe>
  <p>Mini solenóide em funcionamento.</p>
</center>

Solenóides tem diversas aplicações. Uma [válvula solenóide] pode ser utilizada
para o controle da irrigação de jardins por um Arduino baseado na medição da
[umidade do solo]. Em um VANT, válvulas solenóides comandadas pelo computador
de voo podem fazer a seleção do tanque de combustível. Em foguetes, solenóides
podem acionar o mecanismo de abertura do paraquedas ou separação dos estágios.
Na internet, existem exemplos até do uso de solenóides para a construção de um
[instrumento musical] com copos de água. Para alguns exemplos de solenóides
comerciais, veja esses produtos:

* [válvula solenóide na eletrogate],
* [mini solenóide na Eletrodex],
* [mini solenóide na Sparkfun] (com folha de dados).


Modelo elétrico de uma solenóide
--------------------------------

O enrolamento da solenóide, usado para gerar o campo magnético que atrai o
êmbolo, confere ao dispositivo uma indutância que está associada ao
armazenamento de energia no campo magnético. Como o enrolamento geralmente é
feito com um comprimento considerável de fio, temos também um efeito resistivo
associado à dissipação de calor no enrolamento. Dessa forma, um modelo primário
que representa bem o comportamento dominante do dispositivo é um indutor de
indutância $$L$$ em série com um resistor de resistência $$R$$, como mostrado
no circuito equivalente abaixo.

{%
   include figure.html
   file="solenoide-eqv.svg"
   img_style="width: 50%"
   caption="Circuito equivalente de uma solenóide."
%}

Atividade: acionamento de uma solenóide sem diodo
-------------------------------------------------

Abaixo temos um circuito de acionamento de uma solenóide com uma chave.
Escreva a equação diferencial que rege esse circuito para a condição de chave
fechada. Esboce o gráfico da corrente $$i$$ em função do tempo $$t$$ a partir
do fechamento da chave, para a condição inicial de $$i=0$$ em $$t=0$$.
No gráfico, indique o valor final da corrente em função dos parâmetros do
circuito.

{%
   include figure.html
   file="solenoide-chave.svg"
   img_style="width: 50%"
   caption="Circuito de acionamento de uma solenóide com uma chave."
%}

Em seguida, considere que a corrente na solenóide atigiu seu valor de equilíbrio
para a condição de chave fechada e a chave é aberta. O que deve acontecer com a
corrente e a tensão no indutor? Veja no vídeo abaixo o comportamento do circuito
e explique com suas próprias palavras por que surge o arco elétrico quando a
chave é aberta. 

<center>
  <iframe width="500" height="380"
     src="https://www.youtube.com/embed/aSmMFog10D0?rel=0"
     frameborder="0" allow="encrypted-media" allowfullscreen>
  </iframe>
  <p>Mini solenóide em funcionamento.</p>
</center>

Atividade: acionamento de uma solenóide com um diodo
----------------------------------------------------

Para evitar o comportamento observado no vídeo, é utilizado no circuito de
acionamento da solenóide um diodo de roda livre, como mostrado na figura
abaixo.

{%
   include figure.html
   file="solenoide-diodo.svg"
   img_style="width: 70%"
   caption="Circuito de acionamento de uma solenóide com diodo de roda-livre."
%}

**Considerando o diodo ideal**, esboce o gráfico da corrente na solenóide
$$i_s$$ em função do tempo $$t$$ a partir do fechamento da chave, para a
condição inicial de $$i=0$$ em $$t=0$$. O diodo irá operar em qual modo?
No gráfico, indique o valor final da corrente em função dos parâmetros do
circuito.

Em seguida, considere que a chave é aberta para um dado valor de $$i_s$$
inicial maior que zero. O diodo irá operar em qual modo? Escreva a equação
diferencial que rege a dinâmica do sistema e esboce a curva da corrente $$i_s$$
em função do tempo.

**Utilizando o modelo simplificado do diodo** (uma queda de tensão constante
igual a $$v_k$$ no modo de condução), repita a análise anterior.
Qual a diferença entre o comportamento do circuito com os diferentes modelos
do diodo?

Considerando o comportamento do circuito com e sem o diodo, explique com suas
palavras a necessidade do uso do diodo de roda-livre. Qual é a função do diodo
no circuito? Qual é a potência máxima entregue pela solenóide ao circuito
durante sua descarga, em cada caso?

Entrega
-------

A atividade deverá ser entregue por escrito na sala de aula no dia 11 de abril
de 2018.

[instrumento musical]: https://youtu.be/W9j6ZRsOUrI?t=57s
[mini solenóide na Eletrodex]: http://www.eletrodex.com.br/mini-solenoid-12v-jf-0530b.html
[mini solenóide na Sparkfun]: https://www.sparkfun.com/products/11015
[umidade do solo]: https://www.sparkfun.com/products/13322
[válvula solenóide]: https://www.sparkfun.com/products/10456
[válvula solenóide na eletrogate]: https://www.eletrogate.com/valvula-solenoide-de-entrada-de-agua-180-1-2-12v-dc
