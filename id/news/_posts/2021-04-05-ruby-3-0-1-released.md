---
layout: news_post
title: "Ruby 3.0.1 Dirilis"
author: "naruse"
translator: "meisyal"
date: 2021-04-05 12:00:00 +0000
lang: id
---

Ruby 3.0.1 telah dirilis.

Rilis ini memuat perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk lebih detail.

* [CVE-2021-28965: Kerentanan XML round-trip pada REXML]({% link id/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})
* [CVE-2021-28966: Path traversal pada Tempfile di Windows]({% link id/news/_posts/2021-04-05-tempfile-path-traversal-on-windows-cve-2021-28966.md %})

Lihat [commit logs](https://github.com/ruby/ruby/compare/v3_0_0...v3_0_1)
untuk detail.

## Unduh

{% assign release = site.data.releases | where: "version", "3.0.1" | first %}

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

Banyak *committer*, pengembang, dan pengguna yang menyediakan laporan *bug*
telah membantu kami membuat rilis ini. Terima kasih atas kontribusinya.
