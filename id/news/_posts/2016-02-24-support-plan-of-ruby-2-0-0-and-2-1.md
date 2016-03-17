---
layout: news_post
title: "Rencana Dukungan untuk Ruby 2.0.0 dan Ruby 2.1"
author: "usa"
translator: "meisyal"
date: 2016-02-24 09:00:00 +0000
lang: id
---

Kami mengumumkan rencana dukungan untuk Ruby 2.0.0 dan Ruby 2.1.

## Tentang Ruby 2.0.0

Seperti yang telah diumumkan sebelumnya, semua dukungan untuk Ruby 2.0.0 telah berakhir hari ini.
*Bug* dan perbaikan keamanan dari versi Ruby terakhir tidak akan lagi
di-*backport* ke 2.0.0, dan tidak ada *patch* 2.0.0 yang akan dirilis.

Kami sangat merekomendasikan Anda untuk memperbarui ke Ruby 2.3 atau 2.2 segera mungkin.

Mohon hubungi kami lewat ruby-core ML jika Anda ingin melanjutkan perawatan
*branch* 2.0.0 karena beberapa alasan yang dapat dibenarkan Anda tidak dapat memperbarui.

## Tentang Ruby 2.1

Kami sedang merencanakan untuk merilis Ruby 2.1.9 pada akhir bulan Maret.
Setelah rilis, kami akan mengakhiri fase perawatan biasa dari 2.1,
dan memulai fase perawatan keamanannya.
Ini berarti setelah rilis 2.1.9 kami tidak akan pernah *backport*
perbaikan *bug* apapun ke 2.1 kecuali perbaikan keamanan.

Kami merekomendasikan Anda untuk mulai merencanakan pembaruan ke Ruby 2.3 atau 2.2.

Ngomong-ngomong, kami juga sedang merencanakan untuk merilis Ruby 2.1.10 setelah
merilis 2.1.9. Rilis ini bukan sebuah perbaikan *bug* atau keamanan.
Kami tidak pernah mengalami versi Ruby dengan dua digit angka.
Sehingga, kami menganggap penting untuk menguji rilis tersebut
tanpa ada perbaikan keamanan yang kritis.

Ruby 2.1.10 tidak akan mencakup perubahan apapun dari 2.1.9,
kecuali untuk nomor versinya.
Anda tidak harus menggunakannya saat produksi, tetapi Anda seharusnya mengujinya sebelum
rilis 2.1.11 yang mungkin akan mencakup perbaikan keamanan.
