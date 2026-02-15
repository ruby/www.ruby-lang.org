---
layout: news_post
title: "Ruby 1.9.2 RC1 veröffentlicht"
author: "Quintus"
lang: de
---

Ruby 1.9.2 RC1 ist gerade veröffentlicht worden. Es handelt sich hierbei
um einen Release Candidate von Ruby 1.9.2.

Ruby 1.9.2 wird größtenteils mit 1.9.1 kompatibel sein, abgesehen von
den folgenden Änderungen:

* Diverse neue Methoden
* Neues `Socket`-API (IPv6-fähig)
* Neue Zeichenkodierungen
* Eine `Random`-Klasse, die viele verschiedene
  Zufallszahlengeneratoren unterstützt
* `Time` wurde neu implementiert. Es gibt kein Jahr-2038-Problem
  mehr.
* Einige Verbesserungen bei Regulären Ausdrücken
* `$:` enthält das aktuelle Verzeichnis (\".\") nicht mehr
* dl ist neu implementiert worden; es setzt nun auf libffi auf.
* Eine neue Library namens \"psych\" wrappt libyaml. Du kannst diese
  Library anstatt von syck verwenden.

Siehe die [NEWS][1] und das [ChangeLog][2] für weitere Informationen.

Etwa 130 Bugs sind seit der Veröffentlichung von Ruby 1.9.2-preview3
gefixt worden. Alle großen und bekannten Bugs außer [#3462][3] wurden
behoben.

Aufgrund unseres Release-Plans wird Ruby 1.9.2 Anfang August
veröffentlicht werden; wir haben unseren ursprünglichen Plan geändert,
damit Ruby 1.9.2 der RubySpec entspricht. Nun schafft es &gt; 99% der
RubySpec. Probiert das neue Ruby aus und meldet Probleme mit Ruby 1.9.2
über unseren [Issue tracker][4].

#### Download

[ruby-1.9.2-rc1.tar.bz2][5]

: **MD5-Summe**

  242dcfaed8359a6918941b55d0806bf0

  **SHA256**

  c2a680aa5472c8d04a71625afa2b0f75c030d3655a3063fe364cfda8b33c1480

  **Größe**

  8\.479.087 Byte

[ruby-1.9.2-rc1.tar.gz][6]

: **MD5-Summe**

  fdedd5b42ae89a9a46797823ad2d9acf

  **SHA256**

  3e90036728342ce8463be00d42d4a36de70dabed96216c5f8a26ec9ba4b29537

  **Größe**

  10\.779.309 Byte

[ruby-1.9.2-rc1.zip][7]

: **MD5-Summe**

  3da59c5d3567f6e1f1697abbef71f507

  **SHA256**

  4f593a3d0873cea8f371a7fc7484cad7bc03acac0ada1970cb9f83a89bc27997

  **Größe**

  12\.158.992 Byte



[1]: https://github.com/ruby/ruby/blob//v1_9_2_rc1/NEWS
[2]: https://github.com/ruby/ruby/blob//v1_9_2_rc1/ChangeLog
[3]: https://bugs.ruby-lang.org/issues/show/3462
[4]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.zip
