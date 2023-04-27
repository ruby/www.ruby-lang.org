---
layout: news_post
title: "Mehere jQuery-Schwachstellen in RDoc"
author: "aycabta"
translator: "Marvin Gülker"
date: 2019-08-28 09:00:00 +0000
tags: security
lang: de
---

Es wurden mehrere Cross-Site-Scripting-Schwachstellen (XSS) in der mit
RDoc mitgelieferten jQuery-Bibliothek gefunden. RDoc ist Teil von
Ruby. Es wird daher allen Ruby-Nutzern empfohlen, auf die neueste
Ruby-Version zu aktualisieren, in der das Problem mit RDoc behoben
wurde.

## Details

Es wurden die folgenden Schwachstellen gemeldet:

* [CVE-2012-6708](https://www.cve.org/CVERecord?id=CVE-2012-6708)
* [CVE-2015-9251](https://www.cve.org/CVERecord?id=CVE-2015-9251)

Es wird allen Ruby-Nutzern nachdrücklich empfohlen, die Ruby-Version
zu aktualisieren oder wenigstens einen der nachfolgenden Workarounds
anzuwenden. Außerdem müssen bestehende RDoc-Dokumentationen neu
erzeugt werden, um die Schwachstelle zu beheben.

## Betroffene Versionen

* Ruby 2.3er-Serie: alle
* Ruby 2.4er-Serie: 2.4.6 und früher
* Ruby 2.5er-Serie: 2.5.5 und früher
* Ruby 2.6er-Serie: 2.6.3 und früher
* Master vor Revision f308ab2131ee675000926540cbb8c13c91dc3be5

## Notwendige Gegenmaßnahmen

RDoc ist ein Werkzeug zur Generierung statischer Dokumentation. RDoc
selbst zu korrigieren reicht nicht aus, um diese Dokumentationen
abzusichern.

Deshalb müssen RDoc-Dokumentationen, die mit älteren RDoc-Versionen
erzeugt wurden, mit einer neueren RDoc-Version neu erzeugt werden.

## Workarounds

Grundsätzlich sollten Sie Ihre Ruby-Version auf die neueste
aktualisieren. Allerdings beheben RDoc 6.1.2 und neuer die
Schwachstelle, sodass es auch genügt, RDoc auf die neueste Version zu
aktualisieren, wenn Sie Ruby selbst nicht aktualisieren können.

Wie oben ausgeführt ist es aber notwendig, dass Sie bestehende
RDoc-Dokumentationen neu erzeugen.

```
gem install rdoc -f
```

*Nachtrag*: Die erste Version dieses Artikels empfahl teilweise
rdoc-6.1.1.gem, welches die Schwachstelle noch enthielt. Stellen Sie
sich, dass Sie rdoc-6.1.2 oder neuer installieren.

Mit Blick auf die Entwicklerversion wird empfohlen, auf den neuesten
HEAD des Master-Branches zu aktualisieren.

## Danksagung

Dank geht an [Chris Seaton](https://hackerone.com/chrisseaton), der
das Problem gemeldet hat.

## Historie

* Erstveröffentlichung am 2019-08-28 09:00:00 UTC
* RDoc-Version korrigiert am 2019-08-28 11:50:00 UTC
* Kleinere Sprachfehler behoben am 2019-08-28 12:30:00 UTC
