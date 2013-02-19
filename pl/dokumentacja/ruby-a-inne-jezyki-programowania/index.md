---
layout: page
title: "Ruby a Inne Języki Programowania"
lang: pl
---

Gdy po raz pierwszy zobaczysz kawałek kodu w Rubim, prawdopodobnie
będzie on zbliżony do innych języków, z którymi miałeś do czynienia. Tak
ma być. Większość składni nawiązuje do Perla, Pythona i Javy, więc jeśli
te języki są znajome, to nauka Rubiego będzie jak bułka z masłem.

Ten dokument zawiera dwie sekcje. Pierwsza, opisuje najważniejsze
różnice pomiędzy językiem *X* a Rubim. Druga zawiera obraz
najważniejszych elementów języka i porównuje je do tego, co już znasz.

## Czego oczekiwać: *Język X* a Ruby

* [Ruby a
  Java](/pl/dokumentacja/ruby-a-inne-jezyki-programowania/ruby-a-java/)
* [Ruby a
  PHP](/pl/dokumentacja/ruby-a-inne-jezyki-programowania/ruby-a-php/)
* [Ruby a
  Python](/pl/dokumentacja/ruby-a-inne-jezyki-programowania/ruby-a-python/)

## Ważne elementy języka i niespodzianki

Poniżej znajdziesz kilka wskazówek na temat najważniejszych elementów
Rubiego.

### Iteracja

Są dwa elementy, które są nieco różne od tego co możesz już znać. Jednym
z nich są “bloki” oraz iteratory. Zamiast iterować po indeksach w
tablicy (jak w C, C++ lub Javie &lt; 1.5), lub przechodzić po pętli po
liście (jak w Perlowym <tt>for (@a) \{...}</tt>, lub Pythonowym <tt>for
i in lista: ...</tt>), w Rubim zobaczysz:

    lista.each do |element|
      # Jesteśmy w bloku.
      # Tutaj zajmujemy się element-em.
    end

Aby dowiedzieć się więcej o `each` (oraz pokrewnych: `collect`, `find`,
`inject`, `sort`, itd), rzuć okiem na `ri Enumerable` (a potem <tt>ri
Enumerable#*func\_name*</tt>).

### Wszystko ma wartość

Nie ma różnicy pomiędzy wyrażeniem a instrukcją. Wszystko posiada
wartość, nawet jeśli ta wartość jest **nil**.

    x = 10
    y = 11
    z = if x  true

### Symbole nie są “lekkimi stringami”

Wielu programistów przechodzących do Rubiego ma problemy ze zrozumieniem
koncepcji symboli, oraz do czego powinno się ich używać.

Symbole są podobną klasą obiektów, co liczby. Każde wystąpienie tej
samej liczby w wyrażeniu zawsze odnosi się do tego samego obiektu.
Spójrz na ten przykład:

    irb(main):001:0> :george.object_id == :george.object_id
    => true
    irb(main):002:0> "george".object_id == "george".object_id
    => false
    irb(main):003:0>

Metoda `object_id` zwraca unikalny identyfikator obiektu w pamięci.
Jeśli dwa obiekty mają ten sam `object_id`, to są tym samym obiektem
(lub wskazują na ten sam obiekt w pamięci).

Jeśli zatem użyjesz raz jakiegoś symbolu, to kolejne odwołania do niego,
zawsze będą odnosić się do tego samego obiektu. Każde dwa symbole
reprezentujące ten sam ciąg znaków wskazują na ten sam obiekt w pamięci.

Spójrzmy na String (“george”). Wartości `object_id` nie są te same.
Znaczy to tyle, że odnosimy się do dwóch osobnych obiektów w pamięci.
Kiedykolwiek używasz Stringów, Ruby dla każdego z nich alokuje pamięć.

Jeśli nie jesteś pewien w jakim scenariuszu użyć Symbolu a w jakim
Stringu, zastanów się co w danym przypadku jest istotne—tożsamość
obiektu (na przykład w słowniku), czy jego wartość (“george”).

### Wszystko jest obiektem.

“Wszystko jest obiektem” to bardzo silne założenie. Nawet klasy i liczby
całkowite są obiektami, i możesz na nich działać jak na zwykłych
obiektach:

    # Poniższe definicje są tożsame
    # class MyClass
    #   attr_accessor :instance_var
    # end
    MyClass = Class.new do
      attr_accessor :instance_var
    end

### Stałe (zmienne)

Stałe tak naprawdę nie są stałymi. Jeśli zmodyfikujesz stałą, która już
posiada wartość, otrzymasz ostrzeżenie, ale nie doprowadzi to do
wstrzymania twojego programu. Nie znaczy to oczywiście, że powinieneś
modyfikować wartość stałych.

### Konwencje nazewnictwa

Ruby wymusza pewną konwencję jeśli chodzi o nazewnictwo. Jeśli nazwa
zaczyna się od wielkiej litery, jest stałą. Jeśli zaczyna się od znaku
dolara ($), jest zmienną globalną. Jeśli zaczyna się od `@`, jest
zmienną należącą do egzemplarza obiektu. Jeśli zaczyna się od `@@`, jest
zmienną należącą do klasy.

Nazwy metod mogą zaczyna się od wielkiej litery. Może być to źródłem
pewnego zamieszania, jak widać poniżej:

    Constant = 10
    def Constant
      11
    end

Teraz `Constant` ma wartość 10, ale `Constant()` daje wartość 11.

### Udawane argumenty ze słowami kluczowymi

Ruby nie posiada argumentów w formie słów kluczowych tak jak Python, ale
można jest bardzo łatwo zastąpić używając słowników i symboli. Ruby on
Rails używa tego na każdym kroku:

    def some_keyword_params( params )
      params
    end
    some_keyword_params( :param_one => 10, :param_two => 42 )
    # => {:param_one=>10, :param_two=>42}

### Prawda absolutna

W Rubim wszystko, oprócz **nil** oraz **false** jest równoważne
**true**. W C, Pythonie i wielu innych językach, zero oraz inne
wartości, takie jak puste listy są uważane za **false**. Spójrz na
poniższy kod w Pythonie:

    # w Pythonie
    if 0:
      print "0 is true"
    else:
      print "0 is false"

Ten kawałek kodu wypisze <tt>0 is false</tt> To samo w Rubim wygląda
tak:

    # w Rubim
    if 0
      puts "0 is true"
    else
      puts "0 is false"
    end

Wypisze “0 is true”.

### Modyfikatory zakresu dostępu do metod działają do końca definicji klasy.

W poniższym kodzie,

    class MyClass
      private
      def a_method; true; end
      def another_method; false; end
    end

Być może oczekujesz, że `another_method` jest metodą publiczną? Nie
jest. Modyfikator dostępu ‘private’ jest zastosowany dla wszystkich
metod następujących po nim, lub do momentu napotkania innego
modyfikatora zakresu dostępu. Domyślnie, wszystkie metody są publiczne.

    class MyClass
      # Now a_method is public
      def a_method; true; end
    
      private
    
      # another_method jest metodą prywatną
      def another_method; false; end
    end

 `public`, `private` and `protected` to tak naprawdę metody, mogą więc przyjmowac paramatery. Jeśli tym metodom przekażesz Symbol jako parametr, zmienisz widoczność danej metody. ### Dostęp do metod

W JAvie, `public` oznacza, że dana metoda jest dostępna dla wszystkich.
`protected` oznacza, że dostęp mają instancje danej klasy i klas
pochodnych, natomiast `private` oznacza, że jedynie instancje danej
klasy mają dostęp do danej metody.

Ruby róznie się odrobinę w tym względzie. `public` oznacza tak samo
dostęp publiczny. `private` oznacza, że dana metoda(y) jest dostępna
tylko wtedy, jeśli można ją wywołać bez wyraźnego określenia odbiorcy.
Jedynie **self** jest dozwolonym odbiorcą wywołań prywatnych metod.

 `protected` jest tym, na co trzeba zwrócić uwagę. Metoda chroniona może być wywołana przez instancje danej klasy lub klas pochodnych, ale również przez inną instancję danej klasy. Poniżej przykład za [Ruby FAQ][1]\:

    $ irb
    irb(main):001:0> class Test
    irb(main):002:1>   # domyślnie metoda publiczna
    irb(main):003:1*   def func
    irb(main):004:2>     99
    irb(main):005:2>   end
    irb(main):006:1> 
    irb(main):007:1*   def ==(other)
    irb(main):008:2>     func == other.func
    irb(main):009:2>   end
    irb(main):010:1> end
    => nil
    irb(main):011:0> 
    irb(main):012:0* t1 = Test.new
    => #<Test:0x34ab50>
    irb(main):013:0> t2 = Test.new
    => #<Test:0x342784>
    irb(main):014:0> t1 == t2
    => true
    irb(main):015:0> # uczyńmy teraz `func` metodą chronioną, wciąż działa
    irb(main):016:0* # ponieważ 'protected' umożliwia odniesienie do 'other'
    irb(main):017:0* class Test
    irb(main):018:1>   protected :func
    irb(main):019:1> end
    => Test
    irb(main):020:0> t1 == t2
    => true
    irb(main):021:0> # uczyńmy teraz 'func' metodą prywatną
    irb(main):022:0* class Test
    irb(main):023:1>   private :func
    irb(main):024:1> end
    => Test
    irb(main):025:0> t1 == t2
    NoMethodError: private method `func' called for #<Test:0x342784>
            from (irb):8:in `=='
            from (irb):25
            from :0
    irb(main):026:0>

### Klasy są otwarte

Klasy Rubiego są otwarte. Można je otworzyć, dodać nowe metody czy
zmienić istniejące działanie w dowolnym momencie. Nawet główne klasy
takie jak `Fixnum` czy nawet `Object`, rodzic wszystkich obiektów. Ruby
on Rails na przykład definiuje zestaw metod do operowania czasem w
klasie `Fixnum`. Poniżej:

    class Fixnum
      def hours
        self * 3600 # liczba sekund w godzinie
      end
      alias hour hours
    end
      
    # 14 hours from 00:00 January 1st
    # (czyt. kiedy w końcu się obudzisz ;)
    Time.mktime(2006, 01, 01) + 14.hours # => Sun Jan 01 14:00:00

### Śmieszne nazwy metod

W Rubim, nazwy metod mogą kończyć się pytajnikiem lub wykrzyknikiem.
Według przyjętej konwencji, metody które odpowiadają na jakieś pytanie
(n.p. <tt>Array#empty?</tt> zwraca **true** jeśli odbiorca jest pusty)
kończą się pytajnikiem. Potencjalnie “groźne” metody (np. metody, które
modyfikują **self** – dany obiekt lub swoje argumenty `exit!` etc.)
kończą się wykrzyknikiem.

Wszystkie metody, których celem jest zmiana swoich argumentów, nie
kończą się wykrzyknikiem. <tt>Array#replace</tt> zamienia zawartość
danej tablicy zawartością innej tablicy. Istnienie tej metody w celu
innym niż modyfikacja danego obiektu **self** nie ma zbyt dużego sensu.

### Metody singleton

Metody singletonowe to metody, które zostały zdefiniowane i są dostępne
dla danego obiektu.

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

### Brakujące metody

Ruby nie poddaje się jeśli nie może odnaleźć danej metody. Wywołuje w
takim przypadku metodę `method_missing` przekazując nazwę metody, której
nie mógł znaleźć jako argument. Domyślnie, method\_missing zgłasza
wyjątek NameError, lecz można ją przedefiniować aby lepiej pasowała do
Twojej aplikacji, wiele bibliotek tak robi. Poniżej jeden z przykładów:

    # id jest nazwą wywołanej metody, składnia * łączy wszystkie pozostałe argumenty
    # w tablicę nazwaną 'arguments'
    def method_missing( id, *arguments )
      puts "Wywołano niezdefiniowaną metodę #{id}. Przekazano " + 
           "poniższe argumenty: #{arguments.join(", ")}"
    end
    
    __ :a, :b, 10
    # => Wywołano niezdefiniowaną metodę __. Przekazano poniższe 
    # argumenty: a, b, 10

Powyższy kod wyświetla po prostu szczegóły wywołania, możesz to
zachowanie dowolnie zmienić.

### Przekazywanie wiadomości, nie wywołanie metody

Wywołanie metody jest tak naprawdę **wiadomością** przekazywaną innemu
obiektowi:

    # To
    1 + 2
    # Jest to samo co ...
    1.+(2)
    # Jest to to samo co:
    1.send "+", 2

### Bloki są Obiektami, tylko o tym jeszcze nie wiedzą

Bloki (tak naprawdę domknięcia) są powszechnie używane w podstawowej
bibliotece Rubiego. Aby wywołać blok, możesz użyć albo `yield`, albo
utworzyć specjalny obiekt typu `Proc` przekazując specjalny argument,
tak jak w poniższym przykładzie:

    def block( &the_block )
      # Tutaj, the_block jest blokiem przekazanym do tej metody
      the_block # zwróć blok
    end
    adder = block { |a, b| a + b }
    # adder to teraz obiekt typu Proc
    adder.class # => Proc

Możesz tworzyć bloki równiez poza wywołaniami metod, wywołując Proc.new
lub metodę `lambda`.

Podobnie, metody to także obiekty:

    method(:puts).call "puts to obiekt!"
    # => puts to obiekt!

### Operatory to cukier syntaktyczny

Większość operatorów w Rubim to po prostu cukier syntaktyczny dla
wywołań metod. Możesz, na przykład, nadpisać metodę + klasy Fixnum:

    class Fixnum
      # Możesz, ale proszę nie rób tego !
      def +( other )
        self - other
      end
    end

Nie potrzebujesz operatora z C++’s `operator+`, etc.

Poniższe operatory jednak **nie są cukrem syntaktycznym**. Nie są
metodami dlatego nie można ich przedefiniować.

    =, .., ..., !, not, &&, and, ||, or, !=, !~, ::
{: .code .symbols-code}

 Dodatkowo, +=, \*= etc. są po prostu skrótami dla `var = var + other_var`, `var = var * other_var`, etc. dlatego też nie można ich przedefiniować. ## Więcej

Więcej informacji na temat języka Ruby znajdziesz w
[dokumentacji](/pl/dokumentacja/)



[1]: http://www.rubycentral.com/faq/rubyfaq-7.html 
