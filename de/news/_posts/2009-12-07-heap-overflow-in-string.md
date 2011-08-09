---
layout: news_post
title: "Heap overflow in String"
lang: de
---

Es gibt eine Sicherheitslücke in den Methoden *String#rjust*,
*String#ljust* und *String#center*, welche einen Heap overflow auslösen
kann. Dies ermöglichte in seltenen Fällen beliebigen Code auszuführen.

#### Betroffene Versionen

Alle bisherigen Versionen der 1.9er-Reihe.

Die 1.8er-Serie ist nicht betroffen.

#### Lösung

Ein Update auf [1.9.1-p376][1] durchführen.

#### Dank an

* Emmanouel Kellinis, KPMG London, für das Finden des Problems.



[1]: ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2 
