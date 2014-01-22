---
layout: page
title: "Ruby İndirin"
lang: tr
---

Burada en son Ruby dağıtımlarını işinize gelen şekliyle bulabilirsiniz.
En son kararlı sürüm {{ site.downloads.stable.version }},
lütfen önce [Ruby lisansını][license] okuyun.
{: .summary}

### Ruby Kaynak Kodu

Kaynak kodundan kurmak, platformunuza yeterince hakimseniz ve
ortamınızda özel ayarlar gerekiyorsa uygun çözümdür. Eğer platformunuza
hazır paket bulunmazsa da uygun olacaktır.

* [Ruby {{ site.downloads.stable.version }}][stable-gz]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }})
  Kararlı Versiyon (*tavsiye edilir*)
* [Stable Snapshot][stable-snapshot-gz] Bu son kararlı SVN’nin tar gzip hali. Son kararlı
  sürümden daha iyi olması beklenir.
* [Nightly Snapshot][nightly-gz] Bu son SVN’nin tar gzip hali. Çözülmemiş
  problemleri olabilir.

Ruby Subversion ve Git depoları hakkında bilgi için [Ruby
Core](/en/community/ruby-core/) sayfasına bakınız.

### Windows’ta Ruby

Windows için Ruby kurulumunda birkaç seçenek vardır. İlk seçenek
[RubyInstaller][5] kullanmak, derlemiş binary dosyaları içeren bir
kurulum. İkincisi ise paketlenmiş uygulamaların ve binarylerin
kullanılması. Ruby’yi nasıl kuracağınızdan emin değilseniz, ilk seçenek
sizin için daha doğru olacaktır.

* [Ruby 1.8.6-p398 RubyInstaller][6]
  (md5:&nbsp;233d6b3ddc4c61436b075b51254cd138) Kararlı versiyon (*tavsiye
  edilir*)
* [Ruby 1.8.7-p330 RubyInstaller][7] (md5:&nbsp;
  18d688cfae6e60857cad24da6f9ee055) Kararlı versiyon (*tavsiye edilir*)
* [Ruby 1.9.1-p430 RubyInstaller][8]
  (md5:&nbsp;86ac589a955898c3163b161d81750a05) Kararlı versiyon (*tavsiye
  edilir*)
* [Ruby 1.9.2-p136 RubyInstaller][9] (md5:&nbsp;
  8e8843963dae29a98ce3e2ba2ee111f1) Kararlı versiyon (*tavsiye edilir*)
* [Ruby 1.8.7-p249 Binary][10] (md5:&nbsp;4fd37b0b4b21a042cae7f5f0a8daad16)
  Kararlı versiyon
* [Ruby 1.9.1-p378 Binary][11] (md5:&nbsp;7d14a918cc8d243d3e2c409aff41f454)
  Kararlı versiyon

Lütfen dikkat edin yukarda belirtilen binaryler indirilip elle
yüklenmesi gereken ve ek parçaları ayrıca yüklenmesi gereken
dosyalardır. Detaylarını [bu sayfada][12] bulabilirsiniz. Lütfen bir
hata bildirmeden önce bu adımları yerine getirdiğinizden emin olun.

[RubyInstaller][5] ek işlemler takip etmeyi gerektirmez.

Lütfen ayrıca [pik][13] kullanımını da inceleyin. Bununla Windows’ta
aynı anda değişik versiyonları ve gemleri kullanmak mümkündür.

### Linux’da Ruby

Kullandığınız dağıtıma bağlı olarak Ruby’yi kurmanın değişik yolları
vardır. İlki kolay bir şekilde kaynak dosyalarını indirin ve derleyin.
Bunun dışında bazı dağıtımlarda Ruby’yi çok kolay şekilde kurmak için
paket yöneticileri vardır.

Örneğin Debian’da ya da Ubuntu’da `apt-get` harika bir çözüm sunar:

{% highlight sh %}
$ sudo apt-get install ruby1.9.1-full
{% endhighlight %}

Yukarıdaki komut Ruby 1.9.1’in şu andaki kararlı sürümünü kuracaktır.
Eğer Ruby 1.8 versiyon kurmak isterseniz şunu kullanabilirsiniz:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

irb ve rdoc için “universe repository” aktif edilmelidir.

Lütfen ayrıca `rvm` ‘i de inceleyin , [Ruby Version Manager][14] , ile
aynı anda birkaç versiyon Ruby ve gemleri kullanabilirsiniz.

### OS X’de Ruby

Ruby 1.8.6 Mac OS X Leopard’da Ruby on Rails, Capistrno, Mongrel ve
birçok popüler gem’i de kapsayacak şekilde tam desteklenir. Ayrıntı için
[MacOS Forge’daki Ruby wiki][15] ye bakınız.

Mac OS X Tiger 1.8.2 versiyon Ruby ile paketlenmiştir, ama Leopard’a
yükseltilmemişler için de Ruby son versiyonu yüklemek için yollar
vardır. [Locomotive][16] eğer çok hızla Rails geliştirmeye başlamak
isterseniz güzel bir seçim. [MacPorts][17] veya [Fink][18] daha teknik
kişiler için daha güzel gelebilir.

MacPorts’da, Ruby’yi kurmak için…

{% highlight sh %}
$ port install ruby
{% endhighlight %}

Fink (Fink Commander kullanarak) Ruby kurulumu için bir grafik arabirime
sahiptir.

Ayrıca OS X, Unix temelli olduğu için, kaynak kodu indirip derlemek te
diğer çözümler kadar etkili olacaktır.

Ruby (ve Rails) in kurulumuna detaylı bakış için Dan Benjamin’in [Tiger
için][19], [Leopard için][20] ve [Snow Leopard için][21] emsalsiz
makaleleri sizin çok çabuk ilerlemenizi sağlayacaktır.

### Solaris ve OpenSolaris’de Ruby

Ruby 1.8.7 Solaris 8’den Solaris 10’a kadar [Sunfreeware][22]
kurulabilir ve Ruby 1.8.7 [Blastwave][23] ‘da bulunabilir. Solaris 10
için ayarlanmış bir Ruby on Rails paketi Sun’ın Cooltools projesinde
bulunabilir [Coolstack][24].

[OpenSolaris][25] ‘te Ruby kurmak için, lütfen [Image Packaging System
veya IPS][26] client kullanın. Bu en son binary ve gem’leri direk olarak
OpenSolaris depolarından indirecektir. Şunu yazın:

{% highlight sh %}
$ pfexec pkg install SUNWruby18
{% endhighlight %}

Bu Ruby, Rubygems, ortak eklentiler ve onların destek kütüphanelerini
kuracaktır. Bu paket ayrıca DTrace desteği ve performans
optimizasyonları da içerir. Birçok değişik eserler [Ruby OpenSolaris ARC
Case][27] ‘de anlatılmıştır.

Diğer OpenSolaris dağıtımı [Solaris Express Community Edition veya
SXCE][28] üzerinde Ruby kurulu olarak gelir. Versiyonu, yeri vs.
OpenSolaris’le aynıdır ve yukarda bahsedilen ARC Case’de dökümanı
bulunabilir.

SVR4 paketlerini elle yüklemek için lütfen [RubyOpenSolaris project @
Rubyforge][29] adresini inceleyin.



[license]: {{ site.license.url }}
[stable-gz]:   {{ site.downloads.stable.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[5]: http://rubyinstaller.org/
[6]: http://rubyforge.org/frs/download.php/71066/rubyinstaller-1.8.6-p398.exe
[7]: http://rubyforge.org/frs/download.php/73719/rubyinstaller-1.8.7-p330.exe
[8]: http://rubyforge.org/frs/download.php/72075/rubyinstaller-1.9.1-p430.exe
[9]: http://rubyforge.org/frs/download.php/73722/rubyinstaller-1.9.2-p136.exe
[10]: ftp://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.8.7-p249-i386-mswin32.zip
[11]: ftp://ftp.ruby-lang.org:21/pub/ruby/binaries/mswin32/ruby-1.9.1-p378-i386-mswin32.zip
[12]: http://www.garbagecollect.jp/ruby/mswin32/en/documents/install.html
[13]: http://github.com/vertiginous/pik
[14]: http://rvm.beginrescueend.com
[15]: http://trac.macosforge.org/projects/ruby/wiki
[16]: http://locomotive.raaum.org/
[17]: http://www.macports.org/
[18]: http://fink.sourceforge.net/
[19]: http://hivelogic.com/articles/ruby-rails-mongrel-mysql-osx
[20]: http://hivelogic.com/articles/ruby-rails-leopard
[21]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/
[22]: http://www.sunfreeware.com
[23]: http://www.blastwave.org
[24]: http://cooltools.sunsource.net/coolstack
[25]: http://www.opensolaris.org
[26]: http://opensolaris.org/os/project/pkg/
[27]: http://jp.opensolaris.org/os/community/arc/caselog/2007/600/
[28]: http://opensolaris.org/os/downloads
[29]: http://rubyforge.org/projects/rubyopensolaris
