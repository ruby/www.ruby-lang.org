---
layout: news_post
title: "CVE-2021-32066: Kerentanan StartTLS stripping pada Net::IMAP"
author: "shugo"
translator: "meisyal"
date: 2021-07-07 09:00:00 +0000
tags: security
lang: id
---

Sebuah kerentanan StartTLS *stripping* telah ditemukan pada Net::IMAP.
Kerentanan ini telah ditetapkan dengan penanda CVE
[CVE-2021-32066](https://www.cve.org/CVERecord?id=CVE-2021-32066).
Kami sangat merekomendasikan untuk memperbarui Ruby.

net-imap adalah sebuah *default gem* pada Ruby 3.0.1, tetapi *gem* tersebut
memiliki masalah pengemasan. Sehingga, mohon perbarui Ruby.

## Detail

Net::IMAP tidak akan mengeluarkan sebuah *exception* jika StartTLS gagal
dengan sebuah respons yang tidak dikenal, yang mana mungkin memperbolehkan
penyerang *man-in-the-middle* untuk melewati perlindungan TLS dengan
memanfaatkan posisi jaringan antara *client* dan *registry* untuk mengeblok
perintah StartTLS, alias "StartTLS stripping attack."

## Versi Terimbas

* Rangkaian Ruby 2.6: 2.6.7 dan sebelumnya
* Rangkaian Ruby 2.7: 2.7.3 dan sebelumnya
* Rangkaian Ruby 3.0: 3.0.1 dan sebelumnya

## Rujukan

Terima kasih kepada [Alexandr Savca](https://hackerone.com/sighook) yang
telah melaporkan kerentanan ini.

## Riwayat

* Semula dipublikasikan pada 2021-07-07 09:00:00 UTC
