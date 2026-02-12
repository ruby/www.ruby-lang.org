---
layout: news_post
title: "Ruby 1.9.2 veröffentlicht"
author: "Quintus"
lang: de
---

Ruby 1.9.2 ist veröffentlicht worden. Dies ist das neueste Release der
1.9er-Serie.

### Über Ruby 1.9.2

Ruby 1.9.2 wird größtenteils mit 1.9.1 kompatibel sein, abgesehen von
den folgenden Änderungen:

* Diverse neue Methoden
* Neues `Socket`-API (IPv6-fähig)
* Neue Zeichenkodierungen
* Eine `Random`-Klasse, die viele verschiedene Zufallszahlengeneratoren
  unterstützt
* `Time` wurde neu implementiert. Es gibt kein Jahr-2038-Problem mehr.
* Einige Verbesserungen bei Regulären Ausdrücken
* `$:` enthält das aktuelle Verzeichnis (“.”) nicht mehr
* dl ist neu implementiert worden; es setzt nun auf libffi auf.
* Eine neue Library namens “psych” wrappt libyaml. Du kannst diese
  Library anstatt von syck verwenden.

Siehe die [NEWS][1] und das [ChangeLog][2] für mehr Informationen.

Ruby 1.9.2 schafft mehr als 99% der [RubySpec][3].

### Unterstützte Plattformen

Ruby 1.9 kennt 4 Support-Stufen:

#### Supported

Wir haben geprüft, dass Ruby 1.9.2 perfekt damit läuft. Und wir werden
1.9.2 weiterhin dort unterstützen.

* Debian GNU/Linux 5.0 auf IA32.

#### Größte Anstrengungen

Wir haben sichergestellt, dass Ruby 1.9.2 mit den meisten von diesen
problemlos läuft. Und ich glaube, dass wir 1.9.2 dort weiterhin
unterstützen können.

* mswin32, x64-mswin64, mingw32
* MacOS X 10.5 (Intel) und 10.6
* FreeBSD 6 und neuer (amd64, IA32)
* Solaris 10
* Symbian OS

#### Vielleicht

Ich glaube, dass Ruby 1.9.2 dort mit kleineren Modifikationen gut läuft,
trotzdem gilt es nicht als sichergestellt. Patches sind willkommen.

* Andere Linux-Disktributionen
* Andere Versionen von MacOS X.
* cygwin
* AIX 5
* Andere POSIX-kompatible Systeme
* BeOS (Haiku)

#### Nicht unterstützt

Auf diesen läuft Ruby meines Wissens nach nicht. Portierungen sind
jedoch gern gesehen.

* Jedes andere System

### FAQ

#### Die Standard Library ist nach `/usr/local/lib/ruby/1.9.1` installiert?

Diese Versionsnummer bezeichnet die “Library-Kompatibilitäts-Version”.
Ruby 1.9.2 ist größtenteils mit 1.9.1 kompatibel, daher befindet sich
die Library in diesem Verzeichnis.

#### Es gibt mir einen `LoadError`!

`$:` beinhaltet das aktuelle Verzeichnis (“.”) nicht mehr, weswegen
einige Skripte nachgebessert werden müssen. Wie auch immer, dein Skripte
sollte ohnehin so wenig wie möglich vom aktuellen Verzeichnis abhängig
sein.

### Download

[ruby-1.9.2-p0.tar.bz2][4]

: **MD5-Summe**

  d8a02cadf57d2571cd4250e248ea7e4b

  **SHA256**

  e9710990ed8c2e794123aba509010471915fb13c27dae0118831d2001a9c8d3b

  **Größe**

  8\.495.472 Byte

[ruby-1.9.2-p0.tar.gz][5]

: **MD5-Summe**

  755aba44607c580fddc25e7c89260460

  **SHA256**

  8c0c4e261a921b5c406bf9e76ac23bf3c915651534e9d1b9e8c5d0bee4a7285c

  **Größe**

  10\.787.899 Byte

[ruby-1.9.2-p0.zip][6]

: **MD5-Summe**

  e57a393ccd62ddece4c63bd549d8cf7f

  **SHA256**

  e61521af06da71fde9f0c7c08baaf7415614d00c86ec5a7ab08b60a4f3185b2a

  **Größe**

  12\.159.728 Byte



[1]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_2_0
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_0
[3]: https://github.com/ruby/spec
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip
