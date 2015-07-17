---
layout: news_post
title: "WEBrick \"Escapesequence Injection\" Schwachstelle"
author: "Daniel Bovensiepen"
lang: de
---

Eine Schwachstelle in WEBrick, ein Bestandteil der Standard Bibliothek
zur Bereitstellung von HTTP Diensten, wurde gefunden. WEBrick ermöglicht
es Angreifern, eine Escapesequenze in die eigene Logdatei umzuleiten.
Sollte diese Logdatei in bestimmten Terminalemulatoren angezeigt werden,
könnte dies zur Ausführung von potentiell schädlichem Code innerhalb
dieses Terminals führen.

Wir haben bereits den Fehler lokalisiert und entfernt. Es ist dringend
empfohlen eine Aktualisierung durchzuführen. Bis zu dessen Einspielung
und dem Neustart des WEBrick Prozesses, sollte darauf verzichten werden,
die Logdateien zu begutachten.

## Detaillierte Beschreibung

Terminal Escapesequenzen stellen unterschiedlichste Möglichkeiten der
Kommunikation zwischen einem Terminal und einem Prozess zur Verfügung.
Diese Sequenzen sind jedoch nicht dafür ausgelegt, von nicht
vertrauenswürdigen Quellen in das Terminal eingespeist zu werden. Würde
ein entfernter Angreifer eine solche Sequenz in die WEBrick Logdatei
schleusen können und ein Anwender diese Logdatei mit seinem Terminal
öffnen, könnten [verschiedene Schwachstellen von bestimmten
Terminalemulatoren][1] ausgenutzt weden.

Und WEBrick konnte diese Escape-Sequenzen bislang nicht ausfiltern.

Beispiel:

    % xterm -e ruby -rwebrick -e 'WEBrick::HTTPServer.new(:Port=>8080).start' &
    % wget http://localhost:8080/%1b%5d%32%3b%6f%77%6e%65%64%07%0a

Bitte den Fenstertitel von xterm beachten.

## Betroffene Versionen

* Ruby 1.8.6 patchlevel 383 und alle vorhergehenden
* Ruby 1.8.7 patchlevel 248 und alle vorhergehenden
* Entwicklerversion von Ruby 1.8 (1.8.8dev)
* Ruby 1.9.1 patchlevel 376 und alle vorhergehenden
* Entwicklerversion von Ruby 1.9 (1.9.2dev)

## Lösung

* 1\.8.7 pl. 249 beseitigt diesen Fehler. Benutzer von 1.8.7 sollten auf
  folgende Version aktualisieren.
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.gz][2]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.bz2][3]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.zip][4]

* 1\.9.1 pl. 378 beseitigt diesen Fehler. Benutzer von 1.9.1 sollten auf
  folgende Version aktualisieren.
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.gz][5]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.bz2][6]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.zip][7]

* Für Entwicklerversionen bitte auf die Letzte Revision im Trunk
  aktualisieren.

## Danke

Danke an Giovanni \"evilaliv3\" Pellerano, Alessandro \"jekil\" Tanasi
und Francesco \"ascii\" Ongaro, welche diese Fehler entdeckt haben.



[1]: http://marc.info/?l=bugtraq&amp;m=104612710031920&amp;w=2 "Terminal Emulator Security Issues"
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.bz2
[4]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.zip
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.bz2
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.zip
