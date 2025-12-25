---
layout: news_post
title: "Вийшов Ruby 1.9.2-p320"
author: "NARUSE, Yui"
translator: "Andrii Furmanets"
lang: uk
---

Ruby 1.9.2-p320 випущено.

Цей випуск включає виправлення безпеки для RubyGems: Помилка перевірки SSL сервера для віддаленого репозиторію. І багато помилок виправлено в цьому випуску.

## Виправлення безпеки для RubyGems: Помилка перевірки SSL сервера для віддаленого репозиторію

Цей випуск включає два виправлення безпеки в RubyGems.

* Увімкнути перевірку SSL сертифікатів сервера
* Заборонити перенаправлення з https на http

Користувачів, які використовують https джерело в .gemrc або /etc/gemrc, заохочується
оновитися до 1.9.2-p320 або 1.9.3-p194.

Наступне витягнуто з примітки до випуску RubyGems 1.8.23 \[1\].

"Цей випуск збільшує безпеку, використовувану, коли RubyGems спілкується з
https сервером. Якщо ви використовуєте користувацький сервер RubyGems через SSL, цей
випуск призведе до того, що RubyGems більше не підключатиметься, якщо ваш SSL сертифікат не є
глобально дійсним.

Ви можете налаштувати використання SSL сертифіката в RubyGems через
опції :ssl\_ca\_cert та :ssl\_verify\_mode в ~/.gemrc та
/etc/gemrc. Рекомендований спосіб - встановити :ssl\_ca\_cert на CA
сертифікат для вашого сервера або пакет сертифікатів, що містить ваш CA
сертифікат.

Ви також можете встановити :ssl\_verify\_mode на 0, щоб повністю вимкнути перевірки SSL
сертифіката, але це не рекомендується."

Подяка John Firebaugh за повідомлення про цю проблему.

\[1\]
[&lt;URL:https://github.com/rubygems/rubygems/blob/1.8/History.txt&gt;][1]

## Виправлення

* Виправлення безпеки для RubyGems: Помилка перевірки SSL сервера для віддаленого
  репозиторію
* інші виправлення помилок

Див. [тікети][2] та [ChangeLog][3] для деталей.

## Завантаження

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.bz2&gt;][4]
  * РОЗМІР: 8981382 байтів
  * MD5: b226dfe95d92750ee7163e899b33af00
  * SHA256: 6777f865cfa21ffdc167fcc4a7da05cb13aab1bd9e59bfcda82c4b32f75e6b51

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.gz&gt;][5]
  * РОЗМІР: 11338691 байтів
  * MD5: 5ef5d9c07af207710bd9c2ad1cef4b42
  * SHA256: 39a1f046e8756c1885cde42b234bc608196e50feadf1d0f202f7634f4a4b1245

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.zip&gt;][6]
  * РОЗМІР: 12730896 байтів
  * MD5: 0bdfd04bfeb0933c0bdcd00e4ea94c49
  * SHA256: 83db9c86d5cf20bb91e625c3c9c1da8e61d941e1bc8ff4a1b9ea70c12f2972d3




[1]: https://github.com/rubygems/rubygems/blob/1.8/History.txt
[2]: https://bugs.ruby-lang.org/projects/ruby-192/issues?set_filter=1&amp;status_id=5
[3]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_320/ChangeLog
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.zip

