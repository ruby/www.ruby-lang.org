---
layout: news_post
title: "Ruby 2.4.9 Telah Dirilis"
author: "usa"
translator: "meisyal"
date: 2019-10-02 09:00:00 +0000
lang: id
---

Ruby 2.4.9 telah dirilis.

Rilis ini adalah *re-package* dari versi 2.4.8 karena *tarball* dari rilis
Ruby 2.4.8 sebelumnya tidak mau terpasang.
(Lihat [[Bug #16197]](https://bugs.ruby-lang.org/issues/16197) untuk detail.)
Tidak ada perubahan penting kecuali nomor versi antara 2.4.8 dan 2.4.9.

Ruby 2.4 saat ini berada pada fase pemeliharaan keamanan hingga akhir bulan
Maret 2020. Setelah bulan tersebut, pemeliharaan Ruby 2.4 akan berakhir.
Kami menyarankan Anda untuk mulai merencanakan migrasi ke versi Ruby terbaru,
seperti 2.6 atau 2.5.

## Unduh

{% assign release = site.data.releases | where: "version", "2.4.9" | first %}

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

Terima kasih kepada semua yang telah membantu rilis ini.
