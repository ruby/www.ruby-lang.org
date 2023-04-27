---
layout: news_post
title: "CVE-2021-31810: Kerentanan respons FTP PASV yang dipercaya pada Net::FTP"
author: "shugo"
translator: "meisyal"
date: 2021-07-07 09:00:00 +0000
tags: security
lang: id
---

Sebuah kerentanan respons FTP PASV yang dipercaya telah ditemukan pada Net::FTP.
Kerentanan ini telah ditetapkan dengan penanda CVE
[CVE-2021-31810](https://www.cve.org/CVERecord?id=CVE-2021-31810).
Kami sangat merekomendasikan Anda untuk memperbarui Ruby.

net-ftp adalah sebuah *default gem* pada Ruby 3.0.1, tetapi *gem* tersebut
memiliki masalah pengemasan. Sehingga, mohon perbarui Ruby.

## Detail

Sebuah FTP *server* yang berbahaya dapat menggunakan respons PASV untuk
mengelabui Net::FTP dengan menghubungkan kembali ke sebuah alamat IP dan *port*
yang diberikan. Ini berpotensi membuat Net::FTP menguraikan informasi *service*
yang seharusnya privat dan tidak boleh terbuka (contohnya, penyerang melakukan
*port scan* dan *service banner extraction*).

## Versi Terimbas

* Rangkaian Ruby 2.6: 2.6.7 dan sebelumnya
* Rangkaian Ruby 2.7: 2.7.3 dan sebelumnya
* Rangkaian Ruby 3.0: 3.0.1 dan sebelumnya

## Rujukan

Terima kasih kepada [Alexandr Savca](https://hackerone.com/chinarulezzz) yang
telah melaporkan kerentanan ini.

## Riwayat

* Semula dipublikasikan pada 2021-07-07 09:00:00 UTC
