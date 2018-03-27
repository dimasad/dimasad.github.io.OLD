---
layout: default
title: Mecânica do voo -- Simulação de sistemas dinâmicos
---

{{ page.title }}
================
{:.no_toc}

Nesta página será detalhado como realizar a simulação de sistemas dinâmicos 
com alguns sistemas computacionais, em especial o Matlab. No entanto, vale 
ressaltar que as idéias básicas são as mesmas para qualquer linguagem de
programação.

**Índice:**
* ítem 1
* ítem 2
{:toc}


Sistemas de exemplo
-------------------

Os sistema que será simulado nos exemplos é o [oscilador de Duffing], um sistema
caótico muito utilizado na análise de sistemas não lineares.


Implementação em Matlab
-----------------------


Implementação em Julia
----------------------

Exitem alguns pacotes em Julia para simulação de sistemas dinâmicos. Neste
exemplo, será utilizado o pacote `OrdinaryDiffEq`. Esse pacote pode ser
instalado com o comando abaixo na linha de comando do Julia.

```julia
Pkg.add("OrdinaryDiffEq")
```

Os gráficos deste exemplo serão gerados com a biblioteca `Gadfly`, que pode
ser instalado com o comando abaixo.

```julia
Pkg.add("OrdinaryDiffEq")
```

Para mais informações sobre a instalação de pacotes no Julia veja a documentação
oficial da [instalação de pacotes].

[tutorial de indexação]: https://www.mathworks.com/help/matlab/learn_matlab/array-indexing.html
[artigo sobre indexação]: https://www.mathworks.com/company/newsletters/articles/matrix-indexing-in-matlab.html
[instalação de pacotes]: https://docs.julialang.org/en/stable/manual/packages/
[oscilador de Duffing]: http://www.scholarpedia.org/article/Duffing_oscillator