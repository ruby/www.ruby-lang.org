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
minutos para completar. Ele presume que você já tem o Ruby instalado.
(Se não tiver o Ruby no seu computador, faça o [download][installation]
e instale-o antes de começar.)

## Ruby Interativo

O Ruby vem com um programa que mostrará os resultados de quaisquer
instruções que você digitar. Brincar com código Ruby em sessões interativas
como essa é um jeito formidável de aprender a linguagem.

Abra o IRB (que significa _Interactive Ruby_).

* Se estiver usando **macOS** abra o `Terminal`, escreva `irb`, e depois
  pressione a tecla enter.
* Se estiver usando **Linux**, abra um shell e escreva `irb`, seguido de
  enter.
* Se estiver usando **Windows**, abra `Interactive Ruby` a partir do atalho
  para o Ruby no seu menu Iniciar.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

Ok, ele abriu. E agora?

Escreva isto: `"Ola Mundo"`

{% highlight irb %}
irb(main):001:0> "Ola Mundo"
=> "Ola Mundo"
{% endhighlight %}

## O Ruby te Obedeceu!

O que é que aconteceu? Será que acabamos de escrever o menor
programa de “Olá mundo” do mundo? Não exatamente, a segunda linha é a forma do
IRB nos dizer qual o resultado da última expressão que ele avaliou. Se
desejarmos imprimir “Ola Mundo”, necessitamos de um pouco mais:

{% highlight irb %}
irb(main):002:0> puts "Ola Mundo"
Ola Mundo
=> nil
{% endhighlight %}

`puts` é o comando básico para imprimir algo em Ruby. Mas então o que é
aquele `=> nil` ? É o resultado da expressão. `puts` sempre retorna nil,
que em Ruby é o valor que representa o nada absoluto.

## Sua Calculadora Gratuita está Aqui!

Já temos neste momento conhecimento suficiente para utilizar o IRB como
uma calculadora básica:

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

Três mais dois. Muito fácil. Mas e três *vezes* dois? Você pode
escrevê-lo, é suficientemente curto, mas também podemos voltar atrás e
mudar o que acabamos de inserir. Pressione **Seta para cima** no
teclado e veja se ele o leva à linha com `3+2`. Se isso acontecer, use a
tecla da seta para a esquerda para mover o cursor para a frente do sinal
de `+` e depois use a tecla de backspace para mudar o sinal para `*`.

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

Em seguida vamos tentar três ao quadrado:

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

Em Ruby `**` é a forma de dizer “a potência de”. Mas o que acontece quando
queremos saber o inverso disto, ou seja, a raiz quadrada de algo?

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

Muito bem, o que aconteceu aqui? Se você achou que ele “estava descobrindo
a raiz quadrada de nove” então está correto. Mas vejamos as coisas com
mais detalhes. Primeiramente, o que é `Math`?

## Módulos Agrupam Código por Tópicos

`Math` é um módulo nativo para funções matemáticas. Os módulos têm dois
papeis em Ruby. Este é um desses papeis: agrupar métodos semelhantes sob
um nome familiar. `Math` também contém métodos como `sin()` e `tan()`.

Depois segue-se um ponto. O que faz o ponto? O ponto é como
se identifica o receptor de uma mensagem. Qual é a mensagem? Neste caso
é `sqrt(9)`, o que significa chamar o método `sqrt`, uma abreviatura em
língua inglesa para “square root” (raiz quadrada) com o parâmetro `9`.

O resultado desta chamada de método é o valor `3.0`. Se repararmos bem,
o resultado não é apenas `3`. Mas isso deve-se ao fato de que a raiz quadrada
de um número na maioria dos casos não é um inteiro e, assim sendo, o
método retorna sempre um número de ponto flutuante.

E se nós quisermos lembrar do resultado dessa matemática toda? Podemos
atribuir o resultado a uma variável.

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

Como calculadora isto é muito bom, mas nós estamos nos afastando da
mensagem tradicional de `Ola Mundo` em que os tutoriais para iniciantes
normalmente focam… [portanto vamos voltar ao assunto.](2/)

[installation]: /pt/documentation/installation/
