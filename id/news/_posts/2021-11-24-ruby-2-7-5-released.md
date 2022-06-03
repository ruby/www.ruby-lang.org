---
layout: news_post
title: "Ruby 2.7.5 Dirilis"
author: "usa"
translator: "meisyal"
date: 2021-11-24 12:00:00 +0000
lang: id
---

Ruby 2.7.5 telah dirilis.

Rilis ini mencakup perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk lebih detail.

* [CVE-2021-41817: Kerentanan Regular Expression Denial of Service dari Date Parsing Method]({%link id/news/_posts/2021-11-15-date-parsing-method-regexp-dos-cve-2021-41817.md %})
* [CVE-2021-41816: Buffer Overrun pada CGI.escape_html]({%link id/news/_posts/2021-11-24-buffer-overrun-in-cgi-escape_html-cve-2021-41816.md %})
* [CVE-2021-41819: Cookie Prefix Spoofing pada CGI::Cookie.parse]({%link id/news/_posts/2021-11-24-cookie-prefix-spoofing-in-cgi-cookie-parse-cve-2021-41819.md %})

Lihat [commit logs](https://github.com/ruby/ruby/compare/v2_7_4...v2_7_5)
untuk detail.

## Unduh

{% assign release = site.data.releases | where: "version", "2.7.5" | first %}

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
