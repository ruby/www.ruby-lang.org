---
layout: news_post
title: "Ruby 1.9.3-p125 veröffentlicht"
author: "Quintus"
lang: de
---

Ruby 1.9.3-p125 ist veröffentlicht worden.

Dieses Release enthält [einen Sicherheitsfix für Rubys
OpenSSL-Erweiterung][1]. Auch wurden viele andere Fehler behoben.

Hierbei handelt es sich um die neueste stabile Version der 1.9er-Serie.

### Fixes

* [Sicherheitsfix für Rubys OpenSSL-Modul: Erlaube ‘0/n splitting’ als
  Gegenmaßnahme für den TLS-BEAST-Angriff][1]
* Behoben: Unterstützung von LLVM/clang [\[Bug #5076\]][2]
* Behoben: Unterstützung von GCC 4.7 [\[Bug #5851\]][3]
* Weitere Fixes.

Für nähere Informationen siehe die [Tickets][4] und das [Changelog][5].

### Download

**Hinweis**\: Am 17.2.2012 wurden neue Quellcodearchive erstellt, um
[Bug #6040][6] zu beheben.

[ruby-1.9.3-p125.tar.bz2][7]

: **MD5-Summe**

  702529a7f8417ed79f628b77d8061aa5

  **SHA256**

  c67a59443052b5a9219eb4cee3892bdfbc6f250f0c8e214e02256a4cc7ef5526

  **Größe**

  9\.640.876 Byte

[ruby-1.9.3-p125.tar.gz][8]

: **MD5-Summe**

  e3ea86b9d3fc2d3ec867f66969ae3b92

  **SHA256**

  8b3c035cf4f0ad6420f447d6a48e8817e5384d0504514939aeb156e251d44cce

  **Größe**

  12\.128.778 Byte

[ruby-1.9.3-p125.zip][9]

: **MD5-Summe**

  2cff031a8801d91a0a0ca8e9a83e2ec8

  **SHA256**

  c16423182227c765398723da2419e4e962076778ec5e39417fad564e413fde1d/p&gt;

  **Größe**

  13\.590.570 Byte



[1]: {{ site.url }}/de/news/2012/02/16/security-fix-for-ruby-openssl-module/
[2]: https://bugs.ruby-lang.org/issues/show/5076
[3]: https://bugs.ruby-lang.org/issues/show/5851
[4]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[5]: https://github.com/ruby/ruby/blob//v1_9_3_125/ChangeLog
[6]: https://bugs.ruby-lang.org/issues/6040
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.bz2
[8]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.tar.gz
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p125.zip
