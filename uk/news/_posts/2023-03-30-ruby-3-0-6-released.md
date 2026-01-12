---
layout: news_post
title: "Вийшов Ruby 3.0.6"
author: "usa"
translator: "Andrii Furmanets"
date: 2023-03-30 12:00:00 +0000
lang: uk
---

Вийшов Ruby 3.0.6.

Цей реліз включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2023-28755: Вразливість ReDoS у URI]({%link uk/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: Вразливість ReDoS у Time]({%link uk/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

Цей реліз також включає кілька виправлень помилок.
Див. [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_0_6) для подробиць.

Після цього релізу ми завершуємо нормальну фазу підтримки Ruby 3.0, і Ruby 3.0 входить у фазу підтримки безпеки.
Це означає, що ми більше не переноситимемо жодні виправлення помилок до Ruby 3.0, крім виправлень безпеки.

Термін фази підтримки безпеки заплановано на рік.
Ruby 3.0 досягає EOL, і його офіційна підтримка закінчується до кінця фази підтримки безпеки.
Тому ми рекомендуємо почати планувати оновлення до Ruby 3.1 або 3.2.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.0.6" | first %}

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

## Коментар до релізу

Багато комітерів, розробників та користувачів, які надали звіти про помилки, допомогли нам зробити цей реліз.
Дякуємо за їхній внесок.

Підтримка Ruby 3.0, включаючи цей реліз, базується на "Угоді про стабільну версію Ruby" Асоціації Ruby.
