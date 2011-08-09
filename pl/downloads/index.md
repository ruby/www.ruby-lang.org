---
layout: page
title: "Pobierz Ruby'ego"
lang: pl
---

Tutaj możesz pobrać najnowszą dystrybucje języka Ruby dostarczaną w
kilku wariantach. Obecna wersja stabilna to 1.9.1. Proszę pamiętać o
zapoznaniu się z [Licencją Ruby’ego][1].

### Ruby – Kod Źródłowy

Instalacja [ze źródeł][2] jest odpowiednim rozwiązaniem jeśli czujesz
się pewnie na swojej platformie i być może potrzebujesz szczególnych
ustawień dla swojego środowiska. Jest to także dobre rozwiązanie w
przypadku gdy nie ma specjalnie przygotowanych pakietów na twoją
platformę.

* [Ruby 1.8.6-p420][3] wersja stabilna
* [Ruby 1.8.7-p330][4] wersja stabilna
* [Ruby 1.9.2-p136][5] wersja stabilna (*zalecana*)

### Ruby dla Windows

Na platformie Windows istnieje kilka możliwości instalacji Ruby’ego.
Pierwsza z nich to po prostu instalacja [skompilowanych binariów][6].
Kolejna z nich to użycie graficznego [Ruby Installer][7]. Jeśli nie
jesteś pewien jak zainstalować Ruby’ego, graficzny instalator może być
najlepszym rozwiązaniem. (Dodatkowo, graficzny instalator jest
dostarczany z wieloma przydatnymi bibliotekami.)

### Ruby pod Linuksem

W zależności od używanej przez Ciebie dystrybucji, istnieje kilka
sposobów instalacji Ruby’ego. Pierwsza możliwość to po prostu pobranie
kodu źródłowego powyżej i ręczna ich kompilacja. Na niektórych jednak
platformach istnieje możliwość instalacji przy pomocy menedżera
pakietów, która czyni instalacje Ruby’ego ekstremalnie łatwą.

Dla przykładu, platforma Debian lub Ubuntu `apt-get` udostępnia łatwe i
eleganckie rozwiązanie:

    sudo apt-get install ruby
{: .code .sh-code}

### Ruby dla OS X

Instalacja przez RVM ([http://rvm.beginrescueend.com/][8])

    bash 
{: .code .sh-code}

Ruby 1.8.7 jest pełni dostępny w Mac OS X Leopard włącznie z Ruby on
Rails, Mongrel, Capistrano i wieloma innymi popularnymi gemami
(pakietami) Ruby’ego (zobacz też [MacRuby][9] będący bardzo szybką
implementacją Ruby’ego 1.9 w języku Objective-C).

Mac OS X Tiger jest dostarczany ze starszą wersją Ruby 1.8.2. Ci, co nie
zrobili sobie aktualizacji do Leoparda, poza RVM, istnieje jeszcze kilka
innych możliwości instalacji najnowszej wersji Ruby’ego na platformie
Macintosh OS X. [Locomotive][10] jest dobrym wyborem jeśli szukasz
czegoś do szybkiego uruchomienia środowiska do tworzenia aplikacji w
frameworku Rails. Użycie [MacPorts][11] lub [Fink][12] może okazać się
lepszym rozwiązaniem dla doświadczonych użytkowników.

Używając MacPorts, możesz zainstalować Ruby 1.8 przy pomocy polecenia…

    sudo port install ruby
{: .code .sh-code}

lub wersję Ruby 1.9.x przy pomocy polecenia…

    sudo port install ruby19
{: .code .sh-code}

Używając Fink Commandera możesz zainstalować pakiet Ruby z poziomu
interfejsu graficznego.

Dodatkowo, od kiedy OS X bazuje na Uniksie, ściągniecie i instalacja z
źródeł jest równie łatwa i efektywna jak inne rozwiązania.

### Ruby dla Solaris i OpenSolaris

Ruby 1.8.7 jest dostępny dla Solarisa w wersjach od 8 do 10 na stronie
[Sunfreeware][13] a Ruby 1.8.6 jest dostępny na stronie [Blastwave][14]
. Zoptymalizowany Ruby on Rails dla Solarisa 10 jest dostępny jako
projekt [Coolstack][15] należący do sunowskiego projektu Cooltools pro.

Aby zainstalować Ruby’ego na [OpenSolarisie][16], użyj [Image Packaging
System, lub klienta IPS][17]. Zainstaluje on najnowsze binaria Ruby’ego
i RubyGems prosto z sieci OpenSolarisa:

    % pfexec pkg install SUNWruby18
{: .code .sh-code}

Powyższa komenda zainstaluje Ruby, Rubygems, popularne rozszerzenia i
potrzebne do nich biblioteki. Pakiet ten zawiera także wsparcie dla
DTrace oraz jest zoptymalizowany wydajnościowo. Lokalizacja różnych
“artifacts” jest opisana w [Ruby OpenSolaris ARC Case][18] .

Pozostałe dystrybucje OpenSolarisa, znane jako [Solaris Express
Community Edition lub SXCE][19] są dostarczane z preinstalowanym Ruby’m.

Aby zainstalować ręcznie pakiety SVR4, zobacz [RubyOpenSolaris project @
Rubyforge][20].



[1]: http://www.ruby-lang.org/en/about/license.txt 
[2]: ftp://ftp.ruby-lang.org/pub/ruby/ 
[3]: ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p420.tar.gz 
[4]: ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p330.tar.gz 
[5]: ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p136.tar.gz 
[6]: ftp://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ 
[7]: http://rubyinstaller.org 
[8]: http://rvm.beginrescueend.com/ 
[9]: http://www.macruby.org/trac/wiki/MacRuby 
[10]: http://locomotive.raaum.org/ 
[11]: http://www.macports.org/ 
[12]: http://fink.sourceforge.net/ 
[13]: http://www.sunfreeware.com 
[14]: http://www.blastwave.org 
[15]: http://cooltools.sunsource.net/coolstack 
[16]: http://www.opensolaris.org 
[17]: http://opensolaris.org/os/project/pkg/ 
[18]: http://jp.opensolaris.org/os/community/arc/caselog/2007/600/ 
[19]: http://opensolaris.org/os/downloads 
[20]: http://rubyforge.org/projects/rubyopensolaris 
