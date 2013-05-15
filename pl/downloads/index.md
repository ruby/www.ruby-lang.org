---
layout: page
title: "Pobierz Ruby'ego"
lang: pl
---

Tutaj znajdziesz najnowsze dystrybucje języka Ruby. Aktualna stabilna
wersja to {{ site.downloads.stable.version }}.

### MRI/YARV (główne implementacje w języku C)

Pliki [źródłowe][1] do kompilacji:

* [Ruby {{ site.downloads.stable.version }}][2] zalecana
* [Ruby {{ site.downloads.previous.version }}][3]
* [Ruby 1.8.7-p371][4]

Zalecana instalacja dla **OS X** oraz **Linuksa** za pomocą [rbenv][5]
lub [RVM][6].

Dla **Windows** zalecany instalator to [RubyInstaller][7]. Jeśli
potrzebna instalacja frameworka Rails, to jest również dostępny
[RailsInstaller][8].

### Pozostałe implementacje

* [REE – Ruby Enterprise Edition][9]{: :http:=""}. Zmodyfikowana
  implementacja w języku C. Tylko dla systemów uniksowych (i na razie
  tylko Ruby 1.8). Można zainstalować za pomocą rbenv lub RVM.
^

* [JRuby][10]{: :http:=""}. Implementacja w Javie. Dostępny instalator
  dla OS X i Windows oraz binaria (jak i źródła w Javie do kompilacji za
  pomocą ant). Dla systemów uniksowych JRuby można zainstalować także za
  pomocą rbenv lub RVM.
^

* [Rubinius][11]. Ruby zaimplementowany w Ruby z wykorzystaniem
  wirtualnej maszyny w C++. Jest dostępny instalator dla OS X ale też
  można zainstalować za pomocą rbenv lub RVM.
^

* [MagLev][12]. Implementacja w języku Smalltalk. MagLev dostępny jest
  tylko dla 64 bitowych systemów uniksowych. Posiada w pełni obiektową,
  transakcyjną bazę danych. MagLev jest zbudowany na smalltalkowej
  VMWare Gemstone/S 3.1 Virtual Machine (rozwijanej od ponad 20 lat,
  używanej komercyjnie w branży finansowej). Można zainstalować za
  pomocą rbenv lub RVM. Na razie implementacja tylko dla Ruby 1.8.
^

* [MacRuby][13]. Implementacja w języku Objective-C dla systemu OS X.
  Można zainstalować za pomocą RVM.
^

* [IronRuby][14] implementacja w języku C# dla platformy .NET. Na
  systemach uniksowych można zainstalować za pomocą RVM.



[1]: http://ftp.ruby-lang.org/pub/ruby/
[2]: {{ site.downloads.stable.url.gz }}
[3]: {{ site.downloads.previous.url.gz }}
[4]: http://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p371.tar.gz
[5]: https://github.com/sstephenson/rbenv
[6]: https://rvm.io/
[7]: http://rubyinstaller.org/
[8]: http://railsinstaller.org/
[9]: http://www.rubyenterpriseedition.com/
[10]: http://jruby.org
[11]: http://rubini.us
[12]: http://maglev.github.com/
[13]: http://www.macruby.org/
[14]: http://www.ironruby.net/
