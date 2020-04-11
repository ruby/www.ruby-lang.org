---
layout: page
title: "Изтегляне на Ruby"
lang: bg
---

Това е мястото, от където можете да свалите последната версия на Ruby.
Наличната стабилна версия е {{ site.data.downloads.stable[0] }}.
Препоръчително е да прочете [Лиценз на Ruby][license].
{: .summary}

### Начини за инсталиране

Има няколко начина да се инсталира Ruby за всяка голяма платформа:

* За Linux/UNIX може да бъде използван пакетният мениджър на
  дистрибуцията (apt-get, yum, pacman, etc.) или приложение за
  управление на ruby версии ([rbenv][rbenv] и [RVM][rvm]).
* За macOS може да се използва инструмент за управление на ruby версии
  ([rbenv][rbenv] и [RVM][rvm]).
* За Windows машини може да бъде използван [RubyInstaller][rubyinstaller].

Вижте страницата за [Инсталация][installation] за по-подробна
информация за инсталиране.

Ruby може да бъде инсталиран и от изходен код на всички големи платформи.

### Инсталация от изходен код

Инсталацията на Ruby от изходен код е добро решение, ако се чувствате
комфортно с вашата платформа и се нуждаете от специфични настройки за
вашата среда. Това е и добър вариант, ако липсва прекомпилиран пакет за
вашата платформа.

Вижте страницата за [Инсталация][installation] за детайли относно
инсталирането от изходен код. Ако имате проблеми с компилирането на Ruby,
може да използвате някое от приложенията за управление на Ruby версии,
споменати по-горе. Те могат да ви помогнат.

* **Стабилни версии:**{% for version in site.data.downloads.stable %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.data.downloads.security_maintenance %}
* **Получават security ъпдейти (скоро ще бъдат преустановени!):**{% for version in site.data.downloads.security_maintenance %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.eol %}
* **Преустановена поддръжка (EOL):**{% for version in site.data.downloads.eol %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **Snapshots:**
  * [Stable Snapshot]({{ site.data.downloads.stable_snapshots[0].url.gz }}):
    Това е архвирано копие на последната стабилна версия.
  * [Nightly Snapshot]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    Това е архивирано копие на последната версия в Git хранилището.
    Възможно е да съдържа бъгове или некоригирани проблеми.

За повече информация относно Subversion хранилището можете да посетите
страницата [Ruby Core](/bg/community/ruby-core/).

Изходният код на Ruby е наличен и от голям брой
[огледални сайтове][mirrors].
Опитайте да използвате огледален сайт, който се намира възможно най-близо до
вас.



[license]: {{ site.license.url }}
[installation]: /bg/documentation/installation/
[mirrors]: /en/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
