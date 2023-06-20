---
layout: news_post
title: "Wydano Ruby 2.4.0-preview1"
author: "naruse"
translator: 'Michał "Quintasan" Zając'
date: 2016-06-20 09:00:00 +0000
lang: pl
---

Jest nam miło ogłosić wydanie Rubiego 2.4.0-preview1.

Ruby 2.4.0-preview1 jest pierwszym wydaniem wstępnym Rubiego 2.4.0.
Wydanie preview1 pojawiło się wcześniej niż zwykle ponieważ zawiera
dużo usprawnień oraz funkcjonalności.
[Podziel się](https://github.com/ruby/ruby/wiki/How-To-Report)
z nami swoimi uwagami poniważ Ruby 2.4.0 jest nadal w trakcie rozwoju

## [Połączenie Fixnum i Bignum do klasy Integer](https://bugs.ruby-lang.org/issues/12005)

Mimo że standard [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
nie opisuje szczegółów klasy Integer, CRuby posiada dwie publiczne
klasy Integer: Fixnum i Bignum. Ruby 2.4 połączy obie klasy w klasę Integer

## [Klasa String wspiera kapitalizację znaków Unicode](https://bugs.ruby-lang.org/issues/10085)

Metody `String/Symbol#upcase/downcase/swapcase/capitalize(!)` od teraz
potrafią zmieniać kapitalizację znaków Unicode.

## Poprawki wypływające na wydajność

Ruby 2.4 zawiera poniższe usprawnienia pozytywnie wypływające na wydajność:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` i `[x, y].min` zostały zoptymalizowane tak,
aby nie tworzyć tymczasowej tablicy w pewnych przypadkach

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Dodano metodę `Regexp#match?` która dopasowuje wyrażenie regularne bez
tworzenia referencji i modyfikacji `$~` redukując ilość
zaalokowanych obiektów.

### Inne poprawki wpływające na wydajność

* [szybszy dostęp do zmiennych instancji](https://bugs.ruby-lang.org/issues/12274)

## Debugowanie

### [Thread#report_on_exception oraz Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby ignoruje wyjątki w wątkach chyba że inny wątek jawnie wywowła join.
Ustawiając `report_on_exception = true` zostanie wyświetlony komunikat
jeżeli wątek zakończy pracę w wyniku nieobsłużonego wyjątku.

Prosimy o Twoją opinię jaka powinna być domyślna wartość
`report_on_exception`.

### [Wykrywanie zakleszczenia wątków od teraz pokazuje zrzuty stosu oraz zależności](https://bugs.ruby-lang.org/issues/8214)

Ruby potrafi wykrywać zakleszczenia ale informacje zwracane przez
interpreter nie zawierają wystarczająco informacji by pozwolić
na debugowanie. Od Rubiego 2.4 pokazywane będą zrzuty stosu oraz
zależności oczekujących wątków.

Wypróbuj Rubiego 2.4.0-preview1 i
[podziel się](https://github.com/ruby/ruby/wiki/How-To-Report)
z nami swoimi spostrzeżeniami!

## Znaczące zmiany w stosunku do wersji 2.3

Pliki [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS)
oraz [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)
zawierają listę zmian.

Od wydania Rubiego 2.3 zmieniło się
[1140 plików, dodano 33126 linii kodu(+) a usunięto 50993(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview1)

## Pobierz

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.bz2>

  * SIZE:   14108114 bytes
  * SHA1:   7dcc42548d0724d83b6589ab98f34282845d7bcd
  * SHA256: 17570f0b84215ca82252f10c167ee50bc075383c018420c6b2601ae1cade0649
  * SHA512: c9873e8686eb54dbde61d6e23cd5197beebccd6cb31fd12c82763ebe1fde17095d7514d9d93c2c82b238032c98691df5479dc2d666a8a590e0fc54450ec29cb5

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.gz>

  * SIZE:   17605452 bytes
  * SHA1:   1003a1e57547d81f4bb979c0f40f242afc284cd5
  * SHA256: 80d02f49f40e7ce07b70bee7efda751b0595a349a017306e9fe8caad5da13e64
  * SHA512: 4b603ab4ff9ea7e8bb8053aa4b638839d534241466d7f0e4d5bca3f2ea416694c2ea391790f1ffdc07fa538918d27707621741eb0ddc7bd00eb9d7628622787a

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.xz>

  * SIZE:   11155800 bytes
  * SHA1:   bc33085277266f5a09a143bf6817affcb77f8e7f
  * SHA256: 62942c7300727469fe3d2b43e5a5c772d4836cf624a1d644bdece2afaca472c8
  * SHA512: dfc2c6642d49fa95383817a6dc82c416b3218ddfdaf882d6d2e5a7da22d0a5ac142e516a57aa96214070f3c7551d275044233ac052c82d67189b01c39847aad4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.zip>

  * SIZE:   19904781 bytes
  * SHA1:   25c16ee91bbcb0224f80e20d938f5c08832973f7
  * SHA256: fd588aea1558b1171f87a3dd342ee207b8995a2c0a8241d7aa15bcfa16036854
  * SHA512: f2fff35ff9157a4b31177b3d6b91bdaad04c22b3c626c3a5e5ec9a31b103f9607b31c909ef27880065cfdbcfa5d6901a6db89d22e0c645666d069c5b6dd1818b

## Komentarz do wydania

Inne informacje oraz harmonogram wydań kolejnych wersji dostępny na:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
