---
layout: news_post
title: "Ruby 3.3.7 veröffentlicht"
author: k0kubun
translator: "Daniel Bovensiepen"
date: 2025-01-15 07:51:59 +0000
lang: de
---

Ruby 3.3.7 wurde veröffentlicht.

Dies ist ein Routine-Update, welches Fehlerbehebungen enthält.
Bitte beachten Sie die [Release Notes auf GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_7) für weitere Details.

## Herunterladen

{% assign release = site.data.releases | where: "version", "3.3.7" | first %}

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

Viele Committer, Entwickler und Benutzer, die Fehlerberichte eingereicht haben, haben uns geholfen, diese Version zu erstellen.
Vielen Dank für Ihre Beiträge.
