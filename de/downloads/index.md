---
layout: page
title: "Ruby herunterladen"
lang: de
---

Hier kannst Du die aktuellen Ruby-Distributionen herunterladen.
Die stabile Version ist derzeit {{ site.downloads.stable.version }}.
Bitte nimm auch [Rubys Lizenz][license] zur Kenntnis.
{: .summary}

### Verschiedene Möglichkeiten, Ruby zu installieren

Auf allen wichtigen Plattformen gibt es mehrere Möglichkeiten,
Ruby zu installieren:

* Auf Linux/UNIX kann man das Paketverwaltungssystem der jeweiligen
  Distribution oder Drittanbieter-Werkzeuge (rbenv und RVM) verwenden.
* Auf OS X kann man Drittanbieter-Werkzeuge verwenden (rbenv und RVM).
* Auf Windows kann man RubyInstaller verwenden.

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

* **Stabile Version:**
  [Ruby {{ site.downloads.stable.version }}][stable-gz]<br>
  sha256: {{ site.downloads.stable.sha256.gz }}

* **Stabile Vorgängerversion:**
  [Ruby {{ site.downloads.previous.version }}][previous-gz]<br>
  sha256: {{ site.downloads.previous.sha256.gz }}

* **Stabile Vorgängerversion (2.0.0):**
  [Ruby {{ site.downloads.previous20.version }}][previous20-gz]<br>
  sha256: {{ site.downloads.previous20.sha256.gz }}

* **Stabile Vorgängerversion (1.9.3):**
  [Ruby {{ site.downloads.previous19.version }}][previous19-gz]<br>
  sha256: {{ site.downloads.previous19.sha256.gz }}

* **Snapshots:**
  * [Stable Snapshot][stable-snapshot-gz]:
    Hierbei handelt es sich um den neuesten Snapshot des stabilen Zweiges.
  * [Nightly Snapshot][nightly-gz]:
    Hierbei handelt es sich um eine Kopie der SVN-Version von letzter Nacht.
    Es besteht durchaus die Gefahr, dass in dieser Version noch nicht
    korrigierte Fehler enthalten sind.

Weitergehende Informationen zum Subversion- und Git-Repository von Ruby
sind unter [Ruby Core](/de/community/ruby-core/) zu finden.

Der Ruby-Quellcode ist auch auf verschiedenen
[Mirror-Seiten][mirrors] zu finden.
Bitte nutze einen Mirror in deiner Nähe.



[license]: {{ site.license.url }}
[installation]: /de/documentation/installation/
[stable-gz]: {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[previous20-gz]: {{ site.downloads.previous20.url.gz }}
[previous19-gz]: {{ site.downloads.previous19.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[mirrors]: /en/downloads/mirrors/
