---
layout: default
---

Uso de interrupções no Arduino
==============================

Interrupções são eventos que podem ser programados para, quando ocorrerem,
invocar uma função criada pelo usuário para tratá-los, a função de tratamento
de interrupção (_interrupt service routine_). Quando o evento ocorre, o
processador interrompe a execução do programa, salva seu estado na memória e
chama a função de tratamento. Quando a função de tratamento termina, o
processador restaura o estado salvo da memória e retoma a execução de onde foi
interrompido.

Essa funcionalidade é importante para resposta rápida a eventos assíncronos.
Eventos que geram interrupção são a recepção de pacotes nas interfaces de
comunicação (UART, I2C e SPI), término da conversão analógico-digital, estouro
de temporizadores, e mudança de estado de pinos. O uso de interrupções libera
o processador de monitorar constantemente certos pinos ou periféricos, o que é
conhecido como _espera ocupada_.

No entanto, certos cuidados são necessários ao se usar interrupções.
 - **Código curto:** para que o Arduino tenha um bom tempo de resposta e o
 comportamento do programa seja mais determinístico, é importante evitar
 processamento muito complexo ou códigos longos na função de tratamento de
 interrupção.
 - **Sincronização do acesso a variáveis compartilhadas:** para evitar conflito
 no acesso a variáveis compartilhadas entre o código síncrono e a função de
 tratamento de interrupções, é importante garantir que as interrupções estejam
 desabilitadas quando o código principal acessa essas variáveis. Isso é
 feito com as funções [noInterrupts] e [interrupts]. O código entre essas
 funções não pode ser interrompido, o que é chamado de seção crítica. Também é
 importante manter a duração dessas seções críticas o mais curto possível.

Exemplos de interrupções utilizando um botão
============================================

Abaixo temos alguns exemplos de como utilizar interrupções. Todos esses
exemplos utilizam a montagem abaixo. O pino 2 pode ser utilizado para gerar
interrupções quando seu estado muda de 0 para 1 (borda de subida, _rising_),
de 1 para 0  (borda de subida, _falling_), ou ambos (_both_). As interrupções
são configuradas com a função [attachInterrupt].

![](/schem/btn-interrupt.svg)


#### Exemplo: detecção de um evento com interrupções

Esse primeiro código é um teste simples das interrupções. Quando o botão for
pressionado (borda de subida), o texto `Evento!` será impresso na porta serial.
Abra o monitor serial e observe o funcionamento do programa.

**Importante:** não é boa prática o uso das funções `Serial.print` e
`Serial.println` de dentro da função de tratamento de interrupções. Em casos
mais complexos isso pode gerar problemas.

```
// Função de tratamento de interrupção
void evento() {
  Serial.println("Evento!");
}

void setup() {
  Serial.begin(230400);
  attachInterrupt(digitalPinToInterrupt(2), evento, RISING);
}

void loop() {
}

```

Como desafio, altere esse programa para imprimir o texto quando o botão é
liberado. Altere também o programa para imprimir o texto quando o botão é
pressionado e quando é liberado.

#### Exemplo: contagem de eventos de um botão

Esse código abaixo ilustra como usar uma seção crítica para compartilhar
informação entre a função de tratamento de interrupção e o programa principal.
O número de vezes que o botão foi pressionado é impresso na porta serial
periodicamente.

```
int num_evt = 0;

void evento() {
  num_evt++;
}

void setup() {
  Serial.begin(230400);
  attachInterrupt(digitalPinToInterrupt(2), evento, RISING);
}

void loop() {
  noInterrupts(); // Desabilita interrupções (início da seção crítica)
  int num_evt_copia = num_evt;
  interrupts();  // Reabilita interrupções  (fim da seção crítica)
  
  Serial.println(num_evt_copia);
  delay(100);
}
```


#### Exemplo: contagem de eventos de um botão com anti-repique

Botões mecânicos possuem repique o que faz com que o código anterior às vezes
registre mais de um evento quando o botão é pressionado uma única vez. Neste
exemplo, uma estratégia anti-repique é implementada no código de tratamento
de interrupções para resolver esse problema.

```
int num_evt = 0;
long millis_ultimo_evt = 0;

void evento() {
  if (millis() - millis_ultimo_evt > 5)
    num_evt++;
  
  millis_ultimo_evt = millis();
}

void setup() {
  Serial.begin(230400);
  attachInterrupt(digitalPinToInterrupt(2), evento, RISING);
}

void loop() {
  noInterrupts(); // Desabilita interrupções (início da seção crítica)
  int num_evt_copia = num_evt;
  interrupts();  // Reabilita interrupções  (fim da seção crítica)
  
  Serial.println(num_evt_copia);
  delay(100);
}
```

[attachInterrupt]: https://www.arduino.cc/en/Reference/AttachInterrupt
[interrupts]: https://www.arduino.cc/en/Reference/Interrupts
[noInterrupts]: https://www.arduino.cc/en/Reference/Interrupts
