---
layout: news_post
title: "Ruby 3.0.6 Dirilis"
author: "usa"
translator: "meisyal"
date: 2023-03-30 12:00:00 +0000
lang: id
---

Ruby 3.0.6 telah dirilis.

Rilis ini mencakup perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk detail.

* [CVE-2023-28755: Kerentanan ReDoS pada URI]({%link id/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: Kerentanan ReDoS pada Time]({%link id/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

Rilis ini juga mencakup beberapa perbaikan *bug*.
Lihat [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_0_6) untuk
lebih detail.

Setelah rilis ini, kami akan mengakhiri fase perawatan normal dari Ruby 3.0 dan
Ruby 3.0 akan memasuki fase perawatan keamanan.
Ini artinya kami tidak akan melakukan *backport* perbaikan *bug* apa pun, kecuali
perbaikan keamanan.

Ketentuan dari fase perawatan keamanan dijadwalkan selama satu tahun.
Ruby 3.0 akan mencapai EOL dan dukungan resmi berakhir pada akhir dari fase
perawatan keamanan.
Oleh sebab itu, kami merekomendasikan Anda untuk mulai memperbarui Ruby ke
3.1 atau 3.2.

## Unduh

{% assign release = site.data.releases | where: "version", "3.0.6" | first %}

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

Perawatan Ruby 3.0, termasuk rilis ini, didasarkan pada
"Agreement for the Ruby stable version" dari Ruby Association.
