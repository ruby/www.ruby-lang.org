---
layout: news_post
title: "Ruby 2.7.7 Dirilis"
author: "usa"
translator: "meisyal"
date: 2022-11-24 12:00:00 +0000
lang: id
---

Ruby 2.7.7 telah dirilis.

Rilis ini mencakup sebuah perbaikan keamanan.
Mohon cek topik di bawah ini untuk detail.

* [CVE-2021-33621: HTTP response splitting pada CGI]({%link id/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

Rilis ini juga mencakup beberapa perbaikan terkait masalah *build*. Perbaikan
tersebut tidak akan memengaruhi kompatibilitas pada versi sebelumnya.
Lihat [commit logs](https://github.com/ruby/ruby/compare/v2_7_6...v2_7_7)
untuk lebih detail.

## Unduh

{% assign release = site.data.releases | where: "version", "2.7.7" | first %}

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

Banyak *committer*, pengembang, dan pengguna yang telah menyediakan laporan
*bug* membantu kami untuk membuat rilis ini. Terima kasih atas kontribusinya.
