---
layout: default
title: Eletrônica -- Exercício Sobre Diodos
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

Atividade 1: acionamento de uma solenóide sem diodo
---------------------------------------------------

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

__Dica:__
A equação diferencial resultante é de primeira ordem, e a resposta da corrente
tem um formato exponencial. Uma maneira simples de se calcular a solução é
utilizando a transformada de Laplace com condições iniciais nulas.

Atividade 2: acionamento de uma solenóide com um diodo
------------------------------------------------------

No circuito anterior, se a chave for aberta com a corrente no seu valor de
equilíbrio, uma tensão muito alta será induzida no enrolamento e teremos um
arco elétrico entre os terminais da chave. O arco resultante da interrupção
do circuito de uma bobina grande pode ser visto nesta [demonstração do MIT].
Temos também [outro vídeo][vid pg] com a mesma bobina, em câmera lenta, 
resolução maior e uma breve explicação desse fenômeno físico. Basicamente, a
faísca resulta da liberação quase instantânea da energia armazenada no indutor
sob a forma de campo magnético.

Diodos podem ser utilizados para evitar o comportamento observado nos vídeos.
Na figura abaixo temos o circuito anterior com um diodo de proteção. O diodo,
nessa função, é chamado de diodo de roda livre.

{%
   include figure.html
   file="solenoide-diodo.svg"
   img_style="width: 70%"
   caption="Circuito de acionamento de uma solenóide com diodo de roda-livre."
%}

Quando a chave está fechada, o diodo está em corte e o circuito se comporta
da mesma maneira que o anterior. Quando a chave é aberta e ainda há energia
armazenada no indutor, a corrente da solenoide $$i_s$$ circula pelo diodo,
que conduz.

Considerando o modelo simplificado do diodo (veja Tabela 1.7 de Boylestad e 
Nashelsky), escreva a equação diferencial que rege a descarga da solenóide
(chave aberta, $$i_s>0$$), em função da tensão $$V_K$$ do diodo, a corrente
$$i_s$$ e dos parâmetros do circuito $$L$$ e $$R$$.

Quando $$V_K$$ é maior ou menor, como nos diodos de GaAs ou Germânio (veja
Fig. 1.18 de Boylestad e Nashelsky), a bobina se descarrega mais rápido ou mais
devagar? Nesse circuito, o que acontece com a energia armazenada na bobina, 
durante a descarga?

[instrumento musical]: https://youtu.be/W9j6ZRsOUrI?t=57s
[mini solenóide na Eletrodex]: http://www.eletrodex.com.br/mini-solenoid-12v-jf-0530b.html
[mini solenóide na Sparkfun]: https://www.sparkfun.com/products/11015
[umidade do solo]: https://www.sparkfun.com/products/13322
[válvula solenóide]: https://www.sparkfun.com/products/10456
[válvula solenóide na eletrogate]: https://www.eletrogate.com/valvula-solenoide-de-entrada-de-agua-180-1-2-12v-dc
[vid pg]: https://youtu.be/g1Ld8D2bnJM?t=106
[demonstração do MIT]: https://youtu.be/aSmMFog10D0