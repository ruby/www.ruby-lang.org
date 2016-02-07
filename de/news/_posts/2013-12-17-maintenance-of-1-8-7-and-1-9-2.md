---
layout: news_post
title: "Verlängerung der Sicherheits-Maintenance von Ruby 1.8.7 und 1.9.2"
author: "zzak"
translator: "Quintus"
date: 2013-12-17 20:49:03 +0000
lang: de
---

Mit sofortiger Wirkung werden 1.8.7 und 1.9.2 bis Juni 2014 mit
Sicherheitspatches versorgt.

* Terence Lee([@hone02](https://twitter.com/hone02)) und
  Zachary Scott ([@_zzak](https://twitter.com/_zzak))
  übernehmen die Wartung.
* Nach Ablauf der 6-monatigen Maintenance-Periode können wir
  weitere Committer hinzufügen, um eine neuerliche Verängerung um 6
  Monate zu ermöglichen.

Diese Verlängerung der Maintenance wird durch [Heroku][heroku]
ermöglicht; siehe dazu deren Blogpost [A Patch in Time: Securing
Ruby][securing-ruby].

### Fehler melden

Im Laufe dieser erweiterten Unterstützung werden wir _nur_
Sicherheitspatches auf das Quellcoderepository von [1.8.7][source-187]
und [1.9.2][source-192] anwenden.

Wir nehmen Sicherheit sehr ernst; wenn Sie eine Sicherheitslücke
finden, melden Sie sie bitte umgehend an security@ruby-lang.org. Dabei
handelt es sich um eine private Mailingliste, sodass die gemeldeten
Probleme veröffentlicht werden können, nachdem ein Fix erstellt wurde.

Weitere Informationen finden sie unter [ruby-lang.org/de/security][security-de]

### Releaseverwaltung

Wie ich schon weiter oben ausgeführt habe, werden wir ausschließlich
Sicherheitspatches anwenden und lediglich das Patchlevel erhöhen.

Wir werden keine gepatchten Versionen von 1.8.7 oder 1.9.2 auf
ruby-lang.org zur Verfügung stellen; es steht Ihnen aber natürlich
frei, die Binaries aus dem Quellcode zu bauen. Der Hintergrund hierfür
ist, dass wir keine neuen Tickets wollen, da ein offizielles Release
eine weitergehende Verantwortlichkeit des Ruby-Core-Teams für die
Unterstützung der Version bedeuten würde. Unsere personellen
Kapazitäten sind ohnehin begrenzt, außerdem wollen wir unsere Nutzer
zu Upgrades anhalten, nicht veraltete Versionen unterstützen.

### Warum 1.8.7 wiederbeleben?

Sie erinnern sich vielleicht an die Ankündigung vor etwa 6 Monaten, in
der es hieß, [Ruby 1.8.7 sei am Ende][sunset-187-de].

Tatächlich wird das Ruby-Core-Team weder 1.8.7 noch 1.9.2 weiter
unterstützen, jedoch übernehmen Terence und Zachary die Sicherheits-Maintenance
dieser Versionen als Teil einer _Corporate Sponsorship_.

Schon in der Vergangenheit haben einzelne Unternehmen veraltete
Versionen gepflegt. So übernahm 2009 Engine Yard die Unterstützung von
1.8.6 mit der Veröffentlichung von 1.8.6-p369.

### Ermutigende Worte

Wir möchten diese Gelegenheit nutzen, um Ihnen dringlichst nahezulegen,
so schnell wie möglich auf eine unterstützten Ruby-Version zu
aktualisieren. Zahlreiche Ruby-Core-Mitglieder haben unzählige Stunden
in die Verbesserung der Performance und der Features von Ruby 2.0+
gesteckt und wir wollen, dass Sie in den Genuss dieser Vorteile
kommen.

Vielen Dank für Ihre weitergehende Unterstützung und lasst und Ruby
auch weiterhin verbessern!

[heroku]:        http://heroku.com/
[securing-ruby]: https://blog.heroku.com/archives/2013/12/5/a_patch_in_time_securing_ruby/
[source-187]:    https://bugs.ruby-lang.org/projects/ruby-187/repository
[source-192]:    https://bugs.ruby-lang.org/projects/ruby-192/repository
[security-de]:   https://www.ruby-lang.org/de/security/
[sunset-187-de]: https://www.ruby-lang.org/de/news/2013/06/30/we-retire-1-8-7/
