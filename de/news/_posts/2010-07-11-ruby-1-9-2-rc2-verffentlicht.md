---
layout: news_post
title: "Ruby 1.9.2 RC2 veröffentlicht"
author: "Quintus"
lang: de
---

Ruby 1.9.2 RC2 ist gerade veröffentlicht worden. Es handelt sich hierbei
um den zweiten Release Candidate von Ruby 1.9.2.

Seit dem letzten Release Candiate wurden die psych-Library korrigiert
und einige kleinere Bugs gefixt.

Siehe die [NEWS][1] und das [ChangeLog][2] für weitere Informationen.

#### Über Ruby 1.9.2

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

Ruby 1.9.2 ist so stabil geworden, wie wir es uns vorgestellt haben.
Aufgrund unseres Release-Plans wird Ruby 1.9.2 Anfang August
veröffentlicht werden; wir haben unseren ursprünglichen Plan geändert,
damit Ruby 1.9.2 der RubySpec entspricht. Nun schafft es &gt; 99% der
RubySpec. Probiert das neue Ruby aus und meldet Probleme mit Ruby 1.9.2
über unseren [Issue tracker][3].

#### Download

[ruby-1.9.2-rc2.tar.bz2][4]

: **MD5-Summe**

  4e4906d0aab711286b31f5a834860cc3

  **SHA256**

  692ebae991b104482dc9f0d220c1afb6b690a338b3b815aaa4f62954d2fa1b4a

  **Größe**

  8\.480.974 Byte

[ruby-1.9.2-rc2.tar.gz][5]

: **MD5-Summe**

  d12cd39eee4d99bc54b52aba5a0ba4e1

  **SHA256**

  5d523d99f928705ac1de84ade03283c468415c00f8b6755a8dd7a140828869b4

  **Größe**

  10\.781.884 Byte

[ruby-1.9.2-rc2.zip][6]

: **MD5-Summe**

  05229b43981e4e5ce58b5fb2e98eee52

  **SHA256**

  33f7f4cdd8444c2594728f70ac07477575a7cba5e7756bd3645f23e52605618c

  **Größe**

  12\.161.233 Byte



[1]: https://github.com/ruby/ruby/blob//v1_9_2_rc2/NEWS
[2]: https://github.com/ruby/ruby/blob//v1_9_2_rc2/ChangeLog
[3]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.zip
