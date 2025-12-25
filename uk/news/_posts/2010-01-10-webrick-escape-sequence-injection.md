---
layout: news_post
title: "WEBrick має вразливість ін'єкції послідовностей екранування"
author: "Urabe Shyouhei"
translator: "Andrii Furmanets"
lang: uk
---

Виявлено вразливість у WEBrick, частині стандартної
бібліотеки Ruby. WEBrick дозволяє зловмисникам ін'єктувати зловмисні послідовності екранування до
його логів, роблячи можливим виконання небезпечних контрольних символів на
емуляторі терміналу жертви.

У нас вже є виправлення для цього. Випуски для всіх активних гілок будуть
слідувати за цим оголошенням. Але на даний момент ми рекомендуємо вам уникати
перегляду ваших логів WEBrick, поки ви не оновите ваш процес WEBrick.

## Детальний опис

Послідовності екранування терміналу використовуються для дозволу різних форм взаємодії
між терміналом та внутрішнім процесом. Проблема в тому, що ці
послідовності не призначені для випуску ненадійними джерелами; такими як
мережеві входи. Тому якщо віддалений зловмисник міг ін'єктувати послідовності екранування
в логи WEBrick, і жертва випадково консультує їх через свій/свій
термінал, зловмисник міг скористатися різними [слабкостями в
емуляторах терміналу][1].

І WEBrick не вдається відфільтрувати ці послідовності екранування терміналу.

Приклад:

    % xterm -e ruby -rwebrick -e 'WEBrick::HTTPServer.new(:Port=>8080).start' &
    % wget http://localhost:8080/%1b%5d%32%3b%6f%77%6e%65%64%07%0a

Стежте за заголовком вікна xterm.

## Зачеплені версії

* Ruby 1.8.6 рівень патчу 383 та всі попередні версії
* Ruby 1.8.7 рівень патчу 248 та всі попередні версії
* Версії розробки Ruby 1.8 (1.8.8dev)
* Ruby 1.9.1 рівень патчу 376 та всі попередні версії
* Версії розробки Ruby 1.9 (1.9.2dev)

## Рішення

* Виправлення для 1.8.6, 1.8.7, та 1.9.1 будуть слідувати за цим оголошенням.
  * **Оновлення** 1.8.7 pl. 249 випущено для виправлення цієї проблеми. Користувачів 1.8.7
    заохочується оновитися.
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.gz][2]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.bz2][3]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.zip][4]

  * **Оновлення** 1.9.1 pl. 378 випущено для виправлення цієї проблеми. Користувачів 1.9.1
    заохочується оновитися.
    * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.gz][5]
    * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.bz2][6]
    * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.zip][7]

  * **Оновлення** 1.8.6 pl. 388 випущено для виправлення цієї проблеми. Користувачів 1.8.6
    заохочується оновитися.
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.gz][8]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.bz2][9]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.zip][10]

* Для версій розробки, будь ласка, оновіться до найновішої ревізії
  для кожної гілки розробки.

## Подяка

Подяка Giovanni "evilaliv3" Pellerano, Alessandro "jekil" Tanasi,
та Francesco "ascii" Ongaro за виявлення цієї вразливості.




[1]: http://marc.info/?l=bugtraq&amp;m=104612710031920&amp;w=2 "Terminal Emulator Security Issues"
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.bz2
[4]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.zip
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.bz2
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.zip
[8]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.gz
[9]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.bz2
[10]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.zip

