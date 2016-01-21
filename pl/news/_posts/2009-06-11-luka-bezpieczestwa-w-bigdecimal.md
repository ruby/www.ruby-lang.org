---
layout: news_post
title: "Luka bezpieczeństwa w BigDecimal"
author: "hosiawak"
date: 2009-06-11 21:09:09 +0000
lang: pl
---

W bibliotece standardowej BigDecimal znaleziono lukę bezpieczeństwa.
Konwersja z BigDecimal na Float zawiera problem, który umożliwia
atakującemu wywołanie \"segmentation fault\".

ActiveRecord polega na tej metodzie więc większość aplikacji Rails jest
dotknięta tym problemem (chociaż nie jest on spowodowany przez kod
Rails).

## Impakt

Atak \"odmowy dostępu\" można wywołać wysyłając bardzo dużą liczbę do
BigDecimal do sparsowania, np:


    BigDecimal("9E69999999").to_s("F")

## Wersje Ruby dotknięte tym problemem

### wersja 1.8

* 1\.8.6-p368 oraz wszystkie poprzednie wersje
* 1\.8.7-p160 oraz wszystkie poprzednie wersje

### wersja 1.9

* Wszystkie wersje 1.9.1 NIE są dotknięte tym problemem

## Rozwiązanie problemu

### wersja 1.8

Zaleca się aktualizację do wersji 1.8.6-p369 lub ruby-1.8.7-p173.

* [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p369.tar.gz][1]
* [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p173.tar.gz][2]



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p369.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p173.tar.gz
