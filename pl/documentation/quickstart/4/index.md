---
layout: page
title: "Ruby w 20 Minut"
lang: pl

header: |
  <div class="multi-page">
    <a href="../" title="Część 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Część 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Część 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>Ruby w 20 Minut</h1>

---

Patrząc bliżej na nasz program, zauważamy początkowe linie, które
zaczynają się od (#). W Rubim wszystko w linii napisane za znakiem (#)
jest uważane za komentarz i ignorowane przez interpreter. Pierwsza linia
pliku jest wyjątkiem, system operacyjny Unix wskazuje przy jej pomocy
konsoli jakiego programu użyć do uruchomienia tego pliku. Reszta
komentarzy występuje po prostu dla przejrzystości:

Nasza metoda `say_hi` stała się trochę bardziej skomplikowana:

{% highlight ruby %}
# Powiedz hi wszystkim
def say_hi
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("each")
    # @names to pewnego rodzaju lista, przejdź po elementach tej listy
    @names.each do |name|
      puts "Hello #{name}!"
    end
  else
    puts "Hello #{@names}!"
  end
end
{% endhighlight %}

Metoda ta sprawdza teraz parametr `@names` i jeśli wynosi on nil to
wyświetla trzy kropki. Nie ma sensu witać kogoś kogo nie ma, prawda ?

## Iteracje i Pętle

Jeśli obiekt `@names` odpowiada na wywołanie metody `each`, wtedy można
po tym obiekcie iterować, więc zróbmy to i przywitajmy każdą osobę.
Jeśli `@names` jest czymkolwiek innym (nie odpowiada na `each`) zamieńmy
to na stringa i wyświetlmy domyśle powitanie.

Przyjrzyjmy się bliżej iteratorowi:

{% highlight ruby %}
@names.each do |name|
  puts "Hello #{name}!"
end
{% endhighlight %}

`each` jest metodą, która przyjmuje blok kodu i wywołuje ten blok kodu
dla każdego elementu na liście. Kod pomiędzy `do` oraz `end` jest
własnie takim blokiem. Blok przypomina anonimową funkcję lub `lambda`.
Zmienna pomiędzy pionowymi liniami jest parametrem przekazywanym do
bloku.

Zmiennej `name` przypisywany jest każdy element listy, później
wywoływane jest wyrażenie “Hello #\{name}!”@ które wyświetla powitanie.

Większość innych języków programowania obsługuje iterację po elementach
listy za pomocą pętli `for`, w C wygląda to mniej więcej tak:

{% highlight c %}
for (i=0; i<number_of_elements; i++)
{
  do_something_with(element[i]);
}
{% endhighlight %}

To działą, ale nie jest zbyt eleganckie. Potrzebujesz tu tymczasowej
zmiennej do przechowania rozmiaru listy `i` oraz musisz opisać jak
dostać się do kolejnych elementów listy. Sposób w jaki robi to Ruby jest
o wiele bardziej elegancki, wszystko ukryte jest za metodą `each`,
musisz jedynie wskazać co chcesz zrobić z każdym elementem. Wewnątrz,
metoda `each` tak naprawdę wywołuje `yield "Albert"`, później `yield
"Brenda"` i w końcu `yield "Charles"`, itd.

## Bloki, Błyszcząca Iskra Rubiego

Prawdziwa potęga bloków ujawnia się kiedy mamy do czynienia ze
strukturami bardziej skomplikowanymi niż listy. Poza obsługą prostej
funkcjonalności w metodzie, możesz także obsłużyć wstępne ustawienia,
zakończenie i błędy – wszystko ukryte przed użytkownikiem twoich metod.

{% highlight ruby %}
# Powiedz wszystkim "do widzenia"
def say_bye
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("join")
    # Połącz elementy listy przecinkiem
    puts "Goodbye #{@names.join(", ")}.  Come back soon!"
  else
    puts "Goodbye #{@names}.  Come back soon!"
  end
end
{% endhighlight %}

Metoda `say_bye` nie korzysta z `each`, zamiast tego sprawdza czy
`@names` odpowiada na wywołanie metody `join`, jeśli tak, to uzywa tej
metody. W przeciwnym wypadku, funkcja wyświetla po prostu zmienną jako
stringa. Ten sposób, który polega na nie przejmowaniu się faktycznym
*typem* zmiennej a poleganiu po prostu na metodach jakie są dostępne
nazywa się “Duck Typing” (dosł kacze typowanie), tak jak w powiedzeniu
“jeśli to chodzi jak kaczka, i kwacze jak kaczka to musi być kaczka…”.
Zaletą tego podejścia jest to, że nie musimy się niepotrzebnie
ograniczać typami jakie możemy wspierać. Jeśli ktoś wymyśli nowy typ
listy, to jeśli tylko ten nowy typ będzie wspierał metodę `join`
używając tej samej sematyki jak w przypadku innych list, wszystko będzie
działać tak jak powinno.

## Odpalanie Skryptu

Więc, oto jest klasa MegaGreeter , reszta pliku po prostu wywołuje
metody z tej klasy. Zwróćmy uwagę jeszcze na ostatni trik, to linia:

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` jest magiczną zmienną która zawiera nazwę obecnie używanego
pliku. `$0` jest nazwą pliku użytego do uruchomienia programu. To
przyrównanie oznacza: “Jeśli obecny plik to plik, który został
uruchomiony wtedy” takie rozwiązanie umożliwia użycie tego pliku jako
biblioteki w innych miejscach i nie wykonywanie tego kodu w tym
kontekście. Jeśli jednak plik jest użyty jako główny plik wykonywalny
wtedy kod zostanie wykonany.

## Zostałeś Wprowadzony

To by było na tyle jeśli chodzi o krótkie wprowadzenie do Rubiego. Do
odkrycia pozostało o wiele więcej np. różne struktury kontroli oferowane
przez Rubiego; użycie bloków i metody @yield@l; moduły i domieszkowanie
klas i wiele więcej. Mam nadzieję, że to wprowadzenie rozpaliło Twoją
ciekawość.

Jeśli tak, to zapraszam do przejścia do
[Dokumentacji](/pl/documentation/) , w której znajdziesz podsumowanie
linków, manuali i tutoriali, wszystkie dostępne za darmo w sieci.
