---
layout: news_post
title: "Вийшов Ruby 1.9.1-p376"
author: "Yugui"
translator: "Andrii Furmanets"
lang: uk
---

Ruby 1.9.1-p376 щойно випущено. Це випуск рівня патчу
Ruby 1.9.1 та включає виправлення CVE-2009-4124.

#### CVE-2009-4124

Попередній випуск, Ruby 1.9.1-p243 має [вразливість безпеки, яка
дозволяє переповнення купи][1]. Цю вразливість знайшов Emmanouel
Kellinis, KPMG London.

Я рекомендую всім користувачам Ruby 1.9.1 оновитися до p376. Але
вразливість не впливає на серію Ruby 1.8.

#### Інші виправлення

Крім того, 1.9.1-p376 включає &gt; 100 виправлень помилок.

* Команди розширення Irb були зламані. Це виправлено.
* Ripper не міг парсити деякі коди Ruby. Це виправлено.
* Виправлено помилки збірки на AIX.
* Деякі виправлення помилок Matrix.
* Можна завантажувати gems, які встановлені в домашній директорії користувача.
* Деякі методи стали повертати рядок з правильною кодуванням.

Див. ChangeLog для більше деталей.

* [&lt;URL:https://svn.ruby-lang.org/repos/ruby/branches/ruby\_1\_9\_1/ChangeLog&gt;][2]

#### Розташування

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2&gt;][3]
  РОЗМІР
  : 7293106 байтів

  MD5
  : e019ae9c643c5efe91be49e29781fb94

  SHA256
  : 79164e647e23bb7c705195e0075ce6020c30dd5ec4f8c8a12a100fe0eb0d6783

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.gz&gt;][4]
  РОЗМІР
  : 9073007 байтів

  MD5
  : ebb20550a11e7f1a2fbd6fdec2a3e0a3

  SHA256
  : 58b8fc1645283fcf3d5be195dffcaf55b7c85cbc210074273b57b835409b21ca

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.zip&gt;][5]
  РОЗМІР
  : 10337871 байтів

  MD5
  : d4d5e62f65cb92a281f1569a7f25371b

  SHA256
  : 486d3efdab269040ce7142964ba3a4e0d46f0a5b812136bcac7e5bafc726c14e




[1]: {{ site.url }}/uk/news/2009/12/07/heap-overflow-in-string/
[2]: https://svn.ruby-lang.org/repos/ruby/branches/ruby_1_9_1/ChangeLog
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.zip

