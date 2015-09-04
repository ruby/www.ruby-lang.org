---
layout: news_post
title: "Wydano Ruby 2.0.0-p0"
author: "Yusuke Endoh"
translator: "crabonature"
date: 2013-02-24 09:06:22 +0000
lang: pl
---

Mamy przyjemność ogłosić wydanie Rubiego 2.0.0-p0.

Ruby 2.0.0 jest pierwszym stabilnym wydaniem serii 2.0 i zawiera wiele nowych
funkcji i usprawnień, w odpowiedzi na coraz bardziej zróżnicowane i poszerzające
wymagania w stosunku do Rubiego.


Przyjemnego programowania w Ruby 2.0.0!

## Pobieranie

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2&gt;][1]

      SIZE:   10814890 bytes
      MD5:    895c1c581f8d28e8b3bb02472b2ccf6a
      SHA256: c680d392ccc4901c32067576f5b474ee186def2fcd3fcbfa485739168093295f

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz&gt;][2]

      SIZE:   13608925 bytes
      MD5:    50d307c4dc9297ae59952527be4e755d
      SHA256: aff85ba5ceb70303cb7fb616f5db8b95ec47a8820116198d1c866cc4fff151ed

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip&gt;][3]

      SIZE:   15037340 bytes
      MD5:    db5af5d6034646ad194cbdf6e50f49ee
      SHA256: 0d0af6a9c8788537efd8d7d2358ce9468e6e2b7703dacba9ebd064d8b7da5f99

## O Ruby 2.0.0

### Nowości

Niektóre z najważniejszych::

* Kluczowe funkcje języka
  * Kluczowe argumenty, które dają swobodę projektowania API
  * `Module#prepend`, które jest nowym sposobem rozszerzania klas
  * Literał `%i`, który ułatwia tworzenie tablicy symboli
  * `__dir__`, które zwraca nazwę katalogu pliku, który jest aktualnie
    przetwarzany
  * Domyślne kodowanie `UTF-8`, które sprawia, że wiele komentarzy służących
    do kodowania znaków jest niepotrzebnych

* Wbudowane biblioteki
  * `Enumerable#lazy` i `Enumerator::Lazy`, dla (możliwie nieskończonych)
    leniwych strumieni (*lazy strings*)
  * `Enumerator#size` i `Range#size`, dla leniwego wyliczania rozmiaru
  * `#to_h`, które jest nową konwencją dla konwersji do `Hash`
  * `Onigmo`, które jest nowym silnikiem wyrażeń regularnych (klon `Oniguruma`)
  * API do asynchronicznego łapania wyjątków

* Wsparcie debugowania
  * wsparcie dla `DTrace`, które umożliwia diagnostykę podczas wykonywania
    na produkcji
  * `TracePoint`, ulepszone API do śledzenia problemów

* Usprawnienia wydajności
  * Optymalizacja `GC` poprzez oznaczanie bitmapy (*bitmap marking*)
  * Optymalizacja `Kernel#require`, która czyni proces ładowania Rails
    bardzo szybkim
  * Optymalizacja VM w postaci przesyłania metod (*method dispatch*)
  * Optymalizacja opracji dla `Float`

Dodatkowo eksperymentalnie 2.0.0 zawiera `Refinements`,
które dodają nową koncepcję modułów Rubiego.

Zobacz także wiadomości dotyczące nowych funkcji, ulepszeń i detali.

### Zgodność

Projektując 2.0.0 zadbaliśmy by był zgodny z 1.9. O wiele łatwiej będzie
migrować z 1.9 do 2.0 niż to było z 1.8 do 1.9 (Niezgodności są opisane poniżej)

W rzeczywistości dzięki dedykowanej pracy osób trzecich popularne aplikacje
jak Rails i tDiary działały na wersji 2.0.0.RC.

### Dokumentacja

Wprowadziliśmy też sporo ulepszeń w dokumentacji, o które zabiegało wielu
użytkowników Rubiego. Dodaliśmy ogromną ilość rdoc modułów i metod.
2.0.0 będzie udokumentowane w 75%, podczas gdy 1.9.3 było w około 60%.
Ponadto dodaliśmy opis składni języka Ruby, co możesz zobaczyć:

{% highlight sh %}
ri ruby:syntax
{% endhighlight %}

### Stabilność

Proszę zauważyć, że inaczej niż 1.9.0, 2.0.0 jest stabilnym wydaniem,
pomimo że jego numer wersji ma 0 na końcu. Rekomendujemy wszystkim
autorom bibliotek wsparcie wersji 2.0.0. Jak wspomniano powyżej będzie
stosunkowo łatwo migrować z 1.9 do 2.0.

Ruby 2.0.0 jest gotowe do praktycznego użycia i zdecydowanie usprawni
twoją przygodę z Ruby.

## Notatki

### Artykuły

Tu możesz znaleźć wstępne artykuły osób trzecich na temat Ruby 2.0.0:

* [&lt;URL:http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example&gt;][4]
  (obszerny, polecany, po angielsku)
* [&lt;URL:https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0&gt;][5]
  (obszerny, polecany, po angielsku)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][6]
  (streszczenie, po japońsku)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][7]
  (tylko `Enumerator::Lazy`, po japońsku)

Poniżej także pomocne artykuły, aczkolwiek nieaktualne w tematyce `Refinements` (po angielsku):

* [&lt;URL:http://rubysource.com/a-look-at-ruby-2-0/&gt;][8]
* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][9]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][10]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][11]

Ostatnie wydanie "Rubyist Magazine" zawiera artykuły napisane osobiście przez autorów
funkcjonalności dla wprowadzenia do nowości w 2.0.0.

* [&lt;URL:http://jp.rubyist.net/magazine/?0041-200Special&gt;][12]

Choć napisane po japońsku to angielskie tłumaczenia są planowane w przyszłości.

### Niezgodność

Jest pięć zauważalnych niezgodności, o których wiemy:

* Domyślne kodowanie skryptów Ruby obecnie to UTF-8 \[#6679\].
  Niektóre osoby zgłaszały fakt, że ma to wpływ na ich istniejące programy,
  niektóre programy do badania wydajności stawały się bardzo powolne \[ruby-dev:46547\].
* `Iconv` zostało usunięte, które i tak było przestarzałe gdy `M17N` zostało wprowadzone w 1.9.
  Zamiast używaj `String#encode`, itp.
* Jest złamanie ABI \[ruby-core:48984\]. Uważamy, że zwykły użytkownik może/powinien
  po prostu przeinstalować biblioteki rozszerzeń. Musisz zwrócić uwagę by
  NIE KOPIOWAĆ PLIKÓW .so lub .bundle Z 1.9.
* `#lines`, `#chars`, `#codepoints`, `#bytes` zwracają obecnie `Array` zamiast `Enumerator` \[#6670\].
  Ta zmiana umożliwia uniknąć pospolitych \"lines.to\_a\". Używaj `#each_line` itp. by dostać `Enumerator`.
* `Object#inspect` zawsze zwraca napis postaci #&lt;ClassName:0x...&gt; zamiast delegować do `#to_s`. \[#2152\]

Istnieją też stosunkowo nieznaczne niezgodności.
\[ruby-core:49119\]

### Status `Refinements`

Dodaliśmy `Refinements`, które wprowadzają nową koncepcję modułów w Ruby.
Jednakże, proszę zwrócić uwagę na to, że `Refinements` są ciągle w fazie eksperymentalnej,
czyli możemy zmienić ich specyfikację w przyszłości. Pomimo tego,
chcielibyśmy abyś z nich korzystał i przekazał nam swoje spostrzeżenia i uwagi.
Twoje opinie pomogą ukształtować tą interesującą funkcjonalność.

## Podziękowania

Wielu wspaniałych ludzi wzięło udział przy realizacji 2.0.0.
Nawet niepełne uznanie kilku fragmentów wsparcia stało się zbyt obszerne
by je tu umieścić. Przykro nam z tego powodu, z racji tego dodaję link
do specjalnej strony z podziękowaniami.

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks&gt;][13]

Dzięki wam wszystkim!



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip
[4]: http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example
[5]: https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0
[6]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[7]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[8]: http://rubysource.com/a-look-at-ruby-2-0/
[9]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[10]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[11]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[12]: http://jp.rubyist.net/magazine/?0041-200Special
[13]: https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks
