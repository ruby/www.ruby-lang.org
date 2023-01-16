---
layout: news_post
title: "Ruby 2.0.0-rc2 veröffentlicht"
author: "Quintus"
date: 2013-02-08 20:27:03 +0000
lang: de
---

Der zweite Release Candidate von Ruby 2 ist veröffentlicht worden. Dies
ist der letzte Release Candidate vor Ruby 2 und wir bitten darum, alle
Probleme, die möglicherweise auftreten, zu melden.

### Neue Features in Ruby 2

* Benannte Argumente
* [Enumerable#lazy][1]
* [Module#prepend][2]
* \#to\_h: Konvention zur Konvertierung in ein Hash
* `%i` Literal zur Erstellung eines Arrays von Symbolen
* Aktualisierte Engine für reguläre Ausdrücke: Onigmo (ein Fork von
  Oniguruma)
* [Enumerator#size][3] und [Range#size][4]
* DTrace-Support
* TracePoint
* Optimierte Performance für `require` (insbesondere auf Windows)
* Support für NativeClient
* Verbesserung der Dokumentation
* Erweitertes asynchrones Interrupt-Handling
* Startzeit-Parameter zum Tuning der Stackgröße
* Refinements \[*experimentell*\]

...und viel mehr. Siehe [NEWS][5] für Details.

Hier noch einige Artikel Dritter zum Thema:

* [Ruby 2.0 on Rails][6]
* [Preview of the new features in Ruby 2.0.0][7]
* [Ruby 2.0 Preview 1 Released, Final Release in February 2013][8]
* [Refinements in Ruby][9]
* [Ruby 2.0初のプレビュー版がリリース！ 注目機能は!?][10] (japanisch)
* [怠惰なRubyistへの道 – Enumerator::Lazy の使いかた][11] (Enumerator::Lazy,
  japanisch)

(Wenn Sie freiwillig Artikel schreiben möchten, können wir diese in der
nächsten Ankündigung zitieren oder referenzieren)

### Weiteres

#### Inkompatibilitäten

Es gibt drei größere uns bekannte Inkompatibilitäten:

* Das Standardencoding für Ruby-Skripte ist nun UTF-8 [\[#6679\]][12].
  Einige Leute berichten, dass dies existierende Programme betrifft,
  beispielsweise werden einige Benchmark-Programme sehr langsam
  [\[ruby-dev:46547\]][13]. Die Spec hierzu kann sich zum offiziellen
  Release noch ändern.
* **iconv** wurde entfernt. Es war bereits in Ruby 1.9 bei der
  Einführung von M17n als *deprecated* markiert worden und ist damit
  durch String#encode obsolet. Nutzen Sie dieses stattdessen.
* Es gibt binäre Inkompatibilitäten (*ABI breakage*,
  [\[ruby-core:489894\]][14]. Wir denken, dass normale Nutzer einfach
  ihre Extension-Libraries neu installieren können/sollten. SIE DÜRFEN
  KEINE `.so`- ODER `.bundle`-DATEIEN VON RUBY 1.9 KOPIEREN.

Daneben gibt es noch einige kleinere Inkompatibilitäten
[\[ruby-core:49119\]][15]. Melden Sie alle weiteren Inkompatibilitäten,
die Ihnen auffallen.

FYI: Wir arbeiten an Upgrade-Hinweisen, aber einige Teile sind bereits
veraltet:
[https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft][16]

#### Zum Status von Refinements

2\.0.0 wird Refinements als **experimentelles Feature** enthalten, weil
wir uns nicht auf eine detaillierte Spec einigen konnten. Das bedeutet,
dass sich ihr Verhalten in zukünftigen Versionen von Ruby ändern kann.

#### Spezielle Danksagungen

Ich danke allen, die die Preview und ersten Release Candidate
ausprobiert haben. Darüber hinaus bin all den hart arbeitenden
Contributors meinen Dank schuldig. Ich bin wirklich all den Leuten, die
mir bei dieser Veröffentlichung geholfen haben, sehr dankbar.

### Download

[ruby-2.0.0-rc2.tar.bz2][17]

: **MD5-Summe**

  e92420131bd7994513e0bf09a3e2a19b

  **SHA256**

  d55f897bb04283c5fa80223d96d990fe8ecb598508dd59443b356cbba1f66145

  **Größe**

  10\.822.239 Byte

[ruby-2.0.0-rc2.tar.gz][18]

: **MD5-Summe**

  9d5e6f26db7c8c3ddefc81fdb19bd41a

  **SHA256**

  87072ab3e6d393d47f7402682364e4f24efe1c518969795cc01fcdeeb0e646f3

  **Größe**

  13\.616.756 Byte

[ruby-2.0.0-rc2.zip][19]

: **MD5-Summe**

  1a2d33f1c50e32ca1532f8dea4790d53

  **SHA256**

  c28e9baf3aa00b41b8823c16df436ae143e8a63e43e7a53302f23119e13d0ebf

  **Größe**

  15\.118.480 Byte



[1]: http://www.ruby-doc.org/core-2.0/Enumerable.html#method-i-lazy
[2]: http://www.ruby-doc.org/core-2.0/Module.html#method-i-prepend
[3]: http://www.ruby-doc.org/core-2.0/Enumerator.html#method-i-size
[4]: http://www.ruby-doc.org/core-2.0/Range.html#method-i-size
[5]: https://svn.ruby-lang.org/cgi-bin/viewvc.cgi/tags/v2_0_0_rc2/NEWS?view=markup
[6]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[7]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[8]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[9]: http://timelessrepo.com/refinements-in-ruby
[10]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[11]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[12]: https://bugs.ruby-lang.org/issues/6679
[13]: https://blade.ruby-lang.org/ruby-dev/46547
[14]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/48984
[15]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/49119
[16]: https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft
[17]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2
[18]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz
[19]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip
