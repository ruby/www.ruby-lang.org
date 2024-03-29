---
layout: news_post
title: "Ruby 2.5.9 Dirilis"
author: "usa"
translator: "meisyal"
date: 2021-04-05 12:00:00 +0000
lang: id
---

Ruby 2.5.9 telah dirilis.

Rilis ini mencakup beberapa perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk lebih detail.

* [CVE-2020-25613: Potensi Kerentanan HTTP Request Smuggling pada WEBrick]({%link id/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: Kerentanan XML round-trip pada REXML]({% link id/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

Lihat [commit logs](https://github.com/ruby/ruby/compare/v2_5_8...v2_5_9) untuk
detail.

Setelah rilis ini, Ruby 2.5 akan EOL. Dengan kata lain, ini adalah rilis
terakhir dari rangkaian Ruby 2.5. Kami tidak akan merilis Ruby 2.5.10 walaupun
celah keamanan ditemukan. Kami merekomendasikan semua pengguna Ruby 2.5 untuk
segera memperbarui ke Ruby 3.0, 2.7, atau 2.6.

## Unduh

{% assign release = site.data.releases | where: "version", "2.5.9" | first %}

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

Terima kasih kepada semua yang telah membantu rilis ini, khususnya, kepada
pelapor kerentanan.
