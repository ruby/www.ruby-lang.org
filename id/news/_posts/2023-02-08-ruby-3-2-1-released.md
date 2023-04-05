---
layout: news_post
title: "Ruby 3.2.1 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2023-02-08 12:00:00 +0000
lang: id
---

Ruby 3.2.1 telah dirilis.

Ini adalah versi rilis TEENY pertama dari rangkaian Ruby yang *stable*.

Lihat [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_2_1) untuk
lebih detail.

## Unduh

{% assign release = site.data.releases | where: "version", "3.2.1" | first %}

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

## Komentar Rilis

Banyak *committer*, pengembang, dan pengguna yang telah menyediakan laporan
*bug* membantu kami untuk membuat rilis ini. Terima kasih atas kontribusinya.
