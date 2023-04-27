---
layout: news_post
title: "Beberapa kerentanan jQuery pada RDoc"
author: "aycabta"
translator: "meisyal"
date: 2019-08-28 09:00:00 +0000
tags: security
lang: id
---


Ada beberapa kerentanan terkait *Cross-Site Scripting* (XSS) pada jQuery yang
dikirim oleh RDoc yang mana dikemas pada Ruby.
Semua pengguna Ruby disarankan untuk memperbarui Ruby ke rilis terbaru yang
mana berisi perbaikan versi RDoc.

## Detail

Kerentanan berikut ini telah dilaporkan.

* [CVE-2012-6708](https://www.cve.org/CVERecord?id=CVE-2012-6708)
* [CVE-2015-9251](https://www.cve.org/CVERecord?id=CVE-2015-9251)

Semua pengguna Ruby sangat disarankan untuk memperbarui Ruby atau mengambil
salah satu solusi berikut segera mungkin.
Anda juga harus me-*generate* ulang dokumentasi RDoc yang sudah ada sebelumnya
untuk menghilangkan kerentanan secara menyeluruh.

## Versi Terimbas

* Rangkaian Ruby 2.3: semua
* Rangkaian Ruby 2.4: 2.4.6 dan sebelumnya
* Rangkaian Ruby 2.5: 2.5.5 dan sebelumnya
* Rangkaian Ruby 2.6: 2.6.3 dan sebelumnya
* sebelum *commit master* f308ab2131ee675000926540cbb8c13c91dc3be5

## Tindakan yang diperlukan

RDoc adalah sebuah alat untuk menghasilkan dokumentasi statis.
Menge-*patch* RDoc itu sendiri tidak cukup untuk menghilangkan kerentanan.

Sehingga, dokumentasi RDoc yang dihasilkan dengan versi sebelumnya harus
di-*generate* ulang dengan RDoc yang baru.

## Solusi

Pada dasarnya, Anda harus memperbarui Ruby ke versi terbaru.
RDoc 6.1.2 atau setelahnya berisi perbaikan kerentanan, sehingga memperbarui
RDoc ke versi terbaru jika Anda tidak dapat memperbarui Ruby.

Ingat! Seperti yang telah disebutkan sebelumnya, Anda harus me-*generate* ulang
dokumentasi RDoc yang sudah ada.

```
gem install rdoc -f
```

*Update*: versi awal dari berita ini sebagian menyebutkan rdoc-6.1.1.gem, yang
mana masih memiliki kerentanan. Mohon pastikan Anda memasang rdoc-6.1.2 atau
setelahnya.

Berdasarkan versi pengembangan, memperbarui ke HEAD dan *master branch* terbaru.

## Rujukan

Terima kasih kepada [Chris Seaton](https://hackerone.com/chrisseaton) atas
laporan masalah ini.

## Riwayat

* Semula dipublikasikan pada 2019-08-28 09:00:00 UTC
* Versi RDoc diperbaiki pada 2019-08-28 11:50:00 UTC
* Perbaikan kecil bahasa pada 2019-08-28 12:30:00 UTC
