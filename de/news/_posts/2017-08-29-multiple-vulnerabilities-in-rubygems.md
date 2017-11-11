---
layout: news_post
title: "Mehrere Sicherheitslücken in RubyGems"
author: "usa"
translator: "Marvin Gülker"
date: 2017-08-29 12:00:00 +0000
tags: security
lang: de
---

Es gibt mehrere Sicherheitslücken in dem in Ruby enthaltenen RubyGems,
wie [auf dem offiziellen RubyGems-Blog berichtet wird](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## Details

Die folgenden Sicherheitslücken wurden entdeckt.

* Eine Sicherheitslücke, die die DNS-Auflösung betrifft (_DNS request hijacking_). (CVE-2017-0902)
* Eine Sicherheitslücke bei der Auflösung von ANSI-Escape-Sequenzen. (CVE-2017-0899)
* Eine DoS-Schwachstelle im query-Befehl. (CVE-2017-0900)
* Eine Schwachstelle im Gem-Installer erlaubte einem böswilligen Gem beliebige Dateien zu überschreiben.  (CVE-2017-0901)

Alle Ruby-Nutzer sind aufgerufen, so schnell wie möglich zu
aktualisieren oder einen der folgenden Workarounds anzuwenden.

## Betroffene Versionen

* 2.2er Serie: 2.2.7 und früher
* 2.3er Serie: 2.3.4 und früher
* 2.4er Serie: 2.4.1 und früher
* Trunk vor Revision 59672

## Workarounds

Wenn Sie Ruby selbst nicht aktualisieren können, aktualisieren Sie
RubyGems auf die aktuelle Version. Die Sicherheitslücken wurden in
RubyGems 2.6.13 und später behoben.

```
gem update --system
```

Wenn Sie RubyGems nicht aktualisieren können, können Sie die folgenden
Patches als Workaround anwenden.

* [für Ruby 2.2.7](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [für Ruby 2.3.4](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* für Ruby 2.4.1: benötigt 2 Patches. In folgender Reihenfolge nacheinander anwenden:
  1. [RubyGems 2.6.11 zu 2.6.12](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
  2. [RubyGems 2.6.12 zu 2.6.13](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

Trunk-Nutzer aktualisieren auf die neueste Revision.

## Danksagung

Diese Meldung basiert auf [dem offiziellen RubyGems-Blog](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## Historie

* Erstmals veröffentlicht am 2017-08-29 12:00:00 UTC
* CVE-Nummern hinzugefügt am 2017-08-31 2:00:00 UTC
* Hinweis zur Ruby-Aktualisierung am 2017-09-15 12:00:00 UTC
