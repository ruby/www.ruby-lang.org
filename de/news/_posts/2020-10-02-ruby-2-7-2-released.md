---
layout: news_post
title: "Ruby 2.7.2 veröffentlicht"
author: "nagachika"
translator: "Marvin Gülker"
date: 2020-10-02 11:00:00 +0000
lang: de
---

Ruby 2.7.2 ist veröffentlicht worden.

Diese Veröffentlichung enthält eine bewusste Inkompatibilität.
Veraltungswarnungen werden mit 2.7.2 ausgeschaltet. Sie können sie
durch Angabe der Schalter -w oder -W:deprecated auf der Kommandozeile
wieder einschalten. Weitere Informationen unten.

* [Feature #17000 2.7.2 schaltet standardmäßig Veraltungswarnungen aus](https://bugs.ruby-lang.org/issues/17000)
* [Feature #16345 Veraltungswarnungen nicht standardmäßig zeigen.](https://bugs.ruby-lang.org/issues/16345)

Diese Veröffentlichung enthält die neue Version von Webrick, die die
in folgendem Artikel beschriebene Sicherheitslücke behebt.

* [CVE-2020-25613: Sicherheitslücke: Schmuggeln von Requests in WEBrick möglich](/de/news/2020/09/29/http-request-smuggling-cve-2020-25613/)

Siehe die [Commit-Logs](https://github.com/ruby/ruby/compare/v2_7_1...v2_7_2) für weitere Änderungen.

## Download

{% assign release = site.data.releases | where: "version", "2.7.2" | first %}

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

Vielen Dank an die vielen Commiter, Entwickler und fehlermeldenden
Nutzer, deren Beiträge diese Veröffentlichung möglich gemacht haben.
