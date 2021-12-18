---
layout: news_post
title: "Ruby 2.6.8 Dirilis"
author: "usa"
translator: "meisyal"
date: 2021-07-07 09:00:00 +0000
lang: id
---

Ruby 2.6.8 telah dirilis.

Rilis ini memuat perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk lebih detail.

* [CVE-2021-31810: Kerentanan respons FTP PASV yang dipercaya pada Net::FTP]({%link id/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: Kerentanan StartTLS stripping pada Net::IMAP]({%link id/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: Sebuah kerentanan command injection pada RDoc]({%link id/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

Kami biasanya tidak memperbaiki Ruby 2.6, kecuali perbaikan keamanan. Tetapi,
rilis ini memuat beberapa perbaikan *regressed bug* dan *build problem*.
Lihat [commit logs](https://github.com/ruby/ruby/compare/v2_6_7...v2_6_8)
untuk detail.

Ruby 2.6 saat ini berada pada fase perawatan keamanan hingga akhir Maret 2022.
Setelah bulan tersebut, perawatan Ruby 2.6 akan berakhir.
Kami merekomendasikan Anda untuk mulai merencanakan migrasi ke Ruby versi
terbaru, seperti 3.0 atau 2.7.

## Unduh

{% assign release = site.data.releases | where: "version", "2.6.8" | first %}

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
