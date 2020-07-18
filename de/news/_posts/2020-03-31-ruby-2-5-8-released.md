---
layout: news_post
title: "Ruby 2.5.8 veröffentlicht"
author: "usa"
translator: "Marvin Gülker"
date: 2020-03-31 12:00:00 +0000
lang: de
---

Ruby 2.5.8 ist veröffentlicht worden.

Diese Version behebt einige Sicherheitslücken. Siehe die folgenden Links für Details.

* [CVE-2020-10663: Sicherheitslücke bei der Objekterstellung in JSON (weiterer Fehler behoben)]({% link de/news/_posts/2020-03-19-json-dos-cve-2020-10663.md %})
* [CVE-2020-10933: Heap kann durch Sicherheitslücke in Socket-Bibliothek ausgelesen werden]({% link de/news/_posts/2020-03-31-heap-exposure-in-socket-cve-2020-10933.md %})

Siehe die [Commit-Logs](https://github.com/ruby/ruby/compare/v2_5_7...v2_5_8) für weitere Informationen.

## Download

{% assign release = site.data.releases | where: "version", "2.5.8" | first %}

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

Dank an alle, die mit dieser Veröffentlichung geholfen haben, besonders an die Entdecker der Sicherheitslücken.
