---
layout: news_post
title: "Wydano Ruby 2.2.0"
author: "naruse"
translator: "crabonature"
date: 2014-12-25 09:00:00 +0000
lang: pl
---

Jest nam miło ogłosić wydanie Rubiego 2.2.0.

Ruby 2.2 zawiera wiele nowych funkcjonalności i udoskonaleń dla coraz bardziej
zróżnicowanych i poszerzonych wymagań.

Dla przykładu, odśmiecacz pamięci w Rubim jest w stanie obsługiwać obiekty typu Symbol.
Redukuje to zużycie pamięci dla symboli; przed Rubim 2.2 mechanizm odśmiecania pamięci nie
był w stanie ich obsługiwać.
Rails 5.0 będzie wymagało Symbol GC, będzie wspierało tylko Rubiego 2.2 lub
późniejsze. (Zobacz [wpis na blogu Rails](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/)
po szczegóły.)

Także zredukowany czas wstrzymania dzięki nowemu Incremental Garbage Collector
będzie przydatny dla uruchomionych aplikacji Railsowych. Bieżące osiągnięcia wspomniane we [blogu Rails](http://weblog.rubyonrails.org/) sugerują, że Rails 5.0 będą wykorzystywać Incremental GC jak również Symbol GC.

Kolejna funkcjonalność związana z zarządzaniem pamięcią to dodana opcja w `configure.in`
by używać jemalloc [Funkcjonalność #9113](https://bugs.ruby-lang.org/issues/9113).
Jest to eksperymentalna funkcjonalność i domyślnie nieaktywna dopóki nie
zbierzemy danych odnośnie wydajności więcej przypadków użycia.
Gdy będziemy przekonani o korzyściach, funkcjonalność będzie domyślnie włączona.

Eksperymentalne wsparcie dla używania vfork(2) z system() i spawn() także zostało dodane.
Więcej szczegółów możesz przeczytać na
[blogu tanaka-sana po japońsku](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Potencjalnie spowoduje to ogromne przyspieszenie gdy duży proces wykonuje
zewnętrze komendy wiele razy.
Ale vfork(2) jest nadal niezbyt zrozumiałym i potencjalnie ryzykownym wywołaniem systemowym.
Chcemy się przekonać jak wiele zysku to przyniesie poprzez zebranie danych odnośnie
wydajności i przypadków użycia.

Wypróbuj i miłego programowania z Rubim 2.2.0, oraz poinformuj nas o
swoich spostrzeżeniach!

## Znaczące zmiany od 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137)
  ([prezentacja na RubyConf 2014: "Incremental GC for Ruby interpreter"](http://www.atdot.net/~ko1/activities/2014_rubyconf_pub.pdf))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634)
  ([prezentacja na RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* konfiguracja --with-jemalloc
  [Funkcjonalność #9113](https://bugs.ruby-lang.org/issues/9113)
* wbudowane biblioteki:
  * Wsparcie dla Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Nowe metody:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071),
      Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float
      [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime
      [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* dołączone biblioteki:
  * Aktualizacja Psych 2.0.8
  * Aktualizacja Rake 10.4.2
  * Aktualizacja RDoc 4.2.0
  * Aktualizacja RubyGems 2.4.5
  * Aktualizacja test-unit 3.0.8 (usunięta z repozytorium ale załączona w tarballu)
  * Aktualizacja minitest 5.4.3 (usunięta z repozytorium ale załączona w tarballu)
  * mathn oznaczone jako przestarzałe
* C API
  * Usunięcie przestarzałych APIs

Zobacz [NEWS w repozytorium Rubiego](https://github.com/ruby/ruby/blob/v2_2_0/NEWS)
po szczegóły.

Z tymi zmianami, 1557 zmienionych plików, 125039 wstawień(+), 74376 usunięć(-)
od v2.1.0!

## Pobieranie

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * SIZE:   13304042 bytes
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * SIZE:   16494584 bytes
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * SIZE:   10304244 bytes
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * SIZE:   18441027 bytes
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e
