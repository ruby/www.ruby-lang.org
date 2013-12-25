---
layout: page
title: "Скачать Ruby"
lang: ru
---

Здесь вы найдете последние дистрибутивы Ruby на любой вкус. Текущая
стабильная версия {{ site.downloads.stable.version }}. Пожалуйста ознакомьтесь
с [лицензией Ruby]({{ site.license.url }}).
{: .summary}

### Три способа установки Ruby

Вы можете получить копию Ruby несколькими способами, и разные люди
предпочитают каждый из трех способов по разным причинам. Каждый будет
описан в отдельной секции ниже, но вот краткий обзор:

* **Компиляция из исходников** является стандартным путем установки
  приложений уже долгие, долгие годы. Этот способ знаком большому числу
  разработчиков приложений.
* Существует несколько **сторонних инструментов** для установки Ruby.
  Они зачастую упрощают установку как совсем новичкам, так и продвинутым
  пользователям.
* Наконец, некоторые **менеджеры пакетов** поддерживают Ruby. Данный
  способ будет наиболее знаком людям, которые предпочитают пользоваться
  средствами операционной системы.

И наконец, если вы хотите использовать несколько версий Ruby на одной
машине, посмотрите секцию **сторонних приложений** и использования RVM.
В ней описан лучший на данный момент способ сделать это, если конечно вы знаете
зачем вам это надо.

### Компиляция Ruby – Исходный код

Установка из исходного кода – отличный способ для тех, кто хорошо знаком
со своей платформой и кому, возможно, нужны специальные настройки для
своего окружения. Это также хорошее решение в случае когда для вашей
платформы нет готовых собраных пакетов.

Если у вас возникла сложность с компиляцией Ruby, попробуйте один из
сторонних инструментов из следующей секции. Они могут помочь вам.

* [Ruby {{ site.downloads.stable.version }}][1]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }}) Стабильная
* [Ruby {{ site.downloads.previous.version }}][2]
  (md5:&nbsp;{{ site.downloads.previous.md5.gz }}) Предыдущая
* [Stable snapshot][3] Это архив свежайшей стабильной стабильной версии (ruby\_2\_0\_0).
* [Nightly Snapshot][4] Это архив того что в SVN на данный момент. Он
  может содержать баги и другие проблемы. Используйте на собственный риск.

За информацией о Ruby Subversion и Git репозиториях пожалуйста,
посмотрите страницу о [ядре Ruby](/ru/community/ruby-core/).

### Зеркала

Исходный код Ruby доступен по всему миру на нескольких зеркальных
сайтах. Пожалуйста, попробуйте использовать зеркало, которое находится
недалеко от вас.

#### Зеркальные сайты по HTTP протоколу

* [CDN][64] (fastly.com)
* [Япония 1][63] (главный) - HTTPS
* [Япония 2][50] и [зеркало][32] (RingServer)
* [Англия][49] (The Mirror Service)
* [Германия][51] (AmbiWeb GmbH)
* [Бельгия][52] (Easynet)
* [Дания][53] (sunsite.dk)
* [Нидерланды][54] (XS4ALL) - только пакеты релизов
* [США 1][55] (ibiblio.org)
* [США 2][56] (lcs.mit.edu)
* [США 3][57] (binarycode.org)
* [США 4][58] (online-mirror.org)
* [США 5][59] (trexle.com)
* [Австралия][60] (tuwien.ac.at)
* [Тайвань 1][61] (cdpa.nsysu.edu.tw)
* [Тайвань 2][62] (ftp.cs.pu.edu.tw)

#### Зеркальные сайты по FTP протоколу

* [Япония 1][35] (главный: ruby-lang.org)
* [Япония 2][31] and [mirror][32] (RingServer)
* [Япония 3][33] (IIJ)
* [Южная корея][36] (Korea FreeBSD Users Group)
* [Германия][37] (FU Berlin)
* [Англия][38] (The Mirror Service)
* [Бельгия][39] (Easynet)
* [Россия][40] (ChgNet)
* [Греция][41] (ntua.gr)
* [Дания][42] (sunsite.dk)
* [США 1][43] (ibiblio.org)
* [США 2][44] (lcs.mit.edu)
* [Австралия][45] (tuwien.ac.at)
* [Тайвань 1][46] (cdpa.nsysu.edu.tw)
* [Тайвань 2][47] (ftp.cs.pu.edu.tw)
* [Канада][48] (mirror.cs.mun.ca)

#### Зеркальные сайты по rsync

* rsync://rsync.mirrorservice.org/ftp.ruby-lang.org/pub/ruby/ (Англия)
* rsync://sunsite.dk/ftp/mirrors/ruby/ (Дания)
* rsync://gd.tuwien.ac.at/languages/ruby/ (Австрия)
* rsync://mirror.cs.mun.ca/ruby/ (Канада)
* rsync://ftp.cs.pu.edu.tw/Ruby/ (Тайвань)

### Сторонние инструменты

Многие рубисты используют сторонние инструменты для установки Ruby. Эти
инструменты предоставляют различные преимущества, но не все из них
официально поддерживаются. В любом случае их сообщество может оказать
помощь.

#### RVM

Самый популярный инструмент для установки Ruby это **RVM** ("Ruby
Version Manager"). Он не только позволяет очень просто установить Ruby,
но и позволяет устанавливать и управлять несколькими копиями Ruby в
вашей системе, также как и несколькими альтернативными имплементациями
Ruby.

RVM доступен только для Mac OS X, Linux или любой другой UNIX-подобной
операционной системы. Пользователи Windows могут обратить внимание на
похожий проект [pik][5]. Или использовать RubyInstaller описанный в
следующей секции.

На момент написания статьи, вы можете установить RVM следующей командой:

{% highlight sh %}
$ \curl -L https://get.rvm.io | bash -s stable --ruby
{% endhighlight %}

Последние инструкции по установке RVM вы можете найти на [странице
установки RVM][7]. Команда выше установит вам как RVM, так и последнюю
версию Ruby. При помощи RVM вы также можете установить большинство
имплементаций Ruby перечисленных ниже. Чтобы посмотреть все
поддержвиваемые версии, наберите `rvm list known`.

#### RubyInstaller

Для пользователей Windows существует отличный проект, помогающий
установить Ruby: [RubyInstaller][8]. Он предоставляет вам все, что нужно
для настройки полноценного окружения Ruby на Windows.

Чтобы воспользоваться RubyInstaller, скачайте его со [следующей
страницы][9]. Далее лишь запустите установщик и все готово!

Если вы устанавливаете Ruby для того, чтобы воспользоваться Rails, вам
пригодится [RailsInstaller][10], который использует RubyInstaller, но
предоставляет вам дополнительные инструменты, которые помогут
развернуть верное окружение для Rails.

### Системы управления пакетами

Если вы не можете скомпилировать ваш собственный Ruby и не хотите
использовать сторонний инструмент для установки – вы можете
воспользоваться пакетным менеджером вашей операционной системы.

Некоторые участники сообщества Ruby убеждены, что никогда не стоит
пользоваться пакетными менеджерами для установки Ruby. Вместо этого
лучше воспользоваться RVM. Оставим все плюсы и минусы данного подхода за
границами данного текста, отметим лишь, что основной причиной данной
убежденности является то, что в пакетных менеджерах зачастую содержится
информация об устаревших версиях Ruby. Если вы хотите использовать
новейшую версию Ruby, убедитесь, что вы используете верное имя пакета
или воспользуйтесь RVM вместо этого.

#### Ruby на Linux

Debian GNU/Linux и Ubuntu используют систему управления пакетами `apt`.
Вы можете использовать ее следующим образом:

{% highlight sh %}
$ sudo apt-get install ruby1.9.1
{% endhighlight %}

Да, данная команда установит Ruby 1.9.2 или новее. Это так называемая
"совместимая версия библиотеки" для 1.9.1 судя по имени.

Если вы устанавливаете пакет 'ruby', то вы можете получить старый пакет Ruby
1.8, но это зависит дистрибутива.

Arch Linux использует систему управления пакетами `pacman`. Чтобы получить
Ruby, просто напишите следующее:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

На других системах вы можете поискать в репозитории пакетного менеджера
вашего дистрибутива. Хотя возможно, верным выбором будет использование
RVM.

#### Ruby на Mac OS X

Ruby 1.8.7 полностью поддерживается в Mac OS X Lion так же, как и многие
популярные гемы. За подробностями смотрите [вики Ruby на Mac OS
Forge][11].

Mac OS X Tiger поставляется с Ruby версии 1.8.2 и Leopard поставляется с
1.8.6. Но для тех, кто еще не обновился до Leopard, существует множество
способов установить последнюю версию Ruby.

Многие люди на Mac OS X используют [Homebrew][12] как пакетный менеджер.
И это действительно просто – установить Ruby:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

А также, так как OS X является UNIX-подобной ОС, скачивание и установка
из исходного кода настолько же эфективна, как и другие решения. Чтобы
помочь вам с установкой новой версии Ruby на OS X, наилучшей идеей будет
воспользоваться RVM. Наберите `rvm notes`, чтобы получить специфичную
информацию для вашей операционной системы.

Подробные инструкции по установке Ruby (и Rails) написал Dan Benjamin:
[для Tiger][13], [для Leopard][14], и [для Snow Leopard][15]. Данные
инструкции помогут вам запустить окружение очень быстро. Для Lion
поможет [данная инструкция][16].

#### Ruby на Solaris и OpenIndiana

Ruby 1.8.7 доступен для Solaris 8-10 на [Sunfreeware][17] и
[Blastwave][18]. Ruby 1.9.2p0 доступен также на [Sunfreeware][17], но
это все уже устарело. Использование RVM поможет вам получить последнюю
версию Ruby.

Чтобы установить Ruby на [OpenIndiana][19], пожалуюйста используйте
клиент [Image Packaging System, или IPS][20]. Данная система установит
последние бинарники Ruby и RubyGems прямо из сетевого репозитория
OpenSolaris для Ruby 1.9. Это просто:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Как и прежде, RVM, это хороший путь получить последнюю версию Ruby.

### Другие имплементации Ruby

Ruby как язык имеет несколько разных имплементаций. Данный сайт
посвящен имплементации **MRI** ("Matz's Ruby Interpreter" – Ruby
интерпритатор Матца) или **CRuby**, но также существует несколько
других. Они бывают очень полезны в различных ситуациях, предоставляют
большую интеграцию с другими языками или окружениями, или имеют
возможности, которых нет в MRI.

Список имплементаций:

* [JRuby][21] это Ruby реализованый на JVM (Java Virtual Machine),
  использует оптимизированный JIT компилятор, сборщик мусора, нативные
  потоки, инструментальную экосистему и огромное количество библиотек JVM.
* [Rubinius][22] это "Ruby написанный на Ruby". Реализован на основе LLVM –
  изящной виртуальной машине, на который созданы и другие известные
  языки.
* [MacRuby][23] это Ruby, который тесно интегрирован с библиотеками
  Cocoa от Apple для Mac OS X. Позволяет вам проще писать приложения для Mac
  OS X.
* [mruby][mruby] это легковесная реализация Ruby, которая может быть
  слинкована и встроена в приложение. Возглавляет разработку mruby создатель
  языка Ruby, Yukihiro “Matz” Matsumoto.
* [IronRuby][26] это имплементация "тесно интегрированная с .NET
  Framework".
* [MagLev][27] это "быстрая, стабильная имплементация Ruby с
  интегрированным постоянством объектов и распределенным открытым
  кешем".
* [Cardinal][24] это "компилятор Ruby для виртуальной машины [Parrot][25]"
  (Perl 6).

Некоторые из этих имплементаций, включая MRI, следуют инструкциям от
[RubySpec][28], "полной выполняемой спецификации для языка
программирования Ruby".



[1]: {{ site.downloads.stable.url.gz }}
[2]: {{ site.downloads.previous.url.gz }}
[3]: {{ site.downloads.stable_snapshot.url.gz }}
[4]: {{ site.downloads.nightly_snapshot.url.gz }}
[5]: https://github.com/vertiginous/pik
[7]: https://rvm.io/rvm/install/
[8]: http://rubyinstaller.org/
[9]: http://rubyinstaller.org/downloads/
[10]: http://railsinstaller.org/
[11]: http://trac.macosforge.org/projects/ruby/wiki
[12]: http://brew.sh/
[13]: http://hivelogic.com/articles/ruby-rails-mongrel-mysql-osx
[14]: http://hivelogic.com/articles/ruby-rails-leopard
[15]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/
[16]: http://intridea.com/2011/7/26/setting-up-ruby-dev-on-lion?blog=company
[17]: http://www.sunfreeware.com
[18]: http://www.blastwave.org
[19]: http://openindiana.org/
[20]: http://opensolaris.org/os/project/pkg/
[21]: http://jruby.org
[22]: http://rubini.us
[23]: http://www.macruby.org
[mruby]: https://github.com/mruby/mruby
[24]: https://github.com/parrot/cardinal
[25]: http://parrot.org
[26]: http://www.ironruby.net
[27]: http://ruby.gemstone.com
[28]: http://rubyspec.org
[31]: ftp://core.ring.gr.jp/pub/lang/ruby/
[32]: http://www.t.ring.gr.jp/
[33]: ftp://ftp.iij.ad.jp/pub/lang/ruby/
[35]: ftp://ftp.ruby-lang.org/pub/ruby/
[36]: ftp://ftp.kr.freebsd.org/pub/ruby/
[37]: ftp://ftp.fu-berlin.de/unix/languages/ruby/
[38]: ftp://ftp.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[39]: ftp://ftp.easynet.be/ruby/ruby/
[40]: ftp://ftp.chg.ru/pub/lang/ruby/
[41]: ftp://ftp.ntua.gr/pub/lang/ruby/
[42]: ftp://sunsite.dk/mirrors/ruby/
[43]: ftp://www.ibiblio.org/pub/languages/ruby/
[44]: ftp://xyz.lcs.mit.edu/pub/ruby/
[45]: ftp://gd.tuwien.ac.at/languages/ruby/
[46]: ftp://ruby.cdpa.nsysu.edu.tw/ruby/
[47]: ftp://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[48]: ftp://mirror.cs.mun.ca/pub/mirror/ruby/
[49]: http://www.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[50]: http://www.dnsbalance.ring.gr.jp/archives/lang/ruby/
[51]: http://dl.ambiweb.de/mirrors/ftp.ruby-lang.org/
[52]: http://ruby.mirror.easynet.be/
[53]: http://mirrors.sunsite.dk/ruby/
[54]: http://www.xs4all.nl/~hipster/lib/mirror/ruby/
[55]: http://www.ibiblio.org/pub/languages/ruby/
[56]: http://xyz.lcs.mit.edu/ruby/
[57]: http://www.binarycode.org/ruby/
[58]: http://www.online-mirror.org/ruby/
[59]: http://ruby.trexle.com/
[60]: http://gd.tuwien.ac.at/languages/ruby/
[61]: http://pluto.cdpa.nsysu.edu.tw/ruby/
[62]: http://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[63]: https://ftp.ruby-lang.org/pub/ruby/
[64]: http://cache.ruby-lang.org/pub/ruby/
