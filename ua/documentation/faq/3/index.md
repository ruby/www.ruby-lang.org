---
layout: page
title: "Офіційний FAQ Ruby"
lang: ua

header: |
  <div class="multi-page">
    <a href="../" title="Зміст">Зміст</a>
    <span class="separator"> | </span>
    <a href="../1/" title="Частина 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Частина 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Частина 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="Частина 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Частина 6">6</a>
    <span class="separator"> | </span>
    <a href="../7/" title="Частина 7">7</a>
    <span class="separator"> | </span>
    <a href="../8/" title="Частина 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="Частина 9">9</a>
    <span class="separator"> | </span>
    <a href="../10/" title="Частина 10">10</a>
    <span class="separator"> | </span>
    <a href="../11/" title="Частина 11">11</a>
  </div>
  <h1>Офіційний FAQ Ruby</h1>

---

{% include faq-notice.md %}

## Встановлення Ruby

Актуальну інформацію про завантаження та встановлення Ruby дивіться на
сторінці [Встановлення](/ua/documentation/installation/)
або [Завантаження](/ua/downloads/).

### Які операційні системи підтримують Ruby?

{% include warnings/faq-out-of-date.html %}

Ruby розробляється під Linux і написаний досить простим C.
Він працює на Linux та інших UNIX-подібних ОС, macOS,
Windows, DOS, BeOS, Amiga, Acorn Risc OS і OS/2.

### Де можна отримати вихідні коди Ruby?

Останню версію Ruby можна завантажити з:
[www.ruby-lang.org/ua/downloads/](/ua/downloads/).
Дзеркальні сайти також перелічені на цій сторінці.

Також на цій сторінці є посилання на нічний снапшот гілки розробки.

### Чи можна отримати доступ до дерева джерел розробки?

{% include warnings/faq-out-of-date.html %}

Якщо у вас є клієнт CVS, ви можете отримати поточне дерево джерел так:

~~~
$ cvs -d :pserver:anonymous@cvs.netlab.co.jp:/home/cvs login
(Logging in to anonymous@cvs.netlab.co.jp)
CVS password: guest
$ cvs -d :pserver:anonymous@cvs.netlab.co.jp:/home/cvs co ruby
~~~

Якщо у вас немає CVS, ви можете отримати нічний снапшот джерел розробки
з
[https://cache.ruby-lang.org/pub/ruby/snapshot.tar.gz](https://cache.ruby-lang.org/pub/ruby/snapshot.tar.gz).

### Як компілювати Ruby?

У Unix Ruby використовує систему `autoconf` для налаштування середовища
збирання. Вам не потрібна команда `autoconf`, щоб зібрати Ruby з
дистрибутива; просто використайте команди:

~~~
$ ./configure [configure options]
$ make
$ make test
$ make install
~~~

Вам можуть знадобитися права суперкористувача, щоб встановити Ruby,
якщо ви не змінюєте стандартне місце встановлення (`/usr/local`).
Повний список параметрів `configure` можна отримати так:

~~~
$ ./configure --help
~~~

Якщо ви працюєте з репозиторію вихідного коду, може знадобитися
запустити `autoconf` перед `configure`.

### Як повідомити Ruby, де шукати бібліотеки?

{% include warnings/faq-out-of-date.html %}

У деяких системах процес збирання може не знайти бібліотеки, які
використовуються модулями розширень (наприклад, бібліотеки `dbm`).

Ви можете повідомити Ruby, де шукати бібліотеки, через параметри `configure`.
З [\[ruby-talk:5041\]][ruby-talk:5041]:

~~~
$ ./configure --with-xxx-yyy=DIR
~~~

де xxx — це один із:

~~~
opt           extra software path in general
dbm           path for dbm library
gdbm          path for gdbm library
x11           ...for X11..
tk            ...for Tk...
tcl           ...for Tcl...
~~~

а yyy — один із:

~~~
dir           specifies -I DIR/include -L DIR/lib
include       specifies -I DIR
lib           specifies -L DIR
~~~

На HP-UX можуть виникати проблеми зі збиранням через `gcc`.
Спробуйте використовувати нативний компілятор. WATANABE Tetsuya рекомендує:

~~~
$ CC="cc -Ae" CFLAGS=-O ./configure --prefix=/opt/gnu
~~~

Також можуть виникати проблеми з нативним `sed` від HP.
Він рекомендує встановити GNU-еквівалент.

[ruby-talk:5041]: https://blade.ruby-lang.org/ruby-talk/5041

### Чи доступні готові бінарні файли?

Є один завантажуваний пакет, який містить усе потрібне для запуску Ruby
під різними версіями Windows. Він доступний на [RubyInstaller](https://rubyinstaller.org/).

[Reuben Thomas](mailto:Reuben.Thomas@cl.cam.ac.uk) пише:

> Ви могли б згадати, що існує порт для Acorn RISC OS, наразі версії 1.4.3.
> Я зробив цей порт і не планую його підтримувати, але я надіслав патчі
> Matz, тож новіші версії, ймовірно, також компілюватимуться.

### Що таке “cygwin”, “mingw” і “djgpp”?

{% include warnings/faq-out-of-date.html %}

Ruby написаний так, щоб використовувати багаті можливості Unix-середовища.
На жаль, Windows не має деяких функцій і реалізує інші інакше. У результаті
потрібен певний шар сумісності, щоб запускати Ruby (та інші Unix-орієнтовані
програми) у Windows.

Ви можете зустріти різні версії виконуваного файлу Ruby, що використовують
різні wrapper-шари сумісності.

Версія rbdj — це автономна версія Windows-бінарника Ruby.
Вона використовує інструменти DJ Delorie
([http://www.delorie.com](http://www.delorie.com)).

Версія rbcw — це Windows-бінарник Ruby, який потребує бібліотеку cygwin,
доступну на [http://www.cygwin.com](http://www.cygwin.com) або зі сторінок
завантаження Ruby. Cygwin — це і шар емуляції, і набір утиліт, спочатку
створених Cygnus Solutions (нині частина Redhat).
Версія Ruby під cygwin, ймовірно, має найповніший набір можливостей у Windows,
тому більшість програмістів захочуть використовувати саме її.

Щоб використати rbcw-версію, потрібно окремо встановити cygwin .dll.
Після встановлення cygwin на комп’ютер скопіюйте `cygwin1.dll` (яка
знаходиться в підкаталозі `bin` дистрибутива cygwin) у папку
`Windows\System32` (або в інше місце, яке є у вашому PATH).

Дякуємо Anders Schneiderman за основу цього опису.

### Чому не працює графіка Tk у Windows?

{% include warnings/faq-out-of-date.html %}

Чи правильно встановлено Tk на вашій Windows-машині? Перейдіть до
[https://wiki.tcl-lang.org/page/Binary+Distributions](https://wiki.tcl-lang.org/page/Binary+Distributions#85b8647b1ec80c2fa1698c3c7e76204a944a95db2487347c51773f26b9dad6ae)
і знайдіть готовий бінарний дистрибутив Tcl/Tk для вашої системи.

Чи вказують змінні середовища `TCL_LIBRARY` і `TK_LIBRARY` на каталоги,
що містять tcl і tk?

Чи знаходиться бібліотека tk у вашому PATH?
