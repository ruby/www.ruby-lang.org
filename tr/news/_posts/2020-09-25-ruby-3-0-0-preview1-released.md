---
layout: news_post
title: "Ruby 3.0.0 Önizleme 1 Yayınlandı"
author: "naruse"
translator: "ismailarilik"
date: 2020-09-25 00:00:00 +0000
lang: tr
---

Ruby 3.0.0-preview1'in yayınlandığını duyurmaktan memnuniyet duyuyoruz.

Bu sürüm birçok yeni özellik ve performans iyileştirmesi içermektedir.

## RBS

RBS, Ruby programlarındaki tipleri tanımlamada kullanılan bir dildir.
RBS'yi destekleyen tip kontrol edicileri (tip profil oluşturucuları da dahil) ve diğer araçlar, RBS tanımlamaları ile birlikte Ruby programlarını çok daha iyi anlayacaklardır.

RBS ile sınıfların ve modüllerin tanımını yazabilirsiniz: bir sınıfta tanımlanmış metodlar, örnek değişkenleri ve bu değişkenlerin tipleri, ve miras/mix-in ilişkisi.
RBS'nin amacı Ruby programlarında sıkça görülen desenleri desteklemektir.
RBS, union tiplerinin de dahil olduğu gelişmiş tipleri, metod aşırı yüklemeyi, ve genelleyicileri yazmaya izin verir.
Ayrıca _arayüz tipleri_ ile ördek tiplemesini de destekler.

Ruby 3.0 `rbs` gem'i ile gelmektedir, bu gem RBS ile yazılmış tip tanımlarını ayrıştırma ve işlemeye izin verir.

Aşağıdaki kod RBS için küçük bir örnektir.

``` rbs
module ChatApp
  VERSION: String

  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|`, union tip anlamına gelmektedir, `User` ya da `Bot`.

    def initialize: (String) -> void

    def post: (String, from: User | Bot) -> Message   # Metod aşırı yükleme destekleniyor.
            | (File, from: User | Bot) -> Message
  end
end
```

Daha fazla ayrıntı için [rbs gem'inin README](https://github.com/ruby/rbs)'sine bakınız.

## Ractor (deneysel)

Ractor, thread güvenliği endişeleri olmadan paralel çalıştırma özelliğini sağlamak için tasarlanan eşzamanlı soyutlama gibi bir aktör-modeldir.

Birden fazla ractor yapabilirsiniz ve bunları paralelde çalıştırabilirsiniz.
Ractor thread-güvenli paralel programlar yapmanıza izin verir çünkü ractor'lar normal nesneleri paylaşmazlar.
Ractor'lar arasındaki iletişim mesaj geçirme ile desteklenir.

Nesnelerin paylaşılmasını kısıtlamak için Ractor, Ruby'nin sözdizimine bazı kısıtlamalar getirir (birden fazla Ractor yoksa, değişiklik yoktur).

Belirtim ve gerçekleme henüz tam oturmamıştır ve ileride değişecektir, bu sebeple bu özellik deneysel olarak işaretlenmiştir ve eğer bir Ractor oluşturulursa, deneysel özellik uyarısı gösterilir.

Aşağıdaki küçük program `prime?`'ı iki ractor ile paralelde hesaplar ve iki ya da daha fazla çekirdekte ardışık bir programa göre aşağı yukarı 2 kat daha hızlıdır.

``` ruby
require 'prime'

# r1 ve r2'deki, tamsayıların gönderildiği n.prime? paralelde çalışır
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
    n.prime?
  end
end

# parametreleri gönder
r1.send 2**61 - 1
r2.send 2**61 + 15

# 1. ve 2. deyimin sonuçlarını bekle
p r1.take #=> true
p r2.take #=> true
```

Daha fazla ayrıntı için [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md)'ye bakınız.

## Zamanlayıcı (Deneysel)

`Thread#scheduler` bloklayan işlemleri kesmek için tanıtılmıştır.
Bu, var olan kodu değiştirmeden hafif eşzamanlılığa izin verir.

Şu anda desteklenen sınıf ve metodlar:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `IO#wait`, `IO#read`, `IO#write` ve ilişkili metodlar (yani `#wait_readable`, `#gets`, `#puts` vb.).
- `IO#select` *desteklenmemektedir*.

Eşzamanlılık için şu anki giriş noktası `Fiber.schedule{...}`'dır, fakat Ruby 3 yayınlandığı zaman bu durum değişebilir.

Şu anda [`Async::Scheduler`](https://github.com/socketry/async/pull/56)'da bir test zamanlayıcısı vardır.
Daha fazla ayrıntı için [`doc/scheduler.md`](https://github.com/ruby/ruby/blob/master/doc/scheduler.md)'ye bakınız. [Özellik #16786]

**DİKKAT**: Bu özellik deneyseldir.
İsim de özellik de sonraki önizleme sürümlerinde değişecektir.

## Diğer Dikkate Değer Yeni Özellikler

* Sağ atama ifadesi eklendi.

  ``` ruby
  fib(10) => x
  p x #=> 55
  ```

* Sonsuz metod tanımı eklendi.

  ``` ruby
  def square(x) = x * x
  ```

* Bulma deseni eklendi.

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* `Hash#except` şimdi gömülü.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* Hafıza görünümü deneysel bir özellik olarak eklendi.

    * Bu, uzantı kütüphaneleri arasında sayısal bir dizi ve bir biteşlem görüntüsü gibi ham bir hafıza alanını takas etmek için yeni bir C-API'ıdır.
    Uzantı kütüphaneleri ayrıca şekil, öğe biçimi, vb. içeren hafıza alanlarının üstverilerini de paylaşır.
    Bu gibi üstverileri kullanarak, uzantı kütüphaneleri çok boyutlu dizileri bile uygun şekilde paylaşabilirler.
    Bu özellik Python'ın tampon protokolüne danışılarak tasarlanmıştır.

## Performans iyileştirmeleri

* Birçok geliştirme MJIT'te gerçeklenmiştir.
Ayrıntılar için NEWS'e bakınız.

## 2.7'den bu yana diğer dikkate değer değişiklikler

* Anahtar sözcük argümanları diğer argümanlardan ayrılmıştır.
  * Prensipte, Ruby 2.7'de bir uyarı yazdıran kod çalışmayacaktır.
  Ayrıntılar için [belgeye](https://www.ruby-lang.org/tr/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) bakınız.
  * Bu arada argüman yönlendirme artık sondaki argümanları da destekliyor.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* `$SAFE` özelliği tamamiyle silindi; şimdi sadece normal bir global değişken.

* Geriizleme sırası Ruby 2.5'te tersine çevrildi, fakat bu iptal edildi.
Şimdi Ruby 2.4'teki gibi bir davranış söz konusu; hata mesajı ve istisnanın meydana geldiği satır numarası ilk olarak yazdırılır, daha sonra ise çağırıcıları yazdırılır.

* Bazı standart kütüphaneler güncellendi.
  * RubyGems 3.2.0.rc.1
  * Bundler 2.2.0.rc.1
  * IRB 1.2.6
  * Reline 0.1.5

* Aşağıdaki kütüphaneler artık paketlenmiyor.
Bu özellikleri kullanmak için denk gelen gem'leri kurun.
  * net-telnet
  * xmlrpc

* Şu varsayılan gem'ler paketlenmiş gem'ler olarak düzenlendi.
  * rexml
  * rss

* stdlib varsayılan gemler olarak düzenlendi.
Aşağıdaki varsayılan gem'ler rubygems.org'da yayınlandı.
  * abbrev
  * base64
  * English
  * erb
  * find
  * io-nonblock
  * io-wait
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * nkf
  * open-uri
  * optparse
  * resolv
  * resolv-replace
  * rinda
  * securerandom
  * set
  * shellwords
  * tempfile
  * time
  * tmpdir
  * tsort
  * weakref

Daha fazla ayrıntı için [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview1/NEWS.md)'e ya da [işleme loglarına](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1) bakınız.

{% assign release = site.data.releases | where: "version", "3.0.0-preview1" | first %}

Bu değişikliklerle birlikte, 2.7.0'dan bu yana [{{ release.stats.files_changed }} dosya değişti, {{ release.stats.insertions }} ekleme(+) yapıldı, {{ release.stats.deletions }} silme(-) yapıldı](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)!

Lütfen Ruby 3.0.0-preview1'i deneyin, ve bize herhangi bir geri bildirim verin!

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

## 3.0.0-preview2 tanıtımı

Bir statik tip ayrıştırması özelliği olan ["type-profiler"](https://github.com/mame/ruby-type-profiler)'ı dahil etmeyi düşünüyoruz.
Takipte kalın!

## Ruby nedir

Ruby ilk olarak Matz (Yukihiro Matsumoto) tarafından 1993'te geliştirilmiştir, ve şu anda Açık Kaynak olarak geliştirilmektedir.
Birçok platformda çalışır ve tüm dünyada genellikle web geliştirmesi için kullanılır.
