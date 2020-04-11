---
layout: page
title: "Kütüphaneler"
lang: tr
---

Çoğu programlama dili gibi Ruby de geniş bir üçüncü parti kütüphane kümesine
sahiptir.
{: .summary}

Bu kütüphanelerin neredeyse tamamı bir **gem** biçiminde yayınlanır. Bunlar,
[**RubyGems**][1] isimli bir araç ile kurulabilen paketlenmiş kütüphaneler ya
da uygulamalardır.

RubyGems, kütüphanelerin oluşturulması, paylaşılması ve kurulumu için
tasarlanmış bir Ruby paketleme sistemidir (bazı yönlerden `apt-get` gibi bir
dağıtım paketleme sistemidir, fakat Ruby yazılımını hedeflemiştir). Ruby,
1.9 sürümünden itibaren varsayılan olarak RubyGems ile gelmektedir, önceki Ruby
sürümleri RubyGems'in [elle kurulması][2]nı gerektirir.

Bazı diğer kütüphaneler **kaynak kodun** arşivlenmiş (.zip ya da .tar.gz)
dizinleri olarak yayınlanırlar. Kurulum süreci farklılık gösterebilir, genelde
talimatların yer aldığı bir `README` ya da `INSTALL` dosyası vardır.

Hadi şimdi kütüphaneleri nasıl bulup kuracağımıza bakalım.

### Kütüphaneleri bulma

Kütüphanelerin barındırıldığı ana mekan [**RubyGems.org**][1]'dur. Bu depoda
gemleri bulup makinenize kurabilirsiniz. RubyGems websitesini kullanarak ya da
`gem` komutu ile gemleri tarayabilir ya da arayabilirsiniz.

`gem search -r` komutu ile RubyGems deposunu arayabilirsiniz. Örneğin
`gem search -r rails`, Rails ile ilgili gemlerin bir listesini döndürecektir.
`--local` (`-l`) seçeneği ile kurulu gemleriniz arasında yerel bir arama
gerçekleştirebilirsiniz. Bir gem kurmak için `gem install [gem]` komutunu
kullanın. Kurulu gemleri taramak için `gem list` komutunu kullanabilirsiniz.
`gem` komutu ile ilgili daha fazla bilgi için aşağıya bakın ya da
[RubyGems’in belgeleri][3]ne gidin.

Kütüphanelerin başka kaynakları da vardır. [**GitHub**][5], Ruby ile ilgili
içeriğin bulunduğu ana depodur. Sıklıkla bir gem kaynak kodu RubyGems.org'da
tam teşekküllü bir gem olarak yayınlanırken GitHub'da barındırılır.

[**The Ruby Toolbox**][6], açık kaynak Ruby projelerini araştırmayı
kolaylaştıran bir projedir. Çeşitli yaygın geliştirme görevleri için
kategorilere sahiptir, projeler hakkında yayın ve işleme etkinliği ya da
bağımlılıklar gibi birçok bilgi toplar ve projeleri RubyGems.org ve GitHub'daki
gözdeliklerine göre derecelendirir.

### RubyGems hakkında birkaç söz

Burada `gem` komutunu günlük kullanım için basitçe anlattık. Bu paketleme
sisteminin tüm yönlerini kapsayan [daha ayrıntılı bir belgelendirme][7] de
vardır.

#### Mevcut gemler arasında arama yapma

**search** komutu bir karakter dizisine göre gemleri aramak için
kullanılabilir. Adları belirtilen karakter dizisi ile başlayan gemler
döndürülen listede yer alacaktır. Örneğin, "html" ile ilgili gemleri aramak
için:

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

`--remote` / `-r` bayrağı, resmi RubyGems.org deposunu yoklamak istediğimizi
belirtir (varsayılan davranış). `--local` / `-l` bayrağı ile kurulu gemleriniz
arasında yerel bir arama gerçekleştirebilirsiniz.

#### Bir gemi kurma

Gözde Ruby on Rails web çatısını **kurmak** istiyorsunuz diyelim, o zaman şu komutu vermelisiniz:

{% highlight sh %}
$ gem install rails
{% endhighlight %}

`--version` / `-v` bayrağı ile kütüphanenin belirli bir sürümünü de
kurabilirsiniz:

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

#### Tüm gemleri listeleme

Yerel olarak kurulmuş tüm gemlerin bir **listesi** için:

{% highlight sh %}
$ gem list
{% endhighlight %}

RubyGems.org'da bulunan tüm gemlerin (çok uzun) bir listesini almak için:

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### Yardım!

Belgelendirme uçbiriminizin içinde mevcuttur:

{% highlight sh %}
$ gem help
{% endhighlight %}

Örneğin `gem help commands` çok kullanışlıdır çünkü tüm `gem` komutlarının
bir listesini çıktı olarak verir.

#### Kendi geminizi yapma

RubyGems.org bu konuda [birkaç kılavuza][3] sahiptir. Ayrıca [Bundler][9]'ı da
araştırmak isteyebilirsiniz. Bu, RubyGems ile birlikte kullanılabilen ve
uygulamaların bağımlılıklarını yönetmenize yardımcı olan genel bir araçtır.



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[5]: https://github.com/
[6]: https://www.ruby-toolbox.com/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
