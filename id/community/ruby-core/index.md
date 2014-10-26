---
layout: page
title: "Ruby Core"
lang: id
---

Sekarang saatnya untuk mengikuti pengembangan Ruby, di saat pengembangan
Ruby terbaru versi 2.0. Dengan semakin banyaknya perhatian masyarakat
informatika terhadap bahasa pemrograman Ruby, semakin dibutuhkan pula
bakat-bakat dari komunitas untuk membantu pengembangan Ruby dan
dokumentasinya. Silakan bergabung!
{: .summary}

Topik seputar pengembangan Ruby yang dibahas disini adalah:

* [Menggunakan Subversion untuk Memonitor Pengembangan Ruby](#following-ruby)
* [Menyempurnakan Ruby, dengan patch](#patching-ruby)
* [Peraturan untuk Developer Inti](#coding-standards)

### Menggunakan Subversion untuk Memonitor Pengembangan Ruby
{: #following-ruby}

Instalasi [Subversion][1] terlebih dahulu.

Lakukan `svn checkout` *source code* Ruby dengan login sebagai anonim.
Jadi di *console* Anda ketik:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

Sekarang direktori `ruby` berisi *source code* Ruby 1.9 yang paling
terbaru (trunk), yang merupakan versi development Ruby, yang akan
dirilis sebagai 1.9.0 di akhir tahun 2007.

Kalau Anda berminat mempatch Ruby 1.8, gunakan *branch* `ruby_1_8`
ketika svn checkout:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8
{% endhighlight %}

Perintah tadi untuk *checkout* direktori pengembangan Ruby versi 1.8.
Developer yang bekerja di Ruby 1.8 diharapkan melakukan migrasi
perubahan mereka ke trunk Ruby, sangat sering dua branch kelihatan
sangat mirip, dengan pengecualian adanya perbaikan yang dibuat oleh Matz
dan Nobu untuk bahasa Ruby sendiri.

Kalau Anda berminat *browsing*, Anda bisa *browse* [repository Ruby via
web][2].

Untuk informasi lebih lanjut tentang Subversion, silakan lihat [the
Subversion FAQ][3] dan [the Subversion book][4]. Sebagai alternatif,
Anda bisa juga dapatkan buku [Pragmatic Version Control with Subversion][5]
sebagai buku yang berguna untuk pengenalan svn.

### Menyempurnakan Ruby, dengan Patch
{: #patching-ruby}

Rubyforge mempunyai [bug tracker][6] dengan submit patch dan bug report
(laporan adanya bug) ke Matz dan rekan-rekan lainnya (Developer Ruby
Core). Laporan-laporan ini juga di submit ke
[milis Ruby-Core][mailing-lists] untuk didiskusikan,
jadi Anda bisa mengkonfirmasi terlebih dahulu apakah permintaan Anda
akan diperhatikan atau tidak. Anda juga bisa mengirim patch langsung ke
milis. Anda diharapkan untuk berpartisipasi aktif dalam diskusi
tersebut.

Sebagai ringkasan, jadi langkah-langkah mengirimkan patch adalah sebagai
berikut:

1.  Jika Anda memperbaiki bug di Ruby 1.8, check out dulu copy dari Ruby
    1.8 dengan svn pada branch `ruby_1_8`.

         $ svn co http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8

    Jika Anda ingin menambahkan fitur ke Ruby, lakukan check out dari
    `trunk` Ruby source. Walaupun jika Anda ingin menambahkan fitur ke
    Ruby 1.8, fitur tersebut harus disetujui dulu di trunk.

         $ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby

2.  Tambahkan perbaikan Anda ke *source code* Ruby.
3.  Buat patch untuk perbaikan Anda.

         $ svn diff > ruby-changes.patch

4.  Email patch Anda ke [milis Ruby-Core][mailing-lists] dengan entri
    ChangeLog yang menjelaskan patch.
5.  Jika tidak ada masalah dengan patch, maka para committer akan
    melakukan patch tersebut.

**Perhatian:** patch harus dikirimkan dalam format [unified diff][7].
Untuk mengetahui lebih lanjut tentang bagaimana patch digabungkan
(*merge*), lihat [the diffutils reference][8].

Diskusi tentang pengembangan Ruby dibicarakan di
[milis Ruby-Core][mailing-lists]. Jadi kalau Anda penasaran
apakah patch Anda berguna atau tidak atau bila Anda ingin
memulai diskusi tentang masa depan Ruby, jangan sungkan untuk datang
kemari. Jangan mempost hal-hal di luar topik (OOT) karena milis ini
adalah milis serius. Mari kita menjaga sopan santun karena kita
berkorespondensi dengan pembuat Ruby.

Ingatlah Developer Ruby Core tinggal di Jepang dan walau banyak yang
bisa berbicara bahasa Inggris dengan baik tetap ada perbedaan timezone
yang jauh. Mereka juga punya milis development yang menggunakan bahasa
Jepang selain dengan milis yang Bahasa Inggris. Jadi sabarlah jika tidak
ada yang membalas posting anda; jangan menyerah dan coba lagi beberapa
hari kemudian.

### Pedoman untuk Pengembang Inti
{: #coding-standards}

Secara umum developer Ruby harus sudah terbiasa dengan *source code* dan
*style* pengembangan yang digunakan oleh tim Ruby Core. Supaya jelas,
pedoman berikut harus dipatuhi ketika *check-in* (*commit*) ke
Subversion:

* Semua check-ins harus dijelaskan di `ChangeLog`, yang mengikuti
  [standar GNU][9]. (Banyak Developer Ruby Core menggunakan Emacs
  `add-log` mode, yang bisa diakses dengan perintah `C-x 4 a`.)
* Tanggal check-in harus diberikan dalam format Time Standar Jepang
  (UTC+9).
* Poin-poin ChangeLog Anda harus ditaruh juga di pesan commit
  Subversion. Pesan ini secara otomatis di email ke milis Ruby-CVS
  setelah Anda commit.
* Deklarasi function ANSI digunakan di seluruh *source code* Ruby dan
  *packaged extension*.
* Tolong jangan gunakan comment style C++ (`//`), maintainer Ruby
  cenderung memakai komentar multibaris standar C (`/* .. */`).



[mailing-lists]: /id/community/mailing-lists/
[1]: http://subversion.apache.org/
[2]: http://svn.ruby-lang.org/cgi-bin/viewvc.cgi/
[3]: http://subversion.apache.org/faq.html
[4]: http://svnbook.org
[5]: http://www.pragmaticprogrammer.com/titles/svn/
[6]: http://rubyforge.org/tracker/?func=browse&amp;group_id=426&amp;atid=1698
[7]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[8]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[9]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
