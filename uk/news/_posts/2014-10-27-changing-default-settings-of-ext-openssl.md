---
layout: news_post
title: "Змінено налаштування за замовчуванням ext/openssl"
author: "usa"
translator: "Andrii Furmanets"
date: 2014-10-27 12:00:00 +0000
tags: security
lang: uk
---

Ми змінили налаштування за замовчуванням ext/openssl в Ruby 2.1.4, Ruby 2.0.0-p594 та Ruby 1.9.3-p550.
З цією зміною, небезпечні опції SSL/TLS тепер вимкнено за замовчуванням.
Однак, через цю зміну, є можливість деяких проблем у з'єднанні SSL.

## Деталі

OpenSSL все ще реалізує протоколи та шифри, які вважаються небезпечними сьогодні через історичні обставини.
Як вразливість POODLE ([CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)), якщо ви продовжуєте використовувати OpenSSL з такими небезпечними функціями, ви можете не змогти зберегти безпеку мережевого зв'язку.
Тому, на основі обговорення в [Помилка #9424](https://bugs.ruby-lang.org/issues/9424), ми вирішили вимкнути такі небезпечні опції SSL/TLS за замовчуванням.
Якщо вам потрібно скасувати цю зміну (показано нижче), застосуйте зворотний патч, щоб скасувати її.

2.1.4
: [r48098](https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?revision=48098&view=revision)

2.0.0-p594
: [r48110](https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?revision=48110&view=revision)

1.9.3-p550
: [r48121](https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?revision=48121&view=revision)

Однак, якщо ви скасуєте цю зміну, є ризик, що ви не зможете гарантувати безпеку мережевого зв'язку.
Ви повинні зрозуміти наслідки цієї зміни перед її видаленням.

### Включені бібліотеки Ruby

Ця зміна відображається в net/http, net/imap та net/pop.
Оскільки DRb та WEBrick отримують налаштування окремо, ця зміна не впливає на них.

### Скрипти, які використовують ext/openssl безпосередньо

Ця зміна відображається, коли об'єкт `OpenSSL::SSL::SSLContext` створюється та викликається метод екземпляра `set_params`.

Зокрема, код, такий як:

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # якщо ви хочете змінити деякі опції, такі як сховище сертифікатів, режим перевірки тощо, ви можете передати такі параметри в хеші
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

При використанні ext/openssl як клієнтської сторони, ми припускаємо, що може не бути проблеми з цією зміною.
Однак, якщо ви використовуєте ext/openssl як серверну сторону та відображаєте цю зміну, деякі старі клієнти (Internet Explorer 6 на Windows XP, браузери в старих мобільних телефонах, тощо) можуть не змогти підключитися до сервера.

Ваше рішення, чи вмикати цю зміну чи ні, розгляньте компроміси.

## Обхідний шлях

Якщо ви не можете оновити Ruby, але вам потрібно впоратися з небезпечними опціями SSL/TLS, застосуйте наступний monkey-patch:

{% highlight ruby %}
module OpenSSL
  module SSL
    class SSLContext
      remove_const(:DEFAULT_PARAMS)
      DEFAULT_PARAMS = {
        :ssl_version => "SSLv23",
        :verify_mode => OpenSSL::SSL::VERIFY_PEER,
        :ciphers => %w{
          ECDHE-ECDSA-AES128-GCM-SHA256
          ECDHE-RSA-AES128-GCM-SHA256
          ECDHE-ECDSA-AES256-GCM-SHA384
          ECDHE-RSA-AES256-GCM-SHA384
          DHE-RSA-AES128-GCM-SHA256
          DHE-DSS-AES128-GCM-SHA256
          DHE-RSA-AES256-GCM-SHA384
          DHE-DSS-AES256-GCM-SHA384
          ECDHE-ECDSA-AES128-SHA256
          ECDHE-RSA-AES128-SHA256
          ECDHE-ECDSA-AES128-SHA
          ECDHE-RSA-AES128-SHA
          ECDHE-ECDSA-AES256-SHA384
          ECDHE-RSA-AES256-SHA384
          ECDHE-ECDSA-AES256-SHA
          ECDHE-RSA-AES256-SHA
          DHE-RSA-AES128-SHA256
          DHE-RSA-AES256-SHA256
          DHE-RSA-AES128-SHA
          DHE-RSA-AES256-SHA
          DHE-DSS-AES128-SHA256
          DHE-DSS-AES256-SHA256
          DHE-DSS-AES128-SHA
          DHE-DSS-AES256-SHA
          AES128-GCM-SHA256
          AES256-GCM-SHA384
          AES128-SHA256
          AES256-SHA256
          AES128-SHA
          AES256-SHA
          ECDHE-ECDSA-RC4-SHA
          ECDHE-RSA-RC4-SHA
          RC4-SHA
        }.join(":"),
        :options => -> {
          opts = OpenSSL::SSL::OP_ALL
          opts &= ~OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS if defined?(OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS)
          opts |= OpenSSL::SSL::OP_NO_COMPRESSION if defined?(OpenSSL::SSL::OP_NO_COMPRESSION)
          opts |= OpenSSL::SSL::OP_NO_SSLv2 if defined?(OpenSSL::SSL::OP_NO_SSLv2)
          opts |= OpenSSL::SSL::OP_NO_SSLv3 if defined?(OpenSSL::SSL::OP_NO_SSLv3)
          opts
        }.call
      }
    end
  end
end
{% endhighlight %}

## Зачеплені версії цієї зміни

* Ruby 1.9.3 рівень патчу 550 та пізніші
* Ruby 2.0.0 рівень патчу 594 та пізніші
* Ruby 2.1.4 та пізніші
* ревізія 48097 та пізніші trunk

## Історія

* Спочатку опубліковано 2014-10-27 12:00:00 (UTC)

