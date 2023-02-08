---
layout: news_post
title: "Ruby 3.0.5 Dirilis"
author: "usa"
translator: "meisyal"
date: 2022-11-24 12:00:00 +0000
lang: id
---

Ruby 3.0.5 telah dirilis.

Rilis ini mencakup sebuah perbaikan keamanan.
Mohon cek topik di bawah ini untuk detail.

* [CVE-2021-33621: HTTP response splitting pada CGI]({%link id/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

Rilis ini juga mencakup beberapa perbaikan *bug*.
Lihat [commit logs](https://github.com/ruby/ruby/compare/v3_0_4...v3_0_5) untuk
lebih detail.

## Unduh

{% assign release = site.data.releases | where: "version", "3.0.5" | first %}

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

Perawatan dari Ruby 3.0, termasuk rilis ini, didasarkan pada
"Agreement for the Ruby stable version" dari Ruby Association.
