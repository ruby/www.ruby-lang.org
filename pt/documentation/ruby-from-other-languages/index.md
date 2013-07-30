---
layout: page
title: "Ruby a Partir de Outras Linguagens"
lang: pt
---

Quando olha pela primeira vez para um pedaço de código Ruby,
lembrar-se-á, muito provavelmente, de outras linguagens de programação
que já utilizou. Isto é de propósito. Muita da sintaxe é familiar a
utilizadores de Perl, Python e Java (entre outras linguagens). Assim
sendo, se já usou alguma delas, aprender Ruby será muito fácil.

Este documento contém duas secções principais. A primeira, tenta ser um
sumário introdutório daquilo que poderá esperar enquanto muda de uma
linguagem *X* para Ruby. A segunda secção encarrega-se das
características principais da linguagem e como elas se comparam com
aquilo que já se encontra familiarizado.

## O Que Esperar: *Linguagem X* para Ruby

* [Para Ruby a partir de C e
  C++](/pt/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp/)
^

* [Para Ruby a partir de
  Java](/pt/documentation/ruby-from-other-languages/to-ruby-from-java/)
^

* [Para Ruby a partir de
  Perl](/pt/documentation/ruby-from-other-languages/to-ruby-from-perl/)
^

* [Para Ruby a partir de
  PHP](/pt/documentation/ruby-from-other-languages/to-ruby-from-php/)
^

* [Para Ruby a partir de
  Python](/pt/documentation/ruby-from-other-languages/to-ruby-from-python/)

## Características Importantes da Linguagem e Algumas Notas

Aqui ficam alguns apontamentos e dicas das principais características
que irá encontrar enquanto vai aprendendo Ruby.

### Iterações

Duas características do Ruby são um pouco diferentes daquilo que já
alguma vez viu, e é necessário algum tempo para se habituar a elas:
“blocos” e iteradores. Em vez de fazer um ciclo sobre um índice (como no
C, C++, ou Java pre-1.5), ou sobre uma lista (como o <tt>for (@a)
\{...}</tt> do Perl ou <tt>for i in Lista: ...</tt> do Python, em Ruby
irá frequentemente ver

{% highlight ruby %}
alguma_lista.each do |este_item|
  # Estamos dentro do bloco.
  # tratamos este_item.
end
{% endhighlight %}

Para mais informação sobre o mé `each` (e `collect`, `find`, `inject`,
`sort`, etc.), Ver `ri Enumerable` (e depois <tt>ri
Enumerable#*nome\_da\_função*</tt>).

### Tudo tem um valor

Não existe diferença entre uma expressão e uma declaração. Tudo tem um
valor, mesmo que seja **nil**. Isto é possível:

{% highlight ruby %}
x = 10
y = 11
z = if x < y
  true
else
  false
end
z # => true
{% endhighlight %}

### Símbolos não são Strings

Muitos principiantes de Ruby lutam por perceber o que são símbolos e
para quê que podem ser utilizados.

Símbolos podem ser descritos como identidades. Um símbolo é tudo sobre
**quem** é, não sobre **o que** é. Arranque o `irb` e veja a diferença:

{% highlight ruby %}
irb(main):001:0> :jorge.object_id == :jorge.object_id
=> true
irb(main):002:0> "jorge".object_id == "jorge".object_id
=> false
irb(main):003:0>
{% endhighlight %}

Os métodos *`object_id`* retornam a identidade de um Objecto. Se dois
objectos têm o mesmo *`object_id`*, então são o mesmo (apontam para o
mesmo objecto em memória).

Como pode verificar quando utilizou pela primeira vez um símbolo,
qualquer símbolo com os mesmos caracteres referencia o mesmo objecto em
memória. Para quaisquer dois símbolos que representem os mesmos
caracteres os *`object_id`* são os mesmos.

Agora atente na *String*(“jorge”). Os *`object_id`* não são os mesmos.
Isto significa que referenciam dois objectos diferentes em memória.
Sempre que se utiliza uma nova String, o Ruby faz alocação de memória
para esta.

Se tiver dúvidas na utilização entre um símbolo e uma *String*,
considere o que é mais importante: a identidade de um objecto (p.e.
chave da tabela de Hashing), ou os conteúdos (no exemplo acima,
“jorge”).

### Tudo é um objecto

“Tudo é um Objecto” não é só uma hipérbole. Mesmo as classes e os
inteiros são objectos e poderá fazer o mesmo com eles o mesmo que faz
com qualquer outro objecto:

{% highlight ruby %}
# Isto e' o mesmo que
# class AMinhaClasse
#   attr_accessor :variavel_de_instancia
# end
AMinhaClasse = Class.new do
  attr_accessor :variavel_de_instancia
end
{% endhighlight %}

### Constantes Variáveis

As constantes não são verdadadeiramente constantes. Se modificar uma
constante já inicializada, activar-se-á um aviso, mas o seu programa não
terminará. No entanto, isto não quer dizer, que **deverá** redefinir
constantes.

### Convenções na Nomenclatura

O Ruby obriga a algumas convenções na nomenclatura. Se um identificador
começar com:

* Letra Maiúscula, é uma *constante*;
* `$`, é uma variável global;
* `@`, é uma variável de instância;
* `@@` é uma variável de classe.

Apesar de tudo os nomes dos métodos permite-se que comecem com letras
maiúsculas Isto poderá tornar-se confuso, como se pode ver o exemplo
seguinte mostra:

{% highlight ruby %}
Constante = 10
def Constante
  11
end
{% endhighlight %}

Agora `Constante` é 10, mas `Constante()` é 11.

### Falsos parâmetros (keyword parameters)

O Ruby não utiliza parâmetros, como o Python. No entanto, estes podem
ser forjados através da utilização de símbolos e tabelas de hashing. O
Ruby on Rails, entre outros utilizam muito esta técnica. Exemplo:

{% highlight ruby %}
def alguns_parametros(params)
  params
end
alguns_parametros( :param_um => 10, :param_dois => 42 )
# => {:param_um=>10, :param_dois=>42}
{% endhighlight %}

### A Propriedade Universal

Tudo em Ruby, excepto **nil** e **false**, é considerado verdadeiro. Em
C, Python e em muitas outras linguagens, 0 and possivelmente outros
valores, tais como listas vazias, são consideradas falsas. Veja o
seguinte código Python (o exemplo aplica-se a outras linguagens também):

{% highlight python %}
# em Python
if 0:
  print "0 e' verdadeiro"
else:
  print "0 e' falso"
{% endhighlight %}

Isto irá imprimir “0 e’ falso”. O equivalente em Ruby:

{% highlight ruby %}
# em Ruby
if 0
  puts "0 e' verdadeiro"
else
  puts "0 e' falso"
end
{% endhighlight %}

imprime “0 e’ verdadeiro”.

###  *Access modifiers* aplicam-se até ao fim do âmbito

No seguinte código Ruby,

{% highlight ruby %}
class AMinhaClasse
  private
  def um_metodo; true; end
  def outro_metodo; false; end
end
{% endhighlight %}

Poderá pensar que `outro_metodo` seja público. Não é verdade. O
‘private’ access modifier continua até ao fim do escopo, ou até que
outro access modifier apareça, qualquer que apareça primeiro.

Por omissão, os métodos são públicos:

{% highlight ruby %}
class MyClass
  # Agora um_metodo é público
  def um_metodo; true; end

  private

  # another_method is private
  def outro_metodo; false; end
end
{% endhighlight %}

`public`, `private` e `protected` são, na verdade, métodos, por isso podem levar parâmetros. Se passar um Symbol a um deles, a visibilidade desse método é alterada.

### Acesso a métodos

Em Java, `public` significa que um método é acessível por todos;
`protected` significa que instâncias da classe, instâncias de classes
descendentes e instâncias das classes no mesmo *package* podem aceder,
mas mais nada pode; `private` significa que nada, para além das
instâncias da classe podem aceder ao método.

Em Ruby existem diferenças: `public` é, claro, público; `private`
significa que os métodos são acessíveis somente quando chamados com um
receptor específico. Só **self** pode ser o receptor dum método privado
Only **self** is allowed to be the receiver of a private method call.

`protected` é aquele que se deve ter mais cuidado. Um método protegido pode ser chamado de uma class ou classes descendentes, mas também com outra instância como receptor. Exemplo adaptado da [Ruby FAQ][1]\:

{% highlight ruby %}
$ irb
irb(main):001:0> class Teste
irb(main):002:1>   # public por omissao
irb(main):003:1*   def func
irb(main):004:2>     99
irb(main):005:2>   end
irb(main):006:1>
irb(main):007:1*   def ==(outro)
irb(main):008:2>     func == outro.func
irb(main):009:2>   end
irb(main):010:1> end
=> nil
irb(main):011:0>
irb(main):012:0* t1 = Teste.new
=> #<Test:0x34ab50>
irb(main):013:0> t2 = Teste.new
=> #<Test:0x342784>
irb(main):014:0> t1 == t2
=> true
irb(main):015:0> # seja `func` protected. ainda funciona
irb(main):016:0* # porque protected permite a outra referência
irb(main):017:0* class Teste
irb(main):018:1>   protected :func
irb(main):019:1> end
=> Test
irb(main):020:0> t1 == t2
=> true
irb(main):021:0> # seja `func` private
irb(main):022:0* class Teste
irb(main):023:1>   private :func
irb(main):024:1> end
=> Test
irb(main):025:0> t1 == t2
NoMethodError: private method `func' called for #<Test:0x342784>
        from (irb):8:in `=='
        from (irb):25
        from :0
irb(main):026:0>
{% endhighlight %}

### As Classes são abertas

As classes em Ruby são abertas. Poderá abrir, adicionar e alterá-las a
qualquer altura. Mesmo as classes do núcleo como por exemplo `Fixnum` ou
mesmo a classe `Object`, a classe de topo. O Ruby on Rails define uma
quantidade de métodos para lidar com as horas na classe `Fixnum`. Veja:

{% highlight ruby %}
class Fixnum
  def horas
    self * 3600 # nu'mero de segundos numa hora
  end
  alias hora horas
end

# 14 horas depois da meia noite de 1 de Janeiro
# (também as horas a que costuma acordar nesse dia ;) )
Time.mktime(2006, 01, 01) + 14.horas # => Sun Jan 01 14:00:00
{% endhighlight %}

### Nomes engraçados para métodos

Em Ruby, os métodos podem terminar com pontos de interrogação e de
exclamação. Por convenção, métodos que respondem a questões (p.e.
<tt>Array#empty?</tt> devolve **true** se o receptor é vazio) terminam
em ponto de interrogação. Métodos potencialmente “perigosos” (ie métodos
que modificam **self** ou os argumentos, `exit!`, etc.) por convenção
terminam em ponto de exclamação.

No entanto, todos os métodos que alteram os seus argumentos não terminam
com pontos de exclamação. <tt>Array#replace</tt> substitui os conteúdos
de um array com os de um outro array. Não faz muito sentido ter um
método como este que **não** modifique self.

### Singleton methods

Singleton Methods são métodos que só se encontram disponíveis no objecto
em que foi definido.

{% highlight ruby %}
class Car
  def inspect
    "Carro barato"
  end
end

porsche = Car.new
porsche.inspect # => Carro barato
def porsche.inspect
  "Carro caro"
end

porsche.inspect # => Carro caro

# Os outros objectos não são afectados
other_car = Car.new
other_car.inspect # => Carro barato
{% endhighlight %}

### Missing methods

Ruby doesn’t give up if it can’t find a method that responds to a
particular message. It calls the `method_missing` method with the name
of the method it couldn’t find and the arguments. By default,
method\_missing raises a NameError exception, but you can redefine it to
better fit your application, and many libraries do. Here is an example:

{% highlight ruby %}
# id is the name of the method called, the * syntax collects
# all the arguments in an array named 'arguments'
def method_missing( id, *arguments )
  puts "Method #{id} was called, but not found. It has " +
       "these arguments: #{arguments.join(", ")}"
end

__ :a, :b, 10
# => Method __ was called, but not found. It has these
# arguments: a, b, 10
{% endhighlight %}

The code above just prints the details of the call, but you are free to
handle the message in any way that is appropriate.

### Troca de mensagens. Chamadas a funções, não!

A invocação de um método é na verdade uma **mensagem** para outro
objecto:

{% highlight ruby %}
# Este
1 + 2
# E' o mesmo que este...
1.+(2)
# Que e' o mesmo que este:
1.send "+", 2
{% endhighlight %}

### Blocos são Objectos, só que estes ainda não o sabem

Blocos (fechos, na verdade) são extremamente usados na biblioteca
*standard*. Para chamar um bloco, poderá usar `yield`, ou torná-lo num
`Proc` adicionando um argumento especial à lista de argumentos, como:

Blocks (closures, really) are heavily used by the standard library. To
call a block, you can either use `yield`, or make it a `Proc` by
appending a special argument to the argument list, like so:

{% highlight ruby %}
def block( &o_bloco )
  # Aqui dentro, o_bloco é o bloco passado ao método o_bloco
  # devolve o_bloco
end
somador = block { |a, b| a + b }
# somador e' agora um objecto Proc
adder.class # => Proc
{% endhighlight %}

Também, poderá criar blocos fora de chamadas a métodos: chamando
Proc.new com um bloco; ou chamando o método `lambda`.

Da mesma forma, métodos são também Objectos:

Similarly, methods are also Objects in the making:

{% highlight ruby %}
method(:puts).call "puts e' um objecto!"
# => puts e' um objecto!
{% endhighlight %}

### Operadores e Açúcar Sintáctico

A maioria dos operadores em Ruby são somente açúcar sintático (com
algumas regras de precedência) para chamadas a métodos. Poderá, por
exemplo, redifinir o método + da classe Fixnum:

{% highlight ruby %}
class Fixnum
  # Pode fazer, mas por favor não faça isto
  def +( outro )
    self - outro
  end
end
{% endhighlight %}

Não necessita do `operador+`, etc., do C++.

Pode ainda ter um acesso no estilo de um array se definir os métodos
`[]` e `[]=`. Para definir as operações unárias + e – (pense em +1 e
-2), tem que definir os métodos `+@` e `-@`, respectivamente.

Os operadores abaixo não são, no entanto, açúcar sintáctico.Não são
métodos, e não podem ser redifinidos:

{% highlight ruby %}
=, .., ..., !, not, &&, and, ||, or, !=, !~, ::
{% endhighlight %}

Como +=, \*= etc. são somente abreviações para `var = var + outra_var`, `var = var * outra_var`, etc. não podem ser redefinidos.

## Mais informação

Quando se sentir preparado para saber mais sobre Ruby, veja a nossa
secção de [Documentação](/pt/documentation/).



[1]: http://www.rubycentral.com/faq/rubyfaq-7.html "FAQ de Ruby"
