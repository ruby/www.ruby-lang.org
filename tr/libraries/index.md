---
layout: page
title: "Kütüphaneler"
lang: tr
---

Ruby çok sayıda büyüleyici ve kullanışlı kütüphanelere sahiptir, bir
çoğu [klasik *gem* dosyası][1] olarak yayınlanmıştır. Diğer kütüphaneler
kaynak kodunun .zip ya da .tar.gz arşivlenmişi olarak yayınlanır. Haydi
kütüphaneleri nasıl bulacağımızı kuracağımızı inceleyelim.
{: .summary}

### Kütüphaneleri Bulmak

[**RubyForge**][2] , Ruby kütüphanelerinin popüler evidir. İyi bir yol
onun kütüphanelerinin başlıklar altında incelendiği [software map][3]
‘inde gezinmek. Eğer kendi kütüphanenizi üretirseniz Rubyforge’ye
[kayıt][4] ederek ücretsiz Subversion erişimi, web alanı ve mail listesi
alabilirsiniz.

[**Ruby Application Archive**][5] (ya da RAA) işlevleri bakımından ruby
uygulamalarının toplandığı bir klasör. Şu anda [Database][6] kategorisi
en çok girdiye sahip, [Net.][7] [HTML][8] ve [XML][9] onu takip
ediyorlar. [Physics][10] için bile girdi var.

### RubyGemlerin Kullanımı

[RubyGems web sitesinde][1] yer aldığı gibi “RubyGemleri esas Ruby
paketleme sistemidir. Ruby program ve kütüphanelerinin dağıtımı için
standart yapıdır ve Gem paketlerini kurmak için kolay kullanılan bir
araçtır.”

Windows installer içinde RubyGems olmasına rağmen birçok dağıtımda
ayrıca kurulması gerekir. Bu konuda eğer sıradaki gem komutu sizde
çalışmazsa aşağıdaki [RubyGemlerin Kurulması](#installing-rubygems)
kısmına bakınız.

#### Gemleri Araştırmak

**search** komutu adı belirli bir gem’i bulmak için kullanılır. Adında
“html” olan bir Gem bulmak için:

{% highlight sh %}
$ gem search html --remote

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

(*Burada `--remote` / `-r` bayrağı ile ana depodaki gemleri sorguluyoruz.*)

#### Bir Gem Kurulması

Hangi gem’i **kuracağınıza** karar verdiğinizde:

{% highlight sh %}
$ gem install html-sample
{% endhighlight %}

Eğer isterseniz `--version` bayrağı ile belli bir versiyonu da
yükleyebilirsiniz.

{% highlight sh %}
$ gem install html-sample --version 1.0
{% endhighlight %}

#### Tüm Gemlerin Listelenmesi

Ana depodaki tüm gemlerin bir **listesi** için:

{% highlight sh %}
$ gem list --remote
{% endhighlight %}

Sizde kurulu olan gemleri listelemek için bayrak kullanmadan yazın.

{% highlight sh %}
$ gem list
{% endhighlight %}

RubyGems kullanımı hakkında daha fazla bilgi için [**the official
manual**][11] e bakınız, burada Ruby betiklerinizde gemlerin nasıl
kullanılacağına dair örnekler vardır.

### RubyGems Kurulumu

RubyGems kurmak için, önce [download sayfasından][12] indirin. Arşivi
açın ve `setup.rb` çalıştırın. Bazı işletim sistemlerinde bunu root
olarak yapmanız gerekir.

Örneğin, Linux’ta:

{% highlight sh %}
$ tar xzvf rubygems-0.9.0.tar.gz
$ cd rubygems-0.9.0
$ su -
$ ruby setup.rb
{% endhighlight %}

Eğer daha fazla kurulum bilgisine ihtiyaç duyarsanız RubyGems
manualindeki [**installation chapter**][13] inceleyin.



[1]: http://guides.rubygems.org
[2]: http://rubyforge.org/
[3]: http://rubyforge.org/softwaremap/trove_list.php
[4]: http://rubyforge.org/register/
[5]: http://raa.ruby-lang.org/
[6]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Database
[7]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Net
[8]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=HTML
[9]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=XML
[10]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Physics
[11]: http://rubygems.org/read/chapter/1
[12]: http://rubyforge.org/frs/?group_id=126
[13]: http://rubygems.org/read/chapter/3
