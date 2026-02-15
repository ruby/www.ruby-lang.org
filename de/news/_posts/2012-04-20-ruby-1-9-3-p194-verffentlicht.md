---
layout: news_post
title: "Ruby 1.9.3-p194 veröffentlicht"
author: "Quintus"
lang: de
---

Ruby 1.9.3-p194 ist veröffentlicht worden.

Dieses Release behebt ein Sicherheitsproblem in RubyGems, das dazu
führte, dass SSL-Server für Repositories nicht verifiziert wurden.
Daneben sind in diesem Release natürlich auch viele weitere Fehler
behoben worden.

Hierbei handelt es sich um die neueste stabile Version der 1.9er-Serie.

### Sicherheitsfix für RubyGems: SSL-Server-Verifikation für entfernte Repositories

Dieses Release behebt zwei Sicherheitsprobleme in RubyGems:

* Verifikation von SSL-Zertifikaten der Server aktiviert
* Umleitungen von HTTPS auf HTTP verboten

Benutzern, die HTTPS-Quellen in ihrer `.gemrc` oder `/etc/gemrc`
verwenden, wird empfohlen, auf 1.9.3-p194 zu aktualisieren.

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

[ruby-1.9.3-p194.tar.bz2][4]

: **MD5-Summe**

  2278eff4cfed3cbc0653bc73085caa34

  **SHA256**

  a9d1ea9eaea075c60048369a63b35b3b5a06a30aa214a3d990e0bb71212db8fa

  **Größe**

  9\.841.223 Byte

[ruby-1.9.3-p194.tar.gz][5]

: **MD5-Summe**

  bc0c715c69da4d1d8bd57069c19f6c0e

  **SHA256**

  46e2fa80be7efed51bd9cdc529d1fe22ebc7567ee0f91db4ab855438cf4bd8bb

  **Größe**

  12\.432.239 Byte

[ruby-1.9.3-p194.zip][6]

: **MD5-Summe**

  77e67b15234e442d4a3dcc450bc70fea

  **SHA256**

  77474cfb92385b3a0b4c346553048bc65bfe68d4f220128329671a0234cb124d

  **Größe**

  13\.898.712 Byte



[1]: https://github.com/rubygems/rubygems/blob/1.8/History.txt
[2]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[3]: https://github.com/ruby/ruby/blob//v1_9_3_194/ChangeLog
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip
