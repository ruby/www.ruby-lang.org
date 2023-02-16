---
layout: news_post
title: "Ruby 3.1.3 Dirilis"
author: "nagachika"
translator: "meisyal"
date: 2022-11-24 12:00:00 +0000
lang: id
---

Ruby 3.1.3 telah dirilis.

Rilis ini mencakup sebuah perbaikan keamanan.
Mohon cek topik di bawah ini untuk detail.

* [CVE-2021-33621: HTTP response splitting pada CGI]({%link id/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

Rilis ini juga mencakup perbaikan kegagalan *build* pada Xcode 14 dan
macOS 13 (Ventura). Lihat [tiket terkait](https://bugs.ruby-lang.org/issues/18912)
untuk lebih detail.

Lihat [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_1_3)
untuk detail lanjut.

## Unduh

{% assign release = site.data.releases | where: "version", "3.1.3" | first %}

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
