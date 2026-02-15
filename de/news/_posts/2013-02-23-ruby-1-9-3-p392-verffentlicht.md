---
layout: news_post
title: "Ruby 1.9.3-p392 veröffentlicht"
author: "Quintus"
date: 2013-02-23 09:27:32 +0000
lang: de
---

Ruby 1.9.3-p392 ist nun auch noch veröffentlicht worden — wir
entschuldigen uns für diese häufigen Releases, aber hierbei handelt es
sich um wichtige Sicherheitsaktualisierungen.

Hierbei handelt es sich um die neueste stabile Version der 1.9er-Serie.
Sie enthält Sicherheitsfixes für die mit Ruby mitgelieferten JSON- und
REXML-Bibliotheken, nebst einigen kleineren Bugfixes.

* [Denial-of-Service- und Objekterstellungs-Sicherheitslücken in
  JSON][1]
* [Entitätsexpansion-DoS-Schwachstelle in REXML (XML-Bombe,
  CVE-2013-1821)][2]

Siehe die [Tickets][3] und das [Changelog][4] für weitere Informationen.

### Download

[ruby-1.9.3-p392.tar.bz2][5]

: **MD5-Summe**

  a810d64e2255179d2f334eb61fb8519c

  **SHA256**

  5a7334dfdf62966879bf539b8a9f0b889df6f3b3824fb52a9303c3c3d3a58391

  **Größe**

  10\.024.221 Byte

[ruby-1.9.3-p392.tar.gz][6]

: **MD5-Summe**

  f689a7b61379f83cbbed3c7077d83859

  **SHA256**

  8861ddadb2cd30fb30e42122741130d12f6543c3d62d05906cd41076db70975f

  **Größe**

  12\.557.294 Byte

[ruby-1.9.3-p392.zip][7]

: **MD5-Summe**

  212fb3bc41257b41d1f8bfe0725916b7

  **SHA256**

  f200ce4a63ce57bea64028a507350717c2a16bdbba6d9538bc69e9e7c2177c8b

  **Größe**

  13\.863.402 Byte

### Danksagung

Viele Committer, Tester und Nutzer, die Fehler gemeldet haben, halfen uns
sehr bei der Veröffentlichung dieser Version. Vielen Dank an alle eure
Mitarbeit.



[1]: {{ site.url }}/de/news/2013/02/23/denial-of-service-cve-2013-0269/
[2]: {{ site.url }}/de/news/2013/02/23/rexml-bombe/
[3]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[4]: https://github.com/ruby/ruby/blob//v1_9_3_392/ChangeLog
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.zip
