---
layout: page
title: "Ruby a PHP"
lang: pl
---

PHP jest szeroko używany przy aplikacjach internetowych, ale jeśli
chcesz użyć Ruby on Rails lub po prostu chcesz języka programowania,
który jest bardziej dopasowany do ogólnego użycia, warto sprawdzić
Rubiego.

### Podobieństwa

Tak jak w PHP, w Rubim…

* Ruby jest językiem dynamicznie typowanym, tak jak w PHP, stąd też nie
  musisz się martwić o deklaracje typów zmiennych.
* Istnieją klasy, oraz możesz kontrolować dostęp do nich jak w PHP5
  (`public`, `protected` i `private`).
* Część zmiennych, jak w PHP zaczyna się od $ (ale nie wszystkie)
* Także istnieje `eval`.
* Możesz podmieniać zmienne na wartości w stringach. Zamiast
  `"$foo is a $bar"`, napiszesz `"#{foo} is a #{bar}"`—i tak jak w PHP,
  nie ma to zastosowania do łańcuchów w pojedynczych cudzysłowach.
* Istnieją heredoc’i.
* Ruby ma wyjątki, tak jak PHP 5.
* Istnieje dość rozbudowana biblioteka standardowa.
* Tablice i hasze zachowują się jak mógłbyś tego oczekiwać, jeśli
  zamienisz `array()` na `{` and `}`\: `array('a' => 'b')` stanie się
  `{'a' => 'b'}`.
* `true` i `false` zachowują się jak w PHP, ale `null` określany jest
  jako `nil`

### Różnice

W przeciwieństwie do PHP, w Rubim…

* Istnieje silna typizacja. Musisz wywołać `to_s`, `to_i` itd., aby
  przeprowadzić konwersje pomiędzy łańcuchami znaków, liczbami
  całkowitymi i podobnymi, zamiast polegać, że język zrobi to za ciebie.
* Stringi, liczby, tablice, hasze itp. są obiektami. Zamiast wywoływać
  `abs(-1)` piszesz `-1.abs`.
* Nawiasy są opcjonalne w wywołaniach metod, chyba że musisz wyjaśnić w
  ten sposób, które parametry odnoszą się do odpowiednich wywołań metod.
* Zamiast konwencji nazw (np. podkreśleń), biblioteka standardowa
  Rubiego (i nie tylko) jest podzielona na moduły i klasy
* Mechanizm refleksji jest odziedziczoną właściwością obiektów, nie
  musisz używać klas `Reflection` jak w PHP 5.
* Zmienne są referencjami
* Nie ma klas `abstract` czy też `interfece`
* Hasze i tablice nie są zamienne, to dwie różne rzeczy
* Tylko `false` i `nil` są fałszem: `0`, `array()` i `""` są prawdą w
  wywołaniach warunkowych.
* Prawie wszystko jest wywołaniem metody, nawet `raise` (`throw` w PHP).
