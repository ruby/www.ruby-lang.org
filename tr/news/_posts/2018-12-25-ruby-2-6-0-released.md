---
layout: news_post
title: "Ruby 2.6.0 Yayınlandı"
author: "naruse"
translator: "İsmail Arılık"
date: 2018-12-25 00:00:00 +0000
lang: tr
---

Ruby 2.6.0'ın yayınlanmasını duyurmaktan memnuniyet duyarız.

Bu sürüm birkaç yeni özellik ve performans artışı getirmektedir, en önemlileri:

 * Yeni bir JIT derleyicisi.
 * `RubyVM::AbstractSyntaxTree` modülü.

## JIT [Deneysel]

Ruby 2.6 bir JIT (Just-In-Time) derleyicisinin ilk gerçeklemesini barındırmaktadır.

JIT derleyicisi, Ruby programlarının performansını iyileştirmeyi amaçlamaktadır.
İşlem içinde çalışan geleneksel JIT derleyicilerinin aksine, Ruby'nin JIT derleyicisi, C kodunu diske yazar ve yerel kod oluşturmak için yaygın bir C derleyicisini ortaya çıkarır.
Bununla ilgili daha fazla ayrıntı için, [Vladimir Makarov'un MJIT organizasyonu](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#MJIT-organization)na bakın.

JIT derleyicisini etkinleştirmek için, komut satırında ya da `$RUBYOPT` çevre değişkeninde `--jit`'i belirtin.
`--jit-verbose=1`'i belirtmek, JIT derleyicisinin ek bilgileri yazdırmasına neden olacaktır.
Diğer seçenekler için `ruby --help`'in çıktısını ya da [belgelendirme](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#Basic-usage)yi okuyun.

JIT derleyicisi, Ruby, çalışma zamanında var olması gereken GCC, Clang, ya da Microsoft VC++ ile inşa edildiğinde desteklenir.

Ruby 2.6.0 itibariyle, [Optcarrot](https://github.com/mame/optcarrot) isimli CPU yoğunluklu, basit olmayan bir kıyaslamada Ruby 2.5'e göre [1.7 kat hızlı performans](https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208) başardık.
Fakat, bu hala deneysel ve şu anda Rails uygulamaları gibi birçok diğer hafıza yoğunluklu iş yükleri bundan faydalanamayabilir.
Daha fazla ayrıntı için, [Ruby 2.6 JIT - İlerleme ve Gelecek](https://medium.com/@k0kubun/ruby-2-6-jit-progress-and-future-84e0a830ecbf)'e bakın.

Ruby'nin performansının yeni çağı için takipte kalın.

## `RubyVM::AbstractSyntaxTree` [Deneysel]

Ruby 2.6 `RubyVM::AbstractSyntaxTree` modülünü tanıtır.
**Bu modülün gelecek uyumlulukları garanti değildir**.

Bu modül bir `parse` metoduna sahiptir, bu metod verilen karakter dizisini Ruby kodu olarak ayrıştırır ve kodun AST (Abstract Syntax Tree) düğümlerini döndürür.
`parse_file` metodu verilen dosyayı Ruby kodu olarak açar ve ayrıştırır ve AST düğümlerini döndürür.

`RubyVM::AbstractSyntaxTree::Node` sınıfı ayrıca tanıtılır.
`Node` nesnelerinden kaynak konumu ve çocuk düğümlerini alabilirsiniz.
Bu özellik deneyseldir.

## Dikkate Değer Diğer Yeni Özellikler

* `#then` isminde `Kernel#yield_self` için bir takma ad eklenmesi.
  [[Özellik #14594]](https://bugs.ruby-lang.org/issues/14594)

* Sabit isimleri ASCII olmayan bir büyük harf ile başlayabilir.
  [[Özellik #13770]](https://bugs.ruby-lang.org/issues/13770)

* Sonsuz aralıkların tanıtılması.
  [[Özellik #12912]](https://bugs.ruby-lang.org/issues/12912)

  Bir sonsuz aralık, `(1..)`, sonu yokmuş gibi çalışır.
  İşte bazı tipik kullanım durumları:

      ary[1..]                          # sihirli -1 olmadan ary[1..-1] ile aynıdır
      (1..).each {|index| ... }         # 1 dizininden başlayarak değerleri numaralandırır
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* `Enumerable#chain` ve `Enumerator#+`'yı ekle.
  [[Özellik #15144]](https://bugs.ruby-lang.org/issues/15144)

* `Proc` ve `Method`'a `<<` ve `>>` fonksiyon birleştirme operatörlerini ekle.
  [[Özellik #6284]](https://bugs.ruby-lang.org/issues/6284)

      f = proc{|x| x + 2}
      g = proc{|x| x * 3}
      (f << g).call(3) # -> 11; f(g(3)) ile aynıdır
      (f >> g).call(3) # -> 15; g(f(3)) ile aynıdır

* `Binding#source_location`'ı ekle.
  [[Özellik #14230]](https://bugs.ruby-lang.org/issues/14230)

  Bu metod, bağlayıcının kaynak konumunu döndürür, bu, `__FILE__` ve `__LINE__`'ın 2 öğeli bir dizisidir.
  Teknik olarak konuşursak, bu, `eval("[__FILE__, __LINE__]", binding)` ile aynıdır.
  Fakat, bu davranışı, `Kernel#eval`'in bağlayıcının kaynak konumunu boşvereceği şekilde değiştirmeyi planlıyoruz [[Hata #4352]](https://bugs.ruby-lang.org/issues/4352).
  Yani, `Kernel#eval` yerine `Binding#source_location` kullanılması tavsiye edilir.

* `Kernel#system`'e bir `exception:` seçeneği eklenmesi, bu özellik başarısızlık durumunda `false` döndürülmesi yerine bir istisna yükseltilmesine neden olur.
  [[Özellik #14386]](https://bugs.ruby-lang.org/issues/14386)

* `Coverage`'a bir tek atış modu eklenmesi.
  [[Özellik#15022]](https://bugs.ruby-lang.org/issues/15022)

  * Bu mod, "her satırın kaç kere çalıştığı" yerine "her satırın en az bir kere çalışıp çalışmadığını" kontrol eder.
    Her satır için bir kanca sadece bir kez ateşlenir, ve bu ateşlendiği zaman, kanca bayrağı silinecektir, yani bu kanca sıfır ek yük ile çalışır.
  * `Coverage.start`'a `oneshot_lines:` anahtar kelime argümanı eklenmesi.
  * `Coverage.result`'a `stop:` ve `clear:` anahtar kelime argümanları eklenmesi.
    Eğer `clear` doğruysa, sayıcılar sıfır olarak ayarlanır.
    Eğer `stop` doğruysa, kapsama ölçümü devre dışı bırakılır.
  * `Coverage.line_stub`, verilen bir kaynak koddan satır kapsamasının "stub"ını oluşturan basit bir yardımcı fonksiyondur.

* `FileUtils#cp_lr`'nin eklenmesi.
  Bu, aynı `cp_r` gibi çalışır fakat kopyalama yerine bağlar.
  [[Özellik #4189]](https://bugs.ruby-lang.org/issues/4189)

## Performans iyileştirmeleri

* `$SAFE` için olan geçici yer ayrımı kaldırılarak `Proc#call`'un hızlandırılması.
  [[Özellik #14318]](https://bugs.ruby-lang.org/issues/14318)

  `Proc#call`'u sayısız kere çağıran `lc_fizzbuzz` kıyaslamasında 1.4 kat performans iyileştirmesi gözlemledik.
  [[Hata #10212]](https://bugs.ruby-lang.org/issues/10212)

* `block` bir blok parametresi olarak geçirildiğinde `block.call`'un hızlandırılması.
  [[Özellik #14330]](https://bugs.ruby-lang.org/issues/14330)

  Ruby 2.5'te tanıtılan blok ele alımı etrafındaki iyileştirmelerle birleştirince, blok değerlendirmesi şimdi Ruby 2.6'daki bir küçük kıyaslamada 2.6 kat daha hızlı yapılır.
  [[Özellik #14045]](https://bugs.ruby-lang.org/issues/14045)

* Geçici heap (`theap`) tanıtılır.
  [[Hata #14858]](https://bugs.ruby-lang.org/issues/14858)
  [[Özellik #14989]](https://bugs.ruby-lang.org/issues/14989)

  `theap`, belirli sınıflar (`Array`, `Hash`, `Object`, ve `Struct`) tarafından işaret edilen kısa yaşayan hafıza nesneleri için yönetilen bir heap'tir.
  Küçük ve kısa yaşayan Hash nesneleri yapmak 2 kat hızlıdır.
  rdoc kıyaslaması ile %6-7 performans artışı gözlemledik.

* Fiber'in bağlam değiştirme performansını dikkate değer bir şekilde iyileştirmek için eşyordamların yerel gerçeklemeleri (`arm32`, `arm64`, `ppc64le`, `win32`, `win64`, `x86`, `amd64`) yapıldı.
  [[Özellik #14739]](https://bugs.ruby-lang.org/issues/14739)

  64-bit Linux'te `Fiber.yield` ve `Fiber#resume` yaklaşık olarak 5 kat daha hızlıdır.
  Fiber yoğunluklu programlar tümünde %5'e kadar iyileşme bekleyebilir.

## 2.5'ten beri diğer dikkate değer değişiklikler

* `$SAFE` şimdi bir işlem evrensel durumu ve `0`'a geri ayarlanabilir.
  [[Özellik #14250]](https://bugs.ruby-lang.org/issues/14250)

* `ERB.new`'e `safe_level` geçirmek kullanımdan kaldırıldı.
  `trim_mode` ve `eoutvar` argümanları anahtar kelime argümanlarına çevrildi.
  [[Özellik #14256]](https://bugs.ruby-lang.org/issues/14256)

* Unicode desteği sürüm 11'e güncellendi.
  Ruby 2.6'nın gelecek UFACIK bir sürümünde Unicode sürümü 12 ve 12.1 için destek ekleme planlarımız var.
  Bu, [yeni Japon dönemi](http://blog.unicode.org/2018/09/new-japanese-era.html) için destek içerecek.

* RubyGems 3.0.1'i birleştir.
  `--ri` ve `--rdoc` seçenekleri silindi.
  Lütfen bunlar yerine `--document` ve `--no-document` seçeneklerini kullanın.

* [Bundler](https://github.com/bundler/bundler) şimdi varsayılan bir gem olarak kuruluyor.

* İstisna işleme bloklarında, `rescue` olmadan `else` şimdi bir sözdizimi hatasına neden oluyor.
  [DENEYSEL][[Özellik #14606]](https://bugs.ruby-lang.org/issues/14606)

Daha fazla ayrıntı için [NEWS](https://github.com/ruby/ruby/blob/v2_6_0/NEWS)'e ya da [işleme logları](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0)na bakın.

Bu değişiklikler ile, Ruby 2.5.0'dan beri [6437 dosya değişti, 231471 ekleme yapıldı(+), 98498 silme yapıldı(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0)!

Mutlu Noeller, Mutlu Tatiller, ve Ruby 2.6 ile programlamanın keyfini çıkarın!

## Bilinen Problem

_(Bu bölüm 28 Ocak 2019'da eklendi.)_

* [Büyük çok baytlı karakter dizileri gönderirken Net::Protocol::BufferedIO#write, NoMethodError yükseltiyor](https://github.com/ruby/ruby/pull/2058)

## İndirin

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.gz>

      SIZE:   16687800 bytes
      SHA1:   c95f4e86e21390270dad3ebb94491fd42ee2ce69
      SHA256: f3c35b924a11c88ff111f0956ded3cdc12c90c04b72b266ac61076d3697fc072
      SHA512: 01f886b0c0782a06315c4a46414e9f2b66ee634ba4349c8e0697f511793ae3c56d2ad3cad6563f2b0fdcedf0ff3eba51b9afab907e7e1ac243475772f8688382

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.zip>

      SIZE:   20582054 bytes
      SHA1:   a804e63d18da12107e1d101918a3d8f4c5462a27
      SHA256: 8a4fb6ca58202495c9682cb88effd804398bd0ef023e3e36f001ca88d8b5855a
      SHA512: 16d66ec4a2c6a2e928d5b50e094a5efa481ac6e4d5ed77459d351ef19fe692aa59b68307e3e25229eec5f30ae2f9adae2663bafe9c9d44bfb45d3833d77839d4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2>

      SIZE:   14585856 bytes
      SHA1:   b8638eb806efbf7b6af87b24ccc6ad915f262318
      SHA256: c89ca663ad9a6238f4b1ec4d04c7dff630560c6e6eca6d30857c4d394f01a599
      SHA512: ca3daf9acf11d3db2900af21b66231bd1f025427a9d2212b35f6137ca03f77f57171ddfdb99022c8c8bcd730ff92a7a4af54e8a2a770a67d8e16c5807aa391f1

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.xz>

      SIZE:   11918536 bytes
      SHA1:   9ddaeba3505d2855460c8c653159fc0ac8928c0f
      SHA256: acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f
      SHA512: c56eaf85ef7b79deb34ee4590b143c07f4fc83eb79775290761aee5a7c63374659613538a41f25706ed6e19e49d5c67a1014c24d17f29948294c7abd0b0fcea8
