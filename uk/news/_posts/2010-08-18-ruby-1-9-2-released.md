---
layout: news_post
title: "Вийшов Ruby 1.9.2"
author: "Yugui"
translator: "Andrii Furmanets"
lang: uk
---

Ruby 1.9.2 випущено. Це остання стабільна версія серії 1.9.

### Про Ruby 1.9.2

Новий 1.9.2 майже сумісний з 1.9.1, крім цих змін:

* Багато нових методів
* Новий socket API (покращена підтримка IPv6)
* Нові кодування
* Новий клас Random, який підтримує кілька генераторів випадкових чисел
* Time перереалізовано. Помилка з роком 2038 виправлена.
* покращення regex
* $: не включає поточну директорію.
* dl перереалізовано на основі libffi.
* нова бібліотека psych, яка обгортає libyaml, яка може замінити syck.

Див. [NEWS][1] та [ChangeLog][2] для більш детальної інформації.

Ruby 1.9.2 проходить більше 99% [RubySpec][3].

### Підтримувані платформи

Ruby 1.9 підтримує чотири рівні.

Підтримується
: Ми перевірили, що Ruby 1.9.2 добре працює на більшості з них.

  * Debian GNU/Linux 5.0 на IA32.

Зроблено зусилля для
: Ми перевірили, що Ruby 1.9.2 добре працює на більшості з них.

  * mswin32, x64-mswin64, mingw32
  * MacOS X 10.5 (Intel) та 10.6
  * FreeBSD 6 та пізніші (amd64, IA32)
  * Solaris 10
  * Symbian OS

Зроблено зусилля для
: Ми перевірили, що Ruby 1.9.2 добре працює на більшості з них з невеликими
  модифікаціями. Патчі приймаються.

  * Інші дистрибутиви Linux
  * Інші версії MacOS X.
  * cygwin
  * AIX 5
  * Інші POSIX-сумісні системи
  * BeOS (Haiku)

### FAQ

Стандартна бібліотека встановлена в /usr/local/lib/ruby/1.9.1
: Ця версія - це "версія сумісності бібліотеки." Ruby 1.9.2 майже
  1.9.1 сумісний, тому бібліотека встановлена в директорії 1.9.1.

Це спричиняє LoadError
: `$:` не включає поточну директорію. Деякі скрипти можуть потребувати
  модифікацій для правильної роботи.

### Завантаження

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2&gt;][4]
  РОЗМІР
  : 8495472 байтів

  MD5
  : d8a02cadf57d2571cd4250e248ea7e4b

  SHA256
  : e9710990ed8c2e794123aba509010471915fb13c27dae0118831d2001a9c8d3b

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz&gt;][5]
  РОЗМІР
  : 10787899 байтів

  MD5
  : 755aba44607c580fddc25e7c89260460

  SHA256
  : 8c0c4e261a921b5c406bf9e76ac23bf3c915651534e9d1b9e8c5d0bee4a7285c

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip&gt;][6]
  РОЗМІР
  : 12159728 байтів

  MD5
  : e57a393ccd62ddece4c63bd549d8cf7f

  SHA256
  : e61521af06da71fde9f0c7c08baaf7415614d00c86ec5a7ab08b60a4f3185b2a




[1]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_0/NEWS
[2]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_0/ChangeLog
[3]: https://github.com/ruby/spec
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip