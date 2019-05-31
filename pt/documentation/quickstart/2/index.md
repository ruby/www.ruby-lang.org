---
layout: page
title: "Ruby em Vinte Minutos"
lang: pt

header: |
  <div class="multi-page">
    <a href="../" title="Parte 1">1</a>
    <span class="separator"> | </span>
    <strong>2</strong>
    <span class="separator"> | </span>
    <a href="../3/" title="Parte 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Parte 4">4</a>
  </div>
  <h1>Ruby em Vinte Minutos</h1>

---

E se quisermos dizer “Olá” várias vezes sem cansar os dedos? Temos que
definir um método!

{% highlight irb %}
irb(main):010:0> def h
irb(main):011:1> puts "Olá Mundo!"
irb(main):012:1> end
=> :h
{% endhighlight %}

O código `def h` começa a definição do método. Diz ao Ruby que estamos
definindo um método, cujo nome é `h`. A linha seguinte é o corpo do
método, a mesma linha que vimos antes: `puts "Olá Mundo"`. Finalmente, a
última linha `end` diz ao Ruby que terminámos a definição do método.
A reposta do Ruby `=> :h` nos diz que ele sabe que estamos definindo um
método. Essa resposta poderia ser `=> nil` no Ruby 2.0 e versões anteriores.
Mas isso não é importante agora, vamos seguir em frente.

## As Breves e Repetitivas Vidas de um Método

Agora vamos tentar rodar o método algumas vezes:

{% highlight irb %}
irb(main):013:0> h
Olá Mundo!
=> nil
irb(main):014:0> h()
Olá Mundo!
=> nil
{% endhighlight %}

Bem, isso foi fácil. Chamar um método em Ruby é tão fácil como mencionar
o seu nome ao Ruby. Se o método não tiver parâmetros isso é tudo de que
precisamos. Podemos também colocar os parênteses vazios se desejarmos,
porém eles não são necessários.

E se o que queremos é dizer olá a uma pessoa só, e não ao mundo inteiro?
Para isso basta redifinir `h` para que aceite um nome como parâmetro.

{% highlight irb %}
irb(main):015:0> def h(nome)
irb(main):016:1> puts "Olá #{nome}!"
irb(main):017:1> end
=> :h
irb(main):018:0> h("Matz")
Ola Matz!
=> nil
{% endhighlight %}

Parece funcionar… mas vamos parar um minuto para ver o que se passa
aqui.

## Reservando Espaços numa String

O que significa a expressão `#{name}`? É a forma de inserir alguma coisa
numa string. Aquilo que se encontra entre chaves transforma-se numa
string (se já não o for) e é substituído naquele ponto da string.
Podemos também usar isto para ter a certeza de que o nome de alguém se
apresenta em letra maiúscula:

{% highlight irb %}
irb(main):019:0> def h(nome = "Mundo")
irb(main):020:1> puts "Olá #{nome.capitalize}!"
irb(main):021:1> end
=> :h
irb(main):022:0> h "chris"
Olá Chris!
=> nil
irb(main):023:0> h
Olá Mundo!
=> nil
{% endhighlight %}

Podemos encontrar aqui um truque ou dois. Um deles é que estamos
chamando novamente o método sem recorrer aos parênteses. Se aquilo que
estamos fazendo for óbvio então os parênteses são opcionais. O outro
truque é o parâmetro `Mundo` usado por omissão. O que isto quer dizer é
que “Se o nome não for fornecido, então usamos o nome padrão
`"Mundo"`.

## Evoluindo para um Anfitrião

E se quisermos criar um verdadeiro anfitrião, um que se lembre do
nosso nome, nos dê as boas vindas e nos trate com o devido respeito?
Podemos usar um objeto para isso. Então vamos criar a classe “Anfitrião”.

{% highlight irb %}
irb(main):024:0> class Anfitriao
irb(main):025:1>   def initialize(nome = "Mundo")
irb(main):026:2>     @nome = nome
irb(main):027:2>   end
irb(main):028:1>   def diz_ola
irb(main):029:2>     puts "Olá #{@nome}!"
irb(main):030:2>   end
irb(main):031:1>   def diz_adeus
irb(main):032:2>     puts "Adeus #{@nome}, volte sempre."
irb(main):033:2>   end
irb(main):034:1> end
=> nil
{% endhighlight %}

A nova palavra-chave aqui é `class`. Ela define uma nova classe chamada
Anfitrião e alguns métodos para essa classe. E o `@nome` ? É
uma variável de instância e está disponível para todos os métodos da
classe. Como podemos ver, ela é utilizada por `diz_ola` e `diz_adeus`.

Então como é que fazemos a classe Anfitrião funcionar? [Criamos um
objeto.](../3/)
