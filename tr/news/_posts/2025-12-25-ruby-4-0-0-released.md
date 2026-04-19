---
layout: news_post
title: "Ruby 4.0.0 Yayınlandı"
author: "naruse"
translator: "Ender Ahmet Yurt"
date: 2025-12-25 00:00:00 +0000
lang: tr
---

{% assign release = site.data.releases | where: "version", "4.0.0" | first %}
Ruby {{ release.version }} sürümünün yayınlandığını duyurmaktan mutluluk duyuyoruz.
Ruby 4.0, "Ruby Box" ve "ZJIT" sunuyor ve birçok iyileştirme ekliyor.

## Ruby Box

Ruby Box, tanımlamalar hakkında ayrım sağlamak için yeni bir (deneysel) özelliktir. Ruby Box, `RUBY_BOX=1` ortam değişkeni belirtildiğinde etkinleştirilir. Sınıf `Ruby::Box`'tır.

Bir box içinde yüklenen tanımlamalar box içinde izole edilir. Ruby Box, monkey patch'leri, global/sınıf değişkenlerinin değişikliklerini, sınıf/modül tanımlamalarını ve yüklenmiş native/ruby kütüphanelerini diğer box'lardan izole edebilir/ayırabilir.

Beklenen kullanım durumları şunlardır:

* Test durumları bir şeyi geçersiz kılmak için monkey patch kullandığında diğer testleri korumak için test durumlarını box içinde çalıştırma
* Bir Ruby sürecindeki bir uygulama sunucusunda mavi-yeşil dağıtımı yürütmek için web uygulaması box'larını paralel olarak çalıştırma
* Ruby kodu kullanarak yanıt farkını kontrol ederek belirli bir süre için bağımlılık güncellemelerini değerlendirmek için web uygulaması box'larını paralel olarak çalıştırma
* Bir tür "paket" (üst düzey) API'sini uygulamak için temel (alt düzey) API olarak kullanılır (henüz tasarlanmamıştır)

"Ruby Box" detayı için, [Ruby::Box](https://docs.ruby-lang.org/en/master/Ruby/Box.html)'a bakın.
[[Feature #21311]] [[Misc #21385]]

## ZJIT

ZJIT, YJIT'in yeni nesli olarak geliştirilen yeni bir tam zamanında (JIT) derleyicisidir. ZJIT desteği ile Ruby oluşturmak için Rust 1.85.0 veya daha yenisine ihtiyacınız vardır ve ZJIT, `--zjit` belirtildiğinde etkinleştirilir.

Ruby için yeni bir derleyici oluşturuyoruz çünkü hem performans tavanını yükseltmek (daha büyük derleme birimi boyutu ve SSA IR) hem de daha fazla dış katkıyı teşvik etmek istiyoruz (daha geleneksel bir metot derleyicisi olarak). Daha fazla ayrıntı için [blog yazımıza](https://railsatscale.com/2025-12-24-launch-zjit/) bakın.
<!-- blog yazısı 2025-12-24 9:00am UTC'de otomatik olarak yayınlanacak. -->

ZJIT yorumlayıcıdan daha hızlıdır, ancak henüz YJIT kadar hızlı değildir. ZJIT ile deneme yapmanızı öneriyoruz, ancak şimdilik onu üretime dağıtmaktan kaçının. Ruby 4.1 ZJIT için bizi takip edin.

## Ractor İyileştirmeleri

Ruby'nin paralel yürütme mekanizması olan Ractor, birkaç iyileştirme aldı. Mesaj gönderme ve alma ile ilgili sorunları çözmek için yeni bir sınıf olan `Ractor::Port` tanıtıldı ([blog yazımıza](https://dev.to/ko1/ractorport-revamping-the-ractor-api-98) bakın). Ek olarak, `Ractor.shareable_proc`, Ractor'lar arasında `Proc` nesnelerini paylaşmayı kolaylaştırır.

Performans tarafında, birçok dahili veri yapısı, global bir kilit üzerindeki çekişmeyi önemli ölçüde azaltmak ve daha iyi paralelliğin kilidini açmak için iyileştirildi. Ractor'lar artık daha az dahili veri paylaşıyor, bu da paralel olarak çalışırken daha az CPU önbellek çekişmesi ile sonuçlanıyor.

Ractor ilk olarak Ruby 3.0'da deneysel bir özellik olarak tanıtıldı. Gelecek yıl "deneysel" durumunu kaldırmayı hedefliyoruz.

## Dil değişiklikleri

* `*nil` artık `nil.to_a` çağırmaz, benzer şekilde `**nil`
  `nil.to_hash` çağırmaz.  [[Feature #21047]]

* Bir satırın başındaki mantıksal ikili operatörler (`||`, `&&`, `and` ve `or`)
  önceki satırı devam ettirir, akıcı nokta gibi.
  Aşağıdaki kod örnekleri eşittir:

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

    Önceden:

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    ```ruby
    if condition1 &&
       condition2
      ...
    end
    ```

    [[Feature #20925]]

## Temel sınıf güncellemeleri

Not: Yalnızca öne çıkan sınıf güncellemelerini listeliyoruz.

* Array

    * `Array#rfind`, `array.reverse_each.find`'a daha verimli bir alternatif olarak eklendi [[Feature #21678]]
    * `Array#find`, `Enumerable#find`'ın daha verimli bir geçersiz kılması olarak eklendi [[Feature #21678]]
* Binding

    * `Binding#local_variables` artık numaralı parametreleri içermez.
      Ayrıca, `Binding#local_variable_get`, `Binding#local_variable_set` ve
      `Binding#local_variable_defined?` numaralı parametreleri işlemeyi reddeder.
      [[Bug #21049]]

    * `Binding#implicit_parameters`, `Binding#implicit_parameter_get` ve
      `Binding#implicit_parameter_defined?` numaralı parametrelere ve "it" parametresine
      erişmek için eklendi. [[Bug #21049]]

* Enumerator

    * `Enumerator.produce` artık enumerator'ün boyutunu belirtmek için
      isteğe bağlı bir `size` anahtar kelime argümanı kabul eder. Bu bir tamsayı,
      `Float::INFINITY`, çağrılabilir bir nesne (lambda gibi) veya
      bilinmeyen boyutu belirtmek için `nil` olabilir. Belirtilmediğinde,
      boyut varsayılan olarak `Float::INFINITY`'dir.

        ```ruby
        # Sonsuz enumerator
        enum = Enumerator.produce(1, size: Float::INFINITY, &:succ)
        enum.size  # => Float::INFINITY

        # Bilinen/hesaplanabilir boyuta sahip sonlu enumerator
        abs_dir = File.expand_path("./baz") # => "/foo/bar/baz"
        traverser = Enumerator.produce(abs_dir, size: -> { abs_dir.count("/") + 1 }) {
          raise StopIteration if it == "/"
          File.dirname(it)
        }
        traverser.size  # => 4
        ```

      [[Feature #21701]]

* ErrorHighlight

    * Bir ArgumentError yükseldiğinde, artık hem metot çağrısı (çağıran)
      hem de metot tanımı (çağrılan) için kod parçacıkları görüntüler.
      [[Feature #21543]]

      ```
      test.rb:1:in 'Object#add': wrong number of arguments (given 1, expected 2) (ArgumentError)

          caller: test.rb:3
          | add(1)
            ^^^
          callee: test.rb:1
          | def add(x, y) = x + y
                ^^^
              from test.rb:3:in '<main>'
      ```

* Fiber

    * `Kernel#raise`'e benzer şekilde `Fiber#raise(cause:)` argümanı için
      destek tanıtıldı. [[Feature #21360]]

* Fiber::Scheduler

    * Bir fiber'ı verilen istisna ile kesmek için `Fiber::Scheduler#fiber_interrupt`
      tanıtıldı. İlk kullanım durumu, IO işlemi kapatıldığında engelleyici bir IO
      işleminde bekleyen bir fiber'ı kesmektir.
      [[Feature #21166]]

    * Sinyal istisnaları devre dışı bırakıldığında fiber zamanlayıcının işlemeye
      devam etmesine izin vermek için `Fiber::Scheduler#yield` tanıtıldı.
      [[Bug #21633]]

    * Asenkron `IO#close` için `Fiber::Scheduler#io_close` hook'u yeniden tanıtıldı.

    * IO yazma arabelleğini boşaltırken `Fiber::Scheduler#io_write` çağrıldı.
      [[Bug #21789]]

* File

    * `File::Stat#birthtime` artık Linux'ta çekirdek ve dosya sistemi tarafından
      desteklendiğinde statx sistem çağrısı aracılığıyla kullanılabilir.
      [[Feature #21205]]

* IO

    * `IO.select` zaman aşımı argümanı olarak `Float::INFINITY` kabul eder.
      [[Feature #20610]]

    * Kullanımdan kaldırılan bir davranış, `IO` sınıfı metodları ile öndeki `|`
      ile süreç oluşturma, kaldırıldı.  [[Feature #19630]]

* Kernel

    * `Kernel#inspect` artık `#inspect` dizesinde hangi örnek değişkenlerinin
      görüntüleneceğini kontrol etmeye izin veren bir `#instance_variables_to_inspect`
      metodunun varlığını kontrol eder:

        ```ruby
        class DatabaseConfig
          def initialize(host, user, password)
            @host = host
            @user = user
            @password = password
          end

          private def instance_variables_to_inspect = [:@host, :@user]
        end

        conf = DatabaseConfig.new("localhost", "root", "hunter2")
        conf.inspect #=> #<DatabaseConfig:0x0000000104def350 @host="localhost", @user="root">
        ```

        [[Feature #21219]]

    * Kullanımdan kaldırılan bir davranış, `Kernel#open` ile öndeki `|` ile
      süreç oluşturma, kaldırıldı.  [[Feature #19630]]

* Math

    * `Math.log1p` ve `Math.expm1` eklendi. [[Feature #21527]]

* Pathname

    * Pathname varsayılan bir gem'den Ruby'nin temel bir sınıfına yükseltildi.
      [[Feature #17473]]

* Proc

    * `Proc#parameters` artık anonim isteğe bağlı parametreleri `[:opt, nil]`
      yerine `[:opt]` olarak gösterir, bu da çıktıyı anonim parametre gerekli
      olduğundaki ile tutarlı hale getirir. [[Bug #20974]]

* Ractor

    * Ractor'lar arasında iletişim kurmak için yeni bir senkronizasyon mekanizması
      için `Ractor::Port` sınıfı eklendi. [[Feature #21262]]

        ```ruby
        port1 = Ractor::Port.new
        port2 = Ractor::Port.new
        Ractor.new port1, port2 do |port1, port2|
          port1 << 1
          port2 << 11
          port1 << 2
          port2 << 12
        end
        2.times{ p port1.receive } #=> 1, 2
        2.times{ p port2.receive } #=> 11, 12
        ```

        `Ractor::Port` aşağıdaki metodları sağlar:

        * `Ractor::Port#receive`
        * `Ractor::Port#send` (veya `Ractor::Port#<<`)
        * `Ractor::Port#close`
        * `Ractor::Port#closed?`

        Sonuç olarak, `Ractor.yield` ve `Ractor#take` kaldırıldı.

    * Bir Ractor'ın sonlandırılmasını beklemek için `Ractor#join` ve `Ractor#value`
      eklendi. Bunlar `Thread#join` ve `Thread#value`'ya benzer.

    * `Ractor#join`'i uygulamak için dahili olarak kullanılan alt düzey arayüzler
      olarak `Ractor#monitor` ve `Ractor#unmonitor` eklendi.

    * `Ractor.select` artık yalnızca Ractor'ları ve Port'ları kabul eder. Ractor'lar
      verilirse, bir Ractor sonlandığında döner.

    * `Ractor#default_port` eklendi. Her `Ractor`'ın, `Ractor.send`, `Ractor.receive`
      tarafından kullanılan bir varsayılan portu vardır.

    * `Ractor#close_incoming` ve `Ractor#close_outgoing` kaldırıldı.

    * Paylaşılabilir Proc veya lambda yapmak için `Ractor.shareable_proc` ve
      `Ractor.shareable_lambda` tanıtıldı.
      [[Feature #21550]], [[Feature #21557]]

* Range

    * `Range#to_set` artık sonsuz aralıklarla ilgili sorunları önlemek için boyut
      kontrolleri yapar. [[Bug #21654]]

    * `Range#overlap?` artık sonsuz (sınırsız) aralıkları doğru şekilde işler.
      [[Bug #21185]]

    * Başlangıçsız tamsayı aralıklarında `Range#max` davranışı düzeltildi.
      [[Bug #21174]] [[Bug #21175]]

* Ruby

    * Ruby ile ilgili sabitleri içeren yeni bir üst düzey `Ruby` modülü tanımlandı.
      Bu modül Ruby 3.4'te ayrıldı ve şimdi resmi olarak tanımlandı. [[Feature #20884]]

* Ruby::Box

    * Tanımlamalar hakkında ayrım sağlamak için yeni bir (deneysel) özellik.
      "Ruby Box" detayı için, [doc/language/box.md](https://docs.ruby-lang.org/en/4.0/language/box_md.html)'ye bakın.
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` artık otomatik yüklenen bir stdlib sınıfı yerine temel bir sınıftır.
      [[Feature #21216]]

    * `Set#inspect` artık literal dizilere benzer şekilde daha basit bir görüntü kullanır.
      (örn. `#<Set: {1, 2, 3}>` yerine `Set[1, 2, 3]`). [[Feature #21389]]

    * `Set#to_set` ve `Enumerable#to_set`'e argüman geçirmek artık kullanımdan kaldırıldı.
      [[Feature #21390]]

* Socket

    * `Socket.tcp` ve `TCPSocket.new`, ilk bağlantı için zaman aşımını belirtmek için
      `open_timeout` anahtar kelime argümanını kabul eder. [[Feature #21347]]
    * `TCPSocket.new`'de kullanıcı tarafından belirtilen bir zaman aşımı oluştuğunda,
      daha önce duruma bağlı olarak `Errno::ETIMEDOUT` veya `IO::TimeoutError`
      yükseltilebilirdi. Bu davranış, artık `IO::TimeoutError`'ın tutarlı bir
      şekilde yükseltilmesi için birleştirildi.
      (Lütfen `Socket.tcp`'de, benzer durumlarda hala `Errno::ETIMEDOUT`'un
      yükseltilebileceği durumlar olduğunu ve her iki durumda da zaman aşımı işletim
      sistemi düzeyinde oluştuğunda `Errno::ETIMEDOUT`'un yükseltilebileceğini unutmayın.)

* String

    * Unicode, Versiyon 17.0.0'a ve Emoji Versiyon 17.0'a güncellendi.
      [[Feature #19908]][[Feature #20724]][[Feature #21275]] (Regexp için de geçerlidir)

    * `String#strip`, `strip!`, `lstrip`, `lstrip!`, `rstrip` ve `rstrip!`
       `*selectors` argümanlarını kabul edecek şekilde genişletildi. [[Feature #21552]]

* Thread

    * `Kernel#raise`'e benzer şekilde `Thread#raise(cause:)` argümanı için
      destek tanıtıldı. [[Feature #21360]]

## Stdlib güncellemeleri

Yalnızca önemli özellik değişiklikleri olan stdlib değişikliklerini listeliyoruz.

Diğer değişiklikler aşağıdaki bölümlerde listelenmiştir. Ayrıca GitHub sürümleri varsa, önceki paketlenmiş sürüm olan Ruby 3.4.0'dan yayın geçmişini listeledik.

Aşağıdaki paketlenmiş gem'ler varsayılan gem'lerden yükseltildi.

* ostruct 0.6.3
  * 0.6.1'den [v0.6.2][ostruct-v0.6.2], [v0.6.3][ostruct-v0.6.3]'e
* pstore 0.2.0
  * 0.1.4'ten [v0.2.0][pstore-v0.2.0]'a
* benchmark 0.5.0
  * 0.4.0'dan [v0.4.1][benchmark-v0.4.1], [v0.5.0][benchmark-v0.5.0]'a
* logger 1.7.0
  * 1.6.4'ten [v1.6.5][logger-v1.6.5], [v1.6.6][logger-v1.6.6], [v1.7.0][logger-v1.7.0]'a
* rdoc 7.0.2
  * 6.14.0'dan [v6.14.1][rdoc-v6.14.1], [v6.14.2][rdoc-v6.14.2], [v6.15.0][rdoc-v6.15.0], [v6.15.1][rdoc-v6.15.1], [v6.16.0][rdoc-v6.16.0], [v6.16.1][rdoc-v6.16.1], [v6.17.0][rdoc-v6.17.0], [v7.0.0][rdoc-v7.0.0], [v7.0.1][rdoc-v7.0.1], [v7.0.2][rdoc-v7.0.2], [v7.0.3][rdoc-v7.0.3]'e
* win32ole 1.9.2
  * 1.9.1'den [v1.9.2][win32ole-v1.9.2]'ye
* irb 1.16.0
  * 1.14.3'ten [v1.15.0][irb-v1.15.0], [v1.15.1][irb-v1.15.1], [v1.15.2][irb-v1.15.2], [v1.15.3][irb-v1.15.3], [v1.16.0][irb-v1.16.0]'a
* reline 0.6.3
  * 0.6.0'dan [v0.6.1][reline-v0.6.1], [v0.6.2][reline-v0.6.2], [v0.6.3][reline-v0.6.3]'e
* readline 0.0.4
* fiddle 1.1.8
  * 1.1.6'dan [v1.1.7][fiddle-v1.1.7], [v1.1.8][fiddle-v1.1.8]'e

Aşağıdaki varsayılan gem eklendi.

* win32-registry 0.1.2

Aşağıdaki varsayılan gem'ler güncellendi.

* RubyGems 4.0.3
* bundler 4.0.3
* date 3.5.1
  * 3.4.1'den [v3.5.0][date-v3.5.0], [v3.5.1][date-v3.5.1]'e
* delegate 0.6.1
  * 0.4.0'dan [v0.5.0][delegate-v0.5.0], [v0.6.0][delegate-v0.6.0], [v0.6.1][delegate-v0.6.1]'e
* digest 3.2.1
  * 3.2.0'dan [v3.2.1][digest-v3.2.1]'e
* english 0.8.1
  * 0.8.0'dan [v0.8.1][english-v0.8.1]'e
* erb 6.0.1
  * 4.0.4'ten [v5.1.2][erb-v5.1.2], [v5.1.3][erb-v5.1.3], [v6.0.0][erb-v6.0.0], [v6.0.1][erb-v6.0.1]'e
* error_highlight 0.7.1
* etc 1.4.6
* fcntl 1.3.0
  * 1.2.0'dan [v1.3.0][fcntl-v1.3.0]'a
* fileutils 1.8.0
  * 1.7.3'ten [v1.8.0][fileutils-v1.8.0]'a
* forwardable 1.4.0
  * 1.3.3'ten [v1.4.0][forwardable-v1.4.0]'a
* io-console 0.8.2
  * 0.8.1'den [v0.8.2][io-console-v0.8.2]'ye
* io-nonblock 0.3.2
* io-wait 0.4.0
  * 0.3.2'den [v0.3.3][io-wait-v0.3.3], [v0.3.5.test1][io-wait-v0.3.5.test1], [v0.3.5][io-wait-v0.3.5], [v0.3.6][io-wait-v0.3.6], [v0.4.0][io-wait-v0.4.0]'a
* ipaddr 1.2.8
* json 2.18.0
  * 2.9.1'den [v2.10.0][json-v2.10.0], [v2.10.1][json-v2.10.1], [v2.10.2][json-v2.10.2], [v2.11.0][json-v2.11.0], [v2.11.1][json-v2.11.1], [v2.11.2][json-v2.11.2], [v2.11.3][json-v2.11.3], [v2.12.0][json-v2.12.0], [v2.12.1][json-v2.12.1], [v2.12.2][json-v2.12.2], [v2.13.0][json-v2.13.0], [v2.13.1][json-v2.13.1], [v2.13.2][json-v2.13.2], [v2.14.0][json-v2.14.0], [v2.14.1][json-v2.14.1], [v2.15.0][json-v2.15.0], [v2.15.1][json-v2.15.1], [v2.15.2][json-v2.15.2], [v2.16.0][json-v2.16.0], [v2.17.0][json-v2.17.0], [v2.17.1][json-v2.17.1], [v2.18.0][json-v2.18.0]'a
* net-http 0.9.1
  * 0.6.0'dan [v0.7.0][net-http-v0.7.0], [v0.8.0][net-http-v0.8.0], [v0.9.0][net-http-v0.9.0], [v0.9.1][net-http-v0.9.1]'e
* openssl 4.0.0
  * 3.3.1'den [v3.3.2][openssl-v3.3.2], [v4.0.0][openssl-v4.0.0]'a
* optparse 0.8.1
  * 0.6.0'dan [v0.7.0][optparse-v0.7.0], [v0.8.0][optparse-v0.8.0], [v0.8.1][optparse-v0.8.1]'e
* pp 0.6.3
  * 0.6.2'den [v0.6.3][pp-v0.6.3]'e
* prism 1.7.0
  * 1.5.2'den [v1.6.0][prism-v1.6.0], [v1.7.0][prism-v1.7.0]'a
* psych 5.3.1
  * 5.2.2'den [v5.2.3][psych-v5.2.3], [v5.2.4][psych-v5.2.4], [v5.2.5][psych-v5.2.5], [v5.2.6][psych-v5.2.6], [v5.3.0][psych-v5.3.0], [v5.3.1][psych-v5.3.1]'e
* resolv 0.7.0
  * 0.6.2'den [v0.6.3][resolv-v0.6.3], [v0.7.0][resolv-v0.7.0]'a
* stringio 3.2.0
  * 3.1.2'den [v3.1.3][stringio-v3.1.3], [v3.1.4][stringio-v3.1.4], [v3.1.5][stringio-v3.1.5], [v3.1.6][stringio-v3.1.6], [v3.1.7][stringio-v3.1.7], [v3.1.8][stringio-v3.1.8], [v3.1.9][stringio-v3.1.9], [v3.2.0][stringio-v3.2.0]'a
* strscan 3.1.6
  * 3.1.2'den [v3.1.3][strscan-v3.1.3], [v3.1.4][strscan-v3.1.4], [v3.1.5][strscan-v3.1.5], [v3.1.6][strscan-v3.1.6]'ya
* time 0.4.2
  * 0.4.1'den [v0.4.2][time-v0.4.2]'ye
* timeout 0.6.0
  * 0.4.3'ten [v0.4.4][timeout-v0.4.4], [v0.5.0][timeout-v0.5.0], [v0.6.0][timeout-v0.6.0]'a
* uri 1.1.1
  * 1.0.4'ten [v1.1.0][uri-v1.1.0], [v1.1.1][uri-v1.1.1]'e
* weakref 0.1.4
  * 0.1.3'ten [v0.1.4][weakref-v0.1.4]'e
* zlib 3.2.2
  * 3.2.1'den [v3.2.2][zlib-v3.2.2]'ye

Aşağıdaki paketlenmiş gem'ler güncellendi.

* minitest 6.0.0
* power_assert 3.0.1
  * 2.0.5'ten [v3.0.0][power_assert-v3.0.0], [v3.0.1][power_assert-v3.0.1]'e
* rake 13.3.1
  * 13.2.1'den [v13.3.0][rake-v13.3.0], [v13.3.1][rake-v13.3.1]'e
* test-unit 3.7.3
  * 3.6.7'den [3.6.8][test-unit-3.6.8], [3.6.9][test-unit-3.6.9], [3.7.0][test-unit-3.7.0], [3.7.1][test-unit-3.7.1], [3.7.2][test-unit-3.7.2], [3.7.3][test-unit-3.7.3], [3.7.4][test-unit-3.7.4], [3.7.5][test-unit-3.7.5]'e
* rexml 3.4.4
* rss 0.3.2
  * 0.3.1'den [0.3.2][rss-0.3.2]'ye
* net-ftp 0.3.9
  * 0.3.8'den [v0.3.9][net-ftp-v0.3.9]'a
* net-imap 0.6.2
  * 0.5.8'den [v0.5.9][net-imap-v0.5.9], [v0.5.10][net-imap-v0.5.10], [v0.5.11][net-imap-v0.5.11], [v0.5.12][net-imap-v0.5.12], [v0.5.13][net-imap-v0.5.13], [v0.6.0][net-imap-v0.6.0], [v0.6.1][net-imap-v0.6.1], [v0.6.2][net-imap-v0.6.2]'ye
* net-smtp 0.5.1
  * 0.5.0'dan [v0.5.1][net-smtp-v0.5.1]'e
* matrix 0.4.3
  * 0.4.2'den [v0.4.3][matrix-v0.4.3]'e
* prime 0.1.4
  * 0.1.3'ten [v0.1.4][prime-v0.1.4]'e
* rbs 3.10.0
  * 3.8.0'dan [v3.8.1][rbs-v3.8.1], [v3.9.0.dev.1][rbs-v3.9.0.dev.1], [v3.9.0.pre.1][rbs-v3.9.0.pre.1], [v3.9.0.pre.2][rbs-v3.9.0.pre.2], [v3.9.0][rbs-v3.9.0], [v3.9.1][rbs-v3.9.1], [v3.9.2][rbs-v3.9.2], [v3.9.3][rbs-v3.9.3], [v3.9.4][rbs-v3.9.4], [v3.9.5][rbs-v3.9.5], [v3.10.0.pre.1][rbs-v3.10.0.pre.1], [v3.10.0.pre.2][rbs-v3.10.0.pre.2], [v3.10.0][rbs-v3.10.0]'a
* typeprof 0.31.1
* debug 1.11.1
  * 1.11.0'dan [v1.11.1][debug-v1.11.1]'e
* base64 0.3.0
  * 0.2.0'dan [v0.3.0][base64-v0.3.0]'a
* bigdecimal 4.0.1
  * 3.1.8'den [v3.2.0][bigdecimal-v3.2.0], [v3.2.1][bigdecimal-v3.2.1], [v3.2.2][bigdecimal-v3.2.2], [v3.2.3][bigdecimal-v3.2.3], [v3.3.0][bigdecimal-v3.3.0], [v3.3.1][bigdecimal-v3.3.1], [v4.0.0][bigdecimal-v4.0.0], [v4.0.1][bigdecimal-v4.0.1]'e
* drb 2.2.3
  * 2.2.1'den [v2.2.3][drb-v2.2.3]'e
* syslog 0.3.0
  * 0.2.0'dan [v0.3.0][syslog-v0.3.0]'a
* csv 3.3.5
  * 3.3.2'den [v3.3.3][csv-v3.3.3], [v3.3.4][csv-v3.3.4], [v3.3.5][csv-v3.3.5]'e
* repl_type_completor 0.1.12

### RubyGems ve Bundler

Ruby 4.0, RubyGems ve Bundler sürüm 4'ü paketledi. Detaylar için aşağıdaki bağlantılara bakın.

* [RubyGems/Bundler 4'e Yükseltme - RubyGems Blogu](https://blog.rubygems.org/2025/12/03/upgrade-to-rubygems-bundler-4.html)
* [4.0.0 Yayınlandı - RubyGems Blogu](https://blog.rubygems.org/2025/12/03/4.0.0-released.html)
* [4.0.1 Yayınlandı - RubyGems Blogu](https://blog.rubygems.org/2025/12/09/4.0.1-released.html)
* [4.0.2 Yayınlandı - RubyGems Blogu](https://blog.rubygems.org/2025/12/17/4.0.2-released.html)
* [4.0.3 Yayınlandı - RubyGems Blogu](https://blog.rubygems.org/2025/12/23/4.0.3-released.html)

## Desteklenen platformlar

* Windows

    * 14.0'dan (_MSC_VER 1900) eski MSVC sürümleri için destek kaldırıldı.
      Bu, artık Visual Studio 2015 veya daha yenisinin gerekli olduğu anlamına gelir.

## Uyumluluk sorunları

* `Ractor::Port` eklenmesi nedeniyle aşağıdaki metodlar Ractor'dan kaldırıldı:

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoing`

    [[Feature #21262]]

* `ObjectSpace._id2ref` kullanımdan kaldırıldı. [[Feature #15408]]

* `Process::Status#&` ve `Process::Status#>>` kaldırıldı.
  Ruby 3.3'te kullanımdan kaldırılmışlardı. [[Bug #19868]]

* `rb_path_check` kaldırıldı. Bu fonksiyon, Ruby 2.7'de kaldırılan
  `$SAFE` yol kontrolü için kullanılıyordu ve zaten kullanımdan kaldırılmıştı.
  [[Feature #20971]]

* "Yanlış sayıda argüman" `ArgumentError`'ı için geri izleme artık
  alıcının sınıf veya modül adını içerir (örneğin, `bar`'da yerine
  `Foo#bar`'da). [[Bug #21698]]

* Geri izlemeler artık `internal` çerçevelerini görüntülemiyor.
  Bu metodlar artık Ruby kaynak dosyasındaymış gibi görünür,
  diğer C ile uygulanan metodlarla tutarlı. [[Bug #20968]]

  Önce:
  ```
  ruby -e '[1].fetch_values(42)'
  <internal:array>:211:in 'Array#fetch': index 42 outside of array bounds: -1...1 (IndexError)
          from <internal:array>:211:in 'block in Array#fetch_values'
          from <internal:array>:211:in 'Array#map!'
          from <internal:array>:211:in 'Array#fetch_values'
          from -e:1:in '<main>'
  ```

  Sonra:
  ```
  $ ruby -e '[1].fetch_values(42)'
  -e:1:in 'Array#fetch_values': index 42 outside of array bounds: -1...1 (IndexError)
          from -e:1:in '<main>'
  ```

## Stdlib uyumluluk sorunları

* CGI kütüphanesi varsayılan gem'lerden kaldırıldı. Şimdi yalnızca aşağıdaki
  metodlar için `cgi/escape` sağlıyoruz:

    * `CGI.escape` ve `CGI.unescape`
    * `CGI.escapeHTML` ve `CGI.unescapeHTML`
    * `CGI.escapeURIComponent` ve `CGI.unescapeURIComponent`
    * `CGI.escapeElement` ve `CGI.unescapeElement`

    [[Feature #21258]]

* `Set`'in stdlib'den temel sınıfa taşınmasıyla birlikte, `set/sorted_set.rb`
  kaldırıldı ve `SortedSet` artık otomatik yüklenen bir sabit değil. Lütfen
  `sorted_set` gem'ini yükleyin ve `SortedSet` kullanmak için `require 'sorted_set'`
  yapın.
  [[Feature #21287]]


* Net::HTTP

    * Başlık açıkça ayarlanmadığında gövdeli istekler (örneğin, `POST`, `PUT`) için
      otomatik olarak `Content-Type` başlığını `application/x-www-form-urlencoded`
      olarak ayarlama varsayılan davranışı kaldırıldı. Uygulamanız bu otomatik
      varsayılana güveniyorsa, istekleriniz artık Content-Type başlığı olmadan
      gönderilecek ve potansiyel olarak belirli sunucularla uyumluluğu bozacaktır.
      [[GH-net-http #205]]

## C API güncellemeleri

* IO

    * `rb_thread_fd_close` kullanımdan kaldırıldı ve artık işlemsizdir. Dosya
      tanımlayıcılarını C uzantılarından Ruby koduna açmanız gerekiyorsa,
      `RUBY_IO_MODE_EXTERNAL` kullanarak bir `IO` örneği oluşturun ve kapatmak
      için `rb_io_close(io)` kullanın (bu aynı zamanda `IO` örneğindeki tüm
      bekleyen işlemleri keser ve bekler). Dosya tanımlayıcılarını doğrudan
      kapatmak bekleyen işlemleri kesmez ve tanımsız davranışlara yol açabilir.
      Başka bir deyişle, iki `IO` nesnesi aynı dosya tanımlayıcısını paylaşıyorsa,
      birini kapatmak diğerini etkilemez. [[Feature #18455]]

* GVL

    * `rb_thread_call_with_gvl` artık GVL ile veya GVL olmadan çalışır.
      Bu, gem'lerin `ruby_thread_has_gvl_p` kontrolünden kaçınmasına olanak tanır.
      Lütfen hala GVL konusunda dikkatli olun. [[Feature #20750]]

* Set

    * `Set` için bir C API'si eklendi. Aşağıdaki metodlar desteklenir:
      [[Feature #21459]]

        * `rb_set_foreach`
        * `rb_set_new`
        * `rb_set_new_capa`
        * `rb_set_lookup`
        * `rb_set_add`
        * `rb_set_clear`
        * `rb_set_delete`
        * `rb_set_size`

## Uygulama iyileştirmeleri

* `Class#new` (örn. `Object.new`) tüm durumlarda daha hızlıdır, ancak özellikle anahtar kelime argümanları geçirirken. Bu aynı zamanda YJIT ve ZJIT'e de entegre edilmiştir. [[Feature #21254]]
* Farklı boyut havuzlarının GC yığınları artık bağımsız olarak büyür, bu da yalnızca bazı havuzlar uzun ömürlü nesneler içerdiğinde bellek kullanımını azaltır
* GC süpürmesi büyük nesnelerin sayfalarında daha hızlıdır
* "Genel ivar" nesneleri (String, Array, `TypedData`, vb.) artık daha hızlı örnek değişken erişimi için yeni bir dahili "fields" nesnesi kullanır
* GC, ilk kez kullanılana kadar dahili bir `id2ref` tablosunu tutmaktan kaçınır, `object_id` tahsisini ve GC süpürmesini daha hızlı hale getirir
* `object_id` ve `hash`, Class ve Module nesnelerinde daha hızlıdır
* Daha büyük bignum Integer'lar değişken genişlik tahsisi kullanarak gömülü kalabilir
* `Random`, `Enumerator::Product`, `Enumerator::Chain`, `Addrinfo`,
  `StringScanner` ve bazı dahili nesneler artık yazma engelleyici korumalıdır,
  bu da GC yükünü azaltır.

### Ractor

Ractor'ları daha kararlı, performanslı ve kullanılabilir hale getirmek için çok sayıda çalışma yapıldı. Bu iyileştirmeler Ractor uygulamasını deneysel durumdan çıkarmaya daha yaklaştırıyor.

* Performans iyileştirmeleri
    * Donmuş dizeler ve sembol tablosu dahili olarak kilitsiz bir hash seti kullanır [[Feature #21268]]
    * Metot önbellek aramaları çoğu durumda kilitlemeyi önler
    * Class (ve genel ivar) örnek değişken erişimi daha hızlıdır ve kilitlemeyi önler
    * CPU önbellek çekişmesi, ractor başına bir sayaç kullanılarak nesne tahsisinde önlenir
    * CPU önbellek çekişmesi, iş parçacığı yerel bir sayaç kullanılarak xmalloc/xfree'de önlenir
    * `object_id` çoğu durumda kilitlemeyi önler
* Hata düzeltmeleri ve kararlılık
    * Ractor'lar ve Thread'leri birleştirirken olası kilitlenmeler düzeltildi
    * Bir Ractor'da require ve autoload ile ilgili sorunlar düzeltildi
    * Ractor'lar arasında kodlama/dönüştürme sorunları düzeltildi
    * GC işlemlerinde ve metot geçersiz kılmada yarış koşulları düzeltildi
    * Bir Ractor başlatıldıktan sonra çatallanma işlemleriyle ilgili sorunlar düzeltildi
    * GC tahsis sayıları artık Ractor'lar altında doğrudur
    * GC'den sonra TracePoint'lerin çalışmaması düzeltildi [[Bug #19112]]

## JIT

* ZJIT
    * Bir [deneysel metot tabanlı JIT derleyicisi](https://docs.ruby-lang.org/en/master/jit/zjit_md.html) tanıtıldı.
       Mevcut olduğunda, ZJIT çalışma zamanında `--zjit` seçeneği ile veya `RubyVM::ZJIT.enable` çağrılarak etkinleştirilebilir.
      Ruby oluştururken, ZJIT desteğini dahil etmek için Rust 1.85.0 veya daha yenisi gereklidir.
    * Ruby 4.0.0 itibariyle, ZJIT yorumlayıcıdan daha hızlıdır, ancak henüz YJIT kadar hızlı değildir.
      ZJIT ile deneme yapmanızı öneriyoruz, ancak şimdilik onu üretime dağıtmamanızı öneririz.
    * Hedefimiz ZJIT'i YJIT'ten daha hızlı ve üretime hazır hale getirmek Ruby 4.1'de.
* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * `ratio_in_yjit` artık varsayılan yapıda çalışmaz.
          `--yjit-stats`'ta etkinleştirmek için `configure`'da `--enable-yjit=stats` kullanın.
        * TracePoint tarafından her kod geçersiz kılındığında artırılan `invalidate_everything`
          varsayılan istatistiklere eklendi.
    * `RubyVM::YJIT.enable`'a `mem_size:` ve `call_threshold:` seçenekleri eklendi.
* RJIT
    * `--rjit` kaldırıldı. Üçüncü taraf JIT API'sinin uygulamasını
      [ruby/rjit](https://github.com/ruby/rjit) deposuna taşıyacağız.

Daha fazla ayrıntı için [NEWS](https://docs.ruby-lang.org/en/{{ release.tag }}/NEWS_md.html)
veya [commit loglarına](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
bakın.

Bu değişikliklerle, Ruby 3.4.0'dan bu yana [{{ release.stats.files_changed }} dosya değişti, {{ release.stats.insertions }} ekleme(+), {{ release.stats.deletions }} silme(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)!

Mutlu Noeller, Mutlu Yıllar ve Ruby 4.0 ile Mutlu Hackleme!

## İndir

* <{{ release.url.gz }}>

      BOYUT: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      BOYUT: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      BOYUT: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby nedir

Ruby ilk olarak 1993 yılında Matz (Yukihiro Matsumoto) tarafından geliştirildi
ve şimdi Açık Kaynak olarak geliştirilmektedir. Birçok platformda çalışır
ve özellikle web geliştirme için tüm dünyada kullanılır.

[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Bug #19112]:     https://bugs.ruby-lang.org/issues/19112
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
[Bug #20968]:     https://bugs.ruby-lang.org/issues/20968
[Feature #20971]: https://bugs.ruby-lang.org/issues/20971
[Bug #20974]:     https://bugs.ruby-lang.org/issues/20974
[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]:     https://bugs.ruby-lang.org/issues/21049
[Feature #21166]: https://bugs.ruby-lang.org/issues/21166
[Bug #21174]:     https://bugs.ruby-lang.org/issues/21174
[Bug #21175]:     https://bugs.ruby-lang.org/issues/21175
[Bug #21185]:     https://bugs.ruby-lang.org/issues/21185
[Feature #21205]: https://bugs.ruby-lang.org/issues/21205
[Feature #21216]: https://bugs.ruby-lang.org/issues/21216
[Feature #21219]: https://bugs.ruby-lang.org/issues/21219
[Feature #21254]: https://bugs.ruby-lang.org/issues/21254
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
[Feature #21268]: https://bugs.ruby-lang.org/issues/21268
[Feature #21262]: https://bugs.ruby-lang.org/issues/21262
[Feature #21275]: https://bugs.ruby-lang.org/issues/21275
[Feature #21287]: https://bugs.ruby-lang.org/issues/21287
[Feature #21311]: https://bugs.ruby-lang.org/issues/21311
[Feature #21347]: https://bugs.ruby-lang.org/issues/21347
[Feature #21360]: https://bugs.ruby-lang.org/issues/21360
[Misc #21385]:    https://bugs.ruby-lang.org/issues/21385
[Feature #21389]: https://bugs.ruby-lang.org/issues/21389
[Feature #21390]: https://bugs.ruby-lang.org/issues/21390
[Feature #21459]: https://bugs.ruby-lang.org/issues/21459
[Feature #21527]: https://bugs.ruby-lang.org/issues/21527
[Feature #21543]: https://bugs.ruby-lang.org/issues/21543
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21633]:     https://bugs.ruby-lang.org/issues/21633
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21678]: https://bugs.ruby-lang.org/issues/21678
[Bug #21698]:     https://bugs.ruby-lang.org/issues/21698
[Feature #21701]: https://bugs.ruby-lang.org/issues/21701
[Bug #21789]:     https://bugs.ruby-lang.org/issues/21789
[GH-net-http #205]: https://github.com/ruby/net-http/issues/205
[ostruct-v0.6.2]: https://github.com/ruby/ostruct/releases/tag/v0.6.2
[ostruct-v0.6.3]: https://github.com/ruby/ostruct/releases/tag/v0.6.3
[pstore-v0.2.0]: https://github.com/ruby/pstore/releases/tag/v0.2.0
[benchmark-v0.4.1]: https://github.com/ruby/benchmark/releases/tag/v0.4.1
[benchmark-v0.5.0]: https://github.com/ruby/benchmark/releases/tag/v0.5.0
[logger-v1.6.5]: https://github.com/ruby/logger/releases/tag/v1.6.5
[logger-v1.6.6]: https://github.com/ruby/logger/releases/tag/v1.6.6
[logger-v1.7.0]: https://github.com/ruby/logger/releases/tag/v1.7.0
[rdoc-v6.14.1]: https://github.com/ruby/rdoc/releases/tag/v6.14.1
[rdoc-v6.14.2]: https://github.com/ruby/rdoc/releases/tag/v6.14.2
[rdoc-v6.15.0]: https://github.com/ruby/rdoc/releases/tag/v6.15.0
[rdoc-v6.15.1]: https://github.com/ruby/rdoc/releases/tag/v6.15.1
[rdoc-v6.16.0]: https://github.com/ruby/rdoc/releases/tag/v6.16.0
[rdoc-v6.16.1]: https://github.com/ruby/rdoc/releases/tag/v6.16.1
[rdoc-v6.17.0]: https://github.com/ruby/rdoc/releases/tag/v6.17.0
[rdoc-v7.0.0]: https://github.com/ruby/rdoc/releases/tag/v7.0.0
[rdoc-v7.0.1]: https://github.com/ruby/rdoc/releases/tag/v7.0.1
[rdoc-v7.0.2]: https://github.com/ruby/rdoc/releases/tag/v7.0.2
[rdoc-v7.0.3]: https://github.com/ruby/rdoc/releases/tag/v7.0.3
[win32ole-v1.9.2]: https://github.com/ruby/win32ole/releases/tag/v1.9.2
[irb-v1.15.0]: https://github.com/ruby/irb/releases/tag/v1.15.0
[irb-v1.15.1]: https://github.com/ruby/irb/releases/tag/v1.15.1
[irb-v1.15.2]: https://github.com/ruby/irb/releases/tag/v1.15.2
[irb-v1.15.3]: https://github.com/ruby/irb/releases/tag/v1.15.3
[irb-v1.16.0]: https://github.com/ruby/irb/releases/tag/v1.16.0
[reline-v0.6.1]: https://github.com/ruby/reline/releases/tag/v0.6.1
[reline-v0.6.2]: https://github.com/ruby/reline/releases/tag/v0.6.2
[reline-v0.6.3]: https://github.com/ruby/reline/releases/tag/v0.6.3
[fiddle-v1.1.7]: https://github.com/ruby/fiddle/releases/tag/v1.1.7
[fiddle-v1.1.8]: https://github.com/ruby/fiddle/releases/tag/v1.1.8
[date-v3.5.0]: https://github.com/ruby/date/releases/tag/v3.5.0
[date-v3.5.1]: https://github.com/ruby/date/releases/tag/v3.5.1
[delegate-v0.5.0]: https://github.com/ruby/delegate/releases/tag/v0.5.0
[delegate-v0.6.0]: https://github.com/ruby/delegate/releases/tag/v0.6.0
[delegate-v0.6.1]: https://github.com/ruby/delegate/releases/tag/v0.6.1
[digest-v3.2.1]: https://github.com/ruby/digest/releases/tag/v3.2.1
[english-v0.8.1]: https://github.com/ruby/english/releases/tag/v0.8.1
[erb-v5.1.2]: https://github.com/ruby/erb/releases/tag/v5.1.2
[erb-v5.1.3]: https://github.com/ruby/erb/releases/tag/v5.1.3
[erb-v6.0.0]: https://github.com/ruby/erb/releases/tag/v6.0.0
[erb-v6.0.1]: https://github.com/ruby/erb/releases/tag/v6.0.1
[fcntl-v1.3.0]: https://github.com/ruby/fcntl/releases/tag/v1.3.0
[fileutils-v1.8.0]: https://github.com/ruby/fileutils/releases/tag/v1.8.0
[forwardable-v1.4.0]: https://github.com/ruby/forwardable/releases/tag/v1.4.0
[io-console-v0.8.2]: https://github.com/ruby/io-console/releases/tag/v0.8.2
[io-wait-v0.3.3]: https://github.com/ruby/io-wait/releases/tag/v0.3.3
[io-wait-v0.3.5.test1]: https://github.com/ruby/io-wait/releases/tag/v0.3.5.test1
[io-wait-v0.3.5]: https://github.com/ruby/io-wait/releases/tag/v0.3.5
[io-wait-v0.3.6]: https://github.com/ruby/io-wait/releases/tag/v0.3.6
[io-wait-v0.4.0]: https://github.com/ruby/io-wait/releases/tag/v0.4.0
[json-v2.10.0]: https://github.com/ruby/json/releases/tag/v2.10.0
[json-v2.10.1]: https://github.com/ruby/json/releases/tag/v2.10.1
[json-v2.10.2]: https://github.com/ruby/json/releases/tag/v2.10.2
[json-v2.11.0]: https://github.com/ruby/json/releases/tag/v2.11.0
[json-v2.11.1]: https://github.com/ruby/json/releases/tag/v2.11.1
[json-v2.11.2]: https://github.com/ruby/json/releases/tag/v2.11.2
[json-v2.11.3]: https://github.com/ruby/json/releases/tag/v2.11.3
[json-v2.12.0]: https://github.com/ruby/json/releases/tag/v2.12.0
[json-v2.12.1]: https://github.com/ruby/json/releases/tag/v2.12.1
[json-v2.12.2]: https://github.com/ruby/json/releases/tag/v2.12.2
[json-v2.13.0]: https://github.com/ruby/json/releases/tag/v2.13.0
[json-v2.13.1]: https://github.com/ruby/json/releases/tag/v2.13.1
[json-v2.13.2]: https://github.com/ruby/json/releases/tag/v2.13.2
[json-v2.14.0]: https://github.com/ruby/json/releases/tag/v2.14.0
[json-v2.14.1]: https://github.com/ruby/json/releases/tag/v2.14.1
[json-v2.15.0]: https://github.com/ruby/json/releases/tag/v2.15.0
[json-v2.15.1]: https://github.com/ruby/json/releases/tag/v2.15.1
[json-v2.15.2]: https://github.com/ruby/json/releases/tag/v2.15.2
[json-v2.16.0]: https://github.com/ruby/json/releases/tag/v2.16.0
[json-v2.17.0]: https://github.com/ruby/json/releases/tag/v2.17.0
[json-v2.17.1]: https://github.com/ruby/json/releases/tag/v2.17.1
[json-v2.18.0]: https://github.com/ruby/json/releases/tag/v2.18.0
[net-http-v0.7.0]: https://github.com/ruby/net-http/releases/tag/v0.7.0
[net-http-v0.8.0]: https://github.com/ruby/net-http/releases/tag/v0.8.0
[net-http-v0.9.0]: https://github.com/ruby/net-http/releases/tag/v0.9.0
[net-http-v0.9.1]: https://github.com/ruby/net-http/releases/tag/v0.9.1
[openssl-v3.3.2]: https://github.com/ruby/openssl/releases/tag/v3.3.2
[openssl-v4.0.0]: https://github.com/ruby/openssl/releases/tag/v4.0.0
[optparse-v0.7.0]: https://github.com/ruby/optparse/releases/tag/v0.7.0
[optparse-v0.8.0]: https://github.com/ruby/optparse/releases/tag/v0.8.0
[optparse-v0.8.1]: https://github.com/ruby/optparse/releases/tag/v0.8.1
[pp-v0.6.3]: https://github.com/ruby/pp/releases/tag/v0.6.3
[prism-v1.6.0]: https://github.com/ruby/prism/releases/tag/v1.6.0
[prism-v1.7.0]: https://github.com/ruby/prism/releases/tag/v1.7.0
[psych-v5.2.3]: https://github.com/ruby/psych/releases/tag/v5.2.3
[psych-v5.2.4]: https://github.com/ruby/psych/releases/tag/v5.2.4
[psych-v5.2.5]: https://github.com/ruby/psych/releases/tag/v5.2.5
[psych-v5.2.6]: https://github.com/ruby/psych/releases/tag/v5.2.6
[psych-v5.3.0]: https://github.com/ruby/psych/releases/tag/v5.3.0
[psych-v5.3.1]: https://github.com/ruby/psych/releases/tag/v5.3.1
[resolv-v0.6.3]: https://github.com/ruby/resolv/releases/tag/v0.6.3
[resolv-v0.7.0]: https://github.com/ruby/resolv/releases/tag/v0.7.0
[stringio-v3.1.3]: https://github.com/ruby/stringio/releases/tag/v3.1.3
[stringio-v3.1.4]: https://github.com/ruby/stringio/releases/tag/v3.1.4
[stringio-v3.1.5]: https://github.com/ruby/stringio/releases/tag/v3.1.5
[stringio-v3.1.6]: https://github.com/ruby/stringio/releases/tag/v3.1.6
[stringio-v3.1.7]: https://github.com/ruby/stringio/releases/tag/v3.1.7
[stringio-v3.1.8]: https://github.com/ruby/stringio/releases/tag/v3.1.8
[stringio-v3.1.9]: https://github.com/ruby/stringio/releases/tag/v3.1.9
[stringio-v3.2.0]: https://github.com/ruby/stringio/releases/tag/v3.2.0
[strscan-v3.1.3]: https://github.com/ruby/strscan/releases/tag/v3.1.3
[strscan-v3.1.4]: https://github.com/ruby/strscan/releases/tag/v3.1.4
[strscan-v3.1.5]: https://github.com/ruby/strscan/releases/tag/v3.1.5
[strscan-v3.1.6]: https://github.com/ruby/strscan/releases/tag/v3.1.6
[time-v0.4.2]: https://github.com/ruby/time/releases/tag/v0.4.2
[timeout-v0.4.4]: https://github.com/ruby/timeout/releases/tag/v0.4.4
[timeout-v0.5.0]: https://github.com/ruby/timeout/releases/tag/v0.5.0
[timeout-v0.6.0]: https://github.com/ruby/timeout/releases/tag/v0.6.0
[uri-v1.1.0]: https://github.com/ruby/uri/releases/tag/v1.1.0
[uri-v1.1.1]: https://github.com/ruby/uri/releases/tag/v1.1.1
[weakref-v0.1.4]: https://github.com/ruby/weakref/releases/tag/v0.1.4
[zlib-v3.2.2]: https://github.com/ruby/zlib/releases/tag/v3.2.2
[power_assert-v3.0.0]: https://github.com/ruby/power_assert/releases/tag/v3.0.0
[power_assert-v3.0.1]: https://github.com/ruby/power_assert/releases/tag/v3.0.1
[rake-v13.3.0]: https://github.com/ruby/rake/releases/tag/v13.3.0
[rake-v13.3.1]: https://github.com/ruby/rake/releases/tag/v13.3.1
[test-unit-3.6.8]: https://github.com/test-unit/test-unit/releases/tag/3.6.8
[test-unit-3.6.9]: https://github.com/test-unit/test-unit/releases/tag/3.6.9
[test-unit-3.7.0]: https://github.com/test-unit/test-unit/releases/tag/3.7.0
[test-unit-3.7.1]: https://github.com/test-unit/test-unit/releases/tag/3.7.1
[test-unit-3.7.2]: https://github.com/test-unit/test-unit/releases/tag/3.7.2
[test-unit-3.7.3]: https://github.com/test-unit/test-unit/releases/tag/3.7.3
[test-unit-3.7.4]: https://github.com/test-unit/test-unit/releases/tag/3.7.4
[test-unit-3.7.5]: https://github.com/test-unit/test-unit/releases/tag/3.7.5
[rss-0.3.2]: https://github.com/ruby/rss/releases/tag/0.3.2
[net-ftp-v0.3.9]: https://github.com/ruby/net-ftp/releases/tag/v0.3.9
[net-imap-v0.5.9]: https://github.com/ruby/net-imap/releases/tag/v0.5.9
[net-imap-v0.5.10]: https://github.com/ruby/net-imap/releases/tag/v0.5.10
[net-imap-v0.5.11]: https://github.com/ruby/net-imap/releases/tag/v0.5.11
[net-imap-v0.5.12]: https://github.com/ruby/net-imap/releases/tag/v0.5.12
[net-imap-v0.5.13]: https://github.com/ruby/net-imap/releases/tag/v0.5.13
[net-imap-v0.6.0]: https://github.com/ruby/net-imap/releases/tag/v0.6.0
[net-imap-v0.6.1]: https://github.com/ruby/net-imap/releases/tag/v0.6.1
[net-imap-v0.6.2]: https://github.com/ruby/net-imap/releases/tag/v0.6.2
[net-smtp-v0.5.1]: https://github.com/ruby/net-smtp/releases/tag/v0.5.1
[matrix-v0.4.3]: https://github.com/ruby/matrix/releases/tag/v0.4.3
[prime-v0.1.4]: https://github.com/ruby/prime/releases/tag/v0.1.4
[rbs-v3.8.1]: https://github.com/ruby/rbs/releases/tag/v3.8.1
[rbs-v3.9.0.dev.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.dev.1
[rbs-v3.9.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.1
[rbs-v3.9.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.2
[rbs-v3.9.0]: https://github.com/ruby/rbs/releases/tag/v3.9.0
[rbs-v3.9.1]: https://github.com/ruby/rbs/releases/tag/v3.9.1
[rbs-v3.9.2]: https://github.com/ruby/rbs/releases/tag/v3.9.2
[rbs-v3.9.3]: https://github.com/ruby/rbs/releases/tag/v3.9.3
[rbs-v3.9.4]: https://github.com/ruby/rbs/releases/tag/v3.9.4
[rbs-v3.9.5]: https://github.com/ruby/rbs/releases/tag/v3.9.5
[rbs-v3.10.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.1
[rbs-v3.10.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.2
[rbs-v3.10.0]: https://github.com/ruby/rbs/releases/tag/v3.10.0
[debug-v1.11.1]: https://github.com/ruby/debug/releases/tag/v1.11.1
[base64-v0.3.0]: https://github.com/ruby/base64/releases/tag/v0.3.0
[bigdecimal-v3.2.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.0
[bigdecimal-v3.2.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.1
[bigdecimal-v3.2.2]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.2
[bigdecimal-v3.2.3]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.3
[bigdecimal-v3.3.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.0
[bigdecimal-v3.3.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.1
[bigdecimal-v4.0.0]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.0
[bigdecimal-v4.0.1]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.1
[drb-v2.2.3]: https://github.com/ruby/drb/releases/tag/v2.2.3
[syslog-v0.3.0]: https://github.com/ruby/syslog/releases/tag/v0.3.0
[csv-v3.3.3]: https://github.com/ruby/csv/releases/tag/v3.3.3
[csv-v3.3.4]: https://github.com/ruby/csv/releases/tag/v3.3.4
[csv-v3.3.5]: https://github.com/ruby/csv/releases/tag/v3.3.5
