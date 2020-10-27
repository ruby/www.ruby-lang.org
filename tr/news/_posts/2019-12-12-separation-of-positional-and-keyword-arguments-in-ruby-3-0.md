---
layout: news_post
title: "Ruby 3.0'da konumsal argümanların ve anahtar kelime argümanlarının ayrılması"
author: "mame"
translator: "İsmail Arılık"
date: 2019-12-12 12:00:00 +0000
lang: tr
---

Bu makale Ruby 3.0'daki planlanan anahtar kelime argümanlarının uyumsuzluklarını açıklamaktadır.

## tl;dr

Ruby 3.0'da konumsal ve anahtar kelime argümanları ayrılacaktır.
Ruby 2.7, Ruby 3.0'da değişecek davranışlar konusunda uyarı gösterecektir.
Eğer aşağıdaki uyarıları görüyorsanız, kodunuzu güncellemelisiniz:

* `Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call`, ya da
* `Passing the keyword argument as the last hash parameter is deprecated`, ya da
* `Splitting the last argument into positional and keyword parameters is deprecated`

Çoğu durumda _çift splat_ operatörü ekleyerek uyumsuzluktan kaçınılabilir.
Bu operatör harici olarak, bir `Hash` nesnesi yerine anahtar kelime argümanları geçirildiğini ifade eder.
Harici olarak, anahtar kelime argümanları yerine bir `Hash` nesnesi geçirmek içinse süslü parantezler (`{}`) ekleyebilirsiniz.
Daha fazla ayrıntı için aşağıdaki "Tipik durumlar" bölümünü okuyun.

Ruby 3'te, tüm argümanları yetkilendiren bir metod, konumsal argümanlara ilaveten harici olarak anahtar kelime argümanlarını da yetkilendirmelidir.
Ruby 2.7 ve öncesinde bulunan yetkilendirme davranışını korumak istiyorsanız, `ruby2_keywords`'ü kullanın.
Daha fazla ayrıntı için aşağıdaki "Argüman yetkilendirmeyi ele alma" bölümüne bakın.

## Tipik durumlar
{: #typical-cases }

İşte en tipik durumlar.
Hash yerine anahtar kelimeleri geçmek için çift splat operatörünü (`**`) kullanabilirsiniz.

{% highlight ruby %}
# Bu metod sadece bir anahtar kelime argümanı kabul eder
def foo(k: 1)
  p k
end

h = { k: 42 }

# Bu metod çağrısı konumsal bir Hash argümanı geçirir
# Ruby 2.7'de: Hash otomatik olarak bir anahtar kelime argümanına çevrilir
# Ruby 3.0'da: Bu çağrı bir ArgumentError yükseltir
foo(h)
  # => demo.rb:11: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
  #    demo.rb:2: warning: The called method `foo' is defined here
  #    42

# Ruby 3.0'da bu davranışı korumak istiyorsanız, çift splat kullanın
foo(**h) #=> 42
{% endhighlight %}

Bir diğer durum.
Anahtar kelimeler yerine Hash geçirmek için harici olarak süslü parantezleri kullanabilirsiniz.

{% highlight ruby %}
# Bu metod konumsal bir argüman ve bir anahtar kelime gerisi argümanı kabul eder
def bar(h, **kwargs)
  p h
end

# Bu çağrı sadece bir anahtar kelime argümanı geçirir ve hiç konumsal bir argüman geçirmez
# Ruby 2.7'de: Anahtar kelime konumsal bir Hash argümanına çevrilir
# Ruby 3.0'da: Bu çağrı bir ArgumentError yükseltir
bar(k: 42)
  # => demo2.rb:9: warning: Passing the keyword argument as the last hash parameter is deprecated
  #    demo2.rb:2: warning: The called method `bar' is defined here
  #    {:k=>42}

# Ruby 3.0'daki davranışı korumak istiyorsanız, harici olarak bir Hash oluşturmak için süslü parantezleri kullanın
bar({ k: 42 }) # => {:k=>42}
{% endhighlight %}

## Sonu gelen hangisi?
{: #what-is-deprecated }

Ruby 2'de anahtar kelime argümanları son konumsal Hash argümanı olarak düşünülebilir ve son konumsal Hash argümanı anahtar kelime argümanları olarak düşünülebilir.

Otomatik çevrim son bölümde açıklandığı gibi bazen çok karmaşık ve sıkıntılı olduğu için, Ruby 2.7 ile birlikte sonunun geldiği belirtilecek ve Ruby 3'te kaldırılacaktır.
Diğer bir deyişle, Ruby 3'te anahtar kelime argümanları, konumsal olanlardan tamamen ayrılacaktır.
Yani anahtar kelime argümanları geçirmek istediğinizde her zaman `foo(k: expr)` ya da `foo(**expr)` kullanmalısınız.
Eğer anahtar kelime argümanları kabul etmek istiyorsanız, prensipte her zaman `def foo(k: default)` ya da `def foo(k:)` ya da `def foo(**kwargs)` kullanmalısınız.

Anahtar kelime argümanları ile anahtar kelime argümanları kabul etmeyen bir metod çağrıldığında, Ruby 3.0'ın farklı davranmayacağına dikkat edin.
Örneğin, aşağıdaki durumun desteği sonlanmayacaktır ve bu durum Ruby 3.0'da çalışmaya devam edecektir.
Anahtar kelime argümanları hala konumsal bir Hash argümanı olarak değerlendirilir.

{% highlight ruby %}
def foo(kwargs = {})
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

Çünkü bu tarz çok sık kullanılmaktadır ve argümanın nasıl değerlendirileceği konusunda bir kafa karışıklığı ihtimali yoktur.
Bu çevrimi yasaklamak, küçük bir fayda için ek uyumsuzluklara neden olacaktır.

Fakat bu tarz, yeni kodlarda tavsiye edilmez, tabii sık sık bir Hash'i konumsal bir argüman olarak geçirip ayrıca anahtar kelime argümanlarını kullanmıyorsanız.
Diğer türlü çift splat kullanın:

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

## Kodum Ruby 2.7'de patlayacak mı?
{: #break-on-ruby-2-7 }

Kısa cevap: "Patlamayabilir."

Ruby 2.7'deki değişiklikler, 3.0'a doğru bir göç etme yolu olarak tasarlanmaktadır.
Prensipte Ruby 2.7, Ruby 3'te değişecek özelliklere karşı sadece uyarsa da, küçük olduğunu düşündüğümüz bazı uyumsuz değişiklikler içermektedir.
Ayrıntılar için "Diğer küçük değişiklikler" bölümüne bakınız.

Uyarılar ve küçük değişiklikler dışında Ruby 2.7, Ruby 2.6 ile uyumlu olmaya çalışmaktadır.
Yani kodunuz muhtemelen Ruby 2.7'de çalışacaktır, tabii uyarılar verebilir.
Ayrıca kodunuzu Ruby 2.7'de çalıştırarak, onun Ruby 3.0 için hazır olup olmadığını kontrol edebilirsiniz.

<del>
Tüm uyarıları kapatmak istiyorsanız, lütfen `$VERBOSE = nil`'i ayarlayın (genel olarak bu, tavsiye edilmez).
Ruby 2.7, uyarı görünürlüğünü daha iyi kontrol etmek için yeni bir mekanizma ekleyebilir ([Özellik #16345](https://bugs.ruby-lang.org/issues/16345)).
Fakat bu özelliğin son sürümde olup olmayacağına henüz karar vermedik.
</del>

<ins>
Eğer ileride kaldırılma uyarılarını kapatmak istiyorsanız, lütfen `-W:no-deprecated` komut satırı argümanını kullanın ya da `Warning[:deprecated] = false` ifadesini kodunuza ekleyin.
</ins>

## Argüman yetkilendirmeyi ele alma
{: #delegation }

### Ruby 2.6 ya da öncesi
{: #delegation-ruby-2-6-or-prior }

Ruby 2'de, bir `*rest` ve `&block` argümanı kabul ederek ve bu ikisini hedef metoda geçirerek bir yetkilendirme metodu yazabilirsiniz.
Bu davranışta anahtar kelime argümanları da konumsal argümanlar ve anahtar kelime argümanları arasındaki çevrim ile dahili olarak ele alınırlar.

{% highlight ruby %}
def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

### Ruby 3

Anahtar kelime argümanlarını harici olarak yetkilendirmeniz gerekir.

{% highlight ruby %}
def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end
{% endhighlight %}

Alternatif olarak, eğer Ruby 2.6 ya da öncesi ile uyumluluğa ihtiyacınız yoksa ve herhangi bir argümanı değiştirmiyorsanız, Ruby 2.7'de tanıtılan yeni yetkilendirme sözdizimini (`...`) kullanabilirsiniz.

{% highlight ruby %}
def foo(...)
  target(...)
end
{% endhighlight %}

### Ruby 2.7
{: #delegation-ruby-2-7 }

Kısaca: `Module#ruby2_keywords`'ü kullanın ve `*args, &block`'u yetkilendirin.

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

`ruby2_keywords`, son Hash argümanı olarak anahtar kelime argümanlarını kabul eder, ve diğer metodu çağırırken bunu anahtar kelime argümanları olarak geçirir.

Aslında Ruby 2.7 birçok durumda yeni tarz yetkilendirmeyi destekler.
Fakat bilinen bir çıkmaz var.
Bir sonraki bölüme bakın.

### Ruby 2.6, 2.7 ve Ruby 3'te çalışan uyumlu bir yetkilendirme
{: #a-compatible-delegation }

Kısaca: Yine, `Module#ruby2_keywords`'ü kullanın.

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

Maalesef eski tarz yetkilendirmeyi (yani `**kwargs` olmadan) kullanmalıyız çünkü Ruby 2.6 ya da öncesi yeni yetkilendirme tarzını doğru şekilde ele almaz.
Bu, anahtar kelime ayrımının nedenlerinden biridir; ayrıntılar son bölümde açıklanmaktadır.
`ruby2_keywords`, eski tarzı Ruby 2.7 ve 3.0'da bile çalıştırmanızı sağlar.
2.6 ya da öncesinde tanımlı bir `ruby2_keywords` olmadığı için, lütfen [ruby2_keywords gem](https://rubygems.org/gems/ruby2_keywords)'ini kullanın ya da bunu kendiniz tanımlayın:

{% highlight ruby %}
def ruby2_keywords(*)
end if RUBY_VERSION < "2.7"
{% endhighlight %}

---

Eğer kodunuzun Ruby 2.6 ya da öncesinde çalışması gerekmiyorsa, Ruby 2.7'deki yeni tarzı deneyebilirsiniz.
Bu neredeyse her durumda çalışır.
Fakat maalesef aşağıdaki gibi çıkmazlar vardır:

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo({})       #=> Ruby 2.7: []   ({} düşer)
foo({}, **{}) #=> Ruby 2.7: [{}] (Harici olarak "hayır" anahtar kelimelerini geçirerek {} argümanını geçirebilirsiniz)
{% endhighlight %}

Boş bir Hash argümanı otomatik olarak çevrilir ve `**kwargs`'a çekilir, ve yetkilendirme çağrısı boş anahtar kelime hash'ini kaldırır, yani `target`'a hiçbir argüman geçirilmez.
Bildiğimiz kadarıyla bu, tek çıkmaz durum.

Son satırda belirtildiği üzere, bu çıkmazın çevresinden `**{}` argümanını kullanarak dolaşabilirsiniz.

Eğer gerçekten taşınabilirlik konusunda endişeleniyorsanız, `ruby2_keywords`'ü kullanın.
(Ruby 2.6 ya da öncesinin de anahtar kelime argümanları konusunda bir sürü çıkmaza sahip olduğunu kabul edin. :-)
İleride, Ruby 2.6'nın hayatının sonuna gelmesiyle birlikte `ruby2_keywords` silinebilir.
Bu noktada, anahtar kelime argümanlarını harici olarak yetkilendirmenizi tavsiye ederiz (yukarıdaki Ruby 3 koduna bakın).

## Diğer küçük değişiklikler
{: #other-minor-changes }

Anahtar kelime argümanları konusunda Ruby 2.7'de üç küçük değişiklik var.

### 1. Sembol olmayan anahtarlar anahtar kelime argümanlarında kullanılabilir
{: #other-minor-changes-non-symbol-keys }

Ruby 2.6 ve öncesinde anahtar kelime argümanlarında sadece Sembol anahtarlara izin veriliyordu.
Ruby 2.7'de anahtar kelime argümanları Sembol olmayan anahtarlar kullanabilir.

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end
foo("key" => 42)
  #=> Ruby 2.6 ve öncesi: ArgumentError: wrong number of arguments
  #=> Ruby 2.7 ve sonrası: {"key"=>42}
{% endhighlight %}

Eğer bir metod hem isteğe bağlı argümanları hem de anahtar kelime argümanlarını kabul ediyorsa, hem Sembol anahtarlara hem de Sembol olmayan anahtarlara sahip bir Hash nesnesi Ruby 2.6'da ikiye ayrılır.
Ruby 2.7'de ikisi de anahtar kelime olarak kabul edilir çünkü Sembol olmayan anahtarlara izin verilir.

{% highlight ruby %}
def bar(x=1, **kwargs)
  p [x, kwargs]
end

bar("key" => 42, :sym => 43)
  #=> Ruby 2.6: [{"key"=>42}, {:sym=>43}]
  #=> Ruby 2.7: [1, {"key"=>42, :sym=>43}]

# Davranışı korumak için süslü parantezleri kullanın
bar({"key" => 42}, :sym => 43)
  #=> Ruby 2.6 ve 2.7: [{"key"=>42}, {:sym=>43}]
{% endhighlight %}

Ruby 2.7 eğer harici anahtar kelimeler kabul eden fakat anahtar kelime gerisi argümanı (`**kwargs`) kabul etmeyen bir metoda hem Sembol hem de Sembol olmayan anahtarlar ile bir Hash ya da anahtar kelime argümanları geçirilirse, yine de hash'leri ayırır.
Bu davranış Ruby 3'te kaldırılacaktır, ve bir `ArgumentError` yükseltilecektir.

{% highlight ruby %}
def bar(x=1, sym: nil)
  p [x, sym]
end

bar("key" => 42, :sym => 43)
# Ruby 2.6 ve 2.7: => [{"key"=>42}, 43]
# Ruby 2.7: warning: Splitting the last argument into positional and keyword parameters is deprecated
#           warning: The called method `bar' is defined here
# Ruby 3.0: ArgumentError
{% endhighlight %}

### 2. Boş bir hash (`**{}`) ile çift splat hiçbir argüman geçirmez
{: #other-minor-changes-empty-hash }

Ruby 2.6 ve öncesinde, `**empty_hash` geçirmek konumsal bir boş Hash argümanı geçirir.
Ruby 2.7 ve sonrasında ise hiçbir argüman geçirmez.

{% highlight ruby %}
def foo(*args)
  args
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6 ve öncesi: [{}]
  #=> Ruby 2.7 ve sonrası: []
{% endhighlight %}

`foo(**{})`'nun Ruby 2.6'da da 2.7'de de hiçbir şey geçirmediğine dikkat edin.
Ruby 2.6 ve öncesinde `**{}`, ayrıştırıcı tarafından kaldırılır, ve Ruby 2.7'de ve sonrasında bu, `**empty_hash` olarak düşünülür, ki bu da bir metoda hiçbir anahtar kelime argümanı geçirmemek için kolay bir yol sunar.

Ruby 2.7'de, bir metod yetersiz konumsal argüman ile çağrıldığında, Ruby 2.6 ile uyumlu olabilmek için `foo(**empty_hash)` bir uyarı yayınlayarak boş bir hash geçirir.
Bu davranış 3.0'da kaldırılacaktır.

{% highlight ruby %}
def foo(x)
  x
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6 ve öncesi: {}
  #=> Ruby 2.7: warning: Passing the keyword argument as the last hash parameter is deprecated
  #             warning: The called method `foo' is defined here
  #=> Ruby 3.0: ArgumentError: wrong number of arguments
{% endhighlight %}

### 3. Anahtar-kelime-argümanı-yok sözdizimi (`**nil`) tanıtıldı
{: #other-minor-changes-double-splat-nil }

Bir metodun hiçbir anahtar kelime argümanı kabul etmediğini harici olarak belirtmek için bu metodun tanımında `**nil` kullanabilirsiniz.
Bu gibi metodları anahtar kelime argümanları ile çağırmak `ArgumentError`'a neden olacaktır.
(Aslında bu yeni bir özelliktir, bir uyumsuzluk değildir.)

{% highlight ruby %}
def foo(*args, **nil)
end

foo(k: 1)
  #=> Ruby 2.7 ve sonrasında: no keywords accepted (ArgumentError)
{% endhighlight %}

Bir metodun anahtar kelime argümanlarını kabul etmediğini harici olarak belirtmek kullanışlıdır.
Diğer türlü, anahtar kelimeler yukarıdaki örnekteki gibi gerisi argümanına çekilir.
Eğer bir metodu, anahtar kelime argümanları kabul etmek için genişletiyorsanız, bu metod aşağıdaki gibi bir uyumsuzluğa sahip olabilir:

{% highlight ruby %}
# Eğer bir metod gerisi argümanını kabul ediyorsa ve `**nil` içermiyorsa
def foo(*args)
  p args
end

# Geçirilen bir anahtar kelime bir Hash nesnesine çevrilir (Ruby 3.0'da bile)
foo(k: 1) #=> [{:k=>1}]

# Eğer metod, bir anahtar kelime kabul etmesi için genişletildiyse
def foo(*args, mode: false)
  p args
end

# Var olan çağrı patlayabilir
foo(k: 1) #=> ArgumentError: unknown keyword k
{% endhighlight %}

## Neden otomatik çevrimin sonunu getiriyoruz
{: #why-deprecated }

Otomatik çevrim başta iyi bir fikir gibiydi, ve çoğu durumda iyi çalıştı.
Fakat çok fazla sivrilikler vardı ve davranış hakkında birçok hata raporu aldık.

Otomatik çevrim, bir metod isteğe bağlı argümanlar ve anahtar kelime argümanları kabul ettiğinde, iyi çalışmamaktadır.
Bazı kişiler son Hash nesnesinin konumsal bir argüman olarak değerlendirilmesini, diğerleri ise anahtar kelime argümanlarına çevrilmesini beklemektedir.

İşte en çok kafa karıştıran durumlardan birisi:

{% highlight ruby %}
def foo(x, **kwargs)
  p [x, kwargs]
end

def bar(x=1, **kwargs)
  p [x, kwargs]
end

foo({}) #=> [{}, {}]
bar({}) #=> [1, {}]

bar({}, **{}) #=> beklenen: [{}, {}], asıl: [1, {}]
{% endhighlight %}

Ruby 2'de `foo({})`, boş bir Hash'i normal bir argüman olarak geçirir (yani `{}`, `x`'e geçirilir), fakat `bar({})` bir anahtar kelime argümanı geçirir (yani `{}`, `kwargs`'a atanır).
Yani `any_method({})` oldukça kafa karıştırıcıdır.

`bar({}, **{})`'ı, `x`'e harici olarak boş bir hash geçiriyormuşuz gibi düşünebilirsiniz.
Şaşırtıcı biçimde bu, beklediğiniz şekilde çalışmaz; Ruby 2.6'da hala `[1, {}]` yazdırır.
Bunun nedeni Ruby 2.6'da ayrıştırıcının `**{}` argümanını boşvermesi ve ilk sıradaki `{}` argümanının otomatik olarak anahtar kelimelere (`**kwargs`) çevrilmesidir.
Bu durumda `bar({}, {})`'ı çağırmalısınız, fakat bu fazla garip durmaktadır.

Aynı durumlar gerisi ve anahtar kelime argümanları kabul eden metodlarda da vardır.
Bu, anahtar kelime argümanlarının harici yetkilendirmesini çalışmaz hale getirir.

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo() #=> Ruby 2.6 ve öncesi: [{}]
      #=> Ruby 2.7 ve sonrası:  []
{% endhighlight %}

`foo()` hiçbir argüman geçirmez, fakat `target` Ruby 2.6'da boş bir hash argümanı alır.
Bunun nedeni `foo` metodunun anahtar kelimeleri (`**kwargs`) harici olarak yetkilendirmesidir.
`foo()` çağrıldığında `args` boş bir Array, `kwargs` boş bir Hash, `block` ise `nil`'dir.
Sonrasında `target(*args, **kwargs, &block)` argüman olarak boş bir Hash geçirir çünkü `**kwargs` otomatik olarak konumsal bir Hash argümanına çevrilir.

Otomatik çevrim sadece insanların kafasını karıştırmakla kalmaz ayrıca metodu daha az genişletilebilir yapar.
Davranıştaki değişikliğin nedenleri ve belirli gerçeklemelerin neden seçildiği ile ilgili daha fazla ayrıntı için [[Özellik #14183]](https://bugs.ruby-lang.org/issues/14183)'e bakın.

## Teşekkür

Bu makale Jeremy Evans and Benoit Daloze tarafından nazikçe gözden geçirilmiştir (hatta onlarla birlikte yazılmıştır).

## Değişiklik Günlüğü
* 23 Aralık 2019: 2.7.0-rc2'de uyarı mesajları biraz değişti, ve uyarıları bastırmak için bir API eklendi.
