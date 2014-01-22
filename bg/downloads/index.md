---
layout: page
title: "Изтегляне на Ruby"
lang: bg
---

Това е мястото, от където можете да свалите последната версия на Ruby.
Наличната стабилна версия е {{ site.downloads.stable.version }}.
Препоръчително е да прочете [Ruby’s License][license].
{: .summary}

### Инсталация от сорс код

Инсталацията на Ruby от сорс код е добро решение, ако се чувствате
комфортно с вашата платформа и се нуждаете от специфични настройки за
вашата среда. Това е и добър вариант, ако липсва прекомпилиран пакет за
вашата платформа.

* [Ruby {{ site.downloads.stable.version }}][stable-gz]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }})
  стабилна версия (*препоръчително*)
* [Стабилен Snapshot][stable-snapshot-gz]
  Това е архвирано копие на последната стабилна версия в SVN хранилището.
* [Нощен Snapshot][nightly-gz]
  Това е архивирано копие на последната версия в SVN хранилището.
  Възможно е да съдържа некоригирани проблеми.

За повече информация относно Subversion хранилището можете да посетите
страницата [Ruby Core](/bg/community/ruby-core/) .

### Ruby на Windows

Windows платформата позволява няколко варианта за инсталация на Ruby.
Първият вариант е чрез прекомпилирани изпълними файлове. Вторият вариант
включва използването на инсталатор. Ако не сте сигурни как да
инсталирате Ruby, ние ви препоръчваме да ползвате [инсталатора][5]
(разпространява се с допълнителни библиотеки като RubyGems)

* [Ruby 1.8.6-p398 RubyInstaller][6]
  (md5:&nbsp;233d6b3ddc4c61436b075b51254cd138)
* [Ruby 1.8.7-p302 RubyInstaller][7]
  (md5:&nbsp;9391a3dddbbda3ee8aa3bb368fdc5279)
* [Ruby 1.9.1-p430 RubyInstaller][8]
  (md5:&nbsp;86ac589a955898c3163b161d81750a05)
* [Ruby 1.9.2-p0 RubyInstaller][9]
  (md5:&nbsp;21bf42f7ec4b8a831c947d656509cddb) (*препоръчително*)

Забележки:

* ако решите да ползвате инсталатора, най-вероятно ще се наложи да
  използвате [допълнителни библиотеки][10]

### Ruby на Linux

В зависимост от вашата дистрибуция, има няколко начина за инсталацията
на Ruby. Първият е сваляне и компилиране на сорс кода. Вторият вариант е
инсталация на прекомпилирани пакети.

Като пример можем да дадем инсталацията на ruby 1.8 в Debian или Ubuntu,
използвайки `apt-get`\:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

 За версия 1.9.1 :

{% highlight sh %}
$ sudo apt-get install ruby1.9.1-full
{% endhighlight %}

### Ruby на Mac OS X

Ruby 1.8.6 е инсталиран по подразбиране в Mac OS X Leopard и включва
Ruby on Rails, Mongrel, Capistrano и други популярни библиотеки и
приложения. За повече информация посетете [Ruby wiki at MacOS
Forge][11].

В Mac OS X Tiger е инсталирана версия 1.8.2 на Ruby, но за тези, които
не са обновили операционната си система до Leopard, са налични няколко
начина за инсталация. [Locomotive][12] е вариант за лесна инсталация на
Rails среда (включително и Ruby). Използването на [MacPorts][13] или
[Fink][14] е предназначено за технически напреднали потребители.

* В MacPorts инсталацията става със следната команда:
^

{% highlight sh %}
$ port install ruby
{% endhighlight %}

* [Fink][14] притежава графичен интерфейс (използващ Fink Commander) за
  инсталацията на Ruby.
^

* [Homebrew][15] е нова пакетна система, с помоща на която можете да
  инсталирате Ruby за Mac OS X 10.5.\*

Тъй като OS X е Unix-базирана ОС, свалянето и компилирането от сорс код
не е проблем.

За повече детайли за инсталацията на Ruby (и Rails) прочетете статията
на Dan Benjamin [за Tiger][16] и [за Leopard][17]

### Ruby на Solaris и OpenSolaris

Ruby 1.8.7 е достъпен за Solaris 8 чрез Solaris 10 като
[Sunfreeware][18]. Ruby 1.8.6 e достъпен като [Blastwave][19].
Оптимизиран стек на Ruby on Rails за Solaris 10 е познат като
[Coolstack][20].

Използвайте пакета [Image Packaging System, познат като IPS][21] за
инсталация в [OpenSolaris][22]. С негова помощ ще инсталирате както
последната версия Ruby, така и тази на Rubygems:

{% highlight sh %}
$ pfexec pkg install SUNWruby18
{% endhighlight %}

Този пакет включва поддръжката на DTrace за оптимизация на
производителността. Повече информация можете да намерите на страницата
[Ruby OpenSolaris ARC Case][23].

Ruby идва инсталиран по подразбиране в друга дистрибуция на OpenSolaris,
позната като [Solaris Express Community Edition или SXCE][24].

За да инсталирате пакетите ръчно, моля посетете страницата
[RubyOpenSolaris project @ Rubyforge][25].



[license]: {{ site.license.url }}
[stable-gz]:   {{ site.downloads.stable.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[5]: http://rubyinstaller.org/
[6]: http://rubyforge.org/frs/download.php/71066/rubyinstaller-1.8.6-p398.exe
[7]: http://rubyforge.org/frs/download.php/72085/rubyinstaller-1.8.7-p302.exe
[8]: http://rubyforge.org/frs/download.php/72075/rubyinstaller-1.9.1-p430.exe
[9]: http://rubyforge.org/frs/download.php/72170/rubyinstaller-1.9.2-p0.exe
[10]: http://rubyinstaller.org/add-ons/
[11]: http://trac.macosforge.org/projects/ruby/wiki
[12]: http://locomotive.raaum.org/
[13]: http://www.macports.org/
[14]: http://fink.sourceforge.net/
[15]: http://github.com/mxcl/homebrew
[16]: http://danbenjamin.com/articles/2007/02/ruby-rails-mongrel-mysql-osx
[17]: http://danbenjamin.com/articles/2008/02/ruby-rails-leopard
[18]: http://www.sunfreeware.com
[19]: http://www.blastwave.org
[20]: http://cooltools.sunsource.net/coolstack
[21]: http://opensolaris.org/os/project/pkg/
[22]: http://www.opensolaris.org
[23]: http://jp.opensolaris.org/os/community/arc/caselog/2007/600/
[24]: http://opensolaris.org/os/downloads
[25]: http://rubyforge.org/projects/rubyopensolaris
