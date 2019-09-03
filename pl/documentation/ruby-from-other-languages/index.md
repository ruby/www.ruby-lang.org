---
layout: page
title: "Ruby a Inne Języki Programowania"
lang: pl
---

Gdy po raz pierwszy zobaczysz kawałek kodu w Rubim, prawdopodobnie
będzie on zbliżony do innych języków, z którymi miałeś do czynienia. Tak
ma być. Większość składni nawiązuje do Perla, Pythona i Javy, więc jeśli
te języki są znajome, to nauka Rubiego będzie jak bułka z masłem.
{: .summary}

Ten dokument zawiera dwie sekcje. Pierwsza, opisuje najważniejsze
różnice pomiędzy językiem *X* a Rubim. Druga zawiera obraz
najważniejszych elementów języka i porównuje je do tego, co już znasz.

## Czego oczekiwać: *Język X* a Ruby

* [Ruby a Java](to-ruby-from-java/)
* [Ruby a PHP](to-ruby-from-php/)
* [Ruby a Python](to-ruby-from-python/)

## Ważne elementy języka i niespodzianki

Poniżej znajdziesz kilka wskazówek na temat najważniejszych elementów
Rubiego.

### Iteracja

Są dwa elementy, które są nieco różne od tego co możesz już znać. Jednym
z nich są “bloki” oraz iteratory. Zamiast iterować po indeksach w
tablicy (jak w C, C++ lub Javie &lt; 1.5), lub przechodzić po pętli po
liście (jak w Perlowym `for (@a) {...}`, lub Pythonowym
`for i in lista: ...`), w Rubim zobaczysz:

{% highlight ruby %}
lista.each do |element|
  # Jesteśmy w bloku.
  # Tutaj zajmujemy się element-em.
end
{% endhighlight %}

Aby dowiedzieć się więcej o `each` (oraz pokrewnych: `collect`, `find`,
`inject`, `sort`, itd), rzuć okiem na `ri Enumerable`
(a potem `ri Enumerable#func_name`).

### Wszystko ma wartość

Nie ma różnicy pomiędzy wyrażeniem a instrukcją. Wszystko posiada
wartość, nawet jeśli ta wartość jest **nil**.

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

### Symbole nie są “lekkimi stringami”

Wielu programistów przechodzących do Rubiego ma problemy ze zrozumieniem
koncepcji symboli, oraz do czego powinno się ich używać.

Symbole są podobną klasą obiektów, co liczby. Każde wystąpienie tej
samej liczby w wyrażeniu zawsze odnosi się do tego samego obiektu.
Spójrz na ten przykład:

{% highlight irb %}
irb(main):001:0> :george.object_id == :george.object_id
=> true
irb(main):002:0> "george".object_id == "george".object_id
=> false
irb(main):003:0>
{% endhighlight %}

Metoda `object_id` zwraca unikalny identyfikator obiektu w pamięci.
Jeśli dwa obiekty mają ten sam `object_id`, to są tym samym obiektem
(lub wskazują na ten sam obiekt w pamięci).

Jeśli zatem użyjesz raz jakiegoś symbolu, to kolejne odwołania do niego,
zawsze będą odnosić się do tego samego obiektu. Każde dwa symbole
reprezentujące ten sam ciąg znaków wskazują na ten sam obiekt w pamięci.
Ich `object_id` pasują do siebie.

Spójrzmy na String (“george”). Wartości `object_id` nie są te same.
Znaczy to tyle, że odnosimy się do dwóch osobnych obiektów w pamięci.
Kiedykolwiek używasz Stringów, Ruby dla każdego z nich alokuje pamięć.

Jeśli nie jesteś pewien w jakim scenariuszu użyć Symbolu a w jakim
Stringa, zastanów się co w danym przypadku jest istotne — tożsamość
obiektu (na przykład w słowniku), czy jego wartość (“george”).

### Wszystko jest obiektem.

“Wszystko jest obiektem” to bardzo silne założenie. Nawet klasy i liczby
całkowite są obiektami, i możesz na nich działać jak na zwykłych
obiektach:

{% highlight ruby %}
# Poniższe definicje są tożsame
# class MyClass
#   attr_accessor :instance_var
# end
MyClass = Class.new do
  attr_accessor :instance_var
end
{% endhighlight %}

### Stałe (zmienne)

Stałe tak naprawdę nie są stałymi. Jeśli zmodyfikujesz stałą, która już
posiada wartość, otrzymasz ostrzeżenie, ale nie doprowadzi to do
wstrzymania twojego programu. Nie znaczy to oczywiście, że powinieneś
modyfikować wartość stałych.

### Konwencje nazewnictwa

Ruby wymusza pewną konwencję jeśli chodzi o nazewnictwo. Jeśli nazwa
zaczyna się od wielkiej litery, jest stałą. Jeśli zaczyna się od znaku
dolara (`$`), jest zmienną globalną. Jeśli zaczyna się od `@`, jest
zmienną należącą do egzemplarza obiektu. Jeśli zaczyna się od `@@`, jest
zmienną należącą do klasy.

Nazwy metod mogą zaczynać się od wielkiej litery. Może być to źródłem
pewnego zamieszania, jak widać poniżej:

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

Teraz `Constant` ma wartość 10, ale `Constant()` daje wartość 11.

### Argumenty z kluczem

Tak jak w Pythonie, od wersji Rubiego 2.0 metody można definiować
przy użyciu argumentów z kluczem:

{% highlight ruby %}
def deliver(from: "A", to: nil, via: "mail")
  "Wyślij od #{from} do #{to} poprzez #{via}."
end

deliver(to: "B")
# => "Wyślij od A do B poprzez mail."
deliver(via: "Pony Express", from: "B", to: "A")
# => "Wyślij od B do A poprzez Pony Express."
{% endhighlight %}

### Prawda absolutna

W Rubim wszystko, oprócz **nil** oraz **false** jest równoważne
**true**. W C, Pythonie i wielu innych językach, zero oraz inne
wartości, takie jak puste listy są uważane za **false**. Spójrz na
poniższy kod w Pythonie:

{% highlight python %}
# w Pythonie
if 0:
  print("0 is true")
else:
  print("0 is false")
{% endhighlight %}

Ten kawałek kodu wypisze `0 is false` To samo w Rubim wygląda
tak:

{% highlight ruby %}
# w Rubim
if 0
  puts "0 is true"
else
  puts "0 is false"
end
{% endhighlight %}

Wypisze “0 is true”.

### Modyfikatory zakresu dostępu do metod działają do końca definicji klasy.

W poniższym kodzie,

{% highlight ruby %}
class MyClass
  private
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

Być może oczekujesz, że `another_method` jest metodą publiczną? Nie
jest. Modyfikator dostępu `private` jest zastosowany dla wszystkich
metod następujących po nim, lub do momentu napotkania innego
modyfikatora zakresu dostępu. Domyślnie, wszystkie metody są publiczne.

{% highlight ruby %}
class MyClass
  # Now a_method is public
  def a_method; true; end

  private

  # another_method jest metodą prywatną
  def another_method; false; end
end
{% endhighlight %}

`public`, `private` and `protected` to tak naprawdę metody, mogą więc przyjmować parametry. Jeśli tym metodom przekażesz Symbol jako parametr, zmienisz widoczność danej metody.

### Dostęp do metod

W Javie, `public` oznacza, że dana metoda jest dostępna dla wszystkich.
`protected` oznacza, że dostęp mają instancje danej klasy i klas
pochodnych, natomiast `private` oznacza, że jedynie instancje danej
klasy mają dostęp do danej metody.

Ruby różni się odrobinę w tym względzie. `public` oznacza tak samo
dostęp publiczny. `private` oznacza, że dana metoda(y) jest dostępna
tylko wtedy, jeśli można ją wywołać bez wyraźnego określenia odbiorcy.
Jedynie **self** jest dozwolonym odbiorcą wywołań prywatnych metod.

`protected` jest tym, na co trzeba zwrócić uwagę. Metoda chroniona może być wywołana przez instancje danej klasy lub klas pochodnych, ale również przez inną instancję danej klasy. Poniżej przykład za [Ruby Language FAQ][faq]:

{% highlight ruby %}
class Test
  # domyślnie metoda publiczna
  def identifier
    99
  end

  def ==(other)
    identifier == other.identifier
  end
end

t1 = Test.new  # => #<Test:0x34ab50>
t2 = Test.new  # => #<Test:0x342784>
t1 == t2       # => true

# uczyńmy teraz `identifier' metodą chronioną, wciąż działa
# ponieważ 'protected' umożliwia odniesienie do `other'

class Test
  protected :identifier
end

t1 == t2  # => true

# uczyńmy teraz `identifier' metodą prywatną

class Test
  private :identifier
end

t1 == t2
# NoMethodError: private method `identifier' called for #<Test:0x342784>
{% endhighlight %}

### Klasy są otwarte

Klasy Rubiego są otwarte. Można je otworzyć, dodać nowe metody czy
zmienić istniejące działanie w dowolnym momencie. Nawet główne klasy
takie jak `Integer` czy nawet `Object`, rodzic wszystkich obiektów. Ruby
on Rails na przykład definiuje zestaw metod do operowania czasem w
klasie `Integer`. Poniżej:

{% highlight ruby %}
class Integer
  def hours
    self * 3600 # liczba sekund w godzinie
  end
  alias hour hours
end

# 14 hours from 00:00 January 1st
# (czyt. kiedy w końcu się obudzisz ;)
Time.mktime(2006, 01, 01) + 14.hours # => Sun Jan 01 14:00:00
{% endhighlight %}

### Śmieszne nazwy metod

W Rubim, nazwy metod mogą kończyć się pytajnikiem lub wykrzyknikiem.
Według przyjętej konwencji, metody które odpowiadają na jakieś pytanie
(n.p. `Array#empty?` zwraca **true** jeśli odbiorca jest pusty)
kończą się pytajnikiem. Potencjalnie “groźne” metody (np. metody, które
modyfikują **self** – dany obiekt lub swoje argumenty `exit!` etc.)
kończą się wykrzyknikiem.

Wszystkie metody, których celem jest zmiana swoich argumentów, nie
kończą się wykrzyknikiem. `Array#replace` zamienia zawartość
danej tablicy zawartością innej tablicy. Istnienie tej metody w celu
innym niż modyfikacja danego obiektu **self** nie ma zbyt dużego sensu.

### Metody singleton

Metody singletonowe to metody, które zostały zdefiniowane i są dostępne
dla danego obiektu.

{% highlight ruby %}
class Car
  def inspect
    "Tani samochód"
  end
end

porsche = Car.new
porsche.inspect # => Tani samochód
def porsche.inspect
  "Drogi samochód"
end

porsche.inspect # => Drogi samochód

# Inne obiekty nie zostały zmienione
other_car = Car.new
other_car.inspect # => Tani samochód
{% endhighlight %}

### Brakujące metody

Ruby nie poddaje się jeśli nie może odnaleźć danej metody. Wywołuje w
takim przypadku metodę `method_missing` przekazując nazwę metody, której
nie mógł znaleźć jako argument. Domyślnie, `method_missing` zgłasza
wyjątek NameError, lecz można ją przedefiniować aby lepiej pasowała do
Twojej aplikacji, wiele bibliotek tak robi. Poniżej jeden z przykładów:

{% highlight ruby %}
# id jest nazwą wywołanej metody, składnia * łączy wszystkie pozostałe argumenty
# w tablicę nazwaną 'arguments'
def method_missing(id, *arguments)
  puts "Wywołano niezdefiniowaną metodę #{id}. Przekazano " +
       "poniższe argumenty: #{arguments.join(", ")}"
end

__ :a, :b, 10
# => Wywołano niezdefiniowaną metodę __. Przekazano poniższe
# argumenty: a, b, 10
{% endhighlight %}

Powyższy kod wyświetla po prostu szczegóły wywołania, możesz to
zachowanie dowolnie zmienić.

### Przekazywanie wiadomości, nie wywołanie metody

Wywołanie metody jest tak naprawdę **wiadomością** przekazywaną innemu
obiektowi:

{% highlight ruby %}
# To
1 + 2
# Jest to samo co ...
1.+(2)
# Jest to to samo co:
1.send "+", 2
{% endhighlight %}

### Bloki są Obiektami, tylko o tym jeszcze nie wiedzą

Bloki (tak naprawdę domknięcia) są powszechnie używane w podstawowej
bibliotece Rubiego. Aby wywołać blok, możesz użyć albo `yield`, albo
utworzyć specjalny obiekt typu `Proc` przekazując specjalny argument,
tak jak w poniższym przykładzie:

{% highlight ruby %}
def block(&the_block)
  # Tutaj, the_block jest blokiem przekazanym do tej metody
  the_block # zwróć blok
end
adder = block { |a, b| a + b }
# adder to teraz obiekt typu Proc
adder.class # => Proc
{% endhighlight %}

Możesz tworzyć bloki również poza wywołaniami metod, wywołując `Proc.new`
lub metodę `lambda`.

Podobnie, metody to także obiekty:

{% highlight ruby %}
method(:puts).call "puts to obiekt!"
# => puts to obiekt!
{% endhighlight %}

### Operatory to cukier syntaktyczny

Większość operatorów w Rubim to po prostu cukier syntaktyczny dla
wywołań metod. Możesz, na przykład, nadpisać metodę + klasy Integer:

{% highlight ruby %}
class Integer
  # Możesz, ale proszę nie rób tego !
  def +(other)
    self - other
  end
end
{% endhighlight %}

Nie potrzebujesz operatora z C++’s `operator+`, etc.

Możesz nawet mieć operator tablicowy, o ile zdefiniujesz metody `[]` and `[]=`.
By zdefiniować jednoskładnikowy + i – (tak jak +1 i -2), musisz zdefiniować
odpowiednio metody `+@` i `-@`. Poniższe operatory jednak
**nie są cukrem syntaktycznym**. Nie są metodami dlatego nie można ich
przedefiniować.

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

Dodatkowo, `+=`, `*=` etc. są po prostu skrótami dla `var = var + other_var`,
`var = var * other_var`, etc. dlatego też nie można ich przedefiniować.

## Więcej

Więcej informacji na temat języka Ruby znajdziesz w
[dokumentacji](/pl/documentation/).



[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
