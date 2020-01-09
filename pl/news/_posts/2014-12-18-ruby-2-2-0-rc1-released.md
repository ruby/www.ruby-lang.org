---
layout: news_post
title: "Wydano Ruby 2.2.0-rc1"
author: "naruse"
translator: "crabonature"
date: 2014-12-18 09:00:00 +0000
lang: pl
---

Jest nam miło ogłosić wydanie Rubiego 2.2.0-rc1.
Po RC1, wszystkie zmiany zostaną ograniczone tylko do poprawiania błędów.
Finalne wydanie Rubiego 2.2.0 jest zaplanowane na 25 grudnia 2014.

Ruby 2.2 zawiera wiele nowych funkcjonalności i udoskonaleń dla coraz bardziej
zróżnicowanych i poszerzonych wymagań.

Dla przykładu, odśmiecacz pamięci w Rubim jest w stanie obsługiwać obiekty typu Symbol.
Redukuje to zużycie pamięci dla symboli; przed Rubim 2.2 mechanizm odśmiecania pamięci nie
był w stanie ich obsługiwać. Rails 5.0 będzie wymagało Symbol GC, będzie
wspierało tylko Rubiego 2.2 lub późniejsze.
(Zobacz [wpis na blogu Rails](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/)
po szczegóły.)

Także zredukowany czas wstrzymania dzięki nowemu Incremental Garbage Collector
będzie przydatny dla uruchomionych aplikacji Railsowych. Bieżące osiągnięcia wspomniane we [blogu Rails](http://weblog.rubyonrails.org/) sugerują, że Rails 5.0 będą wykorzystywać Incremental GC jak również Symbol GC.

Kolejna funkcjonalność związana z zarządzaniem pamięcią to dodana opcja w `configure.in`
by używać jemalloc [Funkcjonalność #9113](https://bugs.ruby-lang.org/issues/9113).
Jest to eksperymentalna funkcjonalność i domyślnie nieaktywna.
Potrzebujemy zebrać przypadki użycia i dane odnośnie wydajności.
Gdy będziemy przekonani o korzyściach, funkcjonalność będzie domyślnie włączona.

Eksperymentalne wsparcie dla używania vfork(2) z system() i spawn() także zostało dodane.
Więcej szczegółów możesz przeczytać na [blogu tanaka-sana po japońsku](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Potencjalnie spowoduje to ogromne przyspieszenie gdy duży proces wykonuje
zewnętrze komendy wiele razy.
Ale vfork(2) jest nadal niezbyt zrozumiałym i potencjalnie ryzykownym wywołaniem systemowym.
Chcemy się przekonać jak wiele zysku to przyniesie poprzez zebranie przypadków
użycia i danych odnośnie wydajności.

Wypróbuj i miłego programowania z Rubim 2.2.0-rc1, oraz poinformuj nas o
swoich spostrzeżeniach!

## Znaczące zmiany od 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634) ([prezentacja na RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* konfiguracja --with-jemalloc [Funkcjonalność #9113](https://bugs.ruby-lang.org/issues/9113)
* wbudowane biblioteki:
  * Wsparcie dla Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Nowe metody:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* dołączone biblioteki:
  * Aktualizacja Psych 2.0.8
  * Aktualizacja Rake 10.4.0
  * Aktualizacja RDoc 4.2.0.alpha (21b241a)
  * Aktualizacja RubyGems 2.4.5
  * Aktualizacja test-unit 3.0.8 (usunięta z repozytorium ale załączona w tarballu)
  * Aktualizacja minitest 5.4.3 (usunięta z repozytorium ale załączona w tarballu)
  * mathn oznaczone jako przestarzałe
* C API
  * Usunięcie przestarzałych APIs

Zobacz [Wiadomości w repozytorium Rubiego (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS) po szczegóły.

Z tymi zmianami, 1548 zmienionych plików, 123658 wstawień(+), 74306 usunięć(-) od v2.1.0!

## Pobieranie

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.bz2>
  * SIZE:   12475612 bytes
  * MD5:    7144732d30dd4547c0a59862b3345d54
  * SHA256: e6a1f8d45ea749bdc92eb1269b77ec475bc600b66039ff90d77db8f50820a896
  * SHA512: 181201168360bee37dceeef3481a69e8a333a5d329680031fd9d371d30ac64460bbdf4db07546133024f541774e51301f1630cfd988c5e5bf2464834f3abe6bf
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.gz>
  * SIZE:   15531233 bytes
  * MD5:    51f218fabc3ceb7bf3fe5f4f87ddebd3
  * SHA256: a59c8db71b967015ad7c259ba8ef638c7943ec78580412bb86e97791a9322b6b
  * SHA512: 4a35e78c4c0747f9c79e506e98acc117efb0be72fc103d6f9c13d5eb5efa5c6d6748f491526fc7ebb24397f25238f06d552f841e9e898be30aa7cd6c2df38494
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.xz>
  * SIZE:   9675108 bytes
  * MD5:    3f482b88eda45c1bc6bab1921763ce52
  * SHA256: dcfad9bb6e0b513b03f08f86b195da6a6a7045559b558d3493decac0e0abb86c
  * SHA512: 3ec8955d8a269a1e5f28c3e0e6023bd613f244c83914a4a8c96d2761b11914c21ce67cfadb2bcebc480d9c0b9c7b54da6dfa67cdf4b4350db2a85d379265ffed
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.zip>
  * SIZE:   17219660 bytes
  * MD5:    49f5aae44c00f4d57be47576c29a53bd
  * SHA256: 1bd3e83d44b4e5879b4ecdc496d19905bc03637a8c88027c2dc98a369f1ebb83
  * SHA512: bf0e39e5add532ca338095ad6eaaafbe4f84cc9df1e8d4bad986c44e17614623430c2670d9751865e8d645cb483007d5473be82536b985ccab40a7dde72c4161

## Komentarz do wydania

* [2.2.0 Znane problemy](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

Zobacz także harmonogram wydań i inne informacje:

[Wydania22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
