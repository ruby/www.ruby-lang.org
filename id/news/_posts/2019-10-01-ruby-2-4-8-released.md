---
layout: news_post
title: "Ruby 2.4.8 Telah Dirilis"
author: "usa"
translator: "meisyal"
date: 2019-10-01 11:00:00 +0000
lang: id
---

Ruby 2.4.8 telah dirilis.

Rilis ini mencakup perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk lebih detail.

* [CVE-2019-16255: Sebuah kerentanan injeksi kode dari Shell#[] dan Shell#test]({% link id/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254: Pemisahan respons HTTP pada WEBrick (Perbaikan tambahan)]({% link id/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845: Sebuah kerentanan injeksi NUL dari File.fnmatch dan File.fnmatch?]({% link id/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201: Kerentanan Regular Expression Denial of Service dari WEBrick's Digest access authentication]({% link id/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

Ruby 2.4 saat ini berada pada fase pemeliharaan keamanan hingga akhir bulan
Maret 2020. Setelah bulan tersebut, pemeliharaan Ruby 2.4 akan berakhir. Kami
merekomendasikan Anda untuk mulai merencanakan migrasi ke versi Ruby paling
terbaru, seperti 2.6 atau 2.5.

__Update (2 Oktober 4:00 UTC):__ Kami sedang memperbaiki masalah *tarball*
dari rilis Ruby 2.4.8 yang tidak terpasang menggunakan _non-root_ *user*.
Ikuti [[Bug #16197]](https://bugs.ruby-lang.org/issues/16197) untuk detailnya.

## Unduh

{% assign release = site.data.releases | where: "version", "2.4.8" | first %}

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
