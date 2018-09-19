---
layout: default
title: Eletrônica -- Trabalho 1
---

{{page.title}}
==============

Considere a ponte de diodos do circuito abaixo. Esse circuito é muito utilizado
para retificação de corrente alternada e está disponível como circuito integrado
em vários encapsulamentos. Um exemplo de CI com uma ponte desse estilo é o 
[DF005S].

{%
   include figure.html
   file="ponte-diodo.svg"
   img_style="width: 60%"
   caption="Ponte de diodos."
%}

O presente trabalho consiste em um estudo dirigido para análise dessa circuito
de modo a entender melhor seu funcionamento.

### Diodo ideal, entrada $$v_e = 5 \si{V}$$

Considere inicialmente que os diodos são ideais. Para a tensão de entrada
$$v_e = 5 \si{V}$$:

* quais diodos irão conduzir e quais estarão em corte?
* Qual a tensão de saída na carga, $$v_s$$?

### Diodo ideal, entrada $$v_e = -5 \si{V}$$

Considerando os diodos ideais e a tensão de entrada $$v_e = -5 \si{V}$$,

* quais diodos irão conduzir e quais estarão em corte?
* Qual a tensão de saída na carga, $$v_s$$?

### Modelo simplificado do diodo, entrada $$v_e = 5 \si{V}$$

Considere agora o modelo simplificado (constante por partes) do diodo.
Para a tensão de entrada $$v_e = 5 \si{V}$$, qual a tensão de saída na carga,
$$v_s$$?

### Modelo simplificado do diodo, entrada $$v_e = -5 \si{V}$$

Utilizando o modelo simplificado (constante por partes) do diodo, para a tensão
de entrada $$v_e = -5 \si{V}$$, qual a tensão de saída na carga, $$v_s$$?

### Curva de entrada x saída

Esboce o gráfico de $$v_s$$ em função de $$v_e$$ para o diodo ideal e para
o diodo constante por partes, para tensões de entrada $$v_e$$ entre 
$$-5 \si{V}$$ e 5 \si{V}$$.

Entrega
-------

A atividade deverá ser entregue por escrito na sala de aula no dia 03 de 
outubro de 2018.


[DF005S]: https://www.vishay.com/docs/88573/dfs.pdf
