---
layout: news_post
title: "Zmiana polityki wersjonowania poczynając od Rubiego 2.1.0"
author: "zzak"
translator: "crabonature"
date: 2013-12-21 2:00:00 +0000
lang: pl
---

Zdecydowaliśmy się zmienić politykę wersjonowania Rubiego na politykę bardziej
[Semantycznego Wersjonowania](http://semver.org/) poczynając od wydania Rubiego 2.1.0.

W celu zapewnienia lepiej zdefiniowanego i właściwie używanego systemu
wersjonowania Rubiego postanowiliśmy stopniowo przejść do następującej polityki.

## Zmiany w polityce

Polityka ta opiera się na propozycjach administratora ruby-lang.org
Hiroshi Shibaty ([@hsbt](https://twitter.com/hsbt)).

### Schemat wersjonowania

* `MAJOR`: zwiększany gdy niekompatybilna zmiana nie może zostać wydane jako MINOR
  * Zarezerwowane na specjalne okazje
* `MINOR`: zwiększany w każde święta, może mieć niekompatybilne API
* `TEENY`: poprawa błędu lub łata bezpieczeństwa, która zapewnia kompatybilność API
  * Może zostać podniesiony powyżej 10 (np. `2.1.11`), i będzie wydawane co 2-3 miesiące.
* `PATCH`: numer "commitów" od ostatniego wydania `MINOR` (będzie ustawiany na 0 w momencie wydawania `MINOR`)

### Schemat branchy

Będziemy nadal utrzymywali następujące branche:

* trunk
* `ruby_{MAJOR}_{MINOR}_{TEENY}`

### Kompatybilność API

Następujące cechy mogą być oznaczone jako zmiany niezgodne, wymagające
zwiększenia w wersji `MINOR`:

* Usunięcie funkcjonalności z poziomu api w C
* Niekompatybilne wstecz zmiany lub dodatki

### Kompatybilność ABI

ABI będą zgodne z poniższym schematem:. `{MAJOR} {MINOR} 0.`

Dołożymy wszelkich starań, aby zachować kompatybilność ABI na tym samym poziomie
wydań `MINOR`, więc `TEENY` zostanie ustalona na 0.

## Referencje

Aby przeczytać więcej na temat tej propozycji zobacz poniższe linki:

* [Wprowadzenie schematu semantycznego wersjonowania i polityki branchy](https://bugs.ruby-lang.org/issues/8835)
* [Zaakceptowane propozycje po angielsku](https://gist.github.com/sorah/7803201)
* [Zaakceptowane propozycje po japońsku](https://gist.github.com/hsbt/7719305)

## Dzięki!

Chciałbym osobiście podziękować wszystkim, którzy przyczynili się do tej dyskusji.
Każdy krok jaki wykonujemy zbliża nas do bardziej stabilnego i efektywnego Rubiego.
