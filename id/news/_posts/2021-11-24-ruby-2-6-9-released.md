---
layout: news_post
title: "Ruby 2.6.9 Dirilis"
author: "usa"
translator: "meisyal"
date: 2021-11-24 12:00:00 +0000
lang: id
---

Ruby 2.6.9 telah dirilis.

Rilis ini mencakup perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk lebih detail.

* [CVE-2021-41817: Kerentanan Regular Expression Denial of Service dari Date Parsing Method]({%link id/news/_posts/2021-11-15-date-parsing-method-regexp-dos-cve-2021-41817.md %})
* [CVE-2021-41819: Cookie Prefix Spoofing pada CGI::Cookie.parse]({%link id/news/_posts/2021-11-24-cookie-prefix-spoofing-in-cgi-cookie-parse-cve-2021-41819.md %})

Lihat [commit logs](https://github.com/ruby/ruby/compare/v2_6_8...v2_6_9)
untuk detail.

Ruby 2.6 saat ini dalam fase perawatan keamanan hingga akhir Maret 2022.
Setelah bulan tersebut, perawatan Ruby 2.6 akan berakhir.
Kami menyarankan untuk mulai merencanakan migrasi ke versi Ruby terbaru, seperti
3.0 atau 2.7.

## Unduh

{% assign release = site.data.releases | where: "version", "2.6.9" | first %}

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
*bug* membantu kami membuat rilis ini. Terima kasih atas kontribusinya.
