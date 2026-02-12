---
layout: news_post
title: "Изменились дефолтные настройки ext/openssl"
author: "usa"
translator: "gazay"
date: 2014-10-27 12:00:00 +0000
tags: security
lang: ru
---

Мы изменили дефолтные настройки ext/openssl в Ruby 2.1.4, Ruby 2.0.0-p594 и Ruby 1.9.3-p550.
С этими изменениями небезопасные опции SSL/TLS теперь выключены по умолчанию.
Несмотря на эти изменения, проблемы в соединении SSL все еще вероятны.

## Детали

OpenSSL до сих пор реализует протоколы и шифры, исторически признанные небезопасными на сегодняшний день.
Например, POODLE уязвимость ([CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)).
Если вы продолжите использовать OpenSSL с подобными небезопасными фичами, возможно, вы не сможете обеспечить безопасность
сетевых коммуникаций. Так, основываясь на дискуссии в [Bug #9424](https://bugs.ruby-lang.org/issues/9424),
мы решили отключить подобные опции для SSL/TLS по умолчанию.
Если вам надо отменить эти изменения (показанные ниже), примените обратный патч, чтобы включить эти опции снова.

2.1.4
: [r48098](https://git.ruby-lang.org/ruby.git)

2.0.0-p594
: [r48110](https://git.ruby-lang.org/ruby.git)

1.9.3-p550
: [r48121](https://git.ruby-lang.org/ruby.git)

В любом случае, если вы отмените эти изменения, есть риск, что вы не сможете гарантировать безопасность сетевых коммуникаций.
Вы должны понимать последстивия этих изменений, прежде чем отменять их.

### Встроенные библиотеки Ruby

Это изменение затрагивает net/http, net/imap и net/pop.
С тех пор как DRb и WEBrick настраиваются отдельно, это изменение не затрагивает их.

### Скрипты, которые используют ext/openssl напрямую

Это изменение влияет на метод `set_params` объекта `OpenSSL::SSL::SSLContext`.

Например, в следующем коде:

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # если вы хотите изменить какие-либо опции, например, хранилище сертификата, режим проверки и т.п., вы можете передать эти параметры в hash
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

Когда ext/openssl используется на стороне клиента, мы предполагаем, что никаких проблем с представленными изменениями быть не должно.
Но, если вы используете ext/openssl на серверной стороне и у вас есть код, приведенный выше, некоторые
старые клиенты (Internet Explorer 6 на Windows XP, браузеры в старых мобильных телефонах и т.п.), возможно не смогут подключиться к серверу.

Применять или не применять данные изменения – решение остается за вами.

## Обходной путь

Если вы не можете обновить Ruby, но хотите отключить небезопасные опции SSL/TLS, примените следующий манкипатч:

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

## Версии, затронутые изменениями

* Ruby 1.9.3 patchlevel 550 и позднее
* Ruby 2.0.0 patchlevel 594 и позднее
* Ruby 2.1.4 и позднее
* ревизия 48097 и позднее в trunk

## История

* Оригинал опубликован 2014-10-27 12:00:00 (UTC)
