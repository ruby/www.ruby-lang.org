---
layout: news_post
title:  "Verfügbarkeitsprobleme auf ruby-lang.org"
author: "hsbt"
translator: "Quintus"
date:   2013-08-06 04:00:00 +0000
lang:   de
---

Einige der auf ruby-lang.org angebotenen Dienste sind momentan nicht
verfügbar, da die ruby-lang.org-Server down sind.

Dies äußert sich wie folgt:

 * Alle auf ruby-lang.org angebotenen Mailinglisten sind nicht
   erreichbar.
 * Die tar-Pakete von Ruby, die auf ftp.ruby-lang.org bereitgestellt
   werden, sind nicht verfügbar.
 * Mit einem alten DNS-Cache können Sie [www.ruby-lang.org](http://www.ruby-lang.org) nicht
   erreichen.

Wir arbeiten momentan an der Wiederherstellung der Dienste.

## Update (2013-08-06 9:33 UTC)

Der Grund für die heutigen Probleme ist ein Hardwareausfall. Die
folgenden Probleme wurden behoben:

 * Alle Mailinglisten sind wieder erreichbar, jedoch gibt es noch
   kleinere Probleme. Wir arbeiten daran.
 * ftp.ruby-lang.org ist wieder über HTTP und FTP zugänglich.

Wenn Sie weitere Probleme entdecken, melden Sie diese bitte unter
[https://github.com/ruby/www.ruby-lang.org/issues](https://github.com/ruby/www.ruby-lang.org/issues).

## Update (2013-08-06 13:18 UTC)

Wir haben ftp.ruby-lang.org (sowohl HTTP als auch FTP) wieder vom Netz
genommen, weil einige alte Ruby-Pakete beschädigt sind. Die MD5-Summen
stimmen nicht wie erwartet überein.

Wir untersuchen den Vorfall momentan. Weitere Informationen sind unter
[https://github.com/ruby/www.ruby-lang.org/issues/259](https://github.com/ruby/www.ruby-lang.org/issues/259) verfügbar.

## Update (2013-08-07 05:08 UTC)

Unseren Untersuchungen zufolge waren die folgenden Pakete beschädigt.
Sie wurden mittels [http://mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/](http://mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/) wiederhergestellt.

<pre>
ruby-1.9.3-p426.tar.bz2
ruby-1.9.3-p426.tar.gz
ruby-1.9.3-p426.zip
ruby-1.9.3-p429.tar.bz2
ruby-1.9.3-p429.tar.gz
ruby-1.9.3-p429.zip
ruby-2.0.0-p0.tar.bz2
ruby-2.0.0-p0.tar.gz
ruby-2.0.0-p0.zip
ruby-2.0.0-p195.tar.bz2
ruby-2.0.0-p195.tar.gz
ruby-2.0.0-p195.zip
</pre>

Wir haben sichergestellt, dass die MD5-Prüfsummen dieser Dateien denen
in unseren Veröffentlichungshinweisen angegebenen
entsprechen. ftp.ruby-lang.org ist nun wieder über HTTP und FTP
zugänglich.

## Update (2013-08-09 10:30 UTC)

Mittlerweile sind die meisten der seit dem 6. August 2013 wegen
Serverproblemen ausgefallenen Dienste wieder verfügbar:

  * Mailinglisten: Wir haben die Software, die die Mailinglisten zur
    Verfügung stellt, von FML zu Mailman gewechselt.
    * Für weitere Informationen, siehe [http://lists.ruby-lang.org](http://lists.ruby-lang.org).
  * Pakete: Sie können nun die von uns über ftp.ruby-lang.org
    angebotenen Pakete wieder über HTTP und FTP herunterladen.
  * Snapshots: Die täglichen Snapshot-Builds und -Pakete wurden reaktiviert.

Wenn Sie noch irgendwelche Probleme mit unseren Diensten haben, melden
Sie dies unter [https://github.com/ruby/www.ruby-lang.org/issues](https://github.com/ruby/www.ruby-lang.org/issues).
