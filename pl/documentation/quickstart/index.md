---
layout: page
title: "Ruby w 20 Minut"
lang: pl

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Część 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Część 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Część 4">4</a>
  </div>
  <h1>Ruby w 20 Minut</h1>

---

## Wprowadzenie

Poniżej znajduje się krótki tutorial, którego wykonanie nie zajmuje
więcej niż 20 minut. Tutorial zakłada, że masz już zainstalowanego
Rubiego. (Jeśli na swoim komputerze nie masz zainstalowanego Rubiego,
[pobierz](/pl/downloads/) Rubiego i zainstaluj zanim zaczniesz).

## Interaktywny Ruby (Interactive Ruby – IRB)

Otwórz IRB’a.

* Jeśli używasz **macOS** otwórz `Terminal` i wpisz `irb`, naciśnij
  enter.
* Jeśli używasz **Linux’a**, otwórz konsolę, wpisz `irb` i naciśnij
  enter.
* Jeśli używasz **Windows**, otwórz `Interactive Ruby` z zakładki Ruby
  twojego Menu Start.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

Ok, udało się otworzyć IRB’a. Co teraz?

Wpisz: `"Hello World"`

{% highlight irb %}
irb(main):001:0> "Hello World"
=> "Hello World"
{% endhighlight %}

## Ruby Wykonał Polecenie!

Co się stało? Czy właśnie napisaliśmy najkrótszy na świecie program
“Hello World” ? Nie do końca. Druga linia to po prostu sposób w jaki IRB
informuje nas o wyniku ostatniego wyrażenia jakie wykonał. Jeśli chcemy
wyświetlić “Hello World” potrzebujemy troszkę więcej:

{% highlight irb %}
irb(main):002:0> puts "Hello World"
Hello World
=> nil
{% endhighlight %}

`puts` jest poleceniem, które ogólnie rzecz biorąc wyświetla różne
rzeczy w Rubim. A co oznacza `=> nil` ? To wynik wyrażenia. `puts`
zawsze zwraca nil, nil w Rubim zawsze oznacza kompletny brak
jakiejkolwiek wartości.

## Twój Darmowy Kalkulator

Mamy już wystarczająco informacji, aby użyć IRB’a jako prostego
kalkulatora:

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

Trzy plus dwa. Wystarczająco proste. Co z “trzy razy dwa” (three times
two)? Możesz to napisać, jest to wciąż bardzo krótkie, ale możesz też
cofnąć się i zmienić to co przed chwilą wpisałeś. Wciśnij
**strzałkę-w-górę** na swojej klawiaturze i zobacz czy pojawi się linią
z tekstem `3+2` . Jeśli pojawi się, wtedy możesz użyć strzałki w lewo
aby ustawić kursor zaraz za znakiem plus `+` nacisnąć klawisz backspace
i zamienić plus na `*`.

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

Następnie, wypróbujmy potęgowania:

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

W Rubim `**` jest sposobem zapisu potęgowania. Co jeśli chciałbyś pójść
odwrotną drogą i obliczyć pierwiastek kwadratowy danej liczby ?

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

Co przedstawia powyższa linia ? Tak, zgadza się, obliczamy tutaj
pierwiastek kwadratowy liczby 9. Przypatrzmy się temu bliżej. Po
pierwsze co oznacza `Math` ?

## Moduły, Grupuj kod pod względem tematycznym

`Math` jest wbudowanym modułem matematycznym. Moduły służą dwóm celom w
Rubim. Powyższy przykład to pierwszy cel: grupowanie podobnych metod w
odpowiednim module. `Math` zawiera również metody takie jak `sin()` czy
`tan()`.

Następnie mamy kropkę. Co robi ta kropka ? Za pomocą kropki definiujesz
odbiorcę wiadomości. Co jest wiadomością ? W naszym przykładzie
wiadomością jest `sqrt(9)` co oznacza, wywołaj metodę `sqrt`, skrót od
“square root” – pierwiastek kwadratowy z parametrem `9`.

Wynikiem tego wywołania jest wartość `3.0`. Pewnie zauważyłeś, że nie
jest to po prostu `3`. Dzieje się tak dlatego, że w większości wypadków,
pierwiastek kwadratowy jakiejś liczby nie będzie liczbą całkowitą, więc
ta metoda zawsze zwraca liczbę zmiennoprzecinkową.

Co jeśli chcialibyśmy zapamiętać wynik naszych obliczeń ? Przypiszmy
wynik do zmiennej.

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

Odbiegamy tutaj jednak od tradycyjnego programu “Hello World” , na
którym tutoriale dla początkujących powinny się skupiać więc [wróćmy do
tego](2/)
