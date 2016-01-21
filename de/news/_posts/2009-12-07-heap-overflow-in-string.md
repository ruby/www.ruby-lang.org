---
layout: news_post
title: "Heap overflow in String (CVE-2009-4124)"
author: "Quintus"
lang: de
---

Es gibt eine Sicherheitslücke in den Methoden *String#rjust*,
*String#ljust* und *String#center*, welche einen Heap overflow auslösen
kann. Dies ermöglichte in seltenen Fällen beliebigen Code auszuführen.

* [CVE-2009-4124][1]

#### Betroffene Versionen

Alle bisherigen Versionen der 1.9er-Reihe.

Die 1.8er-Serie ist nicht betroffen.

#### Lösung

Ein Update auf [1.9.1-p376][2] durchführen.

#### Dank an

* Emmanouel Kellinis, KPMG London, für das Finden des Problems.

## Änderungen

* 2009-12-07 14:52 +0900 Ergänze Link zu CVE



[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-4124
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2
