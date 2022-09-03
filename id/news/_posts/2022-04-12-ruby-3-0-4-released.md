---
layout: news_post
title: "Ruby 3.0.4 Dirilis"
author: "nagachika dan mame"
translator: "meisyal"
date: 2022-04-12 12:00:00 +0000
lang: id
---

Ruby 3.0.4 telah dirilis.

Rilis ini mencakup perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk lebih detail.

* [CVE-2022-28738: Double free pada Regexp compilation]({%link id/news/_posts/2022-04-12-double-free-in-regexp-compilation-cve-2022-28738.md %})
* [CVE-2022-28739: Buffer overrun pada konversi String-to-Float]({%link id/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

Lihat [commit logs](https://github.com/ruby/ruby/compare/v3_0_3...v3_0_4) untuk
detail.

## Unduh

{% assign release = site.data.releases | where: "version", "3.0.4" | first %}

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
*bug* membantu kami membuat rilis ini. Terima kasih atas kontribusinya.
