---
layout: news_post
title: "Ruby 1.9.1-p429 veröffentlicht"
author: "Quintus"
lang: de
---

Ruby 1.9.1-p429 ist soeben freigegeben worden. Es handelt sich hierbei
um ein Patchlevel-Release von Ruby 1.9.1, in dem viele Fehler berichtigt
und eine kritische Sicherheitslücke, die es einem Angreifer erlaubte,
beliebigen Code auszuführen, geschlossen wurden.

#### Sicherheitslücke

Es gab eine Sicherheitslücke, die zu einem Buffer-Overflow führte, wenn
man `ARGF.inplace_mode` auf Windows gefährliche Werte zuwies.
Sie erlaubte einem Angreifer, beliebigen Code auszuführen. Die
betroffenen Versionen sind:

* Ruby 1.9.1-p378 und alle früheren Versionen.
* Ruby 1.9.2-preview3 und alle früheren Versionen.
* Entwicklungsversionen von Ruby 1.9 (1.9.3-dev)

Ich empfehle euch, euer Ruby 1.9 auf 1.9.1-p249 oder 1.9.2-rc1 zu
updaten.

Die 1.8er-Serie von Ruby ist nicht direkt betroffen.

##### Dank

Die Sicherheitslücke wurde von Masaya TARUI gefunden und gemeldet.

#### Download

[ruby-1.9.1-p429.tar.bz2][1]

: **MD5-Summe**

  09df32ae51b6337f7a2e3b1909b26213

  **SHA256**

  e0b9471d77354628a8041068f45734eb2d99f5b5df08fe5a76d785d989a47bfb

  **Größe**

  7\.300.923 Byte

[ruby-1.9.1-p429.tar.gz][2]

: **MD5-Summe**

  0f6d7630f26042e00bc59875755cf879

  **SHA256**

  fdd97f52873b70f378ac73c76a1b2778e210582ce5fe1e1c241c37bd906b43b2

  **Größe**

  9\.078.126 Byte

[ruby-1.9.1-p429.zip][3]

: **MD5-Summe**

  fcd031414e5e4534f97aa195bb586d6c

  **SHA256**

  c9fe2364b477ad004030f4feeb89aeaa2a01675ff95db1bed31a932806f85680

  **Größe**

  10\.347.659 Byte



[1]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.zip
