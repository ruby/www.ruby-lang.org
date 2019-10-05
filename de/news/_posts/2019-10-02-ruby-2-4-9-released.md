---
layout: news_post
title: "Ruby 2.4.9 veröffentlicht"
author: "usa"
translator: "Marvin Gülker"
date: 2019-10-02 09:00:00 +0000
lang: de
---

Ruby 2.4.9 ist veröffentlicht worden.

Diese Version ist eine Neupaketierung von 2.4.8, weil der
Quell-Tarball der vorangegangenen Version 2.4.8 nicht
installierte. (Siehe [[Bug
#16197]](https://bugs.ruby-lang.org/issues/16197) für Details.)
Es gibt außer der Versionsnummer keine sichtbaren Änderungen zwischen
2.4.8 und 2.4.9.

Ruby 2.4 befindet sich noch bis Ende März 2020 in der Phase der
Sicherheitsaktualisierungen. Danach wird die Unterstützung von Ruby
2.4 eingestellt. Wir empfehlen Ihnen, mit der Planung für eine
Aktualisierung auf eine neuere Ruby-Version, etwa 2.6 oder 2.5, zu
beginnen.

## Download

{% assign release = site.data.releases | where: "version", "2.4.9" | first %}

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
