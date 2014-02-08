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

O Ruby é uma linguagem com um equilíbrio cuidado. O seu criador,
[Yukihiro “Matz” Matsumoto][matz], uniu partes das suas linguagens
favoritas (Perl, Smalltalk, Eiffel, Ada, e Lisp) para formar uma nova
linguagem que equilibra a programação funcional com a programação
imperativa.

Ele disse com frequência que está a “tentar tornar o Ruby natural, não
simples”, de uma forma que reflicta a vida.

Elaborando sobre isto, acrescenta:

> O Ruby é simples na aparência, mas muito complexo no interior, tal
> como o corpo humano<sup>[1](#fn1)</sup>.

### Sobre o Crescimento do Ruby

Desde que foi tornado público em 1995, o Ruby arrastou consigo
programadores devotos em todo o mundo. Em 2006, o Ruby atingiu aceitação
massiva, com a formação de grupos de utilizadores em todas as principais
cidades mundiais e com as conferências sobre Ruby com lotação esgotada.

![Graph courtesy of
Gmane.](http://gmane.org/plot-rate.php?group=gmane.comp.lang.ruby.general&amp;width=320&amp;height=160&amp;title=Ruby-Talk+Activity
"Graph courtesy of Gmane."){: style="padding-left:8px;"}
{: style="float:right"}

A Ruby-Talk, a principal [lista de
correio](/pt/community/mailing-lists/) para a discussão sobre a
linguagem Ruby subiu para uma média de 200 mensagens diárias.

O [índice TIOBE][tiobe], que mede o crescimento das linguagens de programação,
posiciona o Ruby em #12 entre as linguagens de programação. Citando o
seu crescimento, prevêm que “Existem possibilidades de que o Ruby entre
no Top 10 dentro de meio ano.” Muito deste crescimento é atribuído à
popularidade do software escrito em Ruby, em particular a framework de
desenvolvimento web [Ruby on Rails][ror].

O Ruby é também [totalmente livre]({{ site.license.url }}). Não somente livre de
custos, mas também livre para utilizar, copiar, modificar e distribuir.

### Vêr Tudo como um Objecto

Inicialmente, Matz estudou outras linguagens em busca de encontrar uma
sintaxe ideal. Recordando a sua busca, disse, “Eu queria uma linguagem
interpretada que fosse mais poderosa que o Perl e mais orientada aos
objectos do que o Python<sup>[2](#fn2)</sup>.”

Em Ruby, tudo é um objecto. Cada parcela de informação e código podem
receber as suas próprias propriedades e acções. A Programação orientada
aos objectos denomina as propriedades como *variáveis de instância* e as
acções como *métodos*. A aproximação pura, da orientação aos objectos do
Ruby, é geralmente demonstrada pelo seguinte excerto de código que
aplica uma acção a um número.

{% highlight ruby %}
5.times { print "Nós *amamos* o Ruby -- é fantástica!" }
{% endhighlight %}

Em muitas linguagens, números e outros tipos primitivos não são
objectos. O Ruby segue a influência da linguagem Smalltalk em atribuir
métodos e variáveis de instância a todos os seus tipos. Esta abordagem
facilita a utilização do Ruby, uma vez que as regras que se aplicam aos
objectos aplicam-se a tudo em Ruby.

### A Flexibilidade do Ruby

O Ruby é visto como uma linguagem flexível, uma vez que permite aos seus
utilizadores alterar partes da Linguagem. Partes essenciais do Ruby
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
# y is now equal to 11
{% endhighlight %}

Os Operadores do Ruby são `açúcar sintático` para os métodos, também
podem ser redefinidos.

### Blocos, uma Caracteristica Verdadeiramente Expressiva

Os Blocos do Ruby são vistos como uma fonte de grande flexibilidade. Um
programador pode adicionar um fecho a qualquer método, descrevendo como
esse método se deve comportar. O fecho é chamado *bloco* e tornou-se uma
das características mais populares para os recém chegados ao Ruby vindos
de outras linguagens imperativas como o PHP ou o Visual Basic.

Os Blocos são inspirados nas linguagens funcionais. O Matz disse, “nos
fechos em Ruby, Eu quis respeitar a cultura do
Lisp<sup>[3](#fn3)</sup>”.

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

No código aqui apresentado, o bloco é descrito dentro do trecho `do ...
end`. O método `map` aplica o bloco à lista de palavras fornecida.
Existem muitos outros métodos em Ruby que deixam em aberto a
possibilidade para o programador escrever o seu próprio bloco que
complete os detalhes do que esse método deveria fazer.

### O Ruby e o ‘Mixin’

De forma diferente a muitas linguagens de programação orientadas aos
objectos, o Ruby suporta somente herança simples, **propositadamente**.
Mas em Ruby existe o conceito de módulos (chamados categorias em
Objective-C). Os módulos são colecções de métodos.

As Classes podem ‘mixin’ um modulo e receber todos os métodos do módulo
directamente. Por exemplo, qualquer classe que implemente o método
`each` pode ‘mixin’ o módulo `Enumerable`, que adiciona um conjunto de
métodos que utilizam `each` para iterar.

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

Geralmente os programadores de Ruby, vêm esta abordagem como uma forma
muito mais clara do que a herança múltipla, que é complexa e pode ser
demasiado restrictiva.

### A Aparência Visual do Ruby

Apesar de o Ruby utilizar frequentemente pontuação muito limitada e
geralmente preferir palavras em Inglês, alguma pontuação é utilizada
para decorar o Ruby.O Ruby não necessita de declarações de variáveis.
Usa simples convenções de nomes para denotar o âmbito das variáveis.

* `var` poderia ser uma variável local.
* `@var` é uma variável de instância.
* `$var` é uma variável global.

Estes símbolos facilitam a leitura do código, permitindo ao programador
identificar facilmente o papel de cada variável. Deixando ainda de ser
necessário acrescentar um fastidioso sufixo `self.` a cada membro de uma
instância.

### Para Além do Básico

O Ruby é rico em outras características, entre as quais se destacam as
seguintes:

* Capacidade de tratamento de excepções, tal como o Java ou Python, por
  forma a facilitar o tratamento de erros.

* Um verdadeiro mark-and-sweep garbage collector para todos os objectos
  Ruby. Não é necessário manter contadores de referência em bibliotecas
  de extensão (extension libraries). Tal como Matz diz, “Isto é melhor
  para a sua saúde.”

* Escrever extensões C em Ruby é mais fácil do que em Perl ou Python,
  com uma API refinada para chamar Ruby desde o código C. Isto inclui
  chamadas para embeber Ruby em software externo por forma a ser
  utilizado como uma linguagem interpretada dentro do software. Uma
  interface SWIG também se encontra disponível.

* O Ruby pode carregar bibliotecas de extensão (extension libraries)
  dinamicamente se um Sistema Operativo o permitir.

* O Ruby tem um sistema de threading independente do Sistema Operativo.
  Portanto, para todas as plataformas nas quais o Ruby corre, temos
  multithreading, independentemente de o Sistema Operativo o suportar ou
  não, até em MS-DOS temos multithreading!

* O Ruby é altamente portável: é desenvolvido principalmente em ambiente
  GNU/Linux, mas trabalha em muitos tipos de ambientes UNIX, Mac OS X,
  Windows 95/98/Me/NT/2000/XP, DOS, BeOS, OS/2, etc.

### Referências

<sup>1</sup> Matz, falando na lista de correio Ruby-Talk, [12 Mai.
2000][blade].
{: #fn1}

<sup>2</sup> Matz, em [An Interview with the Creator of Ruby][linuxdevcenter], 29
Nov. 2001.
{: #fn2}

<sup>3</sup> Matz, em [Blocks and Closures in Ruby][artima], 22 December
2003.
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
