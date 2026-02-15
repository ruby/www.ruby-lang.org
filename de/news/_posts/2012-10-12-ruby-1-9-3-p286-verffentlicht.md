---
layout: news_post
title: "Ruby 1.9.3-p286 veröffentlicht"
author: "Quintus"
lang: de
---

Ruby 1.9.3-p286 ist veröffentlicht worden.

Dieses Release behebt Sicherheitslücken in den Dateierstellungsroutinen
und im Exception#to\_s-Mechanismus. Daneben wurden viele weitere
Bugfixes gemacht.

Hierbei handelt es sich um die neueste stabile Version der 1.9er-Serie.

### Fixes

Dieses Release enthält einige Sicherheitsfixes und viele weitere
Bugfixes:

* [Durch ungültiges NUL-Zeichen werden unabsichtlich Dateien erzeugt][1]
* [Sicherheitslücke in Exception#to\_s / NameError#to\_s (CVE-2012-4464,
  CVE-2012-4466) ermöglicht Umgehung von $SAFE][2]
* Daneben wurden viele weitere Bugfixes gemacht.

Für Details siehe [die Tickets][3] und [das Changelog][4].

### Download

[ruby-1.9.3-p286.tar.bz2][5]

: **MD5-Summe**

  e76848a86606a4fd5dcf14fc4b4e755e

  **SHA256**

  5281656c7a0ae48b64f28d845a96b4dfa16ba1357a911265752787585fb5ea64

  **Größe**

  9\.961.862 Byte

[ruby-1.9.3-p286.tar.gz][6]

: **MD5-Summe**

  e2469b55c2a3d0d643097d47fe4984bb

  **SHA256**

  e94367108751fd6bce79401d947baa66096c757fd3a0856350a2abd05d26d89d

  **Größe**

  12\.459.652 Byte

[ruby-1.9.3-p286.zip][7]

: **MD5-Summe**

  8b3c2d6bd306804ed198260e4f5b6418

  **SHA256**

  9d59c5885e66e6fbfbc49a2b6b80429141f8bdd2827747ec9a4eee7c2252b522

  **Größe**

  13\.906.047 Byte



[1]: {{ site.url }}/de/news/2012/10/12/durch-ungltiges-nul-zeichen-werden-unabsichtlich-dateien-erzeugt/
[2]: {{ site.url }}/de/news/2012/10/12/sicherheitsluecke-in-exception-ermoeglicht-umgehung-von-safe-mode/
[3]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[4]: https://github.com/ruby/ruby/blob//v1_9_3_286/ChangeLog
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p286.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p286.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p286.zip
