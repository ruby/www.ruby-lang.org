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

E se quisermos dizer “Olá” varias vezes sem cansar os dedos? Temos que
definir um método!

{% highlight irb %}
irb(main):010:0> def h
irb(main):011:1> puts "Olá Mundo!"
irb(main):012:1> end
=> nil
{% endhighlight %}

O código `def h` começa a definição do método. Diz ao Ruby que estamos a
definir um método, cujo nome é `h`. A linha seguinte é o corpo do
método, a mesma frase que vimos antes: `puts "Olá Mundo"`. Finalmente, a
última linha `end` diz ao Ruby que terminámos a definição do método. A
resposta do Ruby `=> nil` diz-nos que sabe que terminamos a definição do
método.

## As Breves e Repetitivas Vidas de um Método

Agora tentemos correr o método algumas vezes:

{% highlight irb %}
irb(main):013:0> h
Olá Mundo!
=> nil
irb(main):014:0> h()
Olá Mundo!
=> nil
{% endhighlight %}

Bem, esta foi fácil. Chamar um método em Ruby é tão fácil como mencionar
o seu nome ao Ruby. Se o método não tiver parâmetros é tudo o que
precisamos. Podemos também colocar os parênteses vazios se desejar-mos,
porem estes não são necessários.

E se o que queremos é dizer ola a uma pessoa só, e não ao mundo inteiro?
Para isso basta redifinir `h` para que aceite um nome como parâmetro.

{% highlight irb %}
irb(main):015:0> def h(nome)
irb(main):016:1> puts "Olá #{nome}!"
irb(main):017:1> end
=> nil
irb(main):018:0> h("Matz")
Olá Matz!
=> nil
{% endhighlight %}

Parece funcionar… mas vamos pausar um minuto para ver o que se passa
aqui.

## Reservando espaços numa String

O que significa a expressão @#\{nome}? É a forma de inserir alguma coisa
numa string. Aquilo que se encontra entre chavetas transforma-se numa
string (se já não o for) e é substituído naquele ponto da string.
Podemos também usar isto para ter a certeza de que o nome de alguém se
apresenta em letra maiúscula:

{% highlight irb %}
irb(main):019:0> def h(nome = "Mundo")
irb(main):020:1> puts "Olá #{nome.capitalize}!"
irb(main):021:1> end
=> nil
irb(main):022:0> h "chris"
Olá Chris!
=> nil
irb(main):023:0> h
Olá Mundo!
=> nil
{% endhighlight %}

Podemos encontrar aqui um truque ou dois. Um deles é que estamos a
chamar novamente o método sem recorrer aos parênteses. Se aquilo que
estamos a fazer for óbvio então os parênteses são opcionais. O outro
truque é o parâmetro `Mundo` usado por omissão. O que isto quer dizer é
que “Se o nome não for fornecido, então usamos o nome por omissão
`"Mundo"`.

## Evoluindo para um Anfitrião

E se quisermos criar um Anfitrião mais “sério”? Um que se lembre do
nosso nome, nos dê as boas vindas e nos trate com o respeio devido?
Podemos usar um objecto para esse efeito. Vamos então criar, a classe
“Anfitrião”.

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

A nova palavra chave aqui é `class`. Esta define uma nova classe chamada
Anfitrião e uma quantidade de métodos para essa classe. E o `@nome` ? É
uma variável de instância e está disponível para todos os métodos da
classe. Como podemos ver está a ser utilizada por `diz_ola` e
`diz_adeus`.

Então como é que pomos a classe Anfitrião em movimento? [Criamos um
objecto.](../3/)

