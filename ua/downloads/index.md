---
layout: page
title: "Завантажити Ruby"
lang: ua
---

Тут ви можете отримати найсвіжіші дистрибутиви Ruby у зручному для вас форматі.
Поточна стабільна версія — {{ site.data.downloads.stable[0] }}.
Будь ласка, обов’язково прочитайте [ліцензію Ruby][license].
{: .summary}

### Способи встановлення Ruby

Ми маємо кілька інструментів для кожної основної платформи:

* На Linux/UNIX можна використовувати систему керування пакетами вашого
  дистрибутива або сторонні інструменти ([rbenv][rbenv] і [RVM][rvm]).
* На macOS можна використовувати сторонні інструменти ([rbenv][rbenv] і [RVM][rvm]).
* На Windows можна використовувати [RubyInstaller][rubyinstaller].

Дивіться сторінку [Встановлення][installation] для деталей щодо використання
систем керування пакетами або сторонніх інструментів.

Звісно, ви також можете встановити Ruby з вихідного коду на всіх основних платформах.

### Компілювання Ruby — вихідний код

Встановлення з вихідного коду — чудове рішення, коли ви добре орієнтуєтеся
у своїй платформі та, можливо, потребуєте специфічних налаштувань для
вашого середовища. Це також корисний варіант, якщо для вашої платформи
немає готових пакунків.

Дивіться сторінку [Встановлення][installation] для деталей щодо збирання
Ruby з вихідного коду. Якщо у вас виникають проблеми з компіляцією Ruby,
розгляньте можливість використання одного зі згаданих вище сторонніх
інструментів — вони можуть допомогти.

* **Стабільні релізи:**{% for version in site.data.downloads.stable %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.data.downloads.preview %}
* **Попередні релізи:**{% for version in site.data.downloads.preview %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.security_maintenance %}
* **Фаза security maintenance (скоро EOL):**{% for version in site.data.downloads.security_maintenance %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.eol %}
* **Більше не підтримується (EOL):**{% for version in site.data.downloads.eol %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **Снапшоти:**{% for snapshot in site.data.downloads.stable_snapshots %}
  * [Стабільний снапшот гілки {{ snapshot.branch }}]({{ snapshot.url.gz }}):
    Це tarball із найновішим снапшотом поточної гілки `{{ snapshot.branch }}`.{% endfor %}
  * [Нічний снапшот]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    Це tarball з тим, що є в Git, сформований щоночі.
    Він може містити помилки або інші проблеми — використовуйте на власний ризик!

Для детальнішої інформації про конкретні релізи, особливо старіші або
попередні, дивіться сторінку [Релізи][releases].
Інформацію про поточний статус підтримки різних гілок Ruby можна знайти
на сторінці [Гілки][branches].

Для інформації про репозиторії Ruby у Subversion та Git дивіться сторінку
[Ruby Core](/ua/community/ruby-core/).

Вихідний код Ruby доступний через глобальний набір
[дзеркальних сайтів][mirrors].
Будь ласка, намагайтеся використовувати дзеркало, що знаходиться ближче до вас.



[license]: /ua/about/license.txt
[installation]: /ua/documentation/installation/
[releases]: /ua/downloads/releases/
[branches]: /ua/downloads/branches/
[mirrors]: /ua/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
