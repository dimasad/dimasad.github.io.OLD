---
layout: default
title: Eletrônica -- Exercício
---

{{page.title}}
==============

#### Análise e dimensionamento de circuitos com transistores NPN

O objetivo deste exercício é analisar e dimensionar dois circuitos com 
transistores bipolares do tipo NPN: um operando no modo ativo, como amplificador
de corrente para acionamento de um LED de potência; e outro no modo de
saturação, como chave para acionamento de um resistor de aquecimento. Para
isso será necessário o cálculo das correntes e quedas de tensão no circuito,
e escolha do valor das resistores para que o circuito opere corretamente.

Seguidor de emissor
-------------------

O primeiro circuito consiste em um seguidor de emissor para acionamento
de um LED de potência modelo [VLWR9632], da [Vishay], cuja corrente nominal é
de 70mA, bem acima do máximo que o Arduino pode suprir por seus pinos de saída
digital. A configuração seguidor de emissor é uma boa opção para o acionamento
desse circuito pois é simples e oferece um bom ganho de corrente, por operar
no modo ativo. O diagrama de circuito está mostrado na figura abaixo,
onde é utilizado o transistor NPN [BC549].

{%
   include figure.html
   file="led-seg-emissor.svg"
   img_style=""
   caption="Diagrama de circuito para acionamento de um LED de alta
            potência utilizando um transistor NPN na configuração de
            seguidor de emissor."
%}

Para esse circuito:

- Escolha o valor de $$R$$ para acionar o LED com sua corrente nominal
  quando a saída do Arduino estiver em nível lógico alto, 5V.
- Estime a corrente de base $$i_B$$ quando o LED estiver aceso.
- Estime as correntes e quedas de tensão no LED e resistor no caso típico.
- Estime a potência dissipada no transistor. Esse valor é aceitável, de acordo
  com as informações da [folha de dados][BC549]?

Transistor como chave
---------------------

O segundo circuito consiste no acionamento de um resistor de aquecimento 
$$R_a$$ com um transistor NPN [BC639] operando como chave, 
utilizando um Arduino, como mostrado na figura abaixo. Esse circuito pode ser 
utilizado, por exemplo, para o controle térmico de um nanosatélite. Observe que
a porta digital do Arduino, de 5V, é utilizada para chavear uma tensão de 12V
no resistor.

{%
   include figure.html
   file="npn-r-aquecimento.svg"
   img_style=""
   caption="Diagrama de circuito para acionamento de um resistor de aquecimento
            utilizando um transistor NPN operando como chave, nos modos de
            saturação e corte."
%}

Para esse circuito:

- Dimensione o resistor de base $$R_B$$ para que, quando a saída do Arduino
  estiver em nível lógico alto, o transistor opere no modo de saturação. 
  Considere que $$R_a=28\si{\ohm}$$ e utilize as informações da 
  [folha de dados][BC639] do transistor.

[BC549]: /datasheet/BC549_npn.pdf
[BC639]: /datasheet/BC639.pdf
[Vishay]: https://www.vishay.com/
[VLWR9632]: https://www.vishay.com/docs/81818/vlwr963.pdf


