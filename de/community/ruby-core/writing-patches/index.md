---
layout: page
title: "Leitfaden für Patch-Autoren"
lang: de
---

Hier findest du einige Tips direkt von Matz dazu, wie deine Patches berücksichtigt werden können.
{: .summary}

Diese Richtlinien wurden von einem [Post von Matz][ruby-core-post]
auf der Ruby-Core Mailingliste übernommen und angepasst:

* Implementiere eine Änderung pro Patch

  Das ist das größte Hindernis für die meisten verzögerten Patches.
  Wenn du einen Patch sendest, der gleichzeitig mehrere Bugs behebt
  (und Features hinzufügt), dann müssen wir sie vor der Übernahme auftrennen.
  Das ist für uns geschäftige Entwickler eine mühsame Aufgabe.
  Daher werden solche Patches oft verzögert. Bitte keine großen Patches.

* Liefere Beschreibungen

  Manchmal beschreibt ein bloßer Patch das gelöste Problem nicht hinreichend.
  Eine bessere Beschreibung (das behobene Problem, Vorbedigungen, Plattform
  etc.) würde für eine zügige Übernahme helfen.

* Verwende die aktuellste Revision

  Dein Problem könnte in der aktuellsten Revision bereits gelöst sein.
  Oder der Code ist dort vielleicht bereits völlig anders.
  Vor dem Senden eines Patches solltest du bitte die aktuellste Version laden
  (der `trunk` Branch für die neueste Entwicklungsversion,
  `{{ site.svn.stable.branch }}` für {{ site.svn.stable.version }}) aus dem Subversion-Repository.

* Verwende `diff -u`

  Wir verwenden lieber `diff -u` Unified-Diff-Patches als `diff -c` oder
  andere Patchformate. Diese sind viel leichter zu begutachten.
  Sende keine ganzen modifizierten Dateien, denn wir wollen nicht selbst einen
  Diff erstellen.

* Liefere Test-Cases (optional)

  Ein Patch mit Test-Cases (vorzugsweise ein Patch zu `test/*/test_*.rb`)
  würde uns helfen, den Patch und deine Absicht besser zu verstehen.

In Zukunft wechseln wir vielleicht auf einen Git-Workflow mit Pull-Requests.
Aber bis dahin wird das Befolgen dieser Richtlinien Frustration vermeiden.

[ruby-core-post]: https://blade.ruby-lang.org/ruby-core/25139
