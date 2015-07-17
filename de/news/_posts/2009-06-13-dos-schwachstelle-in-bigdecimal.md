---
layout: news_post
title: "DoS Schwachstelle in BigDecimal"
author: "Daniel Bovensiepen"
lang: de
---

Eine Denial of Service (DoS) Schwachstelle wurde innerhalb der Standard
Bibliothek BigDecimal gefunden. Konvertierungen von BigDecimal Objekten
nach Float konnten zu einem Fehler führen, den ein Angreifer ausnutzen
konnte um \"Segmentation Faults\" zu erzeugen.

Da ActiveRecord eine solche Konvertierung einsetzt, sind die meisten
Rails Anwendungen von diesem Fehler betroffen. Es sei jedoch angemerkt,
dass dies kein Railsspezifischer Fehler ist.

## Auswirkung

Ein Angreifer kann einen Denial of Service Angriff mithilfe von
BigDecimal initiieren, in dem er extrem große Zahlen parst:


    BigDecimal("9E69999999").to_s("F")

## Anfällige Versionen

### 1.8 Serie

* 1\.8.6-p368 und alle frühreren Versionen
* 1\.8.7-p160 und alle frühreren Versionen

### 1.9 Serie

* Alle 1.9.1 Versionen sind nicht von diesem Fehler betroffen

## Lösung

### 1.8 Serie

Bitte aktualisiere Ruby auf die Version 1.8.6-p369 oder ruby-1.8.7-p173.

* [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p369.tar.gz][1]
* [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p173.tar.gz][2]



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p369.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p173.tar.gz
