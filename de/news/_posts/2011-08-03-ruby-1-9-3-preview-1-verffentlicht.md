---
layout: news_post
title: "Ruby 1.9.3 Preview 1 veröffentlicht"
author: "Quintus"
lang: de
---

Ruby 1.9.3-preview1 ist veröffentlicht worden.

Es handelt sich hierbei um eine erste Vorschau auf die neue Version und
es gibt noch einige kleinere bekannte Probleme, die jedoch im nächsten
Release, Ruby 1.9.3-p0, behoben werden.

Siehe das [ChangeLog][1] und die [NEWS][2] für weitere Informationen.

RubyInside hat eine [Rezension über dieses Release][3] geschrieben.

### Unterschiede zur Vorversion

Vorangegangene Ruby-Versionen sind unter der [GPLv2][4] und der
Ruby-Lizenz veröffentlicht worden, die jetzt aber durch die “2-clause
BSDL” (alias vereinfachte BSD-Lizenz, “Simplified BSD License”) ersetzt
worden sind.

#### Encoding

SJIS ist jetzt ein Alias für Windows-31J anstatt für Shift\_JIS.

#### Standard Library

* io/console: Neue Fähigkeiten für IO-Instanzen
* openssl
* test/unit: Unterstüzt jetzt parallele Tests

#### Weitere Änderungen

`Pathname` und `Date` sind in der aktuellen Vorschau reimplementiert
worden. VM-Locking ist geändert worden.

### Download

[ruby-1.9.3-preview1.tar.bz2][5]

: **MD5-Summe**

  7d93dc773c5824f05c6e6630d8c4bf9b

  **SHA256**

  a15d7924d74a45ffe48d5421c5fc4ff83b7009676054fa5952b890711afef6fc

  **Größe**

  9\.507.455 Byte

[ruby-1.9.3-preview1.tar.gz][6]

: **MD5-Summe**

  0f0220be4cc7c51a82c1bd8f6a0969f3

  **SHA256**

  75c2dd57cabd67d8078a61db4ae86b22dc6f262b84460e5b95a0d8a327b36642

  **Größe**

  12\.186.410 Byte

[ruby-1.9.3-preview1.zip][7]

: **MD5-Summe**

  960e08b2dc866c9987f17d0480de63a1

  **SHA256**

  249483f88156b4ae65cd45742c6f6316660f793b78739657596c63b86f76aaeb

  **Größe**

  13\.696.708 Byte



[1]: https://github.com/ruby/ruby/blob//v1_9_3_preview1/ChangeLog
[2]: https://github.com/ruby/ruby/blob//v1_9_3_preview1/NEWS
[3]: http://www.rubyinside.com/ruby-1-9-3-preview-1-released-5229.html
[4]: http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.zip
