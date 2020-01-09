---
layout: news_post
title: "Wydano Ruby 2.2.0-preview2"
author: "naruse"
translator: "crabonature"
date: 2014-11-28 09:00:00 +0000
lang: pl
---

Jest nam miło ogłosić wydanie Rubiego 2.2.0-preview2.

Ruby 2.2.0-preview2 jest drugim wydaniem Ruby 2.2.0.
Wiele nowych funkcjonalności i udoskonaleń zostało włączonych do coraz bardziej
zróżnicowanych i poszerzonych wymagań dla Rubiego.

Dla przykładu, Symbol GC sprawia, że symbole podlegają odśmiecaniu. Redukuje to
zużycie pamięci dla symboli; przed Rubim 2.2 mechanizm odśmiecania pamięci nie
zwracał uwagi na symbole. Zatem Rails 5.0 będzie wymagało Symbol GC, będzie
wspierało tylko Rubiego 2.2 lub późniejsze.
(Zobacz [wpis na blogu Rails](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/)
po szczegóły.)

Także nowy Incremental GC zmniejszy czas wstrzymania odśmiecania pamięci.
Jest to pomocne przy aplikacjach Railsowych.

Kolejna funkcjonalność związana z zarządzaniem pamięcią to dodana opcja w configure.in
by używać jemalloc [Funkcjonalność #9113](https://bugs.ruby-lang.org/issues/9113).
Jest to eksperymentalna funkcjonalność i domyślnie nieaktywna.
Potrzebujemy zebrać przypadki użycia i dane odnośnie wydajności.
Gdy będziemy przekonani o korzyściach, funkcjonalność będzie domyślnie włączona.

Dodatkowym tematem jest [używanie vfork(2) w system() i spawn() (japoński)](http://www.a-k-r.org/d/2014-09.html#a2014_09_06).
Jest oczekiwane, że spowoduje to ogromne przyspieszenie gdy duży proces wykonuje
zewnętrze komendy wiele razy.
Ale vfork(2) jest ryzykownym wywołaniem systemowym.
Chcemy się przekonać jak wiele zysku to przyniesie poprzez zebranie przypadków
użycia i danych odnośnie wydajności.

Wypróbuj i miłego programowania z Rubim 2.2.0-preview2, oraz poinformuj nas o
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
  * Aktualizacja Psych 2.0.6
  * Aktualizacja Rake 10.4.0
  * Aktualizacja RDoc 4.2.0.alpha (21b241a)
  * Aktualizacja RubyGems 2.4.4+ (2f6e42e)
  * rubygems 2.4.4+ (2f6e42e)
  * Aktualizacja test-unit 3.0.7 (usunięta z repozytorium ale załączona w tarballu)
  * Aktualizacja minitest 5.4.3 (usunięta z repozytorium ale załączona w tarballu)
  * mathn oznaczone jako przestarzałe
* C API
  * Usunięcie przestarzałych APIs

Zobacz [Wiadomości w repozytorium Rubiego (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_preview2/NEWS) po szczegóły.

Z tymi zmianami, 1239 zmienionych plików, 98343 wstawień(+), 61858 usunięć(-).

## Pobieranie

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.bz2>
  * SIZE:   12505279 bytes
  * MD5:    d7abace25a8ffe861cb2807bef1c58a6
  * SHA256: 9e49583f3fad3888fefc85b719fdb210a88ef54d80f9eac439b7ca4232fa7f0b
  * SHA512: c654d4c047f9463a5fb81eaea0fa5ab7bf316962bc7fb0fb356861e6336ce8ce2162c7779d8b27f72d7bc0e9604b5e5af2910abcb0b0a1f197b3138eaddfd4a5
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.gz>
  * SIZE:   15505521 bytes
  * MD5:    bde388d6f10012a92d5dc36196fd6755
  * SHA256: dfcef7b01bd3acb41da6689993ac8dd30e2ecd4fd14bc1a833f46188a9fe2614
  * SHA512: e2d316a679c15c021e40b0f9b7810b319c6a5e771a9b869fda35b6745aecac881bbb05d62192893799816a8673e05c8f17713f10ccdec077f546483608ab85c1
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.xz>
  * SIZE:   9649216 bytes
  * MD5:    0d582e28b92ce9d1456e40fb8d821422
  * SHA256: d14d1fa045263fa242a515d7b9e8c485bf8a9ee9d9d3012dc2b6add0f3a370c6
  * SHA512: 4a8a75ab21b2bd43db4a22d9c63f189f3c7805d575d662b07a4ddc25aa5b156b0c23053d8c48eecf23d5e22f1ea7131467f1cdc48f9ae0a83214b4cd46b08491
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.zip>
  * SIZE:   17239396 bytes
  * MD5:    d94160c214016863932c25cc1ac6ff90
  * SHA256: 88d6c73ee1a4f5fe1f8ad37fe1f56c1ca50622f1338c20b9d46bbb5c2cd94040
  * SHA512: 0a021d31f54c47c5c3901ef6f2ab02a1bfb5cc698f971978c1e16b1aeda78fdadec0c1cdd48af1c8784b8f72ad00d35cf2433d78e20d4447fa0630e02b4e3917

## Komentarz do wydania

* [2.2.0 Znane problemy](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

Zobacz także harmonogram wydań i inne informacje:

[Wydania22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
