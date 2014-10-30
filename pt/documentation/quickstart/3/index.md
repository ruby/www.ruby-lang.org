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

Agora vamos criar e usar um objecto Anfitrião:

{% highlight irb %}
irb(main):035:0> h = Anfitriao.new("João")
=> #<Anfitriao:0x16cac @nome="João">
irb(main):036:0> h.dizer_ola
Ola João
=> nil
irb(main):037:0> h.dizer_adeus
Adeus João, volta em breve.
=> nil
{% endhighlight %}

Uma vez criado o objecto `h`, lembra-nos que o nome é João. Mmm, e se
quisermos aceder directamente ao nome?

{% highlight irb %}
irb(main):038:0> h.@nome
SyntaxError: compile error
(irb):52: syntax error
        from (irb):52
{% endhighlight %}

Não o podemos fazer.

## Por baixo da pele do objecto

As variáveis de instância escondem-se dentro do objecto. Não estão assim
tão bem escondidas, podem ser vistas quando se inspecciona o objecto e
há outras formas de lhes aceder, mas Ruby é fiel aos bons costumes da
programação orientada a objectos mantendo os dados o mais privados
possíveis.

Então, que métodos estão disponíveis para os objectos Anfitrião?

{% highlight irb %}
irb(main):039:0> Anfitriao.instance_methods
=> ["method", "send", "object_id", "singleton_methods",
    "__send__", "equal?", "taint", "frozen?",
    "instance_variable_get", "kind_of?", "to_a",
    "instance_eval", "type", "protected_methods", "extend",
    "eql?", "display", "instance_variable_set", "hash",
    "is_a?", "to_s", "class", "tainted?", "private_methods",
    "untaint", "decir_hola", "id", "inspect", "==", "===",
    "clone", "public_methods", "respond_to?", "freeze",
    "decir_adios", "__id__", "=~", "methods", "nil?", "dup",
    "instance_variables", "instance_of?"]
{% endhighlight %}

Bem. São muitos métodos. Nós só definimos dois métodos. O que é que
aconteceu? Bem estes são **todos** os métodos para os objectos
Anfitrião, uma lista completa, incluindo os que estão definidos nas
super-classes de Anfitrião. Se só quisermos listar unicamente os métodos
definidos para a classe Anfitrião, podemos pedir-lhe que não inclua os
métodos dos seus ancestrais passando-lhe o parâmetro `false`, que
significa que não queremos os métodos definidos pelos seus ancestrais.

{% highlight irb %}
irb(main):040:0> Anfitriao.instance_methods(false)
=> ["dizer_adeus", "dizer_ola""]
{% endhighlight %}

Há mais coisas a explorar. Vejamos a que métodos pode responder o nosso
objecto Anfitrião:

{% highlight irb %}
irb(main):041:0> h.respond_to?("nome")
=> false
irb(main):042:0> h.respond_to?("dirzer_ola")
=> true
irb(main):043:0> h.respond_to?("to_s")
=> true
{% endhighlight %}

Assim ficamos a saber que responde a `dizer_ola`, e `to_s` (que
significa “converter algo numa string”, um método que está definido por
omissão para todos os objectos), mas que não reconhece `nome` como
método.

## Modificar classes—Nunca é demasiado tarde

E se quiser alterar o nome? Ruby oferece uma forma fácil de lhe permitir
o acesso às variáveis de um objecto.

{% highlight irb %}
irb(main):044:0> class Anfitriao
irb(main):045:1>   attr_accessor :nome
irb(main):046:1> end
=> nil
{% endhighlight %}

Em Ruby, podemos voltar a abrir e alterar uma classe. Isso não altera os
objectos já existentes, mas afecta os novos objectos que se possam
criar. Assim vamos criar um novo objecto e vamos brincar com a sua
propriedade `@nome`.

{% highlight irb %}
irb(main):047:0> h = Anfitriao.new("Pedro")
=> #<Anfitriao:0x3c9b0 @nome="Pedro">
irb(main):048:0> h.respond_to?("nome")
=> true
irb(main):049:0> h.respond_to?("nome=")
=> true
irb(main):050:0> h.dizer_ola
Ola Pedro
=> nil
irb(main):051:0> h.nome="Matilde"
=> "Matilde"
irb(main):052:0> h
=> #<Anfitrion:0x3c9b0 @nome="Matilde">
irb(main):053:0> h.nome
=> "Matilde"
irb(main):054:0> h.dizer_ola
Ola Matilde
=> nil
{% endhighlight %}

O uso de `attr_accessor` determina que se tenha definido dois novos
métodos: `nome` para obter o valor, e `nome=` para o alterar.

## Saudar todos, MegaAnfitriao não nega a saudação a ninguém!

De qualquer modo este Anfitrião não é assim tão interessante, só pode
trabalhar para uma pessoa de cada vez. O que se passaria se tivéssemos
uma classe MegaAnfitriao que pudesse saudar o mundo inteiro, uma pessoa
ou uma lista completa de pessoas?

Vamos escrever isto num ficheiro em vez de usar directamente o
interpretador interactivo do Ruby (IRB).

Para sair do IRB, escrevemos “quit”, “exit” ou simplesmente carregamos
nas teclas “Control” e “D”.

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaAnfitriao
  attr_accessor :nomes

  # Criar o objecto
  def initialize(nomes = "Mundo")
    @nomes = nomes
  end

  # Dizer ola a todos
  def dizer_ola
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
  def dizer_adeus
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
  mh = MegaAnfitriao.new
  mh.dizer_ola
  mh.dizer_adeus

  # Alterar o nome para "Diogo"
  mh.nomes = "Diogo"
  mh.dizer_ola
  mh.dizer_ola

  # Alterar o nome para um vector de nomes
  mh.nomes = ["Alberto", "Beatriz", "Carlos",
    "David", "Ernesto"]
  mh.dizer_ola
  mh.dizer_adeus

  # Alterar para nil
  mh.nomes = nil
  mh.dizer_ola
  mh.dizer_adeus
end
{% endhighlight %}

Guardar este ficheiro como “ri20min.rb”, e executar com o comando “ruby
ri20min.rb”. O resultado deverá ser:

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

Há uma série de coisas novas neste novo exemplo às quais podemos [dar
uma observação mais profunda](../4/)

