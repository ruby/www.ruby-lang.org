---
layout: news_post
title: "Sicherheitslücke in FileUtils durch Race-Conditions in Symlinks"
author: "Quintus"
lang: de
---

Eine durch Symlink-Race-Conditions verursachte Sicherheitslücke in
`FileUtils.remove_entry_secure` wurde entdeckt. Die Sicherheitslücke
erlaubt lokalen Nutzern beliebige Dateien und Verzeichnisse zu löschen.

### Betroffene Versionen

* Ruby 1.8.6-p420 und alle vorherigen Versionen
* Ruby 1.8.7-p330 und alle vorherigen Versionen
* Entwicklerversionen von Ruby 1.8 (1.8.8-dev)
* Ruby 1.9.1-p430 und alle vorherigen Versionen
* Ruby 1.9.2-p136 und alle vorherigen Versionen
* Entwicklerversionen von Ruby 1.9 (1.9.3-dev)

### Lösungen

Wir haben das Problem bereits gelöst; alle betroffenen Nutzer sollten
ihre Ruby-Installation aktualisieren.

Nimm aber bitte zur Kenntnis, dass Symlink-Race-Attacks unvermeidbar
sind, wenn eines der Elternverzeichnisse des Verzeichnisses, aus dem du
löschen willst, jemand Unglaubwürdigem gehört. Um wirklich sicher zu
sein, musst du sicherstellen, dass **alle** Elternverzeichnisse nicht
von unglaubwürdigen Benutzern verschoben werden können. So sollten etwa
Elternverzeichnisse nicht von unglaubwürdigen Nutzern besessen werden
und sollten nicht für alle schreibbar sein (außer wenn das Sticky-Bit
gesetzt ist).

### Updates

* 1\.8.7-p334 wurde zur Lösung des Problems veröffentlicht. Nutzern von
  1.8.7 wird empfohlen, zu aktualisieren.
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2][1]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz][2]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip][3]

* 1\.9.1-p431 wurde zur Lösung des Problems veröffentlicht. Nutzern von
  1.9.1 wird empfohlen, zu aktualisieren.
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2][4]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz][5]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip][6]

* 1\.9.2-p180 wurde zur Lösung des Problems veröffentlicht. Nutzern von
  1.9.2 wird empfohlen, zu aktualisieren.
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2][7]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz][8]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip][9]

* Alle betroffenen 1.9er-Versionen gefixt.



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2
[8]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip
