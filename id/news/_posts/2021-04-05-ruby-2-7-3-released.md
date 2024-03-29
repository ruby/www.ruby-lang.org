---
layout: news_post
title: "Ruby 2.7.3 Dirilis"
author: "nagachika"
translator: "meisyal"
date: 2021-04-05 12:00:00 +0000
lang: id
---

Ruby 2.7.3 telah dirilis.

Rilis ini mencakup perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk lebih detail.

* [CVE-2021-28965: Kerentanan XML round-trip pada REXML]({% link id/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})
* [CVE-2021-28966: Path traversal pada Tempfile di Windows]({% link id/news/_posts/2021-04-05-tempfile-path-traversal-on-windows-cve-2021-28966.md %})

Cek [commit logs](https://github.com/ruby/ruby/compare/v2_7_2...v2_7_3) untuk
detail.

## Unduh

{% assign release = site.data.releases | where: "version", "2.7.3" | first %}

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

Banyak *committer*, pengembang, dan pengguna yang menyediakan laporan *bug*
telah membantu kami membuat rilis ini. Terima kasih atas kontribusinya.
