---
layout: page
title: "Ruby Çekirdeği"
lang: tr
---

Şimdi Ruby'nin geliştirilmesini takip etmek için harika bir zaman. Geçtiğimiz
birkaç yılda Ruby'ye artan ilgi ile birlikte, Ruby'yi ve belgelendirmesini
iyileştirmeye yardım edecek iyi yeteneklere olan ihtiyaç da artmaktadır. Peki
nereden başlayacaksınız?
{: .summary}

Ruby'nin geliştirilmesi ile ilgili burada kapsanan konular şunlardır:

* [Ruby'nin Geliştirilmesini Git Kullanarak Takip Etmek](#following-ruby)
* [Yamalar ile Ruby'yi İyileştirmek](#patching-ruby)
* [Dallar hakkında bir not](#branches-ruby)

### Ruby'nin Geliştirilmesini Git Kullanarak Takip Etmek
{: #following-ruby}

En son Ruby kaynak kodunun şu anki birincil deposu
[git.ruby-lang.org/ruby.git][gitrlo]'tir.
Ayrıca [GitHub'da bir yansı][7] da vardır. Lütfen genel olarak bu yansıyı
kullanın.

Git kullanarak en son Ruby kaynak kodunu alabilirsiniz.
Komut satırınızdan:

{% highlight sh %}
$ git clone https://github.com/ruby/ruby.git
{% endhighlight %}

Şimdi `ruby` dizini Ruby'nin geliştirme sürümü (ruby-trunk) için en son kaynak
kodu içerecektir.

Ayrıca
[İşleyici olmayanlar için geliştirmeye NASIL katılınır][noncommitterhowto]
belgesini de inceleyin.

Eğer işleme izniniz varsa ve bir şey itmek istiyorsanız, birincil depoyu
kullanmalısınız.

{% highlight sh %}
$ git clone git@git.ruby-lang.org:ruby.git
{% endhighlight %}

### Yamalar ile Ruby'yi İyileştirmek
{: #patching-ruby}

Çekirdek ekip, Matz ve ekibine yamaların ve hata bildirimlerinin gönderilmesi
için bir [konu takipçisi][10] sürdürmektedir. Bu bildirimler ayrıca tartışmak
için [Ruby-Core e-posta listesi][mailing-lists]ne de gönderilmektedir.
yani isteğinizin dikkat çektiğine emin olabilirsiniz. Yamalarınızı ayrıca
e-posta listesine de gönderebilirsiniz. Her şekilde, ortaya çıkan tartışmada
yer almanız tavsiye edilir.

Yamanızın göz önüne alınabilmesi için takip etmeniz gereken bazı ipuçları için
lütfen, Matz'in hazırladığı, [Yama Yazıcı Kılavuzu][writing-patches]na bakın.

Özetle, bir yama inşa etmek için gereken adımlar:

1.  Ruby kaynak kodunun bir kopyasını GitHub'dan alın. Genelde hata
    düzeltmeleri ve yeni özellikler için olan yamalar Ruby kaynağının gövdesine
    (trunk) gönderilmelidir.

        $ git clone https://github.com/ruby/ruby.git

    Eğer sadece bir sürdürme dalına özgü bir hatayı düzeltiyorsanız, ilgili
    dalın bir kopyasına geçin.

        $ git checkout ruby_X_X

    X_X, geçmek istediğiniz sürüm ile değiştirilmelidir.

2.  İyileştirmelerinizi koda ekleyin.

3.  Bir yama oluşturun.

        $ git diff > ruby-changes.patch

4.  [Konu takipçisi][10]nde bir etiket oluşturun ya da yamanızı, bir değişiklik
    kaydı ile birlikte [Ruby-Core e-posta listesi][mailing-lists]ne gönderin.

5.  Eğer yamanız konusunda herhangi bir eleştiri olmazsa, yamanız sonrasında
    uygulanmak üzere işleyicilerin onayını bekleyecektir.

**Lütfen dikkat:** yamalar [birleşik fark][12] olarak gönderilmelidir.
Yamaların nasıl birleştirildiği ile ilgili daha fazla ayrıntı için,
[diffutils başvurusu][13]na bakın.

Ruby'nin geliştirilmesi [Ruby-Core e-posta listesi][mailing-lists]nde
tartışılmaktadır. Yani eğer yamanızın uğraşmaya değer olup olmadığı konusunda
meraklıysanız ya da Ruby'nin geleceği konusunda bir tartışma başlatmak
istiyorsanız, buraya gelmeye çekinmeyin. Konu dışı tartışmaların bu listede
tolere edilmeyeceğini unutmayın, ses seviyesi çok az olmalı, konular yerinde,
iyi düşünülmüş ve iyi yazılmış olmalıdır. Ruby'nin yaratıcısına hitap ettiğimiz
için hadi biraz hürmet gösterelim.

Ruby'nin çekirdek geliştiricilerinin çoğunun Japonya'da yaşadığını ve çoğu çok
iyi İngilizce konuşsa da belirli bir zaman dilimi farkı olduğunu aklınızda
bulundurun. Onlar ayrıca İngilizce'sinin yanında Japon geliştirme listeleriyle
de uğraşıyorlar. Sabırlı olun, eğer talebiniz çözülmediyse, birkaç gün sonra
dürtmeyi deneyin.


### Dallar hakkında bir not
{: #branches-ruby}

Ruby'nin kaynak kodu 22 Nisan 2019'a kadar Subversion deposunda yönetiliyordu.
Bu sebeple bazı dallar hala Subversion altında yönetiliyor olabilir.
SVN deposunu görüntüleyebilirsiniz.

* [&lt;URL:https://git.ruby-lang.org/ruby.git&gt;][svn-viewvc]

Fakat bununla ilgili bir endişeniz olmamalı (bir dal geliştiricisi değilseniz).
Git çalışma kopyanızda dallara geçiş yapabilirsiniz.
Örneğin, aşağıdaki komutu çalıştırın.

{% highlight sh %}
$ git checkout ruby_X_X
{% endhighlight %}

X_X, geçmek istediğiniz sürüm ile değiştirilmelidir.

Dallarda değişiklik yapmak istiyorsanız, lütfen [konu takipçimiz][10]de bir
konu açın. Ayrıca takip eden bölüme bakın.

[gitrlo]: https://git.ruby-lang.org/ruby.git
[mailing-lists]: /tr/community/mailing-lists/
[writing-patches]: /tr/community/ruby-core/writing-patches/
[noncommitterhowto]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[svn-viewvc]: https://git.ruby-lang.org/ruby.git
[7]: https://github.com/ruby/ruby
[10]: https://bugs.ruby-lang.org/
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
