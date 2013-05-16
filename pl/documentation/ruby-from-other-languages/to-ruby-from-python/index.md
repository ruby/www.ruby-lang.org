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

* Jest interaktywna konsola (nazwya się `irb`).
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
* Masz dostęp do wbudowanego narzędzai dkoumentującego (rdoc).

### Różnice

W odróżnieniu od Pythona, w Rubim,...

* Stringi są mutowalne (modyfikowalne).
* Możesz tworzyć stałe.
* Istnieje kilka narzuconych konwencji (np. nazwy klas zaczynają się z
  dużej litery, nazwy zmiennych zaczynają się z małej litery).
* Istnieje tylko jeden rodzaj kontenera list, jest nim tablica (Array),
  która jest modyfikowalna.
* Stringi zawarte w podwójnych cudzysłowach umożliwiają składnię
  parsującą wyrażenia Rubiego, których wynik jest włączany do reszty
  zawartości stringa i łączenia z oddzielnych fragmentów ( `"add " +
  "strings " + "together"`) Odpowiednikiem pojedynczych cudzysłowów są
  pythonowe `r'raw strings'`
^

* Nie ma klas w “starym” i “nowym” stylu, jest tylko jeden rodzaj klas.
* Nigdy bezpośrednio nie masz dostępu do atrybutów. W Rubim wszystko to
  wywołania metod.
* Nawiasy w wywołaniach metod są zazwyczaj opcjonalne.
* Istnieją słowa kluczowe `public`, `private`, `protected` aby określić
  zakres dostępu do metod. W Pythonie stosuje się do tego celu umowną
  konwencję oraz mieszanie nazw. Pythonowym “odpowiednikiem” zakresu
  protected są metody, których nazwy zaczynają się od znaku
  podkreślenia. Zaś “odpowiednikiem” zakresu private są metody, których
  nazwy zaczynają się od dwóch znaków podkreślenia.
* Zamiast dziedziczenia wielobazowego stosuje się domieszkowanie klas
  (mixin).
* Jest `true` oraz `false` zamiast `True` oraz `False` (oraz `nil`
  zamiast `None`).
* Kiedy testujesz prawdziwość wyrażenia, tylko `false` i `nil` oznaczają
  nieprawdę. Wszystko inne oznacza prawdę (włączając `0`, `0.0` oraz
  `"0"`).
* Jest `elsif` zamiast `elif`.
* Jest `require` zamiast `import`. Pythonowe import działa inaczej, bo
  dotyczy modułów a nie tylko samych plików. Rubinowe “require” działa
  podobnie jak “require\_once” z PHP, po prostu załącza plik i nic
  więcej. Natomiast Pythonowe “import” nie tylko włącza plik ale również
  a) kompiluje go automatycznie do bytecodu (\*.pyc), za drugim razem
  czytany jest ten skompilowany plik, b) wszystkie klasy w tym pliku są
  umieszczane w przestrzeni nazw, określonej nazwą tego pliku. Np.
  import alamakota daje dostęp do wszystkich obiektów poprzez prefiks
  alamakota.
* Komentarze umieszcza się nad a nie pod odnoszącym się fragmentem kodu
  (Pythonowe docstringi umieszcza się *pod* nazwą metody, poza tym
  docstringi są integralną częścią każdej klasy czy metody i są dostępne
  przez metodę `__doc__`
* Istnieje wiele skrótów, które pomimo tego że wymagają się nauczenia i
  zapamiętania, sprawiają, że praca z Rubim jest przyjemna i
  produktywna.

