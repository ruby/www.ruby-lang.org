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

* [Menggunakan Git untuk Memonitor Pengembangan Ruby](#following-ruby)
* [Menyempurnakan Ruby, Patch by Patch](#patching-ruby)
* [Catatan terkait branches](#branches-ruby)

### Menggunakan Git untuk Memonitor Pengembangan Ruby
{: #following-ruby}

Repositori utama saat ini dari kode sumber Ruby terbaru adalah
[git.ruby-lang.org/ruby.git][gitrlo].
Ada juga sebuah [mirror pada GitHub][7]. Biasanya, mohon gunakan *mirror* ini.

Anda dapat mendapatkan kode sumber Ruby terbaru dengan menggunakan Git.
Dari *command line* Anda:

{% highlight sh %}
$ git clone https://github.com/ruby/ruby.git
{% endhighlight %}

Direktori `ruby` saat ini akan berisi kode sumber terbaru dari versi
*development* Ruby (ruby-trunk).

Lihat juga [Non-committer’s HOWTO to join our development][noncommitterhowto].

Jika Anda memiliki akses *commit*, dan jika Anda ingin *push* sesuatu,
Anda seharusnya menggunakan repositori utama.

{% highlight sh %}
$ git clone git@git.ruby-lang.org:ruby.git
{% endhighlight %}

### Menyempurnakan Ruby, dengan Patch
{: #patching-ruby}

Tim Ruby Core merawat [issue tracker][10] untuk memasukkan *patch* dan laporan
*bug* ke Matz dan rekan-rekannya. Laporan-laporan ini juga dimasukkan ke
[milis Ruby-Core][mailing-lists] untuk didiskusikan, jadi Anda bisa
mengkonfirmasi terlebih dahulu apakah permintaan Anda akan diperhatikan atau
tidak. Anda juga bisa mengirim *patch* langsung ke milis. Anda diharapkan
untuk berpartisipasi aktif dalam diskusi tersebut.

Mohon lihat [Patch Writer's Guide][writing-patches] untuk beberapa tips,
langsung dari Matz, bagaimana *patch* Anda dipertimbangkan.

Sebagai ringkasan, langkah-langkah mengirimkan *patch* adalah sebagai
berikut:

1. *Check out* salinan kode sumber Ruby dari GitHub.
   Biasanya *patch* untuk *bugfix* atau fitur baru dimasukkan
   untuk *trunk* dari kode sumber Ruby.

        $ git clone https://github.com/ruby/ruby.git

   Jika Anda sedang memperbaiki sebuah *bug* yang khusus pada satu *branch
   maintenance*, *check out* salinan dari masing-masing *branch*.

        $ git checkout ruby_X_X

2.  Tambahkan perbaikan Anda ke kode.

3.  Buat sebuah *patch*.

        $ git diff > ruby-changes.patch

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

Ingatlah banyak tim Ruby Core tinggal di Jepang dan walau banyak yang
bisa berbicara bahasa Inggris dengan baik tetap ada perbedaan zona waktu
yang jauh. Mereka juga punya milis pengembangan yang menggunakan bahasa
Jepang selain dengan milis berbahasa Inggris. Jadi sabarlah, jika tidak
ada yang membalas kiriman Anda; jangan menyerah dan coba lagi beberapa
hari kemudian.


### Catatan terkait branches
{: #branches-ruby}

Kode sumber Ruby telah dikelola menggunakan repositori Subversion hingga
22 April 2019.
Sehingga, beberapa *branch* mungkin masih dikelola dengan Subversion.
Anda dapat melihat repositori SVN.

* [&lt;URL:https://git.ruby-lang.org/ruby.git&gt;][svn-viewvc]

Namun demikian, Anda tidak harus peduli tentang itu (kecuali Anda adalah
seorang *branch maintainer*).
Anda dapat *check out branch* pada salinan kerja Git Anda.
Sebagai contoh, jalankan perintah berikut.

{% highlight sh %}
$ git checkout ruby_X_X
{% endhighlight %}

X_X seharusnya diganti dengan sebuah versi yang Anda ingin *check out*.

Jika Anda ingin memodifikasi *branch*, mohon buka sebuah isu pada [issue tracker][10] kami.
Lihat juga bagian berikut.

[gitrlo]: https://git.ruby-lang.org/ruby.git
[mailing-lists]: /en/community/mailing-lists/
[writing-patches]: /en/community/ruby-core/writing-patches/
[noncommitterhowto]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[svn-viewvc]: https://git.ruby-lang.org/ruby.git
[7]: https://github.com/ruby/ruby
[10]: https://bugs.ruby-lang.org/
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
