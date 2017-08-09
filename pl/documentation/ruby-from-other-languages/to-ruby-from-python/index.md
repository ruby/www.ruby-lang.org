---
layout: page
title: "Ruby a Python"
lang: pl
---

Python jest kolejnym bardzo przyjaznym językiem programowania ogólnego
zastosowania. Przechodząc z Pythona na Rubiego, odkryjesz, że do
nauczenia jest trochę więcej składni niż w Pythonie.

### Podobieństwa

Podobnie jak w Pythonie, w Rubim,...

* Jest interaktywna konsola (nazywa się `irb`).
* Możesz czytać dokumentację z linii poleceń (używając komendy `ri`
  zamiast `pydoc`).
* Nie ma specjalnych znaków oznaczających koniec linii (poza zwykłym
  znakiem nowej linii).
* Tekst zawarty w literałach może zajmować wiele linii, podobnie jak
  tekst zaznaczony potrójnym cudzysłowem
* Nawiasy oznaczają listy, klamry oznaczają słowniki (w Rubim słowniki
  nazywa się “haszami” ang. Hash)
* Tablice (Array) zachowują się tak samo – dodanie dwóch tablic tworzy
  jedną długą tablicę, złożenie dwóch tablic np. tak: `a3 = [ a1, a2 ]`
  daje tablicę tablic.
* Obiekty są typowane ściśle i dynamicznie.
* Wszystko jest obiektem, zmienne są po prostu referencjami do obiektów.
* Pomimo tego, że wyjątki różnią się słowami kluczowymi, działają bardzo
  podobnie.
* Masz dostęp do wbudowanego narzędzia dokumentującego (rdoc).

### Różnice

W odróżnieniu od Pythona, w Rubim,...

* Stringi są mutowalne (modyfikowalne).
* Możesz tworzyć stałe (zmienne, których wartości nie zamierzasz zmieniać).
* Istnieje kilka narzuconych konwencji (np. nazwy klas zaczynają się z
  dużej litery, nazwy zmiennych zaczynają się z małej litery).
* Istnieje tylko jeden rodzaj kontenera list, jest nim tablica (Array),
  która jest modyfikowalna.
* Stringi zawarte w podwójnych cudzysłowach umożliwiają składnię
  parsującą wyrażenia Rubiego, których wynik jest włączany do reszty
  zawartości stringa i łączenia z oddzielnych fragmentów ( `"add " +
  "strings " + "together"`) Odpowiednikiem pojedynczych cudzysłowów są
  pythonowe `r'raw strings'`.
* Nie ma klas w “starym” i “nowym” stylu, jest tylko jeden rodzaj klas.
  (Python 3+ nie ma tego problemu, ale nie jest w pełni kompatybilny z
  Pythonem 2).
* Nigdy bezpośrednio nie masz dostępu do atrybutów. W Rubim wszystko to
  wywołania metod.
* Nawiasy w wywołaniach metod są zazwyczaj opcjonalne.
* There’s `public`, `private`, and `protected` to enforce access,
  instead of Python’s `_voluntary_` underscore `__convention__`.
* Istnieją słowa kluczowe `public`, `private`, `protected` aby określić
  zakres dostępu do metod, w odróżnieniu od Pythonowych konwencji z
  podkreśleniami `_voluntary_`, `__convention__`.
* Zamiast dziedziczenia wielobazowego stosuje się domieszkowanie klas
  (mixin).
* Możesz dodawać lub modyfikować metody wbudowanych klas. Oba języki pozwalają
  ci otwierać i modyfikować klasy w dowolnym momencie, ale Python nie pozwala na
  modyfikowanie klas wbudowanych, a Ruby nie zabrania.
* Jest `true` oraz `false` zamiast `True` oraz `False` (oraz `nil`
  zamiast `None`).
* Kiedy testujesz prawdziwość wyrażenia, tylko `false` i `nil` oznaczają
  nieprawdę. Wszystko inne oznacza prawdę (włączając `0`, `0.0`, `""`
  oraz `[]`).
* Jest `elsif` zamiast `elif`.
* Jest `require` zamiast `import`. Użycie jest to samo.
* Komentarze umieszczone *nad* fragmentem kodu
  (Pythonowe docstringi umieszcza się *pod* nazwą metody) są używane do
  generowania dokumentacji.
* Istnieje wiele skrótów, które pomimo tego że wymagają się nauczenia i
  zapamiętania, sprawiają, że praca z Rubim jest przyjemna i
  produktywna.
* Nie ma możliwości do wycofania ustawionej raz zmiennej (jak Pythonowe
  wyrażenie `del`). Możesz zresetować zmienną na `nil`, umożliwiając odzyskanie
  pamięci po starej wartości, ale zmienna pozostanie w tabeli symboli tak długo
  jak jest w zasięgu.
