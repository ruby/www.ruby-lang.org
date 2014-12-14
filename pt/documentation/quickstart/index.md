---
layout: page
title: "Ruby em Vinte Minutos"
lang: pt

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Parte 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Parte 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Parte 4">4</a>
  </div>
  <h1>Ruby em Vinte Minutos</h1>

---

## Introdução

Este é um pequeno tutorial de Ruby que não deverá demorar mais de 20
minutos a completar. Assume-se á partida que já tem o Ruby instalado.
(Se não tem o Ruby no seu computador, faça o [download](/pt/downloads/)
e instale-o antes de começar.)

## Ruby Interactivo

Abrir o IRB.

* Se está a usar **Mac OS X** abra o `Terminal`, escreva `irb`, e depois
  pressione a tecla enter.
* Se está a usar **Linux**, abra uma shell e escreva `irb`, seguido de
  enter.
* Se está a usar **Windows**, abra `Interactive Ruby` a partir do atalho
  para o Ruby no seu menu Iniciar.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

Ok, abriu. E agora?

Escreva isto: `"Ola Mundo"`

{% highlight irb %}
irb(main):001:0> "Ola Mundo"
=> "Ola Mundo"
{% endhighlight %}

## O Ruby obedeceu-lhe!

O que é que sucedeu? Será que acabamos de escrever o mais pequeno
programa «Olá mundo»? Não exactamente, a segunda linha é a forma de o
IRB nos dizer qual o resultado da última expressão que avaliou. Se
desejarmos imprimir «Ola Mundo» necessitamos de um pouco mais:

{% highlight irb %}
irb(main):002:0> puts "Ola Mundo"
Ola Mundo
=> nil
{% endhighlight %}

`puts` é o comando básico para imprimir algo em Ruby. Mas então o que é
aquele `=> nil` ? É o resultado da expressão. `puts` retorna sempre nil,
o que em Ruby é o valor que representa o nada absoluto.

## Uma Máquina Calculadora gratuita

Já temos neste momento conhecimento suficiente para utilizar o IRB como
uma calculadora básica:

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

Três mais dois. Suficientemente fácil. E então três *vezes* dois? Pode
escrevê-lo, é suficientemente curto, mas também podemos voltar atrás e
mudar o que acabamos de inserir. Carregue na tecla **Seta para cima** do
teclado e veja se tal o leva à linha com `3+2`. Se tal suceder, use a
tecla da seta para a esquerda para mover o cursor para a frente do sinal
de mais `+` e depois use a tecla de backspace para mudar o sinal para
`*`.

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

De seguida vamos tentar três ao quadrado:

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

Em Ruby `**` é a forma de dizer potência de. Mas o que acontece quando
queremos saber o inverso disto ou seja a raiz quadrada de algo?

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

Muito bem, o que aconteceu aqui atrás? Se disse “que estava a determinar
a raiz quadrada de nove” então está correcto. Mas vejamos as coisas com
mais pormenor. Primeiro de tudo, o que é `Math`?

## Módulos, Agrupar Código por Tópico

`Math` é um módulo nativo para funções matemáticas. Os módulos têm dois
papeis em Ruby. Este é um desses papeis: agrupar métodos semelhantes em
conjunto sobre um nome familiar. `Math` também contém métodos como
`sin()` e `tan()`.

Depois segue-se um ponto final. O que faz o ponto? O ponto final é como
se identifica o receptor de uma mensagem. Qual é a mensagem? Neste caso
é `sqrt(9)`, o que significa chamar o método `sqrt`, uma abreviatura em
língua inglesa para “square root (raiz quadrada)” com o parâmetro `9`.

O resultado desta chamada de método é o valor `3.0`. Se repararmos bem,
o resultado não é apenas `3`. Mas isso deve-se ao facto da raiz quadrada
de um número na maioria dos casos não ser um inteiro e, assim sendo, o
método retorna sempre um número de vírgula flutuante.

E se nos quisermos lembrar do resultado desta matemática toda? Podemos
atribuir o resultado a uma variável.

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

Como calculadora isto é muito bom mas nós estamos a afastarmos-nos da
mensagem mais tradicional `Ola Mundo` que os guias de iniciação
normalmente focam… [portanto vamos voltar ao assunto.](2/)

