---
layout: news_post
title: "Zmieniono domyślne ustawienia ext/openssl"
author: "usa"
translator: "crabonature"
date: 2014-10-27 12:00:00 +0000
tags: security
lang: pl
---

Zmieniliśmy domyślne ustawienia ext/openssl w Rubim 2.1.4, Rubim 2.0.0-p594
i Rubim 1.9.3-p550.
Z tą zmianą niebezpieczne opcje SSL/TLS są obecnie domyślnie nieaktywne.
Jednakże przez tą zmianę istnieje możliwość pewnych problemów w połączeniu SSL.

## Szczegóły

OpenSSL wciąż implementuje z powodów historycznych protokoły i szyfry, które są
dziś niebezpieczne.
Jak podatność POODLE ([CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)),
jeśli będziesz dalej używał OpenSSL z tak niebezpiecznymi cechami, możesz nie być
w stanie zapewnić bezpieczeństwa komunikacji w sieci.
Bazując na dyskusji w [Błędzie #9424](https://bugs.ruby-lang.org/issues/9424),
zdecydowaliśmy wyłączyć domyślnie te niebezpieczne opcje SSL/TLS.
Jeżeli potrzebujesz anulować tą zmianę (pokazaną poniżej), zaaplikuj wsteczną
poprawkę by wycofać tą zmianę.

2.1.4
: [r48098](https://git.ruby-lang.org/ruby.git)

2.0.0-p594
: [r48110](https://git.ruby-lang.org/ruby.git)

1.9.3-p550
: [r48121](https://git.ruby-lang.org/ruby.git)

Jednakże jeśli wycofasz tą zmianę, istnieje ryzyko, że nie będziesz w stanie
zagwarantować bezpieczeństwa komunikacji sieciowej.
Powinieneś rozumieć implikacje tej zmiany przed jej wycofaniem.

### Dołączone biblioteki Rubiego

Ta zmiana znajduje odzwierciedlenie w net/http, net/imap i net/pop.
Od kiedy DRb i WEBrick otrzymują ustawienia oddzielnie, ta zmiana nie wpływa na nie.

### Skrypty używające bezpośrednio ext/openssl

Ta zmiana ma wpływ gdy obiekt `OpenSSL::SSL::SSLContext` jest powoływany do życia
i gdy metoda instancyjna `set_params` jest wołana.

Zwłaszcza w kodzie jak:

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # jeśli chcesz zmienić pewne opcje, takie jak magazyn certyfikatów, tryb sprawdzania i inne, możesz przekazać takie parametry w hashu
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

Podczas używania ext/openssl po stronie klienta, zakładamy, że nie będzie problemów
z tą zmianą.
Jednakże, jeśli używasz ext/openssl po stronie serwera i odzwierciedlając tę zmianę,
pewni starzy klienci (Internet Explorer 6 w Windows XP, przeglądarki w starych
telefonach komórkowych itp.) mogą nie być w stanie połączyć się z serwerem.

Jest to twoją decyzją czy aktywować czy nie tę zmianę, biorąc pod uwagę kompromisy.

## Obejście

Jeśli nie możesz zaktualizować Rubiego, ale nie chciałbyś mieć niebezpiecznych opcji
SSL/TLS, zaaplikuj poniższą łatkę:

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

## Zmiana dotyczy wersji

* Ruby 1.9.3 patchlevel 550 i późniejsze
* Ruby 2.0.0 patchlevel 594 i późniejsze
* Ruby 2.1.4 i późniejsze
* revision 48097 i późniejszy trunk

## Historia

* Oryginalnie opublikowane 2014-10-27 12:00:00 (UTC)
