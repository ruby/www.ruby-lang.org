---
layout: news_post
title: "Ruby 3.1.4 Dirilis"
author: "nagachika"
translator: "meisyal"
date: 2023-03-30 12:00:00 +0000
lang: id
---

Ruby 3.1.4 telah dirilis.

Rilis ini mencakup perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk detail.

* [CVE-2023-28755: Kerentanan ReDoS pada URI]({%link id/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: Kerentanan ReDoS pada Time]({%link id/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

Lihat [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_1_4) untuk
lebih detail.

## Unduh

{% assign release = site.data.releases | where: "version", "3.1.4" | first %}

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

Banyak *committer*, pengembang, dan pengguna yang telah menyediakan laporan *bug*
membantu kami untuk membuat rilis ini. Terima kasih atas kontribusinya.
