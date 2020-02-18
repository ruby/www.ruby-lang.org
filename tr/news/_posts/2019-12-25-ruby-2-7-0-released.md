---
layout: news_post
title: "Ruby 2.7.0 Yayınlandı"
author: "naruse"
translator: "İsmail Arılık"
date: 2019-12-25 00:00:00 +0000
lang: tr
---

Ruby 2.7.0'ın yayınlandığını duyurmaktan memnuniyet duyuyoruz.

Bu sürüm birkaç yeni özellik ve performans iyileştirmesi içermektedir, bunların en önemlileri:

* Desen Eşleştirme
* REPL iyileştirmesi
* Sıkıştırma GC
* Konumsal argümanların ve anahtar kelime argümanlarının ayrılması

## Desen Eşleştirme [Deneysel]

Desen eşleştirme deneysel bir özellik olarak eklenmiştir, bu özellik fonksiyonel programlama dillerinde sıklıkla kullanılır.
[Özellik #14912](https://bugs.ruby-lang.org/issues/14912)

Bu özellik, verilen bir nesne üzerinde yürüyebilir ve eğer bu nesne bir desenle eşleşirse, bu nesnenin değerini atayabilir.

```ruby
require "json"

json = <<END
{
  "name": "Alice",
  "age": 30,
  "children": [{ "name": "Bob", "age": 2 }]
}
END

case JSON.parse(json, symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age #=> 2
end
```

Daha fazla ayrıntı için lütfen [Desen eşleştirme - Ruby 2.7'de yeni bir özellik](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7)'e bakın.

## REPL iyileştirmesi

Ruby ile gelen etkileşimli ortam (REPL; Read-Eval-Print-Loop) olan `irb` şimdi çoklu satır değiştirmeyi destekliyor.
Bu özellik saf Ruby'de gerçeklenen ve `readline`'a uyumlu bir kütüphane olan `reline` tarafından güçlendirilmiştir.
Ayrıca bu, rdoc bütünleşimi de sağlamaktadır.
`irb`'de ayrıca verilen bir sınıf, modül ya da metodun başvurusunu da görüntüleyebilirsiniz.
[Özellik #14683](https://bugs.ruby-lang.org/issues/14683), [Özellik #14787](https://bugs.ruby-lang.org/issues/14787), [Özellik #14918](https://bugs.ruby-lang.org/issues/14918)

Üstelik şimdi `Binding#irb` tarafından gösterilen kaynak satırları ve temel sınıf nesnelerinin gözlem sonuçları renklendiriliyor.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259" poster="https://cache.ruby-lang.org/pub/media/irb-reline-screenshot.png">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take3.mp4" type="video/mp4">
</video>

## Sıkıştırma GC

Bu sürüm, parçalanmış hafıza alanını birleştirebilen Sıkıştırma GC'yi tanıtmaktadır.

Bazı çok thread'li Ruby programları hafıza parçalanmasına neden olabilir, bu da yüksek hafıza kullanımı ve hız düşüşüne neden olur.

`GC.compact` metodu, heap'i sıkıştırmak için eklenmiştir.
Bu fonksiyon heap'teki canlı nesneleri sıkıştırır, böylece daha az sayfa kullanılabilir ve heap daha CoW canlısı olabilir.
[Özellik #15626](https://bugs.ruby-lang.org/issues/15626)

## Konumsal argümanların ve anahtar kelime argümanlarının ayrılması

Anahtar kelime argümanlarının ve konumsal argümanların otomatik dönüştürülmesi ileride kaldırılacak olarak işaretlendi ve Ruby 3'te kaldırılacak.
[[Özellik #14183]](https://bugs.ruby-lang.org/issues/14183)

Ayrıntılar için "[Ruby 3.0'da konumsal argümanların ve anahtar kelime argümanlarının ayrılması](https://www.ruby-lang.org/tr/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/)" makalesine bakın.
Sadece değişiklikler aşağıdaki gibidir.

* Eğer bir metod çağrısı son argümanı olarak bir Hash geçirirse, ve hiç anahtar kelime geçirmezse, ve çağrılan metod anahtar kelimeler kabul ediyorsa, bir uyarı yayınlanır.
  Hash'in anahtar kelime olarak anlaşılmasını sağlamak, uyarıdan kaçınmak ve Ruby 3'te doğru davranıştan emin olmak için çift yıldız operatörü ekleyin.

  ```ruby
  def foo(key: 42); end; foo({key: 42})   # uyarı yayınlanır
  def foo(**kw);    end; foo({key: 42})   # uyarı yayınlanır
  def foo(key: 42); end; foo(**{key: 42}) # iyi
  def foo(**kw);    end; foo(**{key: 42}) # iyi
  ```

* Eğer bir metod çağrısı, anahtar kelimeler kabul eden bir metoda anahtar kelimeler geçirirse fakat yeterli sayıda zorunlu konumsal argüman geçirmezse, anahtar kelimeler gerekli son konumsal argüman olarak düşünülür ve bir uyarı yayınlanır.
  Uyarıdan kaçınmak ve Ruby 3'te doğru davranıştan emin olmak için argümanı anahtar kelimeler olarak değil de, hash olarak geçirin.

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # uyarı yayınlanır
  def foo(h, key: 42); end; foo(key: 42)   # uyarı yayınlanır
  def foo(h, **kw); end; foo({key: 42})    # iyi
  def foo(h, key: 42); end; foo({key: 42}) # iyi
  ```

* Bir metod belirli anahtar kelimeler bekliyor fakat yıldızlı anahtar kelime beklemiyorsa, ve metoda bir hash ya da hem Symbol hem de Symbol olmayan anahtarları içeren yıldızlı anahtar kelimeler geçirildiyse, hash ayrılmaya devam eder, ve bir uyarı yayınlanır.
  Ruby 3'te doğru davranıştan emin olmak için çağıran kodu ayrı hash'ler geçirecek şekilde güncellemeniz gerekiyor.

  ```ruby
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # uyarı yayınlanır
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # uyarı yayınlanır
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # iyi
  ```

* Eğer bir metod anahtar kelime kabul etmiyor ve anahtar kelimeler ile çağrıldıysa, anahtar kelimeler yine konumsal hash olarak düşünülür, herhangi bir uyarı yayınlanmaz.
  Bu davranış Ruby 3'te çalışmaya devam edecek.

  ```ruby
  def foo(opt={});  end; foo( key: 42 )   # iyi
  ```

* Eğer metod keyfi anahtar kelimeler kabul ediyorsa, anahtar kelime argüman anahtarları olarak sembol olmayanlara izin verilir.
  [[Özellik #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* Harici olarak metodun anahtar kelime almadığını belirtmek için metod tanımlarında `**nil` kullanılabilir.
  Böyle bir metodu anahtar kelimeler ile çağırmak ArgumentError ile sonuçlanır.
  [[Özellik #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # iyi
  def foo(h, **nil); end; foo({"str" => 1}) # iyi
  ```

* Anahtar kelime almayan bir metoda boş bir anahtar kelime yıldızı geçirmek artık boş bir hash geçirmiyor.
  Ancak gerekli bir parametre için boş bir hash gerekliyse, bir uyarı yayınlanır.
  Konumsal bir hash geçirmeye devam etmek için çift yıldızı kaldırın.
  [[Özellik #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} ve uyarı
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

İleride kaldırılma uyarılarını kapatmak için lütfen `-W:no-deprecated` komut satırı argümanını kullanın ya da `Warning[:deprecated] = false` ifadesini kodunuza ekleyin.

## Dikkate Değer Diğer Yeni Özellikler

* Varsayılan blok parametreleri olarak numaralanmış parametreler, deneysel bir özellik olarak eklendi.
  [[Özellik #4475]](https://bugs.ruby-lang.org/issues/4475)

* Başlangıçsız aralık deneysel olarak eklendi.
  Bu, sonsuz aralık kadar kullanışlı olmayabilir, fakat DSL kullanımları için iyi olacaktır.
  [[Özellik #14799]](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # ary[0..3] ile aynı
  rel.where(sales: ..100)
  ```

* `Enumerable#tally` eklendi.
  Bu metod, her öğenin kaç kere geçtiğini sayar.

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* Alıcı olarak bir `self` kalıbı ile özel bir metodu çağırmaya artık izin verilmiyor.
  [[Özellik #11297]](https://bugs.ruby-lang.org/issues/11297), [[Özellik #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* `Enumerator::Lazy#eager` eklendi.
  Bu, tembel bir numaralandırıcıdan tembel olmayan bir numaralandırıcı oluşturur.
  [[Özellik #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## Performans iyileştirmeleri

* JIT [Deneysel]

  * JIT edilmiş kod, bir eniyileştirme varsayımı geçersiz kılındığında, daha az eniyileştirilmiş koda yeniden derlenir.

  * Bir metodun saf olduğu düşünülürse, metod satıriçi yapma uygulanır.
    Bu eniyileme hala deneyseldir ve birçok metod henüz saf olarak düşünülmemektedir.

  * `--jit-min-calls`'ın varsayılan değeri 5'ten 10.000'e değiştirildi.

  * `--jit-max-cache`'in varsayılan değeri 1.000'den 100'e değiştirildi.

* Fiber'in önbellekleme stratejisi değiştirildi ve fiber oluşturma hızlandırıldı.
  [GH-2224](https://github.com/ruby/ruby/pull/2224)

* `Module#name`, `true.to_s`, `false.to_s`, ve `nil.to_s` şimdi her zaman dondurulmuş String döndürüyor.
  Döndürülen String belirli bir nesne için her zaman aynıdır.
  [Deneysel]
  [[Özellik #16150]](https://bugs.ruby-lang.org/issues/16150)

* `CGI.escapeHTML`'in performansı iyileştirildi.
  [GH-2226](https://github.com/ruby/ruby/pull/2226)

* Monitor ve MonitorMixin'in performansı iyileştirildi.
  [[Özellik #16255]](https://bugs.ruby-lang.org/issues/16255)

* 1.9'dan beridir var olan çağrı bölgesi başına metod önbellekleme iyileştirildi:
  Önbellek vurma oranı %89'dan %94'e yükseldi.
  [GH-2583](https://github.com/ruby/ruby/pull/2583)'e bakın.

* RubyVM::InstructionSequence#to_binary metodu derlenmiş ikili oluşturur.
  İkili boyutu düşürüldü.
  [Feature #16163]

## 2.6'dan bu yana dikkate değer diğer değişiklikler

* Bazı standart kütüphaneler güncellendi.
  * Bundler 2.1.2
    ([Yayın notu](https://github.com/bundler/bundler/releases/tag/v2.1.2))
  * RubyGems 3.1.2
    * ([3.1.0 için yayın notu](https://github.com/rubygems/rubygems/releases/tag/v3.1.0))
    * ([3.1.1 için yayın notu](https://github.com/rubygems/rubygems/releases/tag/v3.1.1))
    * ([3.1.2 için yayın notu](https://github.com/rubygems/rubygems/releases/tag/v3.1.2))
  * Racc 1.4.15
  * CSV 3.1.2
    ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * REXML 3.2.3
    ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8
    ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * Orijinal sürümü olmayan bazı diğer kütüphaneler de güncellendi.

* Aşağıdaki kütüphaneler artık paketlenmiş gem'ler içinde yer almıyor.
  Bu özellikleri kullanmak için ilgili gem'leri kurun.
  * CMath (cmath gem'i)
  * Scanf (scanf gem'i)
  * Shell (shell gem'i)
  * Synchronizer (sync gem'i)
  * ThreadsWait (thwait gem'i)
  * E2MM (e2mmap gem'i)

* `profile.rb` standart kütüphaneden kaldırıldı.

* Standart kütüphane varsayılan gemlerle desteklendi
  * Aşağıdaki varsayılan gemler rubygems.org'da yayınlandı
    * benchmark
    * cgi
    * delegate
    * getoptlong
    * net-pop
    * net-smtp
    * open3
    * pstore
    * singleton
  * Aşağıdaki varsayılan gemler sadece ruby-core'u destekledi, henüz rubygems.org'da yayınlanmadı.
    * monitor
    * observer
    * timeout
    * tracer
    * uri
    * yaml

* Bir blokla çağrılmış bir metodda bloksuz olarak yer alan `Proc.new` ve `proc` şimdi bir uyarıdır.

* Bir blokla çağrılmış bir metodda bloksuz olarak yer alan `lambda` şimdi bir hata yükseltir.

* Unicode ve Emoji sürümleri 11.0.0'dan 12.0.0'a güncellendi.
  [[Özellik #15321]](https://bugs.ruby-lang.org/issues/15321)

* Unicode sürümü 12.1.0'a güncellendi, bu sürüm U+32FF SQUARE ERA NAME REIWA için destek eklemektedir.
  [[Özellik #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, ve `Date.parse` yeni Japon dönemini desteklemektedir.
  [[Özellik #15742]](https://bugs.ruby-lang.org/issues/15742)

* Derleyicilerin C99'u desteklemesi zorunlu tutuldu.
  [[Diğer #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Lehçemizin ayrıntıları: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Daha fazla ayrıntı için [NEWS](https://github.com/ruby/ruby/blob/v2_7_0/NEWS)'e ya da [işleme günlükleri](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0)ne bakın.

{% assign release = site.data.releases | where: "version", "2.7.0" | first %}

Bu değişiklikler ile birlikte Ruby 2.6.0'dan bu yana [{{ release.stats.files_changed }} dosya değişti, {{ release.stats.insertions }} ekleme(+), {{ release.stats.deletions }} silme(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0) yapıldı!

Ruby 2.7 ile programlamanın tadını çıkarın!

## İndirin

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby nedir

Ruby ilk olarak Matz (Yukihiro Matsumoto) tarafından 1993'te geliştirilmiştir ve şimdi Açık Kaynak olarak geliştirilmektedir.
Birçok platformda çalışır ve dünyanın her yerinde kullanılır, özellikle web geliştirmesi için.
