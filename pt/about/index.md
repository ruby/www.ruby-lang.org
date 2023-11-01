---
layout: page
title: "Sobre o Ruby"
lang: pt
---

Já pensou porque é que o Ruby é tão popular? Os fãs dizem que é uma
linguagem elegante, repleta de arte. E no entanto, dizem que é prática e
conveniente. Afinal qual é o resultado?
{: .summary}

### Os Ideais do Criador do Ruby

O Ruby é uma linguagem com um cuidadoso equilíbrio. O seu criador,
[Yukihiro “Matz” Matsumoto][matz], uniu partes das suas linguagens
favoritas (Perl, Smalltalk, Eiffel, Ada e Lisp) para formar uma nova
linguagem que equilibra a programação funcional com a programação
imperativa.

Ele disse com frequência que está “tentando tornar o Ruby natural, não
simples”, de uma forma que reflita a vida.

Elaborando sobre isto, acrescenta:

> O Ruby é simples na aparência, mas muito complexo no interior, tal
> como o corpo humano<sup>[1](#fn1)</sup>.

### Sobre o Crescimento do Ruby

Desde que foi tornado público em 1995, o Ruby arrastou consigo
programadores devotos em todo o mundo. Em 2006, o Ruby atingiu aceitação
massiva, com a formação de grupos de usuários em todas as principais
cidades do mundo e com as conferências sobre Ruby com lotação esgotada.

A Ruby-Talk, a principal [lista de e-mails](/pt/community/mailing-lists/)
para a discussão sobre a
linguagem Ruby atingiu uma média de 200 mensagens diárias em 2006.
Recentemente a média caiu, já que o tamanho da comunidade distribuiu
as discussões de uma lista central em muitos grupos menores.

Ruby está posicionado entre no top 10 da maioria dos índices que medem o
crescimento da popularidade de linguagens de programação pelo mundo todo
(tais como o [índice TIOBE][tiobe]). Muito deste crescimento é atribuído à
popularidade de softwares escritos em Ruby, em particular o framework de
desenvolvimento web [Ruby on Rails][ror].

O Ruby também é [totalmente livre]({{ site.license.url }}). Não somente livre de
custos, mas também livre para utilizar, copiar, modificar e distribuir.

### Ver Tudo como um Objeto

Inicialmente, Matz estudou outras linguagens em busca de encontrar uma
sintaxe ideal. Recordando a sua busca, disse, “Eu queria uma linguagem
interpretada que fosse mais poderosa do que Perl e mais orientada as
objetos do que Python<sup>[2](#fn2)</sup>.”

Em Ruby, tudo é um objeto. Cada parcela de informação e código podem
receber as suas próprias propriedades e ações. A Programação orientada
a objetos denomina as propriedades como *variáveis de instância* e as
ações como *métodos*. A aproximação pura, da orientação aos objetos do
Ruby, é geralmente demonstrada pelo seguinte trecho de código que
aplica uma ação a um número.

{% highlight ruby %}
5.times { print "Nós *amamos* o Ruby -- ele é fantástico!" }
{% endhighlight %}

Em muitas linguagens, números e outros tipos primitivos não são
objetos. O Ruby segue a influência da linguagem Smalltalk em atribuir
métodos e variáveis de instância a todos os seus tipos. Esta abordagem
facilita a utilização do Ruby, uma vez que as regras que se aplicam aos
objetos aplicam-se a tudo em Ruby.

### A Flexibilidade do Ruby

O Ruby é visto como uma linguagem flexível, uma vez que permite aos seus
utilizadores alterar partes da linguagem. Partes essenciais do Ruby
podem ser removidas ou redefinidas à vontade. Partes existentes podem
ser acrescentadas. O Ruby tenta não restringir o programador.

Por exemplo, a adição é realizada com o operador mais (`+`). Mas, se
preferir utilizar a palavra escrita `plus`, poderia adicionar esse
método à classe nativa do Ruby `Numeric`.

{% highlight ruby %}
class Numeric
  def plus(x)
    self.+(x)
  end
end

y = 5.plus 6
# y agora é igual a 11
{% endhighlight %}

Os operadores do Ruby são açúcar sintático para métodos. Você também
pode redefini-los.

### Blocos, uma Característica Verdadeiramente Expressiva

Os blocos do Ruby são vistos como uma fonte de grande flexibilidade. Um
programador pode adicionar uma _closure_ a qualquer método, descrevendo como
esse método deve se comportar. A _closure_ é chamada de *bloco* e tornou-se uma
das características mais populares para os recém chegados ao Ruby vindos
de outras linguagens imperativas como o PHP ou o Visual Basic.

Os blocos são inspirados nas linguagens funcionais. Matz disse, “nas
_closures_ em Ruby, eu quis respeitar a cultura do
Lisp<sup>[3](#fn3)</sup>”.

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

No código acima, o bloco é descrito dentro do trecho `do ... end`.
O método `map` aplica o bloco à lista de palavras fornecida.
Existem muitos outros métodos em Ruby que deixam em aberto a
possibilidade para o programador escrever o seu próprio bloco que
complete os detalhes do que esse método deveria fazer.

### Ruby e o _Mixin_

De forma diferente a muitas linguagens de programação orientadas a
objeto, o Ruby suporta somente herança simples, **propositadamente**.
Mas em Ruby existe o conceito de módulos (chamados categorias em
Objective-C). Os módulos são coleções de métodos.

As classes podem fazer o _mixin_ de um modulo e receber todos os métodos do
módulo diretamente. Por exemplo, qualquer classe que implemente o método
`each` pode fazer o _mixin_ do módulo `Enumerable`, que adiciona um conjunto de
métodos que utilizam `each` para iterar.

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

Geralmente os programadores de Ruby vêm esta abordagem como uma forma
muito mais clara do que a herança múltipla, que é complexa e pode ser
demasiado restritiva.

### A Aparência Visual do Ruby

Apesar de o Ruby utilizar frequentemente pontuação muito limitada e
geralmente preferir palavras em inglês, alguma pontuação é utilizada
para decorar o Ruby. O Ruby não necessita de declarações de variáveis.
Usa simples convenções de nomes para denotar o âmbito das variáveis.

* `var` poderia ser uma variável local.
* `@var` é uma variável de instância.
* `$var` é uma variável global.

Estes símbolos facilitam a leitura do código, permitindo ao programador
identificar facilmente o papel de cada variável. Também deixa de ser
necessário acrescentar um fastidioso sufixo `self.` a cada membro de uma
instância.

### Além do Básico

O Ruby é rico em outras características, entre as quais se destacam as
seguintes:

* Capacidade de tratamento de exceções, tal como em Java ou Python, de
  forma a facilitar o tratamento de erros.

* Um verdadeiro _garbage collector_ _mark-and-sweep_ para todos os objectos
  Ruby. Não é necessário manter contadores de referência em bibliotecas
  de extensão (_extension libraries_). Tal como Matz diz, “Isto é melhor
  para a sua saúde.”

* Escrever extensões C em Ruby é mais fácil do que em Perl ou Python,
  com uma API refinada para chamar Ruby a partir do código C. Isto inclui
  chamadas para embutir Ruby em software externo, para utilizá-lo como
  uma linguagem interpretada dentro do software. Uma interface SWIG também
  se encontra disponível.

* O Ruby pode carregar bibliotecas de extensão (_extension libraries_)
  dinamicamente se o Sistema Operacional permitir.

* O Ruby é altamente portável: é desenvolvido principalmente em ambiente
  GNU/Linux, mas trabalha em muitos tipos de ambientes UNIX, macOS,
  Windows, etc.

### Outras Implementações do Ruby

O Ruby, como uma linguagem, tem algumas implementações diferentes. Esta
página tem discutido a implementação de referência, frequentemente chamada
pela comunidade de **MRI** (“_Matz’s Ruby Interpreter_”, o "Interpretador de
Ruby do Matz") ou **CRuby** (já que é escrito em C), mas também existem outras.
Elas muitas vezes são úteis em determinadas situações, fornecem integração
adicional a outras linguagens ou ambientes, ou têm características especiais
que o MRI não possui.

Segue uma lista:

* [JRuby][jruby] é Ruby sobre a JVM (_Java Virtual Machine_), utilizando os
  compiladores otimizados JIT da JVM, _garbage collectors_, threads
  concorrentes, seu ecossistema de ferramentas e sua vasta coleção de
  bibliotecas.
* [Rubinius][rubinius] é “Ruby escrito em Ruby”. Construído em cima da LLVM,
  Rubinius utiliza uma elegante máquina virtual sobre a qual outras
  linguagens também estão sendo construídas.
* [mruby][mruby] é uma implementação leve da linguagem Ruby que pode ser
  vinculada e embutida em uma aplicação. Seu desenvolvimento é conduzido
  pelo criador do Ruby, Yukihiro “Matz” Matsumoto.

### Referências

<sup>1</sup> Matz, falando na lista de e-mails Ruby-Talk, [12 Mai.
2000][blade].
{: #fn1}

<sup>2</sup> Matz, em [An Interview with the Creator of Ruby][linuxdevcenter], 29
Nov. 2001.
{: #fn2}

<sup>3</sup> Matz, em [Blocks and Closures in Ruby][artima], 22 December
2003.
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: https://blade.ruby-lang.org/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
[jruby]: http://jruby.org
[rubinius]: http://rubini.us
[mruby]: http://www.mruby.org/
