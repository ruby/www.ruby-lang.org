---
layout: news_post
title: "Ruby 2.7.6 Dirilis"
author: "usa dan mame"
translator: "meisyal"
date: 2022-04-12 12:00:00 +0000
lang: id
---

Ruby 2.7.6 telah dirilis.

Rilis ini mencakup sebuah perbaikan keamanan.
Mohon cek topik di bawah ini untuk lebih detail.

* [CVE-2022-28739: Buffer overrun pada konversi String-to-Float]({%link id/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

Rilis ini juga mencakup beberapa perbaikan *bug*.
Lihat [commit logs](https://github.com/ruby/ruby/compare/v2_7_5...v2_7_6)
untuk detail.

Setelah rilis ini, kami akan mengakhiri fase perawatan dari Ruby 2.7 dan
Ruby 2.7 akan memasuki fase perawatan keamanan.
Hal ini berarti kami tidak akan melakukan *backport* perbaikan *bug* apapun ke
Ruby 2.7, kecuali perbaikan keamanan.

Masa perawatan keamanan dijadwalkan selama satu tahun.
Ruby 2.7 mencapai *EOL* dan dukungan resminya berakhir dengan berakhirnya fase
perawatan keamanan.
Oleh sebab itu, kami merekomendasikan Anda untuk merencanakan pembaruan ke
Ruby 3.0 atau 3.1.

## Unduh

{% assign release = site.data.releases | where: "version", "2.7.6" | first %}

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

Perawatan Ruby 2.7, termasuk rilis ini, didasarkan pada "Agreement for the
Ruby stable version" dari Ruby Association.
