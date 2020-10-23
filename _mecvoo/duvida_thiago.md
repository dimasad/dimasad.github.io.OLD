---
layout: default
title: Mecânica do voo -- Resposta à dúvida no trabalho
---

{{ page.title }}
================

Ei Thiago,

vou demonstrar como calcular duas derivadas para você entender a lógica de como
funciona. Isso é mais ou menos como foi feito no Apêndice B.3 do livro, mas
eu vou tentar explicar com mais detalhe de onde vem cada passo e expressão.

A gente começa com a equação que quer linearizar. Para obter o modelo linear
no espaço de estados e as funções de transferência de uma aeronave, você pode
usar qualquer forma das equações do movimento: eixos do corpo, eixos do vento,
eixos da terra, eixos da estabilidade. Usar os eixos da estabilidade tem a
vantagem de que a conversão entre vento e corpo é trivial. De qualquer jeito,
o resultado final é sempre o mesmo, só a maneira de apresentar os resultados
é que muda. Isso é importante de se lembrar porque cada autor e livro fazem
esse procedimento de maneira ligeiramente diferente, mas equivalente. No meio
científico e profissional, é importante saber ler cada uma dessas formas e
entender como converter entre um formato e outro.

No modelo linear desenvolvido na seção 8.7 do livro do Durham, são linearizadas 
as equações do movimento em dois formatos: dimensional nos eixos do corpo e
adimensional nos eixos do vento. Vou considerar aqui o modelo dimensional nos
eixos do corpo, que foi o que eu pedi no trabalho. As equações do movimento
que vamos utilizar são a (7.2), (7.3) e (7.4). Como estamos considerando 
movimento estritamente longitudinal, essas equações podem ser simplificadas:

$$
\begin{align*}
  \dot u &=\frac Xm + \frac Tm - g\sin\theta - qw, \\
  \dot w &=\frac Zm - g\cos\theta + qu, \\
  \dot q &=\frac{\mathcal M}{I_y}, \\
  \dot \theta &= q.
\end{align*}
$$

Temos então que tomar a derivada parcial do lado direito de cada equação em 
relação a cada estado e entrada. O vetor de estados é

$$
\mathbf x = 
\begin{bmatrix}
u \\ w \\ q \\ \theta
\end{bmatrix},
$$

que é cada variável cuja derivada aparece nas equações do movimento. As entradas
são os comandos que eu assumo que vem de fora do sistema, as variáveis
_exógenas_. Essa questão da derivada parcial é uma coisa que confunde um pouco,
porque a gente muitas vezes escreve a equação de forma resumida, com termos como
$$X$$, $$Z$$, $$\mathcal M$$ e $$\bar q$$ que na verdade são funções dos 
estados. Tomar a derivada parcial significa que todas as dependências diretas
com o estado devem ser consideradas. Apesar disso, como a derivada é _parcial_,
somente um estado ou entrada são variados por vez, e os demais são mantidos
constantes.

Vamos considerar também as mesmas hipóteses para linearização que o livro-texto
no desenvolvimento da Eq. (8.15): $$\gamma_{\operatorname{Ref}} = 0 $$
(condição de referência do trabalho),
$$C_{L_{\dot \alpha}} = C_{m_{\dot \alpha}} = 0$$
(modelo do trabalho), e 
$$w_{\operatorname{Ref}} = \alpha_{\operatorname{Ref}} = 0$$
(eixos da estabilidade).
Chamando o lado direito da equação segunda equação do movimento de $$f_2$$,

$$
f_2(\mathbf x, \mathbf u) = \frac Zm - g\cos\theta + qu, 
$$

temos que 

$$
\frac{\partial f_2}{\partial w} = 
\frac 1m \frac{\partial Z}{\partial w},
$$

sendo todas as derivadas avaliadas na condição de referência. Para simplificar
nossa notação, em engenharia aeronáutica se dá um nome especial às derivadas
das forças e momentos aerodinâmicos: _derivadas de estabilidade e controle_.
A notação compacta é

$$
Z_w = \left.\frac{\partial Z}{\partial w}\right|_{\operatorname{Ref}},
$$

com subscrito designando derivada parcial. Como discutido na Seção 8.6.2 do
livro, essa convenção não é universal, uma outra linha usa a definição 

$$
Z_w = \frac 1m \left.\frac{\partial Z}{\partial w}\right|_{\operatorname{Ref}}
\qquad\text{(convenção alternativa)}.
$$

Obtendo a expressão da derivada $$Z_w$$
---------------------------------------

Vamos ver então como obter a expressão da derivada dimensional de estabilidade
$$Z_w$$, usando todas as considerações e definições apresentadas acima. O 
primeiro passo é expandir a expressão de $$Z$$. A partir das representações
da Seção 6.2 do livro, temos que 

$$
\begin{align*}
  Z &= \bar q S C_Z,\\
  \bar q &= \frac12 \rho V^2,\\
  V &= \sqrt{u^2 + w^2},\\
  C_Z &= -C_D \sin\alpha - C_L\cos\alpha.
\end{align*}
$$

Além disso, nosso modelo aerodinâmico é, desconsiderando os termos nulos,

$$
\begin{align*}
  C_D &= C_{D_0} + C_{D_\alpha}\alpha,\\
  C_L &= C_{L_0} + C_{L_\alpha}\alpha + C_{L_q}\hat q + 
  C_{L_{\delta_e}}\delta_e.\\
\end{align*}
$$

Agora, basta aplicar a regra da cadeia e regra do produto repetidamente para
a força aerodinâmica,

$$
\begin{align*}
  Z_w &= \frac{\partial Z}{\partial w}
  = \frac{\partial\bar q}{\partial w} S C_Z +
  \bar q S \frac{\partial C_Z}{\partial w}, \\
\end{align*}
$$

a pressão dinâmica

$$
\begin{align*}
  \frac{\partial\bar q}{\partial w}&= \rho w,
\end{align*}
$$

e o coeficientes aerodinâmicos

$$
\begin{align*}
  \frac{\partial C_Z}{\partial w} &= 
  -\frac{\partial C_D}{\partial w} \sin\alpha
  -C_D\cos\alpha\frac{\partial\alpha}{\partial w}
  -\frac{\partial C_L}{\partial w} \cos\alpha
  + C_L\sin\alpha \frac{\partial\alpha}{\partial w},
  \\
  \frac{\partial C_D}{\partial w} &= 
  C_{D_\alpha} \frac{\partial\alpha}{\partial w}.
\end{align*}
$$

A relação entre $$\alpha$$ e $$w$$ é mostrada na Eq. (7.9) do livro:

$$
\alpha = \operatorname{arc\,tan}(\tfrac{w}{u}),
$$

o que implica que 

$$
\begin{align*}
  \frac{\partial\alpha}{\partial w} &= \frac{u}{u^2 + w^2} = \frac{u}{V^2}. \\
\end{align*}
$$

Dá para ver que essas contas são, basicamente, um grande exercício de cálculo I.
E parece também que vai cada vez aumentando mais, porque a regra da cadeia
e regra do produto vão aumentando o número de expressões. No entanto, as
condições de referência simplificam bastante nossa expressão final:

$$
\begin{align*}
  \left.\frac{\partial\alpha}{\partial w}\right|_{\operatorname{Ref}}
  &= \frac{1}{V_{\operatorname{Ref}}} 
  \\
  \left.
  \frac{\partial C_D}{\partial w} 
  \right|_{\operatorname{Ref}}
  &= C_{D_\alpha}\frac{1}{V_{\operatorname{Ref}}}, 
  \\
  \left.
  \frac{\partial C_L}{\partial w} 
  \right|_{\operatorname{Ref}}
  &= C_{L_\alpha}\frac{1}{V_{\operatorname{Ref}}},
  \\
  \left.
  \frac{\partial C_Z}{\partial w}
  \right|_{\operatorname{Ref}}
   &= -C_{D_{\operatorname{Ref}}}\frac{1}{V_{\operatorname{Ref}}}
   -C_{L_{\alpha}}\frac{1}{V_{\operatorname{Ref}}}
  \\
  \left.
  \frac{\partial\bar q}{\partial w}
  \right|_{\operatorname{Ref}}
  &= 0 
  \\
  \left.
  \frac{\partial Z}{\partial w}
  \right|_{\operatorname{Ref}}
  &= 
  -\frac{\bar q_{\operatorname{Ref}} S}{V_{\operatorname{Ref}}}
  (C_{D_{\operatorname{Ref}}} + C_{L_{\alpha}}).
\end{align*}
$$

Observe que a última expressão é o elemento da terceira linha e primeira 
coluna da equação (8.9).
