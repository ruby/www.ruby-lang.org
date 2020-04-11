---
layout: news_post
title: "Ruby 2.4.9 Yayınlandı"
author: "usa"
translator: "İsmail Arılık"
date: 2019-10-02 09:00:00 +0000
lang: tr
---

Ruby 2.4.9 yayınlandı.

Bu sürüm, 2.4.8'in yeniden paketlenmiş halidir çünkü önceki Ruby 2.4.8 yayın tar arşivi kurulmuyordu.
(Ayrıntılar için [[Hata #16197]](https://bugs.ruby-lang.org/issues/16197) etiketine bakın.)
2.4.8 ile 2.4.9 arasında sürüm numaraları dışında önemli bir fark yok.

Ruby 2.4 artık güvenlik sürdürme evresinde, Mart 2020'nin sonuna kadar.
Bu tarihten sonra, Ruby 2.4'ün sürdürülmesi sona erecek.
2.6 ya da 2.5 gibi daha yeni Ruby sürümlerine göç etmeyi planlamaya başlamanızı tavsiye ederiz.

## İndirin

{% assign release = site.data.releases | where: "version", "2.4.9" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## Yayın Yorumu

Bu yayında emeği geçen herkese teşekkür ederiz.
