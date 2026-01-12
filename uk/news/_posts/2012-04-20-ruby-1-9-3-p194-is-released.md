---
layout: news_post
title: "Вийшов Ruby 1.9.3-p194"
author: "NARUSE, Yui"
translator: "Andrii Furmanets"
lang: uk
---

Ruby 1.9.3-p194 випущено.

Цей випуск включає виправлення безпеки для RubyGems: Помилка перевірки SSL сервера для віддаленого репозиторію. І багато помилок виправлено в цьому випуску.

## Виправлення безпеки для RubyGems: Помилка перевірки SSL сервера для віддаленого репозиторію

Цей випуск включає два виправлення безпеки в RubyGems.

* Увімкнути перевірку SSL сертифікатів сервера
* Заборонити перенаправлення з https на http

Користувачів, які використовують https джерело в .gemrc або /etc/gemrc, заохочується
оновитися до 1.9.3-p194.

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

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2&gt;][4]
  * РОЗМІР: 9841223 байтів
  * MD5: 2278eff4cfed3cbc0653bc73085caa34
  * SHA256: a9d1ea9eaea075c60048369a63b35b3b5a06a30aa214a3d990e0bb71212db8fa

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz&gt;][5]
  * РОЗМІР: 12432239 байтів
  * MD5: bc0c715c69da4d1d8bd57069c19f6c0e
  * SHA256: 46e2fa80be7efed51bd9cdc529d1fe22ebc7567ee0f91db4ab855438cf4bd8bb

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip&gt;][6]
  * РОЗМІР: 13898712 байтів
  * MD5: 77e67b15234e442d4a3dcc450bc70fea
  * SHA256: 77474cfb92385b3a0b4c346553048bc65bfe68d4f220128329671a0234cb124d




[1]: https://github.com/rubygems/rubygems/blob/1.8/History.txt
[2]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[3]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_3_194/ChangeLog
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip
