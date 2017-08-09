---
layout: news_post
title:  "Masalah Layanan ruby-lang.org"
author: "hsbt"
translator: "catcyborg"
date:   2013-08-06 04:00:00 +0000
lang:   id
---

Beberapa layanan yang disediakan ruby-lang.org berhenti,
karena server ruby-lang.org down.

Dampaknya adalah sebagai berikut:

 * Semua mailing list yang disediakan ruby-lang.org down.
 * Paket tar Ruby yang didistribusikan ftp.ruby-lang.org tidak dapat diakses.
 * Jika anda mencari pada cache DNS lama, anda tidak dapat mengakses www.ruby-lang.org.

Kami sedang memperbaiki layanan ini sekarang.

## Update (2013-08-06 9:33 UTC)

Sebab masalah hari ini adalah kegagalan hardware.
Kami memperbaiki masalah-masalah berikut.

 * Semua mailing list kembali, tetapi masih ada beberapa masalah. Kami sedang memperbaikinya.
 * ftp.ruby-lang.org dapat diakses lagi melalui http dan ftp.

Jika anda menemukan masalah lain, harap laporkan ke
https://github.com/ruby/www.ruby-lang.org/issues.

## Update (2013-08-06 13:18 UTC)

Kami memberhentikan ftp.ruby-lang.org melalui http dan ftp, karena beberapa paket Ruby tua rusak. MD5 tidak cocok seperti yang diharapkan.

Kami sedang menginvestigasi hal tersebut sekarang. Informasi rinci terdapat pada issue berikut.
https://github.com/ruby/www.ruby-lang.org/issues/259

## Update (2013-08-07 05:08 UTC)

Kami mengkonfirmasikan paket berikut rusak. Kami mendapatkan beberapa paket melalui http://mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
<pre>
ruby-1.9.3-p426.tar.bz2
ruby-1.9.3-p426.tar.gz
ruby-1.9.3-p426.zip
ruby-1.9.3-p429.tar.bz2
ruby-1.9.3-p429.tar.gz
ruby-1.9.3-p429.zip
ruby-2.0.0-p0.tar.bz2
ruby-2.0.0-p0.tar.gz
ruby-2.0.0-p0.zip
ruby-2.0.0-p195.tar.bz2
ruby-2.0.0-p195.tar.gz
ruby-2.0.0-p195.zip
</pre>

Kami telah memeriksa bahwa checksum MD5 file-file tersebut sama dengan pengumuman rilis kami. ftp.ruby-lang.org via http dan ftp dapat diakses sekarang.

## Update (2013-08-09 10:30 UTC)

Beberapa layanan kami telah kembali sekarang, yang tadinya telah berhenti sejak 6 Agustus 2013 karena masalah server yang kami laporkan sebelumnya

  * Mailing list: Kami gantikan software yang menyediakan layanan ini dari FML ke Mailman.
    * Untuk rincian lebih lanjut, harap lihat http://lists.ruby-lang.org
  * Distribusi paket: Anda sekarang dapat mengunduh paket yang kami sediakan dari ftp.ruby-lang.org melalui http dan ftp.
  * Paket snapshot: Kami memulai ulang pembangunan dan pemaketan snapshot setiap hari

Jika anda menemukan masalah apapun pada layanan kami, harap laporkan kepada kami di https://github.com/ruby/www.ruby-lang.org/issues
