---
layout: news_post
title: "Ruby 1.9.2-p320 veröffentlicht"
author: "Quintus"
lang: de
---

Ruby 1.9.2-p320 ist veröffentlicht worden.

Dieses Release behebt ein Sicherheitsproblem in RubyGems, das dazu
führte, dass SSL-Server für Repositories nicht verifiziert wurden.
Daneben sind in diesem Release natürlich auch viele weitere Fehler
behoben worden.

### Sicherheitsfix für RubyGems: SSL-Server-Verifikation für entfernte Repositories

Dieses Release behebt zwei Sicherheitsprobleme in RubyGems:

* Verifikation von SSL-Zertifikaten der Server aktiviert
* Umleitungen von HTTPS auf HTTP verboten

Benutzern, die HTTPS-Quellen in ihrer `.gemrc` oder `/etc/gemrc`
verwenden, wird empfohlen, auf 1.9.2-p320 oder 1.9.3-p194 zu
aktualisieren.

Das folgende ist ein Auszug aus den [Veröffentlichungshinweisen von
RubyGems 1.8.23][1].

> Dieses Release erhöht die Sicherheit von RubyGems’ Kommunikation mit
> HTTPS-Servern. Wenn Sie einen eigenen RubyGems-Server über SSL
> betreiben, dessen Zertifikat nicht global gültig ist, wird dieses
> Release RubyGems dazu veranlassen, sich nicht mehr mit diesem Server
> zu verbinden.
> Die Art und Weise, wie RubyGems SSL-Zertifikate handhabt, kann
> mithilfe der `:ssl_ca_cert` und `:ssl_verify_mode`-Direktiven in der
> **~/.gemrc** und **/etc/gemrc** festgelegt werden. Es wird empfohlen,
> `:ssl_ca_cert` auf das Ihr CA-Zertifikat oder das Zertifikatsbundle
> mit Ihrer CA-Zertifizierung zu setzen.
>
> Ein Wert von 0 für `:ssl_verify_mode` veranlasst RubyGems, überhaupt
> keine SSL-Zertifikatsprüfungen durchzuführen, was jedoch nicht
> empfohlen wird.

### Fixes

* Sicherheitsfix für RubyGems: SSL-Server-Verifikationsfehler für
  entfernte Repositories
* Andere Bugfixes

Für nähere Informationen siehe die [Tickets][2] und das [Changelog][3].

### Download

[ruby-1.9.2-p320.tar.bz2][4]

: **MD5-Summe**

  b226dfe95d92750ee7163e899b33af00

  **SHA256**

  6777f865cfa21ffdc167fcc4a7da05cb13aab1bd9e59bfcda82c4b32f75e6b51

  **Größe**

  8\.981.382 Byte

[ruby-1.9.2-p320.tar.gz][5]

: **MD5-Summe**

  5ef5d9c07af207710bd9c2ad1cef4b42

  **SHA256**

  39a1f046e8756c1885cde42b234bc608196e50feadf1d0f202f7634f4a4b1245

  **Größe**

  11\.338.691 Byte

[ruby-1.9.2-p320.zip][6]

: **MD5-Summe**

  0bdfd04bfeb0933c0bdcd00e4ea94c49

  **SHA256**

  83db9c86d5cf20bb91e625c3c9c1da8e61d941e1bc8ff4a1b9ea70c12f2972d3

  **Größe**

  12\.730.896 Byte



[1]: https://github.com/rubygems/rubygems/blob/1.8/History.txt
[2]: https://bugs.ruby-lang.org/projects/ruby-192/issues?set_filter=1&amp;status_id=5
[3]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_320
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.zip
