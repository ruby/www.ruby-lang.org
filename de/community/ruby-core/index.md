---
layout: page
title: "Ruby Core"
lang: de
---

Jetzt ist die beste Zeit, die weitere Entwicklung von Ruby zu verfolgen.
Durch das in den letzten Jahren gestiegene Interesse an Ruby besteht ein
wachsender Bedarf an Talenten, die bei der Verbesserung von Ruby und der
Dokumentation seiner Bestandteile mitwirken. Also, womit willst Du anfangen?
{: .summary}

Die hier behandelten Themen zur Entwicklung von Ruby sind Folgende:

* [Die Ruby-Entwicklung über Git verfolgen](#following-ruby)
* [Ruby verbessern, Patch für Patch](#patching-ruby)
* [Hinweis zu Branches](#branches-ruby)

### Die Ruby-Entwicklung über Git verfolgen
{: #following-ruby}

Das aktuelle Haupt-Repository mit dem neuesten Ruby-Quellcode ist
[git.ruby-lang.org/ruby.git][gitrlo].
Zusätzlich existiert auch ein [Mirror auf GitHub][7].  Verwende im Allgemeinen bitte diesen Mirror.

Du kannst über Git den neuesten Quellcode von Ruby beziehen.
Von deiner Kommandozeile:

{% highlight sh %}
$ git clone https://github.com/ruby/ruby.git
{% endhighlight %}

Der Ordner `ruby` wird jetzt den neuesten Quellcode für die Entwicklungsversion von Ruby beinhalten (ruby-trunk).

Siehe dazu auch das Dokument [Non-committer’s HOWTO to join our development][noncommitterhowto].

Wenn du Commit-Berechtigung hast und etwas pushen möchtest, solltest du
das Haupt-Repository verwenden.

{% highlight sh %}
$ git clone git@git.ruby-lang.org:ruby.git
{% endhighlight %}

### Ruby verbessern, Patch für Patch
{: #patching-ruby}

Das Kernteam betreibt einen [Issue-Tracker][10] für das Beisteuern von Patches
und Fehlerberichte an Matz und die Gang. Diese Berichte werden auch an die [Ruby-Core Mailingliste][mailing-lists] zur Diskussion gesendet. So kannst du
sicher sein, dass deine Anfrage nicht unbemerkt bleibt.
Du kannst Patches auch direkt an die Mailingliste senden. Wie auch immer,
du bist herzlich eingeladen an der entstehenden Diskussion teilzunehmen.

Bitte schau dir den [Leitfaden für Patch-Autoren][writing-patches] an.
Dort findest du einige Tips direkt von Matz dazu, wie deine Patches berücksichtigt werden können.

Als Zusammenfassung, die Schritte zur Erstellung eines Patches sind:

1.  Checke den Ruby-Quellcode von GitHub aus.
    Patches für Bugfixes oder neue Features sollten für den `trunk` von
    Rubys Quellcode abgegeben werden.

        $ git clone https://github.com/ruby/ruby.git

    Wenn du einen Bug in einem Maintenance-Branch fixen willst, dann checke
    eine Kopie dieses Branches aus.

        $ git checkout ruby_X_X

    X_X sollte durch die auszucheckende Version ersetzt werden.

2.  Füge deine Verbesserungen zum Code hinzu.

3.  Erstelle einen Patch.

        $ git diff > ruby-changes.patch

4.  Erstelle ein Ticket im [Issue-Tracker][10] oder maile deinen Patch an
    die [Ruby-Core Mailingliste][mailing-lists] mit einem ChangeLog-Eintrag
    zu deinem Patch.

5.  Wenn zu dem Patch keine Bedenken angemeldet werden, dann wird den
    Committern die Berechtigung erteilt, ihn zu übernehmen.

**Bitte beachte:** Patches sollten als [unified diff][12] abgegeben werden.
Siehe [die diffutils Referenz][13] für mehr Informationen dazu, wie Patches übernommen werden.

Die Diskussion zur Ruby-Entwicklung findet auf der
[Ruby-Core Mailingliste][mailing-lists] statt. Wenn du also neugierig bist,
ob sich dein Patch lohnt oder du eine Diskussion zur Zukunft von Ruby
starten möchtest, dann zögere nicht, an Bord zu kommen.
Sei gewarnt: Off-Topic-Diskussionen werden auf dieser Liste nicht toleriert.
Der Lärmpegel sollte niedrig, Themen sollten pointiert, gut durchdacht
und formuliert sein. Da wir uns an den Schöpfer von Ruby wenden, sollten
wir etwas Ehrfurcht an den Tag legen.

Behalte im Hinterkopf, dass viele Kernentwickler von Ruby in Japan leben.
Viele sprechen hervorragendes Englisch, aber trotzdem bleibt ein erheblicher
Zeitzonen-Unterschied.
Außerdem gibt es neben den englischen auch eine ganze Menge japanische Entwicklungs-Mailinglisten. Sei geduldig. Wenn deine Anfrage nicht gelöst wird,
dann bleib dran - versuch es ein paar Tage später nochmal.

### Hinweis zu Branches
{: #branches-ruby}

Der Ruby-Quellcode wurde bis zum 22. April 2019 über Subversion verwaltet.
Daher werden manche Zweige immer noch über Subversion gepflegt.
Du kannst das SVN-Repository betrachten.

* [&lt;URL:https://git.ruby-lang.org/ruby.git&gt;][svn-viewvc]

Normalerweise musst du dich darum aber nicht kümmern (außer wenn du ein
Branch-Maintainer bist).
Du kannst Branches in deiner Git-Arbeitskopie auschecken,
zum Beispiel über folgendes Kommando.

{% highlight sh %}
$ git checkout ruby_X_X
{% endhighlight %}

X_X sollte durch die auszucheckende Version ersetzt werden.

Wenn du die Zweige modifizieren möchtest, dann öffne bitte ein Issue im
[Issue-Tracker][10].
Siehe auch den nachfolgenden Abschnitt.


[gitrlo]: https://git.ruby-lang.org/ruby.git
[mailing-lists]: /de/community/mailing-lists/
[writing-patches]: /de/community/ruby-core/writing-patches/
[noncommitterhowto]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[svn-viewvc]: https://git.ruby-lang.org/ruby.git
[7]: https://github.com/ruby/ruby
[10]: https://bugs.ruby-lang.org/
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
