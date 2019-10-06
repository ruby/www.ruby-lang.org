---
layout: news_post
title: "Ruby 2.5.7 veröffentlicht"
author: "usa"
translator: "Marvin Gülker"
date: 2019-10-01 11:00:00 +0000
lang: de
---

Ruby 2.5.7 ist veröffentlicht worden.

Diese Version behebt mehrere Sicherheitslücken, die nachfolgend
aufgeführt werden. Siehe die verlinkten Artikel für Details.

* [CVE-2019-16255: Einschleusung von Code in Shell#[] und Shell#test möglich]({% link de/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254: HTTP-Antwortveränderung in WEBrick (zusätzliche Fehlerkorrektur)]({% link de/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845: Einfügung von NUL-Zeichen möglich in File.fnmatch und File.fnmatch?]({% link de/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201: Denial-of-Service-Schwachstelle in WEBricks Digest-Authentisierung]({% link de/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

Siehe das [Commit-Log](https://github.com/ruby/ruby/compare/v2_5_6...v2_5_7) für Details.

## Download

{% assign release = site.data.releases | where: "version", "2.5.7" | first %}

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

Dank an alle, die mit dieser Veröffentlichung geholfen haben.

Die Unterstützung von Ruby 2.5, diese Veröffentlichung eingeschlossen,
beruht auf der „Vereinbarung über die stabile Ruby-Version“ der Ruby
Association.
