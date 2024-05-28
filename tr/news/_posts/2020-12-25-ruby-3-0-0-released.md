---
layout: news_post
title: "Ruby 3.0.0 Yayınlandı"
author: "naruse"
translator: "ismailarilik"
date: 2020-12-25 00:00:00 +0000
lang: tr
---

Ruby 3.0.0'ın yayınlandığını duyurmaktan memnuniyet duyuyoruz.
2015'ten bu yana, amacı performans, eşzamanlılık ve Tipleme olan Ruby 3'ü geliştirmek için çok uğraştık.
Özellikle performans konusunda, Matz Ruby3'ün Ruby2'den 3 kat hızlı olacağını söylemişti: [Ruby 3x3](https://blog.heroku.com/ruby-3-by-3)

{% assign release = site.data.releases | where: "version", "3.0.0" | first %}

<img src='https://cache.ruby-lang.org/pub/media/ruby3x3.png' alt='Optcarrot 3000 çerçeveleri' width='100%' />

NES'in oyun emulasyonu işyükü temelli tek threadde performansı ölçen [Optcarrot kıyaslaması](https://github.com/mame/optcarrot) ile Ruby3, Ruby 2.0'dan 3 kat daha hızlı olduğunu kanıtladı!
<details>
  Bunlar şurada not edilen ortama göre ölçülmüştür: [benchmark-driver.github.io/hardware.html](https://github.com/benchmark-driver/benchmark-driver)
  [Commit 8c510e4095](https://github.com/ruby/ruby/commit/8c510e4095), Ruby 3.0 olarak kullanıldı.
  Ortamınıza ya da kıyaslamanıza göre 3 kat hız ölçemeyebilirsiniz.
</details>

Ruby 3.0.0 bu amaçları şunlar ile karşılar:
* Performans
  * MJIT
* Eşzamanlılık
  * Ractor
  * Fiber Zamanlayıcı
* Tipleme (Statik Analiz)
  * RBS
  * TypeProf

Yukarıda anlatılan performans artışı ile birlikte, Ruby 3.0 aşağıda anlatılan birçok yeni özelliği tanıtır.

## Performans

> Konferans açılış konuşmasında ilk defa "Ruby3x3"ten bahsettiğimde, çekirdek ekibin üyeleri de dahil olmak üzere birçok kişi içinden "Matz bir palavracı" diye geçirdi.
  Aslında ben de öyle hissettim.
  Fakat bunu yaptık.
  Çekirdek ekibin gerçekten de Ruby3.0'ı Ruby 2.0'dan üç kat daha hızlı yaptığını (bazı kıyaslamalarda) görmekten gurur duyuyorum. -- Matz

### MJIT

Birçok iyileştirme MJIT'te gerçeklenmiştir.
Ayrıntılar için NEWS'e bakınız.

Ruby 3.0 itibariyle, JIT'in sınırlı işyüklerinde performans iyileştirmeleri vermesi gerekiyor; oyunlar ([Optcarrot](https://github.com/mame/optcarrot)), yapay zeka ([Rubykon](https://github.com/benchmark-driver)) ya da zamanının çoğunu birkaç metodu birçok kez çağırarak geçiren herhangi bir uygulama gibi.


Ruby 3.0 [JIT'lenmiş kodun boyutunu önemli ölçüde düşürmüş olsa da](https://twitter.com/k0kubun/status/1256142302608650244), Rails gibi optimize eden işyükleri için hala hazır değildir.
Rails çok fazla metod içinde vakit geçirir, bu sebeple JIT tarafından arttırılan i-cache kaçırmalarından zarar görür.
Bu konu hakkında yapılacak iyileştirmeler için Ruby 3.1'i takipte kalın.

## Eşzamanlılık / Paralel

> Çoklu çekirdek çağındayız.
  Eşzamanlılık çok önemlidir.
  Ractor'lar ve Async Fiber'ler ile birlikte, Ruby gerçek bir eşzamanlı dil olacak. --- Matz

### Ractor (deneysel)

Ractor, thread güvenliği endişeleri olmadan paralel çalıştırma özelliğini sağlamak için tasarlanan eşzamanlı soyutlama gibi bir aktör-modeldir.

Birden fazla ractor yapabilirsiniz ve bunları paralelde çalıştırabilirsiniz.
Ractor thread-güvenli paralel programlar yapmanıza izin verir çünkü ractor'lar normal nesneleri paylaşmazlar.
Ractor'lar arasındaki iletişim mesaj geçirme ile desteklenir.

Nesnelerin paylaşılmasını kısıtlamak için Ractor, Ruby'nin sözdizimine bazı kısıtlamalar getirir (birden fazla Ractor yoksa, değişiklik yoktur).

Belirtim ve gerçekleme henüz tam oturmamıştır ve ileride değişecektir, bu sebeple bu özellik deneysel olarak işaretlenmiştir ve ilk `Ractor.new`'de "deneysel özellik" uyarısı gösterilir.

Aşağıdaki küçük program meşhur tak fonksiyonu kıyaslamasının ([Tak (function) - Wikipedia](https://en.wikipedia.org/wiki/Tak_(function))) çalışma zamanını ölçer.
Bunun için bu program 4 kere sırayla ve 4 kere de ractor'lar ile paralel olarak çalıştırılır.

``` ruby
def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # sırayla çalıştırılan sürüm
  x.report('seq'){ 4.times{ tarai(14, 7, 0) } }

  # paralel sürüm
  x.report('par'){
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
```

```
Benchmark result:
          user     system      total        real
seq  64.560736   0.001101  64.561837 ( 64.562194)
par  66.422010   0.015999  66.438009 ( 16.685797)
```

Sonuç Ubuntu 20.04, Intel(R) Core(TM) i7-6700 (4 çekirdek, 8 donanım thread'i) özelliklerine sahip bir sistemde ölçülmüştür.
Bu sonuç, paralel sürümün sırayla çalıştırılan sürümden 3,87 kez hızlı olduğunu göstermektedir.

Ayrıntılar için [doc/ractor.md](https://docs.ruby-lang.org/en/3.0/ractor_md.html)'ye bakınız.

### Fiber Zamanlayıcı

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

Bu örnek program birden çok HTTP isteğini eşzamanlı olarak gerçekleştirecektir:

``` ruby
require 'async'
require 'net/http'
require 'uri'

Async do
  ["ruby", "rails", "async"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

Bu program bir olay döngüsü sağlayan [async](https://github.com/socketry/async) gem'ini kullanır.
Bu olay döngüsü, `Net::HTTP`'nin bloklamaması için `Fiber#scheduler`'ı kullanır.
Diğer gem'ler Ruby'nin bloklamayan çalışmasını sağlamak için bu arayüzü kullanabilirler, ve bu gem'ler aynı bloklamayan çapaları destekleyebilen Ruby'nin diğer gerçeklemeleri (JRuby, TruffleRuby, vb.) ile uyumlu olabilirler.

## Statik Analiz

> 2010'lar statik olarak tiplenen programlama dillerinin yıllarıydı.
  Ruby, tip belirtimleri olmadan, soyut yorumlamaları kullanarak, statik tip kontrolüne uyum sağlamaya çalıştı.
  RBS ve TypeProf bu konulardaki ilk adımdır.
  Daha fazla adım gelecek. --- Matz

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

## Diğer Dikkate Değer Yeni Özellikler

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

* Uzun bir kodu IRB'ye yapıştırmak, Ruby 2.7.0'da gelene göre 53 kat daha hızlı.
  Örneğin, [şu örnek kodu](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) yapıştırmak için gereken zaman 11.7 saniyeden 0.22 saniyeye düşmüştür.


<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.mp4" type="video/mp4">
</video>


* IRB'ye `measure` komutu eklendi.
  Bu komut basit çalıştırma zaman ölçümü sağlamaktadır.

  ```
  irb(main):001:0> 3
  => 3
  irb(main):002:0> measure
  TIME is added.
  => nil
  irb(main):003:0> 3
  processing time: 0.000058s
  => 3
  irb(main):004:0> measure :off
  => nil
  irb(main):005:0> 3
  => 3
  ```

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

* Desen eşleştirme (`case/in`) artık deneysel değil.
  * Ayrıntılar için lütfen [desen eşleştirme belgelendirmesine](https://docs.ruby-lang.org/en/3.0/syntax/pattern_matching_rdoc.html) bakınız.
* `$SAFE` özelliği tamamiyle silindi; şimdi sadece normal bir global değişken.
* Geriizleme sırası Ruby 2.5'te tersine çevrildi, fakat bu iptal edildi.
  Şimdi Ruby 2.4'teki gibi bir davranış söz konusu; hata mesajı ve istisnanın meydana geldiği satır numarası ilk olarak yazdırılır, daha sonra ise çağırıcıları yazdırılır.
* Bazı standart kütüphaneler güncellendi.
  * RubyGems 3.2.3
  * Bundler 2.2.3
  * IRB 1.3.0
  * Reline 0.2.0
  * Psych 3.3.0
  * JSON 2.5.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Date 3.1.0
  * Digest 3.0.0
  * Fiddle 1.0.6
  * StringIO 3.0.0
  * StringScanner 3.0.0
  * vb.
* Aşağıdaki kütüphaneler artık paketlenmiyor, standart kütüphanede de değiller.
  Bu özellikleri kullanmak için denk gelen gem'leri kurun.
  * sdbm
  * webrick
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

Ayrıntılar için [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)'e ya da [işleme loglarına](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}) bakınız.

Bu değişikliklerle birlikte, 2.7.0'dan bu yana [{{ release.stats.files_changed }} dosya değişti, {{ release.stats.insertions }} ekleme(+), {{ release.stats.deletions }} silme(-) yapıldı](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}#file_bucket)!

> Ruby3.0 bir dönüm noktası.
  Dil gelişti, ayrıca uyumluluğu da korudu.
  Fakat bu bir son değil.
  Ruby gelişmeye ve çok daha iyi olmaya devam edecek.
  Takipte kalın! --- Matz

İyi tatiller, ve Ruby 3.0 ile programlamanın tadını çıkarın!

## İndirin

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
