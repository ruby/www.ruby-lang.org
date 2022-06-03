---
layout: news_post
title: "Ruby 2.7.4 Dirilis"
author: "usa"
translator: "meisyal"
date: 2021-07-07 09:00:00 +0000
lang: id
---

Ruby 2.7.4 telah dirilis.

Rilis ini memuat perbaikan keamanan.
Mohon cek topik-topik di bawah ini untuk lebih detail.

* [CVE-2021-31810: Kerentanan respons FTP PASV yang dipercaya pada Net::FTP]({%link id/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: Kerentanan StartTLS stripping pada Net::IMAP]({%link id/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: Sebuah kerentanan command injection pada RDoc]({%link id/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

Lihat [commit logs](https://github.com/ruby/ruby/compare/v2_7_3...v2_7_4)
untuk detail.

## Unduh

{% assign release = site.data.releases | where: "version", "2.7.4" | first %}

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

Perawatan Ruby 2.7, termasuk rilis ini, didasarkan pada "Agreement for the Ruby
stable version" dari Ruby Association.
