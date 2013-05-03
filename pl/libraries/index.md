---
layout: page
title: "Biblioteki"
lang: pl
---

Istnieje niezliczona ilość przydatnych bibliotek, które są przeznaczone
dla języka Ruby, z których wiele zostało opublikowanych jako plik *gem*.
Inne biblioteki są rozprowadzane jako pliki archiwum (.zip lub .tar.gz)
katalogu z kodem źródłowym. Spójrzmy jak wyszukiwać interesujące nas
biblioteki i jak należy je instalować.

### Znajdowanie bibliotek
{: #finding-libraries}

[**RubyForge**][1] jest jednym z popularnych repozytoriów
oprogramowania, w którym znajdują się biblioteki dla tego języka. Można
również przejrzeć [mapę oprogramowania][2], która zawiera biblioteki
podzielone tematycznie. (Jeśli sam będziesz tworzył własne biblioteki,
możesz [zarejestrować][3] swój projekt na Rubyforge—otrzymasz wtedy
darmowy dostęp do Subversion, przestrzeń dyskową na stronę www, oraz
listy wysyłkowe.

[**Ruby Application Archive**][4] (lub RAA) jest katalogiem wszelkiego
rodzaju oprogramowania w Rubim, podzielonego na kategorie funkcjonalne.
W chwili obecnej kategoria [bazy danych][5] ma najwięcej projektów, o
jeden mniej ma [Net.][6] [HTML][7], [XML][8] są również popularne. Nawet
dla [Fizyki][9] są cztery projekty.

### Używanie RubyGems
{: #using-rubygems}

Graficzny instalator Rubiego pod Windows zawiera pakiet RubyGems, lecz
wiele innych dystrybucji go nie zawiera. W paragrafie [Instalacja
RubyGems](#installing-rubydems) poniżej znajdziesz odpowiednie
instrukcje dla swojej platformy.

#### Przeszukiwanie Gemów

Komenda **search** jest wykorzystywanwa do przeszukiwania gemów o
określonej nazwie. Dla przykładu, aby znaleźć słowo “html” w nazwie
gema, należy wydać polecenie:

{% highlight sh %}
$ gem search html --remote

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
   A sample Ruby gem, just to illustrate how RubyGems works.
{% endhighlight %}

(*Flaga `--remote` mówi o tym, że będziemy przeszukiwać oficjalne,
zdalne repozytorium RubyGems.*)

#### Instalacja Gema

Jeśli już wiesz, który gem Cię interesuje, wydaj polecenie **install**\:

{% highlight sh %}
$ gem install html-sample
{% endhighlight %}

Jeśli masz taką potrzebę, to przy pomocy flagi `--version` możesz
zainstalować określoną wersję.

{% highlight sh %}
$ gem install html-sample --version 1.0
{% endhighlight %}

#### Wyświetlanie wszystkich gemów

Aby zobaczyć kompletną listę wszystkich gemów dostępnych na Rubyforge,
wydaj polecenie:

{% highlight sh %}
$ gem list --remote
{% endhighlight %}

Jeśli chcesz zobaczyć tylko lokalnie zainstalowane gemy, omiń flagę
`--remote`.

{% highlight sh %}
$ gem list
{% endhighlight %}

Aby dowiedzieć się więcej o RubyGems i ich zastosowaniu, przejrzyj
[**oficjalną instrukcję**][10] (w języku angielskim), która zawiera
wiele przykładów na użycie gemów we własnych skryptach.

### Instalacja RubyGems
{: #installing-rubygems}

Aby zainstalować RubyGems, ściągnij RubyGems 0.9.0 ze strony [do
pobrania][11]. Rozpakuj archiwum, a następnie uruchom `setup.rb`. Na
niektórych systemach będziesz musiał zrobić to jako root.

Na przykład, na Linuxie:

{% highlight sh %}
$ tar xzvf rubygems-0.9.0.tar.gz
$ cd rubygems-0.9.0
$ su -
# ruby setup.rb
{% endhighlight %}

Jeśli chcesz dowiedzieć się więcej o instalacji Rubiego, przejrzyj
[**rozdział instalacja**][12] (w języku angielskim).



[1]: http://rubyforge.org/
[2]: http://rubyforge.org/softwaremap/trove_list.php
[3]: http://rubyforge.org/register/
[4]: http://raa.ruby-lang.org/
[5]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Database
[6]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Net
[7]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=HTML
[8]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=XML
[9]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Physics
[10]: http://rubygems.org/read/chapter/1
[11]: http://rubyforge.org/frs/?group_id=126
[12]: http://rubygems.org/read/chapter/3
