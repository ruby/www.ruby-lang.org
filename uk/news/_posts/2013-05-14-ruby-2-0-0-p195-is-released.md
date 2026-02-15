---
layout: news_post
title: "Вийшов Ruby 2.0.0-p195"
author: "nagachika"
translator: "Andrii Furmanets"
date: 2013-05-14 13:00:01 +0000
lang: uk
---

Ruby 2.0.0-p195 випущено. Це перший випуск рівня патчу 2.0.0.

Цей випуск включає виправлення безпеки розширення Ruby DL / Fiddle.

* [Обхід таїнтування об'єкта в DL та Fiddle в Ruby
  (CVE-2013-2065)](/uk/news/2013/05/14/taint-bypass-dl-fiddle-cve-2013-2065/)

І є багато виправлень помилок та деякі оптимізації, та виправлення документації.

## Завантаження

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.bz2)

      РОЗМІР:   10807456 байтів
      MD5:    2f54faea6ee1ca500632ec3c0cb59cb6
      SHA256: 0be32aef7a7ab6e3708cc1d65cd3e0a99fa801597194bbedd5799c11d652eb5b

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.gz)

      РОЗМІР:   13641558 байтів
      MD5:    0672e5af309ae99d1703d0e96eff8ea5
      SHA256: a2fe8d44eac3c27d191ca2d0ee2d871f9aed873c74491b2a8df229bfdc4e5a93

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.zip](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.zip)

      РОЗМІР:   15092199 байтів
      MD5:    924fe4bea72b1b258655211998631791
      SHA256: 81a4dc6cc09e491d417a51e5983c4584eff849e2a186ec3affdbe5bc15cd7db5

## Зміни

Основні виправлення нижче.
Див. [ChangeLog](https://github.com/ruby/ruby/blob//v2_0_0_195/ChangeLog)
або [Тікети](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&status_id=5)
для деталей.

Дякую всім комітерам/учасникам.

### Ядро - prepend

      #7841 Module#prepend тепер виявляє циклічний prepend.
      #7843 видалення prepended методів спричиняє винятки.
      #8357 Module#prepend ламає оператори порівняння Module.
      #7983 Module#prepend не може перевизначити операторні методи Fixnum.
      #8005 методи, зроблені приватними/захищеними після визначення, стають невикликаними на prepended класі.
      #8025 Module#included_modules включає класи, коли prepended.

### Ядро - ключові аргументи

      #7922 неназваний ключовий rest аргумент спричиняє SyntaxError.
      #7942 підтримка визначення методу, який отримує лише ключові аргументи без дужок.
      #8008 виправлення помилки в super з ключовими аргументами.
      #8236 виправлення обробки rest аргументів та ключових аргументів через `super'.
      #8260 несимвольний ключ не повинен трактуватися як ключові аргументи.

### Ядро - refinements

      #7925 виправлення помилки refinements з викликом методу super у блоці.

### Ядро - GC

      #8092 покращення точності GC.stat[:heap_live_num]
      #8146 уникнення непотрібного зростання купи.
      #8145 виправлення необмеженого зростання пам'яті з великими значеннями RUBY_FREE_MIN.

### Ядро - Regexp

      #7972 Regexp POSIX space клас залежить від локації.
      #7974 Regexp case-insensitive група не працює.
      #8023 Regexp lookbehind assertion не працює з увімкненим режимом /m
      #8001 Regexp \Z відповідає там, де не повинен

### Ядро - інше

      #8063 виправлення потенційного порушення пам'яті та уникнення abort на середовищі _FORTIFY_SOURCE=2 (напр. Ubuntu).
      #8175 ARGF#skip не працює, як задокументовано.
      #8069 File.expand_path('something', '~') тепер підтримує домашній шлях на Windows.
      #8220 виправлення Segmentation fault, коли defined? ().
      #8367 виправлення регресії в defined?(super).
      #8283 Dir.glob не рекурсує приховані директорії.
      #8165 виправлення помилки множинного require з не-ascii шляхом файлу.
      #8290 виправлення несумісної поведінки String#inspect з символом NUL.
      #8360 виправлення Segmentation fault Thread#join(Float::INFINITY) на деяких платформах.

### RubyGems

      Версія включеного RubyGems оновлена до 2.0.2+
      #7698 виправлення несумісності rubygems щодо встановлення бібліотек розширень.
      #8019 виправлення помилки gem list --remote не працює.

### Бібліотеки

      #7911 File.fnmatch з US-ASCII шаблоном та UTF-8 шляхом викликає виняток.
      #8240 виправлення помилки про OpenSSL::SSL::SSLSocket ламає інші з'єднання або файли на GC.
      #8183 CGI.unescapeHTML не може декодувати Numeric Character References з великої літери (&#Xnnnn).

### Збірка/Платформа специфічне

      #7830 виправлення помилки збірки з попередженням компілятора.
      #7950 виправлення помилки збірки на mswin/VC з --with-static-linked-ext.
