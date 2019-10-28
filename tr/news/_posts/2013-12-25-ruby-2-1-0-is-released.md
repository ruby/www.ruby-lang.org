---
layout: news_post
title: "Ruby 2.1.0 yayınlandı."
author: "nurse"
translator: "sdogruyol"
date: 2013-12-25 16:00:00 +0000
lang: tr
---

Ruby 2.1.0 yayınlandı!

Ruby 2.1 geri uyumluluğu bozmadan bir çok iyileştirme ve hızlandırma ile beraber
gelmektedir.

Şimdi Deneyin!

## İndir

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.bz2)
  * BOYUT:  12007442 bayt
  * MD5:    1546eeb763ac7754365664be763a1e8f
  * SHA256: 1d3f4ad5f619ec15229206b6667586dcec7cc986672c8fbb8558161ecf07e277
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz)
  * BOYUT:  15076389 bayt
  * MD5:    9e6386d53f5200a3e7069107405b93f7
  * SHA256: 3538ec1f6af96ed9deb04e0965274528162726cc9ba3625dcf23648df872d09d
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.zip)
  * BOYUT:  16603067 bayt
  * MD5:    2fc3a80b56da81b906a9bb6fc7ca8399
  * SHA256: d40d7bfb39ca2e462dea61dcbbcf33426b60e6e553335c3afb39b4d827a6891c

## 2.0'dan değişiklikler

Öne çıkan değişiklikler:

* VM (Metod Önbelleği)
* RGenGC (ko1'in [RubyKaigi Sunumu](http://rubykaigi.org/2013/talk/S73) ve [RubyConf 2013 Sunumu](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf)na bakın)
* arıtımlar [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* sözdizimi değişiklikleri
  * Rasyonel/Karmaşık Kalıplar [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def'in döndürme değeri [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * GMP kullan [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0 ve RubyGems 2.2.0
* "literal".freeze artık optimize edilmiş halde[#9042](https://bugs.ruby-lang.org/issues/9042)
* Exception#cause eklendi [#8257](https://bugs.ruby-lang.org/issues/8257)
* BigDecimal, JSON, NKF, Rake, RubyGems, ve RDoc gibi kütüphaneler güncellendi
* curses kaldırıldı [#8584](https://bugs.ruby-lang.org/issues/8584)

Değişiklikleri daha detaylı gör: [Ruby deposunda NEWS](https://github.com/ruby/ruby/blob/v2_1_0/NEWS).
