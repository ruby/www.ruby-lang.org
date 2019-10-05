---
layout: news_post
title: "Ruby 2.4.8 Released"
author: "usa"
translator: "Marvin Gülker"
date: 2019-10-01 11:00:00 +0000
lang: de
---

Ruby 2.4.8 ist veröffentlicht worden.

Diese Version behebt Sicherheitslücken. Siehe die folgenden Links für
Details.

* [CVE-2019-16255: Einschleusung von Code in Shell#[] und Shell#test möglich]({% link de/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254: HTTP-Antwortveränderung in WEBrick (zusätzliche Fehlerkorrektur)]({% link de/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845: Einfügung von NUL-Zeichen möglich in File.fnmatch und File.fnmatch?]({% link de/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201: Denial-of-Service-Schwachstelle in WEBricks Digest-Authentisierung]({% link de/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

Ruby 2.4 befindet sich noch bis Ende März 2020 in der Phase der
Sicherheitsaktualisierungen. Danach wird die Unterstützung von Ruby
2.4 eingestellt. Wir empfehlen Ihnen, mit der Planung für eine
Aktualisierung auf eine neuere Ruby-Version, etwa 2.6 oder 2.5, zu
beginnen.

__Nachtrag (2. Okt. 4:00 UTC):__ Wir arbeiten an dem Problem, dass der
Ruby 2.4.8er Quell-Tarball nicht für _nicht-root_-Nutzer installierbar
ist. Folgen Sie [[Bug #16197]](https://bugs.ruby-lang.org/issues/16197)
für detaillierte Meldungen.

## Download

{% assign release = site.data.releases | where: "version", "2.4.8" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Veröffentlichungskommentar

Dank an alle, die mit dieser Veröffentlichung geholfen haben,
insbesondere an die Melder der Sicherheitslücken.
