---
layout: page
title: "Ruby Core"
lang: de
---

Jetzt ist die beste Zeit, die weitere Entwicklung von Ruby zu verfolgen,
denn Ruby 2.0 ist in Arbeit. Durch das erhöhte Interesse an Ruby,
das sich in den letzten Jahren entwickelt hat, besteht ein
steigender Bedarf an Talenten, die bei der Verbesserung von Ruby und der
Dokumentation seiner Teile mitwirken. Also, womit willst Du anfangen?
{: .summary}

Die hier behandelten Themen zur Entwicklung von Ruby sind Folgende:

* [Subversion zur Entwicklung von Ruby nutzen](#following-ruby)
* [Mit Git arbeiten](#git-ruby)
* [Ruby verbessern, Patch für Patch](#patching-ruby)
* [Regeln für Core-Entwickler](#coding-standards)

### Subversion zur Entwicklung von Ruby nutzen
{: #following-ruby}

Mit dem folgenden Kommandozeilenbefehl kannst du den aktuellsten
Quelltext von Ruby über Subversion herunterladen (auschecken):

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

Das Verzeichnis `ruby` enthält nun den vollständigen Quelltext der
Entwicklerversion Ruby 1.9. Bitte bedenke, dass es sich bei dieser
Version um die absolut neuste Variante von Ruby handelt. Sie wird
ständig weiterentwickelt und wird erst am Ende des Jahres 2007 offiziell
veröffentlicht.

Wenn du Interesse an der Verbesserung von Ruby 1.8 hast, solltest du dir
den Branch `ruby_1_8` genauer anschauen. Über den folgenden
Kommandozeilenbefehl kannst du den Quelltext auschecken:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8
{% endhighlight %}

Damit hast du die aktuelle Entwicklerversion des offiziellen Ruby 1.8
Zweiges in das Verzeichnis `ruby_1_8` heruntergeladen. Entwickler, die
einen Patch für diese Version entwickeln, werden darum gebeten ebenfalls
einen Patch für die Entwicklerversion 1.9 zu erstellen. Aufgrund dessen
sollten die Versionen 1.8 und 1.9 sich einander ähneln, mit der Ausnahme
von Erweiterungen an der Sprache Ruby selbst.

Bei Interesse besteht die Möglichkeit das [Ruby-Repository über den
Webbrowser][1] zu begutachten.

Für weiterführende Informationen bezüglich Subversion bietet sich die
englischsprachige [Subversion-FAQ][2] und das ebenfalls
englischsprachige [Subversion-Buch][3] an.

### Mit Git arbeiten
{: #git-ruby}

Diejenigen, die [Git][4] bevorzugen, können einen [Mirror auf GitHub][5]
nutzen. Dieser kann von [offiziellen Committern][6] und [allen
Anderen][7] benutzt werden.

### Ruby verbessern, Patch für Patch
{: #patching-ruby}

Rubyforge bietet einen [Bug-Tracker][8] für das Melden von Fehlern und
Übersenden von Patches an Matz und die Anderen. Die Fehlerreports gehen
parallel auch zur Diskussion an die Ruby-Core-Mailingliste, wodurch keine
Fehlermeldung unbeachtet bleibt.

Zusammenfassend sind folgende Schritte für das Erstellen eines Patches
erforderlich:

1.  Eine Kopie von Ruby 1.8 auschecken. Dabei das Tag
    `ruby_1_8` verwenden.

         $ cvs -z4 -d :pserver:anonymous@cvs.ruby-lang.org:/src \
             co -r ruby_1_8 -d ruby-1.8 ruby

2.  Hinzufügen der eigenen Verbesserungen (im Verzeichnis `ruby-1.8`).
3.  Einen Patch erstellen.

         $ cvs diff > ruby-1.8-changes.patch

4.  [Abschicken][9] des neuen Patches.

**Bitte beachten:** Patches sollten als [unified diff][10] abgeschickt
werden. Wer mehr über das Zusammenführen (Merge) der Patches wissen will,
sollte sich die [diffutils-Referenz][11] ansehen.

Diskussionen zum Thema Ruby-Entwicklung werden in der
[Ruby-Core-Mailingliste][mailing-lists] gebündelt.
Wer herausfinden will, ob sein Patch Sinn macht oder nur eine Diskussion
über die Zukunft von Ruby anfangen will, sollte nicht zögern an Bord zu
kommen. Es wird an dieser Stelle davor gewarnt, Off-Topic Diskussionen
zu führen, da diese in der Liste nicht akzeptiert werden. Es sollte klar
kommuniziert und aussagekräftige Überschriften verwendet werden.
Schließlich wird hier der Erfinder von Ruby angesprochen, daher lasst
uns ein wenig Respekt haben.

Es sollte klar sein, dass das Kernteam in Japan lebt. Obwohl die meisten
sehr gut Englisch sprechen, gibt es aber auch noch einen signifikanten
Unterschied in der Zeitzone zu beachten. Es existieren übrigens auch
komplett japanischsprachige Listen neben den englischen Pendants. Man
sollte nur die Ruhe bewahren, wenn eine Antwort nicht sofort
zurückkommt. Notfalls kann die gleiche Anfrage ein paar Tage später
nochmal gestellt werden.

### Regeln für Core-Entwickler
{: #coding-standards}

Allgemein sollten Entwickler von Ruby mit den Quelltexten und dem
Entwicklungstil des Teams vertraut sein. Zum besseren Verständnis
sollten die folgenden Richtlinien beim Einchecken ins
Subversion-Repository beachtet werden:

* Alle Änderungen sollten im `ChangeLog` gemäß den
  [GNU-Konventionen][12] erfasst werden. (Viele Core-Entwickler von Ruby
  nutzen den `add-log` Modus von Emacs: `C-x 4 a`.)
* Der Check-in Zeitstempel sollte in Japan Standard Time (UTC+9)
  angegeben werden.
* Die Punkte im ChangeLog sollten als Kommentar beim Einchecken
  verwendet werden. Dieser Kommentar wird automatisch nach einem Commit
  an die Ruby-CVS-Liste gemailt.
* Funktionsprototypen werden überall im Ruby-Quelltext verwendet.
* Bitte keine C++-Kommentare (`//`) verwenden. Das Ruby-Wartungsteam
  bevorzugt stattdessen die Mehrzeilenkommentare von Standard-C
  (`/* .. */`).



[mailing-lists]: /de/community/mailing-lists/
[1]: http://svn.ruby-lang.org/cgi-bin/viewvc.cgi/
[2]: http://subversion.apache.org/faq.html
[3]: http://svnbook.org
[4]: http://git-scm.com/
[5]: http://github.com/ruby/ruby
[6]: http://wiki.github.com/shyouhei/ruby/committerhowto
[7]: http://wiki.github.com/shyouhei/ruby/noncommitterhowto
[8]: http://rubyforge.org/tracker/?func=browse&amp;group_id=426&amp;atid=1698
[9]: http://rubyforge.org/tracker/?func=add&amp;group_id=426&amp;atid=1700
[10]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[11]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[12]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
