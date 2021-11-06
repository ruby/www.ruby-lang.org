---
layout: news_post
title: "Ruby 2.6.7 Dirilis"
author: "usa"
translator: "meisyal"
date: 2021-04-05 12:00:00 +0000
lang: id
---

Ruby 2.6.7 telah dirilis.

Rilis ini memuat perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk lebih detail.

* [CVE-2020-25613: Potensi Kerentanan HTTP Request Smuggling pada WEBrick]({%link id/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: Kerentanan XML round-trip pada REXML]({% link id/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

Lihat [commit logs](https://github.com/ruby/ruby/compare/v2_6_6...v2_6_7) untuk
detail.

Dengan rilis ini, kami mengakhiri fase perawatan dari Ruby 2.6 dan Ruby 2.6
masuk ke fase perawatan keamanan.
Ini berarti kami tidak akan melakukan *backport* perbaikan *bug* apapun pada
Ruby 2.6, kecuali perbaikan keamanan.
Masa perawatan keamanan dijadwalkan selama satu tahun.
Ruby 2.6 mencapai EOL dan dukungan resminya berakhir saat fase perawatan
keamanan selesai.
Oleh sebab itu, kami menyarankan Anda untuk merencanakan pembaruan ke
Ruby 2.7 atau 3.0.

## Unduh

{% assign release = site.data.releases | where: "version", "2.6.7" | first %}

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

Perawatan Ruby 2.6, termasuk rilis ini, didasarkan pada "Agreement for the Ruby
stable version" dari Ruby Association.
