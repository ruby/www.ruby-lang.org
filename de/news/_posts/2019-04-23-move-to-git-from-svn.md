---
layout: news_post
title: "Ruby-Repository wechselt von Subversion auf Git"
author: "hsbt"
translator: "Marvin Gülker"
date: 2019-04-23 00:00:00 +0000
lang: de
---

Am heutigen Tage wurde das offizielle Repository für die
Programmiersprache Ruby von Subversion auf Git umgestellt.

Das Web-Interface für das neue Repository befindet sich auf
[https://git.ruby-lang.org](https://git.ruby-lang.org) und wird mittels
cgit bereitgestellt. Commit-Hashes von Beitragenden können direkt ins
Ruby-Repository übernommen werden.

## Leitlinien für die Entwicklung

* Wir benutzen keine Themen-Zweige in cgit.
* Das GitHub-Repository wird weiterhin nur als Spiegelung genutzt. Von
  der „Merge Pull Request“-Funktion machen wir keinen Gebrauch.
* Die Zweige ruby_2_4, ruby_2_5 und ruby_2_6 werden weiterhin SVN
  benutzen. Wir werden auf cgit nichts in diese Zweige einpflegen.
* Beginnend mit ruby_2_7 werden wir cgit zur Entwicklung stabiler
  Zweige benutzen.
* Wir benutzen keine Merge-Commits.

## Danksagungen

* k0kubun

  k0kubun hat keine Mühen bei der Entwicklung der Werkzeuge für
  Veröffentlichungs- und Rückportierungsarbeiten gescheut und außerdem
  das Hook-Skript für Git aktualisiert.

* naruse

  naruse hat die notwendigen Änderungen am Ruby-CI und an Redmine
  (bugs.ruby-lang.org) vorgenommen.

* mame

  mame hat das Benachrichtigungsskript für Slack geschrieben.

## Zukünftige Arbeit

Wir sind noch nicht ganz fertig. Wenn Sie auf ein mit der
Git-Umstellung zusammenhängendes Problem stoßen, tragen Sie es bitte
unter [https://bugs.ruby-lang.org/issues/14632](https://bugs.ruby-lang.org/issues/14632)
ein.

Viel Spaß!
