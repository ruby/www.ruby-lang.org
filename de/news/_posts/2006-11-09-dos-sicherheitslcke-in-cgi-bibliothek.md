---
layout: news_post
title: "DoS Sicherheitslücke in CGI Bibliothek (CVE-2006-5467)"
author: "Daniel Bovensiepen"
lang: de
---

Es wurde eine Sicherheitslücke in der CGI Bibliothek (cgi.rb) gefunden
welche direkt mit Ruby zusammen ausgeliefert wird. Diese kann von
böswilligen Benutzern dazu verwendet werden, einen [Denial of Services
Angriff (DoS)][1] durchzuführen. Das Problem wird dadurch hervorgerufen,
dass eine HTTP Anfrage, welche eine Multipart MIME Kodierung verwendet,
einen ungültigen Begrenzer enthält. Ein solcher ungültiger Begrenzer
könnte so “-” statt so “--” aussehen. Das Verhalten führt dazu, dass
sämtlicher zur Verfügung stehender Speicher belegt wird. Hierbei handelt
es sich um eine typische DoS Vorraussetzung.

**Ruby 1.8.5 und sämtliche vorherigen Versionen sind von dieser
Sicherheitslücke betroffen.** Die Schwachstelle wurde als
[CVE-2006-5467][2] veröffentlicht.

### Betroffene Versionen

1.8 Reihe
: 1\.8.5 und alle vorherigen

Entwicklerversion (1.9 Reihe)
: Alle Versionen vor dem 23.09.2006

### Lösung

1.8 Reihe
: Verwende bitte den folgenden Patch nachdem du auf die Version 1.8.5
  gewechselt hast:

  * [CGI DoS Patch][3] (367 bytes; md5sum:
    9d25f59d1c33a0b215f6c25260dcb536)

  Bitte bedenke, dass eventuell dein Paketmanager bereits einen
  dementsprechenden Patch eingespielt hat.

Entwicklerversion (1.9 Reihe)
: Bitte benutze eine Version ab dem 23. September 2006.

### Referenzen

* [ \[SEC\] Mongrel Temporary Fix For cgi.rb 99% CPU DoS Attack][4]



[1]: http://de.wikipedia.org/wiki/Denial_of_Service
[2]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-5467
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-cgi-dos-1.patch
[4]: http://rubyforge.org/pipermail/mongrel-users/2006-October/001946.html
