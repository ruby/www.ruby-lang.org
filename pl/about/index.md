---
layout: page
title: "O języku Ruby"
lang: pl
---

Zastanawiasz się dlaczego Ruby jest tak popularny? Jego fani nazywają go
pięknym, pełnym sztuki językiem. Mimo to, twierdzą, że jest poręczny i
praktyczny. O co chodzi ?

### Ideały twórcy języka Ruby

Ruby jest językiem starannie dobranej równowagi. Jego twórca, [Yukihiro
“Matz” Matsumoto][1], połączył części jego ulubionych języków (Perla,
Smalltalka, Eiffel, Ady i Lispa) by uformować nowy język, który
zbalansował programowanie funkcjonalne wraz z programowanie
imperatywnym.

Matz często mówi, że chce uczynić ten język naturalnym – nie
prostym – w sposób odzwierciedlający życie. 

Bazując na tym dodaje:

> Ruby jest prosty z wyglądu, ale bardzo skomplikowany w środku, tak jak
> ciało ludzkie<sup>[1](#fn1)</sup>.

### O rozwoju Ruby

Począwszy od publicznego wydania w 1995, Ruby zwrócił na siebie uwagę
wielu programistów na całym świecie. W 2006 Ruby uzyskał masową
akceptację, co objawiło sie w postaci dużej ilości aktywnych grup
użytkowników powstających w największych miastach świata oraz salach
konferencyjnych wypełnionych po brzegi.

![Graph courtesy of
Gmane.](http://gmane.org/plot-rate.php?group=gmane.comp.lang.ruby.general&amp;width=320&amp;height=160&amp;title=Ruby-Talk+Activity
"Graph courtesy of Gmane."){: style="padding-left:8px;"}
{: style="float:right"}

Ruby-Talk, główna [lista mailingowa](/en/community/mailing-lists/) na
tematy związane z Rubim, osiągnęła średnio ruch 200 wiadomości dziennie
w 2006 roku. Zmalało to w ostatnich latach gdy część spółeczności
przeniosło dyskusje z jednej centralnej listy na wiele mniejszych grup.

Wskaźnik [TIOBE indeks][6], który mierzy rozwój języków programowania, umieszcza
Rubiego na 10 miejscu wśród światowych języków programowania. Wiele owego
wzrostu zawdzięcza Ruby popularności software napisanego przy jego użyciu,
szczególnie frameworkowi Ruby on Rails<sup>[2](#fn2)</sup>.

Ruby jest także [zupełnie darmowy]({{ site.license.url }}). Darmowe jest nie
tylko korzystanie, ale również kopiowanie, modyfikowanie i
rozprowadzanie tego języka.

### Postrzeganie Wszystkiego Jako Obiekt

Początkowo, Matz szukał w innych językach idealnej składni. Wspominając
swoje poszukiwania, Matz mówi: “Szukałem języka potężniejszego od Perla
i bardziej obiektowego od Pythona<sup>[3](#fn3)</sup>.”

W Rubim, wszystko jest obiektem. Każdy fragment informacji i kodu może
uzyskać swoje właściwości i czynności. Programowanie obiektowe nazywa
właściwości *zmiennymi instancji* a czynności *metodami*. Czysto
obiektowe podejście Rubiego jest zazwyczaj demonstrowane przy użyciu
fragmentu kodu, który wywołuje czynność na liczbie.

{% highlight ruby %}
5.times { print "We *love* Ruby -- it's outrageous!" }
{% endhighlight %}

W wielu językach, liczby i inne typy podstawowe nie są obiektami. Ruby
podąża za Smalltalkiem udostępniając metody i zmienne instancji
wszystkim swoim typom. To ułatwia korzystanie z języka, ponieważ reguły
mające zastosowanie do obiektów odnoszą sie również do całego języka.

### Elastyczność Rubiego

Ruby postrzegany jest jako język elastyczny, ponieważ pozwala on swoim
użytkownikom dowolnie modyfikować jego części. Zasadnicze części języka
mogą zostać usunięte lub przedefiniowane – w zależności od woli. Do
istniejących już części można dodać nowe. Ruby stara się nie ograniczać
programisty.

Na przykład, dodawanie wykonuje się za pomocą operatora (`+`). Lecz
gdybyś chciał wykorzystać w tym celu słowa `plus`, mógłbyś dodać
stosowną metodę do klasy `Numeric`.

{% highlight ruby %}
class Numeric
  def plus(x)
    self.+(x)
  end
end

y = 5.plus 6
# y wynosi teraz 11
{% endhighlight %}

Operatory Rubiego są lukrem składniowym dla metod, metody również
możesz przedefiniować.

### Bloki, Prawdziwie Ekspresyjna Właściwość

Bloki postrzegane są jako źródło ogromnej elastyczności. Programista
może dołączyć domknięcie (ang. closure) do dowolnej metody, opisując jak
dana metoda ma działać. To domknięcie nazywa się *blokiem* i stało się
ono jednym z najbardziej popularnych właściwości Rubiego dla
programistów pochodzących ze środowisk PHP i Visual Basic’a.

Bloki zainspirowane zostały językami funkcjonalnymi. Matz mówił, “w
blokach Rubiego chciałem oddać szacunek środowisku
Lispa<sup>[4](#fn4)</sup>.”

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

W powyższym kodzie, blok jest opisany pomiędzy słowami `do ... end`.
Metoda `map` aplikuje zadany blok do podanej listy słów (Google Yahoo
MSN). Wiele innych metod w Rubim udostępnia miejsce dla programisty,
który może napisać swój własny blok i wykorzystać go w danej metodzie.

### Język Ruby oraz Mixin-y

W przeciwieństwie do innych języków obiektowych, Ruby potrafi realizować
tylko jednokrotne dziedziczenie **celowo**. Język Ruby pozwala jednak na
korzystanie z modułów (zwanych również Kategoriami w Objective-C).
Moduły są zbiorami metod.

Klasy mogą dołączyć moduł i w ten sposób przejąć implementację metod z
modułu. Dla przykładu, którakolwiek z klas implementujących metodę
`each` może dołączyć moduł `Enumerable`, który z kolei realizuje kilka
metod, które wykorzystują metodę `each` do iterowania po elementach.

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

Programiści języka Ruby uznają tą technikę za prostszą niż wielokrotne
dziedziczenie, które może być skomplikowane i nakłada wiele ograniczeń.

### Wygląd Rubiego

Ruby używa minimalnej liczby elementów składni i zwykle preferuje
angielskie słowa kluczowe. Używa pewnych znaków interpunkcyjnych
do jej udekorowania. Ruby nie wymaga deklaracji zmiennych,
jedynie bardzo prostej konwencji, aby zaznaczyć w jakim zakresie żyje
zmienna.

* `var` może być zmienną lokalną.
* `@var` jest polem instancji (zmienną instancji).
* `$var` jest zmienną globalną.

Dzięki tej konwencji, programista może szybko zidentyfikować rodzaj
zmiennej z którą ma do czynienia. Nie ma już potrzeby wstawiania słowa
kluczowego `self.` przy każdym wystąpieniu zmiennej instancji.

### Zaawansowane techniki

Ruby posiada bogactwo innych właściwości, niektóre z nich to:

* Ruby obsługuje błędy poprzez wyjątki, zupełnie jak Java lub Python.
  Pozwala to na wykorzystanie dobrze znanego mechanizmu przez
  programistów tych języków.
^

* Ruby posiada prawdziwy garbage collector typu mark-and-sweep dla
  wszystkich obiektów żyjących w pamięci obiektowej. Nie ma potrzeby
  przetrzymywania informacji na temat liczby odniesień do obiektu. Jak
  mówi Matz, “Wpływa to korzystnie na twoje zdrowie.”
^

* Pisanie rozszerzeń do Rubiego jest prostsze niż w Perlu lub Pythonie i
  ma bardzo eleganckie API dostępne w języku C. Pozwala ono na
  wbudowanie interpretera Rubiego do aplikacji jako język skryptowy.
  Dostępny jest również interfejs SWIG.
^

* Jeśli system operacyjny na to pozwala, Ruby pozwala na dynamiczne
  ładowanie bibliotek.
^

* Ruby posiada wątki, które są niezależne od systemu operacyjnego. To
  znaczy, że są one dostępne na każdej platformie, niezależnie od tego,
  czy sama platforma wspiera wątki, można ich używać nawet w MS-DOS!
^

* Ruby jest bardzo przenośny: rozwijany głównie na platformie GNU/Linux,
  ale może być używany na wielu typach UNIXów, Mac OS X, Windows
  95/98/Me/NT/2000/XP/Vista/7/8, DOS, BeOS, OS/2, itd.

#### Odnośniki

<sup>1</sup> Matz, wypowiedź na liście ruby-talk, [May 12th, 2000][2].
{: #fn1}

<sup>2</sup> Zobacz stronę [Ruby on Rails][3] aby dowiedzieć sie więcej.
{: #fn2}

<sup>3</sup> Matz, w [Wywiad z twórcą języka Ruby][4], Nov. 29th, 2001.
{: #fn3}

<sup>4</sup> Matz, w [Bloki i domknięcia w Rubym][5], December 22nd,
2003.
{: #fn4}



[1]: http://www.rubyist.net/~matz/
[2]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/2773
[3]: http://rubyonrails.org/
[4]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[5]: http://www.artima.com/intv/closures2.html
[6]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
