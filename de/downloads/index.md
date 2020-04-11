---
layout: page
title: "Ruby herunterladen"
lang: de
---

Hier kannst Du die aktuellen Ruby-Distributionen herunterladen.
Die stabile Version ist derzeit {{ site.data.downloads.stable[0] }}.
Bitte nimm auch [Rubys Lizenz][license] zur Kenntnis.
{: .summary}

### Verschiedene Möglichkeiten, Ruby zu installieren

Auf allen wichtigen Plattformen gibt es mehrere Möglichkeiten,
Ruby zu installieren:

* Auf Linux/UNIX kann man das Paketverwaltungssystem der jeweiligen
  Distribution oder Drittanbieter-Werkzeuge ([rbenv][rbenv] und [RVM][rvm]) verwenden.
* Auf macOS kann man Drittanbieter-Werkzeuge verwenden ([rbenv][rbenv] und [RVM][rvm]).
* Auf Windows kann man [RubyInstaller][rubyinstaller] verwenden.

Siehe die [Installationsanleitung][installation] für Details zu
den verschiedenen Paketverwaltungssystemen und Drittanbieter-Werkzeugen.

Natürlich kann Ruby auf allen wichtigen Plattformen auch aus dem
Quellcode installiert werden.

### Ruby aus dem Quellcode kompilieren

Ruby aus dem Quellcode zu installieren ist eine geeignete Lösung,
wenn Du Dich gut mit Deinem System auskennst und eventuell spezielle
Einstellungen für Deine Umgebung benötigst. Es ist außerdem eine gute
Lösung, falls es keine vorgefertigten Pakete für Dein System gibt.

Siehe die [Installationsanleitung][installation] für Details.
Falls es Schwierigkeiten beim Kompilieren geben sollte, solltest Du
vielleicht zu einem der oben erwähnten Drittanbieter-Werkzeuge greifen.

* **Stabile Versionen:**{% for version in site.data.downloads.stable %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.data.downloads.security_maintenance %}
* **In der Phase der Sicherheits-Maintenance (Unterstützung endet bald!):**{% for version in site.data.downloads.security_maintenance %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.eol %}
* **Nicht mehr unterstützt (EOL):**{% for version in site.data.downloads.eol %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **Snapshots:**
  * [Stable Snapshot]({{ site.data.downloads.stable_snapshots[0].url.gz }}):
    Hierbei handelt es sich um den neuesten Snapshot des stabilen Zweiges.
  * [Nightly Snapshot]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    Hierbei handelt es sich um eine Kopie der Git von letzter Nacht.
    Es besteht durchaus die Gefahr, dass in dieser Version noch nicht
    korrigierte Fehler enthalten sind.

Weitergehende Informationen zum Subversion- und Git-Repository von Ruby
sind unter [Ruby Core](/de/community/ruby-core/) zu finden.

Der Ruby-Quellcode ist auch auf verschiedenen
[Mirror-Seiten][mirrors] zu finden.
Bitte nutze einen Mirror in deiner Nähe.



[license]: {{ site.license.url }}
[installation]: /de/documentation/installation/
[mirrors]: /en/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
