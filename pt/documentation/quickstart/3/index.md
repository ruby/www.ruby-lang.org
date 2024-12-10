---
layout: page
title: "Ruby em Vinte Minutos"
lang: pt

header: |
  <div class="multi-page">
    <a href="../" title="Parte 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Parte 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Parte 4">4</a>
  </div>
  <h1>Ruby em Vinte Minutos</h1>

---

Agora vamos criar e usar um objeto Anfitrião:

{% highlight irb %}
irb(main):035:0> g = Anfitriao.new("João")
=> #<Anfitriao:0x16cac @nome="João">
irb(main):036:0> g.diz_ola
Ola João
=> nil
irb(main):037:0> g.diz_adeus
Adeus João, volte em breve.
=> nil
{% endhighlight %}

Uma vez criado o objeto `g`, ele se lembra de que o nome é João. Mmm, e se
quisermos acessar diretamente o nome?

{% highlight irb %}
irb(main):038:0> g.@nome
SyntaxError: compile error
(irb):52: syntax error
        from (irb):52
{% endhighlight %}

Nope, não conseguimos.

## Objeto por Baixo da Pele

As variáveis de instância escondem-se dentro do objeto. Não estão assim
tão bem escondidas, podem ser vistas quando se inspeciona o objeto e
há outras formas de lhes acessar, mas o Ruby é fiel aos bons costumes da
programação orientada a objetos mantendo os dados o mais privados
possíveis.

Então, que métodos estão disponíveis para os objetos Anfitrião?

{% highlight irb %}
irb(main):039:0> Anfitriao.instance_methods
=> ["method", "send", "object_id", "singleton_methods",
    "__send__", "equal?", "taint", "frozen?",
    "instance_variable_get", "kind_of?", "to_a",
    "instance_eval", "type", "protected_methods", "extend",
    "eql?", "display", "instance_variable_set", "hash",
    "is_a?", "to_s", "class", "tainted?", "private_methods",
    "untaint", "diz_ola", "id", "inspect", "==", "===",
    "clone", "public_methods", "respond_to?", "freeze",
    "diz_adeus", "__id__", "=~", "methods", "nil?", "dup",
    "instance_variables", "instance_of?"]
{% endhighlight %}

Uau. São muitos métodos. Nós só definimos dois métodos. O que é que
aconteceu? Bem, estes são **todos** os métodos para os objetos
Anfitrião, uma lista completa, incluindo os que estão definidos nas
super-classes de Anfitrião. Se só quisermos listar os métodos
definidos para a classe Anfitrião, podemos pedir-lhe que não inclua os
métodos dos seus ancestrais passando-lhe o parâmetro `false`, que
significa que não queremos os métodos definidos pelos seus ancestrais.

{% highlight irb %}
irb(main):040:0> Anfitriao.instance_methods(false)
=> ["diz_adeus", "diz_ola""]
{% endhighlight %}

Há mais coisas a explorar. Vejamos a que métodos pode responder o nosso
objeto Anfitrião:

{% highlight irb %}
irb(main):041:0> g.respond_to?("nome")
=> false
irb(main):042:0> g.respond_to?("diz_ola")
=> true
irb(main):043:0> g.respond_to?("to_s")
=> true
{% endhighlight %}

Assim sabemos que responde a `diz_ola`, e `to_s` (que
significa “converter algo em uma string”, um método que está definido por
padrão para todos os objetos), mas que não reconhece `nome` como
método.

## Modificando Classes – Nunca é Tarde Demais

E se quisermos ver ou alterar o nome? Ruby oferece uma forma fácil
de fornecer acesso às variáveis de um objeto.

{% highlight irb %}
irb(main):044:0> class Anfitriao
irb(main):045:1>   attr_accessor :nome
irb(main):046:1> end
=> [:nome, :nome=]
{% endhighlight %}

Em Ruby, podemos abrir uma classe novamente e alterá-la. As mudanças estarão
presentes em quaisquer objetos criados e até mesmo nos objetos existentes
dessa classe. Então vamos criar um novo objeto e vamos brincar com a sua
propriedade `@nome`.

{% highlight irb %}
irb(main):047:0> g = Anfitriao.new("Pedro")
=> #<Anfitriao:0x3c9b0 @nome="Pedro">
irb(main):048:0> g.respond_to?("nome")
=> true
irb(main):049:0> g.respond_to?("nome=")
=> true
irb(main):050:0> g.diz_ola
Ola Pedro
=> nil
irb(main):051:0> g.nome="Matilde"
=> "Matilde"
irb(main):052:0> g
=> #<Anfitrion:0x3c9b0 @nome="Matilde">
irb(main):053:0> g.nome
=> "Matilde"
irb(main):054:0> g.diz_ola
Ola Matilde
=> nil
{% endhighlight %}

O uso de `attr_accessor` definiu dois novos métodos para nós:
`nome` para obter o valor e `nome=` para alterá-lo.

## Saudando a Tudo e a Todos, MegaAnfitriao não Esquece Ninguém!

De qualquer modo este Anfitrião não é assim tão interessante, ele só consegue
trabalhar com uma pessoa de cada vez. E se tivéssemos uma classe MegaAnfitriao
que pudesse saudar o mundo inteiro, uma pessoa ou uma lista inteira de pessoas?

Vamos escrever isto num arquivo em vez de usar diretamente o interpretador
interativo do Ruby (IRB).

Para sair do IRB, digite “quit”, “exit” ou simplesmente pressione “Control+D”.

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaAnfitriao
  attr_accessor :nomes

  # Criar o objecto
  def initialize(nomes = "Mundo")
    @nomes = nomes
  end

  # Dizer ola a todos
  def diz_ola
    if @nomes.nil?
      puts "..."
    elsif @nomes.respond_to?("each")
      # @nomes é uma lista de algum tipo,
      # assim podemos iterar!
      @nomes.each do |nome|
        puts "Ola #{nome}"
      end
    else
      puts "Ola #{@nomes}"
    end
  end

  # Dizer adeus a todos
  def diz_adeus
    if @nomes.nil?
      puts "..."
    elsif @nomes.respond_to?("join")
      # Juntar os elementos à lista
      # usando a vírgula como separador
      puts "Adeus #{@nomes.join(", ")}. Voltem em breve."
    else
      puts "Adeus #{@nomes}. Volta em breve."
    end
  end

end


if __FILE__ == $0
  mg = MegaAnfitriao.new
  mg.diz_ola
  mg.diz_adeus

  # Alterar o nome para "Diogo"
  mg.nomes = "Diogo"
  mg.diz_ola
  mg.diz_adeus

  # Alterar o nome para um vector de nomes
  mg.nomes = ["Alberto", "Beatriz", "Carlos",
    "David", "Ernesto"]
  mg.diz_ola
  mg.diz_adeus

  # Alterar para nil
  mg.nomes = nil
  mg.diz_ola
  mg.diz_adeus
end
{% endhighlight %}

Salve este arquivo como “ri20min.rb”, e execute-o com o comando
“ruby ri20min.rb”. O resultado deverá ser:

    Ola Mundo
    Adeus Mundo. Volta em breve.
    Ola Diogo
    Adeus Diogo. Volta em breve.
    Ola Alberto
    Ola Beatriz
    Ola Carlos
    Ola David
    Ola Ernesto
    Adeus Alberto, Beatriz, Carlos, David, Ernesto.
    Voltem em breve.
    ...
    ...
{: .code}

Há uma série de coisas novas neste exemplo às quais podemos
[observar mais profundamente](../4/)
