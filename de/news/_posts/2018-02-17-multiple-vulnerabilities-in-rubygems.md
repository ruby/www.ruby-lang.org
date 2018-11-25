---
layout: news_post
title: "Zahlreiche Schwachstellen in RubyGems"
author: "usa"
translator: "Marvin Gülker"
date: 2018-02-17 03:00:00 +0000
tags: security
lang: de
---

In RubyGems ist eine Anzahl von Schwachstellen gefunden worden, wie
auf dem [offiziellen RubyGems-Blog beschrieben wird](http://blog.rubygems.org/2018/02/15/2.7.6-released.html).

## Details

Die folgenden Sicherheitslücken wurden behoben.

* Verhinderung von Pfadverfolgung _(path traversal)_ bei
  Schreibzugriff auf ein per Symlink verlinktes basedir außerhalb des
  Wurzelverzeichnisses.
* Möglicherweise unsichere Objektdeserialisierung in gem owner
  behoben.
* Oktalfelder in Tar-Kopfzeilen werden jetzt streng beachtet.
* Werfe einen Sicherheitsfehler, wenn in einem Paket Dateien mehrfach
  vorkommen.
* Erzwinge URL-Validierung im Homepage-Attribut der Spec
* XSS-Schwachstelle im Homepage-Attribut behoben, wenn es von
  gem server angezeigt wird.
* Verhinderung von Pfadverfolgung während der Gem-Installation.

Es wird nachdrücklich empfohlen, so schnell wie möglich einen der
folgenden Workarounds anzuwenden.

## Betroffene Versionen

* Ruby 2.2er-Serie: 2.2.9 und früher
* Ruby 2.3er-Serie: 2.3.6 und früher
* Ruby 2.4er-Serie: 2.4.3 und früher
* Ruby 2.5er-Serie: 2.5.0 und früher
* Trunk vor Revision 62422

## Workarounds

Die Probleme wurden in RubyGems 2.7.6 behoben, weshalb eine
Aktualisierung von RubyGems auf die neueste Version Abhilfe schafft.

```
gem update --system
```

Wenn Sie RubyGems nicht aktualisieren können, wenden Sie die folgenden
Patches als Workaround an.

* [für Ruby 2.2.9](https://bugs.ruby-lang.org/attachments/download/7030/rubygems-276-for-ruby22.patch)
* [für Ruby 2.3.6](https://bugs.ruby-lang.org/attachments/download/7029/rubygems-276-for-ruby23.patch)
* [für Ruby 2.4.3](https://bugs.ruby-lang.org/attachments/download/7028/rubygems-276-for-ruby24.patch)
* [für Ruby 2.5.0](https://bugs.ruby-lang.org/attachments/download/7027/rubygems-276-for-ruby25.patch)

Trunk-Nutzer aktualisieren auf die neueste Revision.

## Danksagung

Dieser Bericht basiert auf dem [offiziellen RubyGems-Blogpost](http://blog.rubygems.org/2018/02/15/2.7.6-released.html).

## Historie

* Erstmals veröffentlicht: 2018-02-17 03:00:00 UTC
