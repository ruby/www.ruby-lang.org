---
layout: page
title: "Изтегляне на Ruby"
lang: bg
---

Това е мястото, от където можете да свалите последната версия на Ruby.
Наличната стабилна версия е {{ site.downloads.stable[0].version }}.
Препоръчително е да прочете [Лиценз на Ruby][license].
{: .summary}

### Начини за инсталиране

Има няколко начина да се инсталира Ruby за всяка голяма платформа:

* За Linux/UNIX може да бъде използван пакетният мениджър на
  дистрибуцията (apt-get, yum, pacman, etc.) или приложение за
  управление на ruby версии (rbenv и RVM).
* За OS X може да се използва инструмент за управление на ruby версии
  (rbenv и RVM).
* За Windows машини може да бъде използван RubyInstaller.

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

* **Стабилни версии:**{% for release in site.downloads.stable %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.downloads.security_maintenance %}
* **Получават security ъпдейти (скоро ще бъдат преустановени!):**{% for release in site.downloads.security_maintenance %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.downloads.eol %}
* **Преустановена поддръжка (EOL):**{% for release in site.downloads.eol %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **Snapshots:**
  * [Stable Snapshot]({{ site.downloads.stable_snapshot.url.gz }}):
    Това е архвирано копие на последната стабилна версия в SVN хранилището.
  * [Nightly Snapshot]({{ site.downloads.nightly_snapshot.url.gz }}):
    Това е архивирано копие на последната версия в SVN хранилището.
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
