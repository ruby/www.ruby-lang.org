---
layout: news_post
title: "Sicherheitslücke in Exception#to_s / NameError#to_s (CVE-2012-4464, CVE-2012-4466) ermöglicht Umgehung von $SAFE"
author: "Quintus"
lang: de
---

Es wurden Sicherheitslücken in Exception#to\_s, NameError#to\_s und
`name_err_msg_to_s()` (eine interpreter-interne API) gefunden, mithilfe
derer böswilliger Nutzercode die Sicherheitsprüfung durch `$SAFE`
umgehen kann.

## Details

Der `$SAFE`-Mechanismus von Ruby erlaubt es, nicht vertrauenswürdigen
Nutzercode im Modus `$SAFE >= 4` laufen zu lassen; dabei handelt es sich
um eine Art Sandbox, die verhindert, dass Operationen innerhalb dieses
Modus auf Daten außerhalb der Sandbox zugreifen können.

In diesem Mechanismus wurde eine Sicherheitslücke ausfindig gemacht:
Exception#to\_s, NameError#to\_s und die interpreter-interne API
`name_err_mesg_to_s()` haben die Bits von `$SAFE` nicht korrekt
behandelt, sodass ein String-Objekt, das nicht *tainted* war, durch
ihren Gebrauch destruktiv als *tainted* markiert werden konnte. Dadurch
war es dem nicht vertrauenswürdigem Code in der Sandbox möglich, einen
zuvor *untainted* String destruktiv zu verändern.

Ruby 1.8 hatte vor einiger Zeit [eine ähnliche Sicherheitslücke][1].
Damals wurden Exception#to\_s und NameError#to\_s gefixt, aber
`name_err_mesg_to_str()` wurde übersehen und überlebte den
Sicherheitsfix.

## Betroffene Versionen

* Alle Ruby-1.8.7-Releases vor Patchlevel 371
* Alle Ruby-1.9.3-Releases vor Patchlevel 286
* Alle Entwicklungszweige von Ruby 2 vor Revision r37068

## Lösung

Auf die neueste Version aktualisieren.

## Dank

Die Sicherheitslücke wurde von Tyler Hickes gefunden.

## Updates

* Erstveröffentlichung des [Originalbeitrags][2]\: 2012-10-12 19:17:50
  JST.



[1]: {{ site.url }}/de/news/2011/02/18/exception-methoden-knnen-safe-umgehen/
[2]: {{ site.url }}/en/news/2012/10/12/cve-2012-4464-cve-2012-4466/
