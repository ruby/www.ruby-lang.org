---
layout: page
title: "Dari Perl ke Ruby"
lang: id
---

Perl memang memukau. Dokumentasi Perl juga memukau. Komunitas Perl juga …
luar biasa.
Untuk para pengguna Perl yang sudah lama menginginkan bahasa beorientasi objek
yang terintegrasi elegan dari awal, Ruby cocok untuk
Anda.

### 99 Bottles of Beer on the Wall

Cara tercepat untuk melihat perbedaan Perl dan Ruby adalah melihat
contoh *source code*.

Berikut ini adalah kode program [99 Bottles of Beer on the Wall][1]
menggunakan bahasa Perl:

{% highlight perl %}
$n = 5;
sub bottle { my $n = shift; $n < 2 ? "$n bottle" : "$n bottles" }
while ($n) {
   print <<"BOTOL";
${\bottle $n} of beer on the wall
${\bottle $n} of beer
Take one down, pass it around
${\bottle --$n} of beer on the wall

BOTOL
}

print "No more beer on the wall :-(\n";
{% endhighlight %}

Program tersebut dapat ditulis sebagai berikut di Ruby:

{% highlight ruby %}
puts "\n It's beer song time!\n"

bottles = lambda {|n| n == 1 ? "#{n} bottle" : "#{n} bottles"}
sep = "~" * 32

99.downto 1 do |n|
  puts "#{sep}#{bottles[n]} of beer on the wall#{bottles[n]} of beerTake one down, pass it around#{bottles[n - 1]} of beer on the wall"
end

puts sep
puts "\n No more beer on the wall :-("
{% endhighlight %}

Algoritma yang digunakan kedua program tersebut sedikit berbeda, tapi
secara fungsionalitas sama.

Sumber: [Perl][2] (ditulis oleh [Jim Menard][3]), [Ruby][4] (ditulis
oleh *binary42*)

### Kemiripan Perl dan Ruby

Sama seperti Perl, di Ruby…

* Anda mendapat *package management system*, kurang lebih seperti CPAN,
  yang di Ruby disebut [RubyGems][5].
* Regexp (*regular expressions*) sudah built in. Selamat menikmati!
* Cukup banyak *library* standar bawaan Ruby yang siap pakai.
* Buka dan tutup kurung secara umum opsional (boleh dipakai boleh juga
  tidak)
* Cara penggunaan `String` secara umum mirip dengan Perl.
* Sintaks *delimited string* dan *regexp* mirip dengan Perl (seperti
  `%q{ini string}` (single-quoted), atau `%Q{ini juga string}`
  (double-quoted), dan `%w{ini untuk list kata-kata yang
  single-quoted}`. Anda `%Q|bisa|` `%Q~saja~` `%Q(menggunakan)`
  delimiter `%Q^yang lain^` kalau Anda suka).
* Menyediakan interpolasi string dalam petik ganda, `"bentuknya
  #{seperti} ini"` (contoh sebelumnya menghasilkan isi variabel
  `seperti`, tapi Anda bisa menaruh kode Ruby apa pun di dalam sintaks
  `#{}`).
* Shell command juga menggunakan `` `backtick` `` (tanda petik balik).
* Mempunyai fitur dokumentasi dalam kode, yang di Ruby disebut `rdoc`.

### Perbedaan Perl dan Ruby

Tidak seperti Perl, di Ruby…

* Anda tidak punya *context-dependent rules* seperti di Perl.
* Sebuah variabel tidak sama dengan obyek yang dituju, karena variabel
  hanya *reference* dari obyek sebenarnya.
* Karakter `$` and `@` dapat digunakan untuk prefiks variabel,
  tapi penggunaannya berbeda. Karakter tersebut digunakan untuk
  menyatakan lingkup variabel (`$` untuk variabel global, `@`
  untuk _instance variable_, dan `@@` untuk atribut kelas).
* Anda membangun Array menggunakan kurung siku (misal: @\[1, 2, 3\]) dan
  bukan tanda kurung.
* Menyimpan array dalam array lainnya tidak menggabungkan array tersebut
  menjadi satu tingkat, melainkan Anda mendapatkan array di dalam array
  (*nested array*).
* Menggunakan `def` untuk mendefinisikan metode, bukan `sub`.
* Tidak perlu *semicolon* / titik koma (`;`) di setiap akhir baris.
  Sedangkan definisi *function*, definisi *class*, statemen `case`, dan
  lain-lain ditutup dengan *keyword* `end`.
* Obyek bersifat *strongly typed*. Jika Anda ingin mengkonversi *type*,
  Anda tinggal memanggil metode yang diinginkan, misalnya `foo.to_i`,
  `foo.to_s`, dan seterusnya.
* Tidak ada `eq`, `ne`, `lt`, `gt`, `ge` ataupun `le`. Gunakan operator
  yang sudah baku, misalnya `<`, `>=`, dan sebagainya.
* Tidak ada *diamond operator* (`<>`). Anda biasanya dapat
  `IO.some_method` sebagai gantinya.
* *Fat comma* (`=>`) hanya digunakan untuk membuat hash.
* Tidak ada `undef`. Di Ruby Anda dapat menggunakan `nil`. `nil`
  merupakan obyek (seperti obyek yang lain juga di Ruby). Meski `nil`
  tidak sama dengan variabel yang belum didefinisikan, `nil` dianggap
  `false` pada operasi *boolean*, sehingga dapat digunakan sebagai
  pengganti apabila dibutuhkan.
* Ketika dites, hanya `false` dan `nil` yang bernilai `false`. Selain
  kedua nilai tadi, semuanya nilai *boolean* ekspresi apapun adalah
  `true` (termasuk `0`, `0.0` dan `"0"`).
* Jika Anda menyukai [PerlMonks][6], [milis id-ruby dan
  ruby-talk](/id/community/mailing-lists/) adalah tempat yang sangat
  berguna.



[1]: http://www.99-bottles-of-beer.net/
[2]: http://www.99-bottles-of-beer.net/language-perl-539.html
[3]: http://www.io.com/~jimm/
[4]: http://www.99-bottles-of-beer.net/language-ruby-670.html
[5]: http://guides.rubygems.org
[6]: http://www.perlmonks.org/
