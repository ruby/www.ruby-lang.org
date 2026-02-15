---
layout: news_post
title: "Ruby 1.9.2 sürüm yayınlandı"
author: "Yugui"
lang: tr
---

Ruby 1.9.2 yayınlandı. 1.9 serisinin en son kararlı sürümü.

### Ruby 1.9.2 Hakkında

Yeni 1.9.2 aşağıdaki durumlar haricinde 1.9.1 ile tam uyumlu:

* Birçok yeni metod
* Yeni socket API (gelişmiş IPv6 desteği)
* Yeni encoding\'ler
* Birçok farklı rastgele sayı üreteclerini destekleyen yeni Random
  sınıfı
* Time tekrar tanımlandı. 2038 yılı bug\'ı temizlendi.
* regex düzeltmeleri
* $: bulunulan klasörü içermiyor.
* dl, libffi'nin üstünde gerçeklendi.
* libyaml\'yi saran yeni psych kütüphanesi syck kütüphanesi yerine
  kullanılabilir.

Ayrıntılı bilgi için [NEWS][1] ve [ChangeLog][2] adreslerine bakınız.

Ruby 1.9.2 [RubySpec][3] un %99 unu geçmiştir.

### Desteklenen Platformlar

Ruby 1.9 dört seviyede destek verir.

Desteklenen
: Ruby 1.9.2 nin sağlıklı çalıştığı denenmiştir.

  * Debian GNU/Linux 5.0 на IA32.

Çalışma yapılmış
: Ruby 1.9.2 nin birçoğunda sağlıklı çalıştığı denenmiştir.

  * mswin32, x64-mswin64, mingw32
  * MacOS X 10.5 (Intel) ve 10.6
  * FreeBSD 6 ve sonrası (amd64, IA32)
  * Solaris 10
  * Symbian OS

Çalışma yapılmış
: Ruby 1.9.2 nin birçoğunda birkaç modifikasyonla sağlıklı çalıştığı
  denenmiştir. Yamalar kabul edilmektedir.

  * Diğer Linux dağıtımları
  * MacOS X'in diğer sürümleri.
  * cygwin
  * AIX 5
  * Diğer POSIX uyumlu sistemler
  * BeOS (Haiku)

### SSS

Standart kütüphane /usr/local/lib/ruby/1.9.1 klasöründedir.
: Bu versiyon \"kütüphane uyumlu sürüm\"dür. Ruby 1.9.2
  kütüphaneleri de 1.9.1 klasörüne konmuştur.

Bir LoadError kaynağı
: `$:` bulunulan klasörü içermez. Bazı scriptlerde değişiklik yapmak
  gerekebilir.

### İndirin

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2&gt;][4]
  BOYUT
  : 8495472 bayt

  MD5
  : d8a02cadf57d2571cd4250e248ea7e4b

  SHA256
  : e9710990ed8c2e794123aba509010471915fb13c27dae0118831d2001a9c8d3b

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz&gt;][5]
  BOYUT
  : 10787899 bayt

  MD5
  : 755aba44607c580fddc25e7c89260460

  SHA256
  : 8c0c4e261a921b5c406bf9e76ac23bf3c915651534e9d1b9e8c5d0bee4a7285c

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip&gt;][6]
  BOYUT
  : 12159728 bayt

  MD5
  : e57a393ccd62ddece4c63bd549d8cf7f

  SHA256
  : e61521af06da71fde9f0c7c08baaf7415614d00c86ec5a7ab08b60a4f3185b2a



[1]: https://github.com/ruby/ruby/blob//v1_9_2_0/NEWS
[2]: https://github.com/ruby/ruby/blob//v1_9_2_0/ChangeLog
[3]: https://github.com/ruby/spec
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip
