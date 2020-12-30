---
layout: news_post
title: "Ruby 3.0.0 RC1 Yayınlandı"
author: "naruse"
translator: "ismailarilik"
date: 2020-12-20 00:00:00 +0000
lang: tr
---

Ruby 3.0.0-rc1'in yayınlandığını duyurmaktan memnuniyet duyuyoruz.

Bu sürüm birçok yeni özellik ve performans iyileştirmesi içermektedir.

## Statik Analiz

### RBS

RBS, Ruby programlarındaki tipleri tanımlamada kullanılan bir dildir.

RBS'yi destekleyen tip kontrol edicileri (TypeProf ve diğer araçlar da dahil), RBS tanımlamaları ile birlikte Ruby programlarını çok daha iyi anlayacaklardır.

RBS ile sınıfların ve modüllerin tanımını yazabilirsiniz: bir sınıfta tanımlanmış metodlar, örnek değişkenleri ve bu değişkenlerin tipleri, ve miras/mix-in ilişkisi.

RBS'nin amacı Ruby programlarında sıkça görülen desenleri desteklemektir.
RBS, union tiplerinin de dahil olduğu gelişmiş tipleri, metod aşırı yüklemeyi, ve genelleyicileri yazmaya izin verir.
Ayrıca _arayüz tipleri_ ile ördek tiplemesini de destekler.

Ruby 3.0 `rbs` gem'i ile gelmektedir, bu gem RBS ile yazılmış tip tanımlarını ayrıştırma ve işlemeye izin verir.
Aşağıdaki kod sınıf, modül ve sabit tanımlamalarını içeren, RBS için küçük bir örnektir.

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

### TypeProf

TypeProf, Ruby ile paketlenmiş bir tip analizi aracıdır.

Şu anda TypeProf, bir çeşit tip çıkarımı olarak hizmet vermektedir.

TypeProf, sade (tiplerin belirtilmediği) Ruby kodunu okur, hangi metodların tanımlandığını ve bu metodların nasıl kullanıldığını analiz eder, ve RBS biçiminde prototip bir tip imzası oluşturur.

İşte basit bir TypeProf demosu.

Örnek bir girdi:

``` ruby
# test.rb
class User
  def initialize(name:, age:)
    @name, @age = name, age
  end
  attr_reader :name, :age
end
User.new(name: "John", age: 20)
```

Örnek bir çıktı:

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

TypeProf'u, girdiyi "test.rb" olarak kaydederek ve "typeprof test.rb" komutunu çağırarak çalıştırabilirsiniz.

Ayrıca [TypeProf'u çevrimiçi deneyebilirsiniz](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=).
(Burası TypeProf'u sunucu tarafında çalıştırır, yani eğer çalışmazsa kusura bakmayın!)

Ayrıntılar için [belgelendirmeye](https://github.com/ruby/typeprof/blob/master/doc/doc.md) ve [demolara](https://github.com/ruby/typeprof/blob/master/doc/demo.md) bakın.

TypeProf şu anda deneysel ve oturmuş değil; Ruby'nin sadece bir alt kümesi destekleniyor, ve tip hatalarının tespit edilmesi kısıtlıdır.
Fakat TypeProf, dil özelliklerinin kapsamasını, analiz performansını ve kullanılırlığı hızlıca artırmak için gelişmektedir.
Herhangi bir geri bildirime çok ihtiyacımız var.

## Ractor (deneysel)

Ractor, thread güvenliği endişeleri olmadan paralel çalıştırma özelliğini sağlamak için tasarlanan eşzamanlı soyutlama gibi bir aktör-modeldir.

Birden fazla ractor yapabilirsiniz ve bunları paralelde çalıştırabilirsiniz.
Ractor thread-güvenli paralel programlar yapmanıza izin verir çünkü ractor'lar normal nesneleri paylaşmazlar.
Ractor'lar arasındaki iletişim mesaj geçirme ile desteklenir.

Nesnelerin paylaşılmasını kısıtlamak için Ractor, Ruby'nin sözdizimine bazı kısıtlamalar getirir (birden fazla Ractor yoksa, değişiklik yoktur).

Belirtim ve gerçekleme henüz tam oturmamıştır ve ileride değişecektir, bu sebeple bu özellik deneysel olarak işaretlenmiştir ve ilk `Ractor.new`'de "deneysel özellik" uyarısı gösterilir.

Aşağıdaki küçük program `n.prime?`'ı (`n` nispeten büyük bir tamsayıdır) iki ractor ile paralelde hesaplar.
Bu programın çalışması paralel bilgisayarda ardışık bir programa göre aşağı yukarı 2 kat daha hızlıdır.

``` ruby
require 'prime'
# r1 ve r2'deki, tamsayıların gönderildiği n.prime? paralelde çalışır
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.receive
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

Daha fazla ayrıntı için [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md)'ye bakın.

## Fiber Zamanlayıcı

`Fiber#scheduler` bloklayan işlemleri kesmek için tanıtılmıştır.
Bu, var olan kodu değiştirmeden hafif eşzamanlılığa izin verir.
Nasıl çalıştığının genel bir bakış için ["Beni Bekleme, Ruby 3'te Ölçeklenebilir Eşzamanlılık"](https://www.youtube.com/watch?v=Y29SSOS4UOc)'ı izleyin.

Şu anda desteklenen sınıf ve metodlar:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write` ve ilişkili metodlar (`#wait_readable`, `#gets`, `#puts`, vb. gibi).
- `IO#select` *desteklenmemektedir*.

(Async gem'ini bağlantılarla açıkla).
Bu örnek program birden çok HTTP isteğini eşzamanlı olarak gerçekleştirecektir:

(Bunu açıkla:)
1. async dışsal bir gem
2. async bu yeni özelliği kullanır

``` ruby
require 'async'
require 'net/http'
require 'uri'
Async do
  ["ruby", "python", "c"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

## Other Notable New Features

* Tek satır desen eşleştirme yeniden tasarlandı. (deneysel)

    * `=>` eklendi.
      Sağ taraf ataması olarak kullanılabilir.

      ```ruby
      0 => a
      p a #=> 0

      {b: 0, c: 1} => {b:}
      p b #=> 0
      ```

    * `in`, `true` ya da `false` döndürmesi için değiştirildi.

      ```ruby
      # sürüm 3.0
      0 in 1 #=> false

      # sürüm 2.7
      0 in 1 #=> NoMatchingPatternError yükseltir
      ```

* Bulma deseni eklendi. (deneysel)

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* Sonsuz metod tanımı eklendi.

  ``` ruby
  def square(x) = x * x
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
* Uzun bir kodu IRB'ye yapıştırmak, Ruby 2.7.0'da gelene göre 53 kat daha hızlı.
  Örneğin, [şu örnek kodu](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) yapıştırmak için gereken zaman 11.7 saniyeden 0.22 saniyeye düşmüştür.

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

* Desen eşleştirme (`case`/`in`) artık deneysel değil.
* `$SAFE` özelliği tamamiyle silindi; şimdi sadece normal bir global değişken.
* Geriizleme sırası Ruby 2.5'te tersine çevrildi, fakat bu iptal edildi.
  Şimdi Ruby 2.4'teki gibi bir davranış söz konusu; hata mesajı ve istisnanın meydana geldiği satır numarası ilk olarak yazdırılır, daha sonra ise çağırıcıları yazdırılır.
* Bazı standart kütüphaneler güncellendi.
  * RubyGems 3.2.2
  * Bundler 2.2.2
  * IRB 1.2.6
  * Reline 0.1.5
  * Psych 3.2.1
  * JSON 2.4.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Digest 3.0.0
  * Fiddle 1.0.4
  * StringIO 3.0.0
  * StringScanner 3.0.0
* Aşağıdaki kütüphaneler artık paketlenmiyor.
  Bu özellikleri kullanmak için denk gelen gem'leri kurun.
  * net-telnet
  * xmlrpc
* Şu varsayılan gem'ler paketlenmiş gem'ler olarak düzenlendi.
  * rexml
  * rss
* Aşağıdaki stdlib dosyaları şimdi varsayılan gemler ve rubygems.org'da yayınlandı.
  * English
  * abbrev
  * base64
  * drb
  * debug
  * erb
  * find
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * open-uri
  * optparse
  * pp
  * prettyprint
  * resolv-replace
  * resolv
  * rinda
  * set
  * securerandom
  * shellwords
  * tempfile
  * tmpdir
  * time
  * tsort
  * un
  * weakref
  * digest
  * io-nonblock
  * io-wait
  * nkf
  * pathname
  * syslog
  * win32ole

Daha fazla ayrıntı için [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_rc1/NEWS.md)'e
ya da [işleme loglarına](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_rc1)
bakın.

{% assign release = site.data.releases | where: "version", "3.0.0-rc1" | first %}

Bu değişikliklerle birlikte, 2.7.0'dan bu yana [{{ release.stats.files_changed }} dosya değişti, {{ release.stats.insertions }} ekleme yapıldı(+), {{ release.stats.deletions }} silme yapıldı(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0)!

Lütfen Ruby 3.0.0-rc1'i deneyin, ve bize herhangi bir geri bildirim verin!

## Download

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

Ruby ilk olarak Matz (Yukihiro Matsumoto) tarafından 1993'te geliştirilmiştir, ve şu anda Açık Kaynak olarak geliştirilmektedir.
Birçok platformda çalışır ve tüm dünyada genellikle web geliştirmesi için kullanılmaktadır.
