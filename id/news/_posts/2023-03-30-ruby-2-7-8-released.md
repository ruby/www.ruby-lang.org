---
layout: news_post
title: "Ruby 2.7.8 Dirilis"
author: "usa"
translator: "meisyal"
date: 2023-03-30 12:00:00 +0000
lang: id
---

Ruby 2.7.8 telah dirilis.

Rilis ini mencakup perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk detail.

* [CVE-2023-28755: Kerentanan ReDoS pada URI]({%link id/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: Kerentanan ReDoS pada Time]({%link id/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

Rilis ini juga mencakup beberapa perbaikan pada *build*.
Lihat [GitHub releases](https://github.com/ruby/ruby/releases/tag/v2_7_8) untuk
lebih detail.

Setelah rilis ini, Ruby 2.7 akan mencapai EOL. Dengan kata lain, ini akan menjadi
rilis terakhir dari rangkaian Ruby 2.7.
Kami tidak akan merilis Ruby 2.7.9 walaupun ada kerentanan keamanan ditemukan
(tetapi, kami mungkin merilis jika sebuah regresi signifikan ditemukan).
Kami merekomendasikan semua pengguna Ruby 2.7 untuk mulai migrasi ke Ruby 3.2,
3.1, atau 3.0 segera.

## Unduh

{% assign release = site.data.releases | where: "version", "2.7.8" | first %}

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

## Komentar rilis

Banyak *committer*, pengembang, dan pengguna yang telah menyediakan laporan
*bug* membantu kami untuk membuat rilis ini. Terima kasih atas kontribusinya.
