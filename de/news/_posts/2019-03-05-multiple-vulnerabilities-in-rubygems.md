---
layout: news_post
title: "Mehrere Sicherheitslücken in RubyGems"
author: "hsbt"
translator: "Marvin Gülker"
date: 2019-03-05 00:00:00 +0000
tags: security
lang: de
---

Es gibt mehrere Sicherheitslücken in der mit Ruby mitgelieferten
Software RubyGems, wie [auf dem offiziellen RubyGems-Blog dargelegt wird](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## Details

Die folgenden Sicherheitslücken wurden gemeldet:

* CVE-2019-8320: Verzeichnislöschung durch Symlinks bei der Dekompression von Tar-Archiven
* CVE-2019-8321: Sicherheitsproblem durch Einschleusung von Escape-Sequenzen in `verbose`
* CVE-2019-8322: Sicherheitsproblem durch Einschleusung von Escape-Sequenzen in `gem owner`
* CVE-2019-8323: Sicherheitsproblem durch Einschleusung von Escape-Sequenzen in der Verarbeitung von API-Antworten
* CVE-2019-8324: Die Installation eines präparierten Gems kann zur Ausführung beliebigen Codes führen
* CVE-2019-8325: Sicherheitsproblem durch Einschleusung von Escape-Sequenzen in Fehlermeldungen

Allen Ruby-Nutzern wird dringend empfohlen, so schnell wie möglich
einen der folgenden Workarounds anzuwenden.

## Betroffene Versionen

* Ruby 2.4er-Serie: 2.4.5 und früher
* Ruby 2.5er-Serie: 2.5.3 und früher
* Ruby 2.6er-Serie: 2.6.1 und früher
* Trunk vor Revision 67168

## Workarounds

Die Fehler wurden in RubyGems 2.7.6.2/2.7.9/3.0.3 und später behoben,
d.h. Sie können RubyGems auf die neueste Version aktualisieren:

```
gem update --system
```

Wenn Sie RubyGems nicht aktualisieren können, können Sie stattdessen
die folgenden Patches anwenden.

* [für Ruby 2.4.5](https://bugs.ruby-lang.org/attachments/7669)
* [für Ruby 2.5.3](https://bugs.ruby-lang.org/attachments/7670)
* [für Ruby 2.6.1](https://bugs.ruby-lang.org/attachments/7671)

Trunk-Nutzer müssen auf die neueste Revision aktualisieren.

## Danksagung

Diese Nachricht beruht auf dem [offiziellen RubyGems-Blogpost](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## Historie

* Erstveröffentlichung am 2019-03-05 00:00:00 UTC
* Verlinkung zu den Patches aktualisiert am 2019-03-06 05:26:27 UTC
