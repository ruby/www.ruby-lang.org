---
layout: news_post
title: "Ruby Repository Pindah dari Subversion ke Git"
author: "hsbt"
translator: "meisyal"
date: 2019-04-23 00:00:00 +0000
lang: id
---

Hari ini, *repository* resmi dari bahasa pemrograman Ruby pindah dari
Subversion ke Git.

Antarmuka *web* dari *repository* baru adalah
[https://git.ruby-lang.org](https://git.ruby-lang.org), dan ini disediakan
oleh cgit. Kami akan menyimpan *commit hash* dari kontributor pada *repository*
Ruby secara langsung.

## Kebijakan pengembangan

* Kami tidak menggunakan sebuah *branch* topik pada cgit.
* *Repository* GitHub masih menjadi sebuah *mirror*. Kami tidak menggunakan
fitur "Merge pull request".
* *Branch* ruby_2_4, ruby_2_5, dan ruby_2_6 akan terus menggunakan SVN. Kami
tidak *push* apapun ke *branch-branch* tersebut pada cgit.
* Mulai ruby_2_7, kami akan menggunakan cgit untuk mengembangkan
*stable branch*.
* Kami tidak menggunakan *merge commit*.

## Ucapan Terima Kasih

* k0kubun

  k0kubun secara agresif mengembangkan *toolchain* yang berkaitan dengan alur
kerja *release* dan *backport* dan juga memperbarui *hook script* untuk git.

* naruse

  naruse memperbarui perubahan fitur untuk Ruby CI dan Redmine (bugs.ruby-lang.org).

* mame

  mame membuat *script* notifikasi *commit* untuk slack.

## Pekerjaan Berikutnya

Kami masih harus menyelesaikan beberapa tugas. Jika Anda menemukan sebuah
masalah terkait migrasi Git, mohon ajukan ke [https://bugs.ruby-lang.org/issues/14632](https://bugs.ruby-lang.org/issues/14632).

Nikmati!
