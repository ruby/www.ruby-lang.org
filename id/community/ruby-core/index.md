---
layout: page
title: "Ruby Core"
lang: id
---

Sekarang saatnya untuk mengikuti pengembangan Ruby. Dengan bertambahnya
perhatian yang diterima oleh Ruby dalam beberapa tahun terakhir, maka
dibutuhkan bakat yang baik untuk meningkatkan Ruby dan mendokumentasikannya.
Sehingga, dari mana Anda memulai?
{: .summary}

Topik seputar pengembangan Ruby yang dibahas disini adalah:

* [Menggunakan Subversion untuk Memonitor Pengembangan Ruby](#following-ruby)
* [Bagaimana Menggunakan Git pada Repository Utama Ruby](#git-ruby)
* [Menyempurnakan Ruby, Patch by Patch](#patching-ruby)
* [Peraturan untuk Developer Inti](#coding-standards)

### Menggunakan Subversion untuk Memonitor Pengembangan Ruby
{: #following-ruby}

Mendapatkan kode sumber Ruby terbaru dengan melakukan *checkout* sebagai anonim
pada repositori [Subversion][1]. Masukan perintah berikut pada *console* Anda:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

Sekarang direktori `ruby` akan berisi kode sumber terbaru dari versi
*development* Ruby (ruby-trunk). Saat ini *patch* yang digunakan oleh *trunk*
di-*backport* ke *branch stable* {{ site.svn.stable.version }},
{{ site.svn.previous.version }}, dan {{ site.svn.old.version }} (lihat bawah).

Jika Anda ingin *patching* Ruby {{ site.svn.stable.version }},
gunakan *branch* {{ site.svn.stable.branch }} ketika sedang *checkout*:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.stable.branch }}
{% endhighlight %}

Demikian pula untuk Ruby {{ site.svn.previous.version }}:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.previous.branch }}
{% endhighlight %}

Perintah di atas akan melakukan *checkout* masing-masing ke direktori
`{{ site.svn.stable.branch }}` or `{{ site.svn.previous.branch }}`.
Pekerjaan pengembang pada *maintenance branch* diharapkan untuk migrasi
perubahannya ke Ruby *trunk*, seringkali *branch-branch* kelihatan sangat
mirip, dengan pengecualian ada perbaikan yang dibuat oleh Matz dan Nobu untuk
bahasa Ruby sendiri.

Kalau Anda berminat *browsing*, Anda bisa *browse* [repository Ruby melalui
web][2].

Untuk informasi lebih lanjut tentang Subversion, silakan lihat [the
Subversion FAQ][3] dan [the Subversion book][4]. Sebagai alternatif,
Anda bisa juga dapatkan buku [Pragmatic Version Control with Subversion][5]
sebagai buku yang berguna untuk pengenalan svn.

### Bagaimana Menggunakan Git pada Repositori Utama Ruby
{: #git-ruby}

Bagi mereka yang lebih memilih menggunakan [Git][6] dibanding Subversion dapat
mengikuti instruksi di [mirror on GitHub][7], baik untuk [comitter][8]
maupun [bukan commiter][9].

### Menyempurnakan Ruby, dengan Patch
{: #patching-ruby}

Tim Ruby Core merawat [bug tracker][6] untuk memasukkan *patch* dan laporan
*bug* ke Matz dan rekan-rekannya. Laporan-laporan ini juga dimasukkan ke
[milis Ruby-Core][mailing-lists] untuk didiskusikan, jadi Anda bisa
mengkonfirmasi terlebih dahulu apakah permintaan Anda akan diperhatikan atau
tidak. Anda juga bisa mengirim *patch* langsung ke milis. Anda diharapkan
untuk berpartisipasi aktif dalam diskusi tersebut.

Mohon lihat [Patch Writer's Guide][writing patches] untuk beberapa tips,
langsung dari Matz, bagaimana *patch* Anda dipertimbangkan.

Sebagai ringkasan, langkah-langkah mengirimkan *patch* adalah sebagai
berikut:

1. *Checkout* salinan kode sumber Ruby dari Subversion.
   Biasanya *patch* untuk *bugfix* atau fitur baru dimasukkan
   untuk *trunk* dari kode sumber Ruby. Bahkan jika Anda ingin menambahkan
   sebuah fitur ke Ruby {{ site.svn.previous.version }}, perubahan harus
   disetujui terlebih dahulu di *trunk*.

        $ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby

   Jika Anda sedang memperbaiki sebuah *bug* yang khusus pada satu *branch
   maintenance*, *checkout* salinan dari masing-masing *branch*,
   Misal, `{{ site.svn.previous.branch }}`.

        $ svn co https://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.previous.branch }}

2.  Tambahkan perbaikan Anda ke *source code* Ruby.

3.  Buat sebuah *patch*.

        $ svn diff > ruby-changes.patch

4.  Buat sebuah tiket di [issue tracker][10] atau kirim *patch* melalui e-mail
    ke [Ruby-Core mailing list][mailing-lists] dengan entri ChangeLog yang
    menjelaskan patch.

5.  Jika tidak ada masalah dengan *patch* tersebut, maka para *committer* akan
    memberikan persetujuan untuk menggunakannya.

**Perhatian:** *patch* harus dikirimkan dalam format [unified diff][12].
Untuk mengetahui lebih lanjut tentang bagaimana *patch* digabungkan
(*merge*), lihat [the diffutils reference][13].

Diskusi tentang pengembangan Ruby dibicarakan di
[milis Ruby-Core][mailing-lists]. Jadi kalau Anda penasaran
apakah patch Anda berguna atau tidak atau bila Anda ingin
memulai diskusi tentang masa depan Ruby, jangan sungkan untuk datang
kemari. Jangan mengirimkan hal-hal di luar topik (OOT) karena milis ini
adalah milis serius. Mari kita menjaga sopan santun karena kita
berkorespondensi dengan pembuat Ruby.

Ingatlah tim Ruby Core tinggal di Jepang dan walau banyak yang
bisa berbicara bahasa Inggris dengan baik tetap ada perbedaan zona waktu
yang jauh. Mereka juga punya milis pengembangan yang menggunakan bahasa
Jepang selain dengan milis berbahasa Inggris. Jadi sabarlah, jika tidak
ada yang membalas kiriman Anda; jangan menyerah dan coba lagi beberapa
hari kemudian.

### Pedoman untuk Pengembang Inti
{: #coding-standards}

Secara umum developer Ruby harus sudah terbiasa dengan kode sumber dan
gaya pengembangan yang digunakan oleh tim Ruby Core. Supaya jelas,
pedoman berikut harus dipatuhi ketika *check-in* (*commit*) ke
Subversion:

* Semua check-ins harus dijelaskan di `ChangeLog`, yang mengikuti
  [standar GNU][14]. (Banyak Developer Ruby Core menggunakan Emacs
  `add-log` mode, yang bisa diakses dengan perintah `C-x 4 a`.)
* Tanggal *check-in* harus diberikan dalam format yang memenuhi standar
  waktu Jepang (UTC+9).
* Poin-poin ChangeLog Anda harus ditaruh juga di pesan *commit*
  Subversion. Pesan ini secara otomatis di e-mail ke milis Ruby-CVS
  setelah Anda *commit*.
* *Function prototype* digunakan di seluruh kode sumber Ruby dan
  *packaged extension*-nya.
* Tolong jangan gunakan gaya komentar C++ (`//`), *maintainer* Ruby
  cenderung memakai komentar multibaris standar C (`/* .. */`).

Lihat juga informasi di [Ruby’s issue tracker][10].



[mailing-lists]: /en/community/mailing-lists/
[writing-patches]: /en/community/ruby-core/writing-patches/
[1]: http://subversion.apache.org/
[2]: https://svn.ruby-lang.org/cgi-bin/viewvc.cgi/
[3]: http://subversion.apache.org/faq.html
[4]: http://svnbook.org
[5]: http://www.pragmaticprogrammer.com/titles/svn/
[6]: http://git-scm.com/
[7]: https://github.com/ruby/ruby
[8]: https://github.com/shyouhei/ruby/wiki/committerhowto
[9]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[10]: https://bugs.ruby-lang.org/
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[14]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
