---
layout: news_post
title: "Änderungen an der Ruby-Versionierung ab 2.1.0"
author: "zzak"
translator: "Quintus"
date: 2013-12-21 2:00:00 +0000
lang: de
---

Wir haben uns entschieden, ab Ruby 2.1.0 zu einer eher [semantischen
Versionierung](http://semver.org/) zu wechseln.

Um ein besser organisiertes und ordentlich nutzbares
Versionierungsschema für Ruby zur Verfügung zu stellen, haben wir uns
dafür entschieden, die folgenden Richtlinien umzusetzen.

## Richtlinienänderungen

Die Richtlinie basiert auf einem Vorschlag des Administrators von
ruby-lang.org, Hiroshi Shibata ([@hsbt](https://twitter.com/hsbt)).

### Versionierungsschema

* `MAJOR`: Wird erhöht, wenn es inkompatible Änderungen gibt, die
  nicht per MINOR veröffentlicht werden können.
  * Für besondere Ereignisse reserviert.
* `MINOR`: Wird jedes Jahr an Weihnachten erhöht, kann API-kompatibel sein.
* `TEENY`: Sicherheits- oder Bugfix, der API-Kompatibilität
  gewährleistet.
  * Kann größer als 10 werden (z.B. `2.1.11`) und wird etwa alle 2-3
    Monate erhöht.
* `PATCH`: Anzahl der Commits seit dem letzten `MINOR`-Release (wird
  auf 0 zurückgesetzt, wenn `MINOR` erhöht wird).

### Branching-Schema

Wir werden weiterhin die folgenden Zweige unterstützen:

* trunk
* `ruby_{MAJOR}_{MINOR}_{TEENY}`

### API-Kompatibilität

Die folgenden Dinge können als inkompatible Änderung markiert werden
und somit eine Erhöhung der `MINOR`-Version erforderlich machen:

* Entfernen von API-Features auf C-Ebene
* Nicht rückwärtskompatible Änderungen und Erweiterungen

### ABI-Kompatibilität

Das ABI wird dem folgenden Schema folgen: `{MAJOR}.{MINOR}.0`

Wir bemühen und so gut wie möglich (_best effort_), die
ABI-Kompatibilität innerhalb derselben `MINOR`-Veröffentlichungsreihe
aufrecht zu erhalten, daher wird `TEENY` auf 0 festgehalten.

## Referenzen

Sie können die folgenden Beiträge lesen, um mehr über diesen Vorschlag
zu erfahren:

* [Einführung eines semantischen Versionierungsschemas und einer Branching-Richtlinie](https://bugs.ruby-lang.org/issues/8835)
* [Akzeptierter Vorschlag auf Englisch](https://gist.github.com/sorah/7803201)
* [Akzeptierter Vorschlag auf Japanisch](https://gist.github.com/hsbt/7719305)

## Vielen Dank!

Ich möchte mich an dieser Stelle persönlich bei jedem bedanken, der zu
dieser Diskussion beigetragen hat. Jeder Schritt, den wir unternehmen,
ist einer hin zu einem stabileren und effektiveren Ruby.
