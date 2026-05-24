---
layout: page
title: "Официальный FAQ по Ruby"
lang: ru

header: |
  <div class="multi-page">
    <a href="../" title="Оглавление">Оглавление</a>
    <span class="separator"> | </span>
    <a href="../1/" title="Часть 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Часть 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Часть 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="Часть 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Часть 6">6</a>
    <span class="separator"> | </span>
    <a href="../7/" title="Часть 7">7</a>
    <span class="separator"> | </span>
    <a href="../8/" title="Часть 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="Часть 9">9</a>
    <span class="separator"> | </span>
    <a href="../10/" title="Часть 10">10</a>
    <span class="separator"> | </span>
    <a href="../11/" title="Часть 11">11</a>
  </div>
  <h1>Официальный FAQ по Ruby</h1>

---

{% include faq-notice.md %}

## Установка Ruby

Актуальную информацию о скачивании и установке Ruby
смотрите на страницах [Установка](/ru/documentation/installation/)
или [Скачать](/ru/downloads/).

### Какие операционные системы поддерживают Ruby?

{% include warnings/faq-out-of-date.html %}

Ruby разрабатывается под Linux и написан на довольно простом C.
Он работает под Linux и другими UNIX-подобными операционными системами, macOS,
Windows, DOS, BeOS, Amiga, Acorn Risc OS и OS/2.

### Где я могу получить исходный код Ruby?

Последнюю версию Ruby можно скачать с:
[www.ruby-lang.org/ru/downloads/](/ru/downloads/).
Зеркала также перечислены на этой странице.

Также на этой странице есть ссылка на ночной снапшот дерева разработки.

### Могу ли я получить доступ к дереву исходного кода разработки?

{% include warnings/faq-out-of-date.html %}

Если у вас есть клиент CVS, вы можете получить текущее дерево исходного кода, используя:

~~~
$ cvs -d :pserver:anonymous@cvs.netlab.co.jp:/home/cvs login
(Logging in to anonymous@cvs.netlab.co.jp)
CVS password: guest
$ cvs -d :pserver:anonymous@cvs.netlab.co.jp:/home/cvs co ruby
~~~

Если у вас нет CVS, вы можете получить ночной снапшот исходного кода разработки с
[https://cache.ruby-lang.org/pub/ruby/snapshot.tar.gz](https://cache.ruby-lang.org/pub/ruby/snapshot.tar.gz).

### Как мне скомпилировать Ruby?

Под Unix Ruby использует систему `autoconf` для настройки среды сборки. Вам не нужна команда `autoconf` на вашей машине, чтобы собрать Ruby из дистрибутива; просто используйте команды:

~~~
$ ./configure [configure options]
$ make
$ make test
$ make install
~~~

Вам могут понадобиться права суперпользователя для установки Ruby, если вы не переопределите стандартный путь установки (`/usr/local`). Вы можете получить полный список опций `configure`, используя:

~~~
$ ./configure --help
~~~

Если вы работаете из репозитория исходного кода, вам может потребоваться запустить
`autoconf` перед запуском `configure`.

### Как мне указать Ruby, где находятся мои библиотеки?

{% include warnings/faq-out-of-date.html %}

На некоторых системах процесс сборки может не найти библиотеки, используемые модулями расширения (например, библиотеки `dbm`).

Вы можете указать Ruby, где искать библиотеки, используя опции `configure`. Из [\[ruby-talk:5041\]][ruby-talk:5041]:

~~~
$ ./configure --with-xxx-yyy=DIR
~~~

где xxx это либо

~~~
opt           extra software path in general
dbm           path for dbm library
gdbm          path for gdbm library
x11           ...for X11..
tk            ...for Tk...
tcl           ...for Tcl...
~~~

и yyy это либо

~~~
dir           specifies -I DIR/include -L DIR/lib
include       specifies -I DIR
lib           specifies -L DIR
~~~

На HP-UX могут возникнуть проблемы при сборке с помощью `gcc`. Попробуйте использовать нативный компилятор. WATANABE Tetsuya рекомендует:

~~~
$ CC="cc -Ae" CFLAGS=-O ./configure --prefix=/opt/gnu
~~~

Также могут быть проблемы с нативным `sed` от HP.
Он рекомендует установить аналог от GNU.

[ruby-talk:5041]: https://blade.ruby-lang.org/ruby-talk/5041

### Доступны ли скомпилированные бинарные файлы?

Единый файл для скачивания, содержащий все необходимое для запуска Ruby в различных операционных системах Windows, доступен на [RubyInstaller](https://rubyinstaller.org/).

[Reuben Thomas](mailto:Reuben.Thomas@cl.cam.ac.uk) пишет:

> Вы могли бы упомянуть, что существует порт для Acorn RISC OS, в данный момент версии 1.4.3.
> Я сделал этот порт и не планирую его поддерживать, но я отправил
> патчи Matz, так что более новые версии тоже могут скомпилироваться.

### Что это за штуки «cygwin», «mingw» и «djgpp»?

{% include warnings/faq-out-of-date.html %}

Ruby написан так, чтобы использовать богатый набор возможностей среды Unix. К сожалению, в Windows отсутствуют некоторые функции, а другие реализованы иначе. В результате для запуска Ruby (и других программ на базе Unix) в Windows требуется своего рода промежуточный слой.

Вы можете столкнуться с различными версиями исполняемого файла Ruby, которые используют разные слои сопоставления оберток.

Версия rbdj — это автономная версия Windows-бинарника Ruby. Она использует инструменты DJ Delorie ([http://www.delorie.com](http://www.delorie.com)).

Версия rbcw — это Windows-бинарник Ruby, которому требуется библиотека cygwin, доступная на [http://www.cygwin.com](http://www.cygwin.com) или на страницах скачивания Ruby. Cygwin — это одновременно и уровень эмуляции, и набор утилит, изначально созданных Cygnus Solutions (ныне часть Redhat). Версия Ruby для cygwin, вероятно, обладает наиболее полным набором функций под Windows, поэтому большинство программистов предпочтут использовать именно её.

Чтобы использовать версию rbcw, вам нужно будет установить cygwin .dll отдельно. Как только вы установите cygwin на свой компьютер, скопируйте `cygwin1.dll` (который находится в поддиректории `bin` дистрибутива cygwin) в папку `Windows\System32` (или в другое место в вашем пути PATH).

Спасибо Anders Schneiderman за основу этого описания.

### Почему графика Tk не работает в Windows?

{% include warnings/faq-out-of-date.html %}

Правильно ли установлен Tk на вашей Windows-машине? Перейдите на [https://wiki.tcl-lang.org/page/Binary+Distributions](https://wiki.tcl-lang.org/page/Binary+Distributions#85b8647b1ec80c2fa1698c3c7e76204a944a95db2487347c51773f26b9dad6ae), чтобы найти скомпилированный бинарный дистрибутив Tcl/Tk для вашей системы.

Указывают ли переменные окружения `TCL_LIBRARY` и `TK_LIBRARY` на директории, содержащие tcl и tk?

Находится ли библиотека tk в вашем пути PATH?
