---
layout: page
title: "Biblioteki"
lang: pl
---

Jak dla większości języków programowania, istnieje szeroki zbiór bibliotek
dla Rubiego.
{: .summary}

Większość z nich została wydana jako **gem**. [**RubyGems**][1] jest
system pakietowania zaprojektowanym w celu ułatwienia tworzenia,
udostępniania i instalacji bibliotek (w pewnym sensie, system dystrybucji
pakietów podobny do `apt-get`, ale ukierunkowany na oprogramowanie Ruby).
Od wersji 1.9 Ruby zawiera domyślnie RubyGems, podczas gdy poprzednie
wersje Rubiego wymagają [ręcznej instalacji][2].

Inne biblioteki są rozprowadzane jako pliki archiwum (.zip lub .tar.gz)
katalogu z **kodem źródłowym**. Proces instalacji może się różnić,
typowo jest dostępny plik z instrukcją `README` lub `INSTALL`.

### Znajdowanie bibliotek

Głównym miejscem gdzie biblioteki są udostępniane jest [**RubyGems.org**][1],
udostępniający biblioteki jako gemy. Możesz przeglądać stronę bezpośrednio
lub używając polecenia `gem`.

Przy użyciu `gem search -r` możesz przeszukiwać repozytorium RubyGems. Na
przykład `gem search -r rails` zwróci listę gemów powiązanych z Railsami.
Z opcją `--local` (`-l`) możesz przeszukiwać lokalnie zainstalowane gemy.
By zainstalować gema użyj `gem install [gem]`. Przeglądanie zainstalowanych
gemów za pomocą `gem list`. Po więcej informacji na temat polecenia `gem`,
zobacz niżej lub udaj się do [RubyGems’ docs][3].

Istnieją też inne źródła bibliotek. [RubyForge][4] był popularnym miejscem
dla bibliotek Rubiego, ale ostatnie lata przyniosły powstanie [**GitHuba**][5]
jako głównego repozytorium na treści związane z Rubim. Najczęściej źródła
gema będą utrzymywane na GitHubie i publikowane jako w pełni używalne gemy na
RubyGems.org.

[**The Ruby Toolbox**][6] jest projektem ułatwiającym eksplorację projektów
open source w Rubim. Posiada kategorie dla różnych typowych zadań, zbiera masę
informacji o projektach, jak wydanie, historię zmian i zależności,
a także ocenia projekty na bazie ich popularności na RubyGems.org i GitHubie.
Wyszukiwanie czyni łatwym szukanie tego czego poszukujesz.

### Kilka słów więcej o RubyGems

Oto szybki przegląd poleceń `gem` do codziennego użytku. [Bardziej szczegółowa
dokumentacja][7] jest dostępna, pokrywająca wszelkie aspekty tego systemu
pakietowania.

#### Wyszukiwanie wśród dostepnych gemów

Polecenie **search** może być użyte do szukania gemów na bazie napisów.
Gemy, których nazwy zaczynają się od podanego napisu zostaną zwrócone w wyniku.
Na przykład by wyszukać gemy związane z “html”:

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

Flaga `--remote` / `-r` oznacza, że chcemy sprawdzić oficjalne repozytorium
RubyGems.org (domyślne zachowanie).
Z flagą `--local` / `-l` zostanie wykonane lokalne szukanie wśród
zainstalowanych gemów.

#### Instalowanie gema

W momencie gdy wiesz, którego gema chciałbyś **zainstalować**, na przykład
popularne Railsy:

{% highlight sh %}
$ gem install rails
{% endhighlight %}

Możesz nawet instalowac konkretne wersje biblioteki używając flagi
`--version` / `-v`:

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

#### Spis wszystkich gemów

By zobaczyć **listę** wszystkich zainstalowanych lokalnie gemów:

{% highlight sh %}
$ gem list
{% endhighlight %}

By uzyskać (bardzo długą) listę wszystkich gemów dostępnych na RubyGems.org:

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### Pomoc!

Dokumentacja jest dostępna w twoim terminalu:

{% highlight sh %}
$ gem help
{% endhighlight %}

Na przykład `gem help commands` jest bardzo przydatne, ponieważ wyświetla
listę wszystkich poleceń `gem`.

#### Tworzenie własnych gemów

RubyGems.org ma [wiele poradników][3] w tym temacie. Możesz chcieć zapoznać się
również z [Bundlerem][9], generycznym narzędziem, które pomaga zarządzać
zależnościami aplikacji i może być używany wraz z RubyGems.



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[4]: http://rubyforge.org/
[5]: https://github.com/
[6]: https://www.ruby-toolbox.com/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
