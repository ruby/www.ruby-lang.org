---
layout: page
title: "Ruby a Java"
lang: pl
---

Java jest językiem dojrzałym. Jest przetestowany. Jest także szybki (w
przeciwieństwie do tego co mówi tłum przeciwników Javy). Jest także dość
rozwlekła w zapisie. Przechodząc z Javy na Rubiego, oczekuj że twój kod
skurczy się znacząco. Możesz także oczekiwać, że mniej czasu zajmie ci
tworzenie szybkich prototypów.

### Podobieństwa

Tak jak w Javie, w Rubim…

* Pamięć jest zarządzana przez garbage collector.
* Obiekty są silnie typowane.
* Występują metody publiczne, prywatne i chronione.
* Istnieją wbudowane narzędzia dokumentujące (te Rubiego nazywane są
  RDoc). Dokumentacja wygenerowana przez rdoc bardzo przypomina tą
  wygenerowaną przez javadoc.

### Różnice

W przeciwieństwie do Javy, w Rubim…

* Nie musisz kompilować twojego kodu. Po prostu go uruchamiasz.
* Istnieją inne toolkity GUI. Użytkownicy Rubiego mogą spróbować
  [WxRuby][1], [FXRuby][2], [Ruby-GNOME2][3], [Qt][4],
  lub dla przykładu wbudowanego w Rubiego Tk.
* Używasz słowa kluczowego `end`, które kończy definicję takich rzeczy
  jak klasy, w przeciwieństwie do oznaczania bloku kodu nawiasami
  klamrowymi.
* Używasz `require` zamiast `import`.
* Wszystkie atrybuty/właściwości klas są prywatne. Dostęp do nich
  istnieje tylko przez metody (akcesory).
* Nawiasy w wywołaniach metod są zazwyczaj opcjonalne i często pomijane.
* Wszystko jest obiektem, włączając liczby jak 2 czy 3.14159.
* Brak statycznej typizacji.
* Nazwy zmiennych są tylko etykietami. Nie mają one powiązanego z nimi
  typu.
* Brak deklaracji typów. Po prostu nadajesz zmiennej nowe nazwy w razie
  potrzeby a one po prostu zostaną utworzone (np. `a = [1,2,3]` w
  przeciwieństwie do `int[] a = {1,2,3};`).
* Brak konieczności rzutowania. Po prostu wywołaj metody. Twoje testy
  jednostkowe powiedzą tobie nawet przed uruchomieniem kodu, czy
  zobaczysz wyjątek.
* Używasz `foo = Foo.new("hi")` zamiast `Foo foo = new Foo("hi")`.
* Konstruktor zawsze nazywa się “initialize” niezależnie od nazwy klasy.
* Używasz domieszkowania klas (ang. “mixins”) zamiast interfejsów.
* Preferowany jest YAML wobec XMLa.
* Istnieje `nil` zamiast `null`.
* `==` i `equals()` są obsługiwane inaczej w Rubim. Używaj `==` kiedy chcesz
  sprawdzić równość w Rubim (`equals()` w Java). Używaj `equal?()`
  kiedy chcesz wiedzieć czy dwa obiekty są takie same (`==` w Java).



[1]: https://github.com/eumario/wxruby
[2]: https://github.com/larskanis/fxruby
[3]: https://ruby-gnome2.osdn.jp/
[4]: https://github.com/ryanmelt/qtbindings/
