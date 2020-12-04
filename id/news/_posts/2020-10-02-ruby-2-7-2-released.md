---
layout: news_post
title: "Ruby 2.7.2 Dirilis"
author: "nagachika"
translator: "meisyal"
date: 2020-10-02 11:00:00 +0000
lang: id
---

Ruby 2.7.2 telah dirilis.

Rilis ini berisi *intentional incompatibility*. Peringatan *deprecation*
dinonaktifkan secara *default* pada 2.7.2 and versi selanjutnya. Anda dapat
mengaktifkan peringatan *deprecation* dengan menambahkan opsi -w atau
-W:deprecated pada *command-line*. Mohon cek topik-topik di bawah ini untuk
lebih detail.

* [Feature #17000 2.7.2 turns off deprecation warnings by default](https://bugs.ruby-lang.org/issues/17000)
* [Feature #16345 Don't emit deprecation warnings by default.](https://bugs.ruby-lang.org/issues/16345)

Rilis ini juga berisi versi baru dari *webrick* dengan sebuah perbaikan
keamanan yang dijelaskan pada artikel berikut.

* [CVE-2020-25613: Potensi Kerentanan HTTP Request Smuggling pada WEBrick](/id/news/2020/09/29/http-request-smuggling-cve-2020-25613/)

## Unduh

{% assign release = site.data.releases | where: "version", "2.7.2" | first %}

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

Terima kasih kepada *committer*, pengembang, dan pengguna yang telah
menyediakan laporan dan kontribusi sehingga memungkinkan rilis ini.
