---
layout: page
title: "Ruby'yi İndirin"
lang: tr
---

Burada en son Ruby dağıtımlarını işinize gelen şekliyle bulabilirsiniz.
En son kararlı sürüm {{ site.data.downloads.stable[0] }} sürümüdür.
Lütfen önce [Ruby'nin lisansını][license] okuyun.
{: .summary}

### Ruby'yi Kurmanın Yolları

Her ana platform üstünde Ruby'yi kurmak için birkaç araç vardır:

* Linux/UNIX'te dağıtımınızın paket yönetim sistemini ya da
  üçüncü taraf araçları ([rbenv][rbenv] ve [RVM][rvm]) kullanabilirsiniz.
* macOS makinelerinde üçüncü taraf araçları ([rbenv][rbenv] ve [RVM][rvm]) kullanabilirsiniz.
* Windows makinelerinde [RubyInstaller][rubyinstaller]'ı kullanabilirsiniz.

Paket yönetim sistemleri ya da üçüncü taraf araçları kullanma hakkındaki
ayrıntılar için [Kurulum][installation] sayfasına bakın.

Tabii ki, ayrıca tüm ana platformlar üzerinde Ruby'yi kaynaktan da kurabilirsiniz.

### Ruby'yi Derlemek — Kaynak Kod

Kaynak kodundan kurmak, platformunuza yeterince hakimseniz ve
ortamınızda özel ayarlar gerekiyorsa uygun çözümdür. Bu çözüm ayrıca
eğer platformunuz için hazır paketler yoksa da uygun olacaktır.

Ruby'yi kaynaktan derleme hakkındaki ayrıntılar için [Kurulum][installation]
sayfasına bakın. Ruby'yi derlerken bir sorunla karşılaşıyorsanız,
yukarıda bahsedilen üçüncü taraf araçlardan birini kullanmayı düşünün.
Bunlar size yardımcı olabilir.

* **Kararlı sürümler:**
  {% for version in site.data.downloads.stable %}
  {% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}
  {% endfor %}

{% if site.data.downloads.preview %}
* **Önizleme sürümleri:**
  {% for version in site.data.downloads.preview %}
  {% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}
  {% endfor %}
{% endif %}

{% if site.data.downloads.security_maintenance %}
* **Güvenlik sürdürmesi sürecinde (yakında hayatının sonuna gelecek!):**
  {% for version in site.data.downloads.security_maintenance %}
  {% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}
  {% endfor %}
{% endif %}

{% if site.data.downloads.eol %}
* **Artık sürdürülmüyor (Hayatının sonuna gelmiş):**
  {% for version in site.data.downloads.eol %}
  {% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}
  {% endfor %}
{% endif %}

* **Anlıklar:**
  * [Kararlı Anlık]({{ site.data.downloads.stable_snapshots[0].url.gz }}):
    Bu, şu anki kararlı dalın son anlığının bir tar arşividir.
    [Gecelik Anlık]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    Bu, Git'de her ne varsa onun bir tar arşividir, gecelik olarak yapılır.
    Bu, hata ve başka sorunlar içerebilir, sorumluluğunu alarak kullanın!

Belirli sürümler, özellikle daha eski sürümler ya da önizlemeler,
hakkında daha fazla bilgi için, [Sürümler sayfası][releases]na bakın.
Çeşitli Ruby dallarının şu anki sürdürme durumları hakkında bilgi
[Dallar sayfası][branches]nda bulunabilir.

Ruby Subversion ve Git depoları hakkında bilgi için [Ruby
Core](/tr/community/ruby-core/) sayfasına bakın.

Ruby kaynağı tüm dünyaya yayılmış [Yansı Siteleri][mirrors]nden
ulaşılabilirdir.
Lütfen yakınınızdaki bir yansıyı kullanmaya çalışın.



[license]: {{ site.license.url }}
[installation]: /tr/documentation/installation/
[releases]: /en/downloads/releases/
[branches]: /en/downloads/branches/
[mirrors]: /en/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
