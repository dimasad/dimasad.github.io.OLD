---
layout: default
---

Mecânica do voo -- Equações do movimento longitudinal
=====================================================

Nesta seção iremos obter as equações do movimento para a dinâmica longitudinal
de um avião. É um modelo simplificado que será mais fácil de analisar e
exemplificará os principais conceitos que serão abordados na disciplina.

Definições básicas
------------------

Utilizaremos três sistemas de coordenadas na modelagem da aeronave. Mantendo
a convenção utilizada na mecânica do voo, o plano longitudinal é composto dos
eixos $$x$$ e $$z$$. O eixo $$y$$, que completa o sistema de coordenadas
cartesianas destrógiro, é ortogonal ao plano longitudinal. 

* Os eixos da terra, designados pelo subscrito $$E$$ (do inglês _earth_),
tem sua origem fixa em algum ponto arbitrário da terra, seu eixo $$x_E$$
horizontal apontando para o norte e seu eixo $$z_E$$ vertical apontando para
baixo.
* Os eixos do corpo, designados pelo subscrito $$B$$ (do inglês _body_) tem
sua origem fixa no C.G. do veículo, seu eixo $$x_B$$ alinhado com a condição
de voo nominal da aeronave e seu eixo $$z_B$$ ortogonal apontando para baixo.
* Os eixos do vento, designados pelo subscrito $$W$$ (do inglês _wind_) tem
sua origem fixa no C.G. do veículo e são obtidos rotacionando os eixos do corpo
de forma que o eixo $$x_W$$ esteja alinhado com a velocidade instantânea da
aeronave em relação à atmosfera.

Suposições
----------

Ao se derivar qualquer modelo, é importante lembrar que _todo_ modelo é uma
aproximação. O nível de detalhe e as aproximações feitas irão contribuir para
definir o envelope de validade do modelo. Se as aproximações deixarem de ser
válidas, o modelo poderá fornecer resultados diferentes do comportamento do
sistema. Cabe ao usuário sempre avaliar se as suposições são razoáveis ou não,
e posteriormente validar o modelo com ensaios no sistema.

Neste primeiro momento, faremos as seguintes considerações:

* a terra é plana e é um referencial inercial;
* a aeronave é um corpo rígido;
* o movimento da aeronave está restrito ao plano vertical;
* não há vento, ou seja, a velocidade da atmosfera em relação à terra é nula.


A suposição de terra plana é razoável para  analisar a dinâmica da aeronave
em escalas curtas de tempo, até alguns minutos. Para analisar a navegação de
a aeronaves em grandes distâncias é necessário levar em conta a curvatura
da terra. É razoável considerar a terra como um referencial inercial para o
voo de aeronaves subsônicas e transônicas. Apenas para números de Mach altos o
efeito da rotação da Terra se torna relevante. Já o efeito da rotação da Terra
ao redor do Sol só é relevante para dinâmica orbital no sistema solar.

A suposição de corpo rígido é mais dependente do tipo da aeronave. Planadores
e outras aeronaves de alto alongamento, por exemplo, geralmente possuem um
alto grau de flexibilidade estrutural. De qualquer jeito, a suposição de corpo
rígido geralmente representa bem o comportamento dominante do sistema e é
adequada para análises preliminares.

Por fim, a suposição de que o movimento da aeronave está restrito ao plano
vertical é bem razoável nas etapas do voo de subida, cruzeiro, descida e
aproximação inicial. Geralmente o plano longitudinal da aeronave,
$$x_B$$--$$z_B$$ é um plano de simetria, de forma que o eixo
$$y_B$$, perpendicular a este plano, é um eixo principal de inércia.
Dessa forma, não havendo forças ou momentos laterais é possível que o movimento
da aeronave se restrinja ao plano vertical.

A suposição de que não há vento é feita somente para simplificar nosso exemplo.
Com poucas alterações é possível considerar vento constante ou com variação
lenta.

Equações do movimento translacional
-----------------------------------


Equações do movimento rotacional
--------------------------------

