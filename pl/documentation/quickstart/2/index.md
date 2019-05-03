---
layout: page
title: "Ruby w 20 Minut"
lang: pl

header: |
  <div class="multi-page">
    <a href="../" title="Część 1">1</a>
    <span class="separator"> | </span>
    <strong>2</strong>
    <span class="separator"> | </span>
    <a href="../3/" title="Część 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Część 4">4</a>
  </div>
  <h1>Ruby w 20 Minut</h1>

---

Co jeśli chcielibyśmy mówić “Hello World” tak aby nasze palce się nie
zmęczyły ? Musimy zdefiniować metodę!

{% highlight irb %}
irb(main):010:0> def h
irb(main):011:1> puts "Hello World!"
irb(main):012:1> end
=> nil
{% endhighlight %}

Kod `def h` rozpoczyna definicję metody. Wskazuje Rubiemu, że
definiujemy metodę, która nazywa się `h`. Następna linia to ciało
metody, ten sam kod, który widzieliśmy już wcześniej: `puts "Hello
World"`. W końcu ostatnia linia `end` mówi Rubiemu, że skończyliśmy
definiować metodę. Odpowiedź Rubiego `=> nil` mówi nam, że zrozumiał to,
że skończyliśmy definiować metodę.

## Krótkie, Powtarzalne Życia Metody

Teraz wypróbujmy uruchomić tę metodę kilka razy:

{% highlight irb %}
irb(main):013:0> h
Hello World!
=> nil
irb(main):014:0> h()
Hello World!
=> nil
{% endhighlight %}

No cóż, to było proste. Wywołanie metody w Rubim sprowadza się do
napisania jej nazwy. Jeśli metoda nie przyjmuje żadnych parametrów, to
wszystko czego potrzebujesz. Możesz dodać puste nawiasy, jeśli chcesz
ale nie jest to wymagane.

Co jeśli chcielibyśmy mówić “hello” do konkretnej osoby a nie do całego
świata ? Musimy po prostu przedefiniować `h` aby przyjmowała imię jako
parametr.

{% highlight irb %}
irb(main):015:0> def h(name)
irb(main):016:1> puts "Hello #{name}!"
irb(main):017:1> end
=> nil
irb(main):018:0> h("Matz")
Hello Matz!
=> nil
{% endhighlight %}

Działa … ale spójrzmy bliżej na to co się tutaj dzieje.

## Holding Spots in a String

Co oznacza ta część `#{name}` ? To sposób w jaki Ruby umieszcza coś w
Stringu. Ta część pomiędzy klamrami jest zamieniana na string (jeśli
jużnim nie jest) i umieszczana wewnątrz otaczającego ją stringa. Możesz
użyć tego sposobu na przykład aby upewnić się, że czyjeś imię jest
drukowane z dużej litery:

{% highlight irb %}
irb(main):019:0> def h(name = "World")
irb(main):020:1> puts "Hello #{name.capitalize}!"
irb(main):021:1> end
=> nil
irb(main):022:0> h "chris"
Hello Chris!
=> nil
irb(main):023:0> h
Hello World!
=> nil
{% endhighlight %}

Warto zwrócić tutaj uwagę na kilka innych sztuczek. Jedną z nich jest
to, że wywołujemy metodę bez nawiasów. Jeśli to co robisz jest
oczywiste, nawiasy są opcjonalne. Inną sztuczką jest domyślny parametr
`World`. Oznacza on “Jeśli imię nie jest podane, użyj domyślnej wartości
`"World"`”.

## Ewolucja w Kierunku Klasy Greeter

Co jeśli chcielibyśmy mieć prawdziwą klasę witającą, taką, która
zapamiętuje twoje imię, wita Cię i traktuje zawsze z szacunkiem. Do tego
celu użyjemy obiektu. Stwórzmy klasę “Greeter”.

{% highlight irb %}
irb(main):024:0> class Greeter
irb(main):025:1>   def initialize(name = "World")
irb(main):026:2>     @name = name
irb(main):027:2>   end
irb(main):028:1>   def say_hi
irb(main):029:2>     puts "Hi #{@name}!"
irb(main):030:2>   end
irb(main):031:1>   def say_bye
irb(main):032:2>     puts "Bye #{@name}, come back soon."
irb(main):033:2>   end
irb(main):034:1> end
=> nil
{% endhighlight %}

Nowym słowem kluczowym jest tutaj `class`. Definiuje ono nową klasę
nazwaną Greeter oraz kilka metod tej klasy. Zauważ również `@name`. Jest
to zmienna instancji, która jest dostępna dla wszystkich metod tej
klasy. Używana jest przez metody `say_hi` oraz `say_bye`.

Jak teraz wprowadzić tę klasę w ruch ? [Utwórzmy obiekt.](../3/)
