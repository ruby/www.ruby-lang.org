---
layout: news_post
title: "Auf dem Weg zu Ruby 2"
author: "Quintus"
lang: de
---

Ein kurzer Abriss über den momentanen Zustand von Ruby 2.

(Ich schreibe diese Nachricht anstelle von Endoh-san, dem
Ruby-Release-Manager, der momentan sehr beschäftigt ist)

Wir sind gerade dabei, Ruby 2.0.0 für die Veröffentlichung
aufzupolieren. Der Code für Ruby 2 befindet sich momentan im „Code
Freeze“ und es dürfen keine neuen Features mehr hinzugefügt werden.

Außerdem versuchen wir, **kritische** Blocker für Ruby 2.0.0 ausfindig
zu machen. Wenn Sie also etwas freie Zeit zur Verfügung haben, versuchen
Sie doch bitte, den momentanen Trunk von Ruby 2.0.0 mit Ihren
Anwendungen zu verwenden. Wenn Ihnen dabei irgendwelche Probleme
auffallen, teilen Sie uns diese bitte mit.

Referenz: [Ungelöste Bugs][1]=

Wenn Sie Ihre Probleme gern bis zum Release von Ruby 2 gelöst sehen
möchten, öffnen Sie bitte ein Ticket — wir werden ihnen dann hohe
Priorität einräumen.

Vielen Dank für Ihre Hilfe.

### Plan für die Veröffentlichung von Ruby 2

#### Meilensteine

* Showstopper identifizieren: ASAP
* Code-Freeze: 23. Dezember 2012
* Veröffentlichung von 2.0.0-rc1: Erste Januarwoche 2013 (erwartet)
* Veröffentlichung von 2.0.0-rc2: Erste Februarwoche 2013 (erwartet)
* Veröffentlichung von 2.0.0-p0: 24. Februar 2013

#### Showstopper identifizieren

In den etwa 300+ offenen Tickets müssen die „Showstopper“ ausfindig
gemacht werden und mit der Wichtigkeit „unverzüglich“ (*immediate*)
versehen werden. Dabei ist ein „Showstopper“:

* Ein reproduzierbarer Segfault
* Ein Problem, dass wirkliche/existierende Programme schwer betrifft
* Ein ernsthaftes Problem ohne Workaround

Nach diesem Prozess neu eröffnete Tickets werden je nach Notwendigkeit
nachträglich als Showstopper identifiziert.

#### Code Freeze: 23. Dezember

Oder: Deadline für Feature-Implementationen. 2.0.0 wird KEINE (auch
keine akzeptierten) Features enthalten, die nicht vor dieser Deadline
vollständig implementiert wurden.

#### Veröffentlichung von 2.0.0-rc1: Erste Januarwoche (erwartet)

Wenn alle Showstopper aus dem Weg geräumt sind, werden wir 2.0.0-rc1
veröffentlichen. Das kann je nach Status auch spät werden.

Die Unterstützung von Plattformen wird davon abhängig sein, ob der RC1
auf einer Plattform funktioniert oder nicht. Nach 2.0.0-rc1 werden wir
versuchen, so viele nicht-showstopping Bugs wie möglich zu beheben.

#### Veröffentlichung von 2.0.0-rc2: Erste Februarwoche (erwartet)

Nachdem alle Showstopper, die nach der Veröffentlichung des RC1 gemeldet
wurden, aus dem Weg geräumt worden sind, werden wir 2.0.0-rc2
veröffentlichen. Zu diesem Zeitpunkt wird voraussichtlich ein Branch
ruby\_2\_0 angelegt werden.

Nach dem 2.0.0-rc2 werden wir nach Möglichkeit nur noch Showstopper
beseitigen, die nach dem RC2 gemeldet wurden. Generell werden wir KEINE
nicht-showstopping Bugs beheben, um Regressionen zu vermeiden.

#### Veröffentlichung von 2.0.0-p0: 24. Februar

PARTY! パーティー！

\[Anm. d. Übers. „Ich“ bezieht sich in diesem Beitrag auf Sasada-san.
Den „Plan für die Veröffentlichung von Ruby 2“ hat Endoh-san
erarbeitet\]



[1]: https://bugs.ruby-lang.org/projects/ruby-trunk/issues?set_filter=1&amp;f%5B%5D=status_id&amp;op%5Bstatus_id%5D=o&amp;f%5B%5D=tracker_id&amp;op%5Btracker_id%5D=%3D&amp;v%5Btracker_id%5D%5B%5D=1&amp;f%5B%5D=&amp;c%5B%5D=tracker&amp;c%5B%5D=status&amp;c%5B%5D=priority&amp;c%5B%5D=subject&amp;c%5B%5D=assigned_to&amp;c%5B%5D=updated_on&amp;group_by
