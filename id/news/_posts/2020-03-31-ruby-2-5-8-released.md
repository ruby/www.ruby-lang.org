---
layout: news_post
title: "Ruby 2.5.8 Dirilis"
author: "usa"
translator: "meisyal"
date: 2020-03-31 12:00:00 +0000
lang: id
---

Ruby 2.5.8 telah dirilis.

Rilis ini mencakup perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk lebih detail.

* [CVE-2020-10663: Kerentanan Penciptaan Unsafe Object pada JSON (Perbaikan tambahan)]({% link id/news/_posts/2020-03-19-json-dos-cve-2020-10663.md %})
* [CVE-2020-10933: Kerentanan tereksposnya heap pada pustaka socket]({% link id/news/_posts/2020-03-31-heap-exposure-in-socket-cve-2020-10933.md %})

Lihat [commit logs](https://github.com/ruby/ruby/compare/v2_5_7...v2_5_8) untuk detail.

## Unduh

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

## Komentar Rilis

Terima kasih kepada semua yang telah membantu rilis ini, khususnya kepada
pelapor kerentanan.
