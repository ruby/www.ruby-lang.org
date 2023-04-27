---
layout: news_post
title: "CVE-2021-31799: Sebuah kerentanan command injection pada RDoc"
author: "aycabta"
translator: "meisyal"
date: 2021-05-02 09:00:00 +0000
tags: security
lang: id
---

Ada sebuah kerentanan *Command Injection* pada RDoc yang di-*bundle* dengan
Ruby. Semua pengguna Ruby direkomendasikan untuk memperbarui RDoc ke versi
terbaru untuk memperbaiki kerentanan ini.

## Detail

Berikut adalah kerentanan yang telah dilaporkan.

* [CVE-2021-31799](https://www.cve.org/CVERecord?id=CVE-2021-31799)

RDoc sebelumnya memanggil `Kernel#open` untuk membuat sebuah berkas lokal. Jika
sebuah proyek Ruby memiliki sebuah berkas yang mana nama berkas dimulai dengan
`|` dan diakhiri `tags`, perintah yang mengikuti karater pipa akan dieksekusi.
Sebuah proyek Ruby yang berbahaya bisa saja memanfaatkan ini untuk menjalankan
sebuah perintah yang tidak seharusnya pada seorang pengguna yang mencoba untuk
menjalankan perintah `rdoc`.

Pengguna Ruby yang terimbas dengan kerentanan ini seharusnya memperbarui RDoc
ke versi terbaru.

## Versi Terimbas

* Semua rilis RDoc dari 3.11 sampai 6.3.0

## Cara Memperbarui

Jalankan perintah berikut untuk memperbarui RDoc ke versi terbaru (6.3.1 atau
setelahnya).

```
gem install rdoc
```

Jika Anda menggunakan *bundler*, mohon tambahkan `gem "rdoc", ">= 6.3.1"` pada
`Gemfile` Anda.

## Rujukan

Terima kasih kepada [Alexandr Savca](https://hackerone.com/chinarulezzz) yang
telah melaporkan kerentanan ini.

## Riwayat

* Semula dipublikasikan pada 2021-05-02 09:00:00 UTC
