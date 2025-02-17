---
layout: news_post
title: "Ruby 3.4.2 veröffentlicht"
author: k0kubun
translator: "Daniel Bovensiepen"
date: 2025-02-14 21:55:17 +0000
lang: de
---

Ruby 3.4.2 wurde veröffentlicht.

Dies ist ein Routine-Update, welches Fehlerbehebungen enthält. Bitte beachten Sie die
[Release Notes auf GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_2) für weitere Details.

## Veröffentlichungsplan

Wir beabsichtigen, eine neue stabile Ruby-Version (derzeit Ruby 3.4) alle 2 Monate zu veröffentlichen.
Ruby 3.4.3 wird im April veröffentlicht, 3.4.4 im Juni, 3.4.5 im August, 3.4.6 im Oktober und 3.4.7 im Dezember.

Wenn es Änderungen gibt, die eine beträchtliche Anzahl von Menschen betreffen, können diese Versionen früher als erwartet veröffentlicht werden.

## Herunterladen

{% assign release = site.data.releases | where: "version", "3.4.2" | first %}

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
