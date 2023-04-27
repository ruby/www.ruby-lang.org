---
layout: news_post
title: "Sicherheitsfix für Rubys OpenSSL-Modul: Erlaube \"0/n splitting\" als Gegenmaßnahme für den TLS-BEAST-Angriff"
author: "Quintus"
lang: de
---

In OpenSSL wird die `SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS`-Option von
SSL-Verbindungen benutzt, um die unter [\[1\]][1] beschriebene
TLS-CBC-IV-Schwachstelle zu beheben. Obwohl es eigentlich ein bekannter
Fehler von TLSv1/SSLv3 ist, erhält dies momentan als “BEAST-Angriff”
[\[2\]][2] (CVE-2011-3389) besondere Aufmerksamkeit. Das zugehörige
Ticket befindet sich in unserem Issue-Tracker [\[3\]][3].

Bislang benutzte Rubys OpenSSL-Erweiterung die `SSL_OP_ALL`-Option, eine
Kombination von OpenSSL-Optionen für diverse kleinere Workarounds, als
Standard für alle SSL-Verbindungen und es gab für den Nutzer nur die
Möglichkeit, weitere Optionen hinzuzufügen, nicht aber die, bereits in
der `SSL_OP_ALL`-Option enthaltene Features (wie eben
`SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS`) wieder zu entfernen. Das war
beabsichtigt und es wurden keine Konstanten wie
`SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS` zur Verfügung gestellt, doch
sollten wir jetzt wohl erlauben, die Option zu entfernen, um der
Ruby-OpenSSL-Erweiterung das Einsetzen leerer Fragmente zu Beginn einer
SSL-Verbindung (sog. “0/n splitting”) zu ermöglichen, damit der
TLS-BEAST-Angriff abgewehrt werden kann.

[Dieses Release][4] definiert zusätzliche Konstanten, sodass Nutzer
Optionen aus `SSL_OP_ALL` deaktivieren können. Nichtsdestotrotz ist die
Standardoption noch immer `SSL_OP_ALL`, man kann jedoch einen SSL-Socket
mit “0/n splitting” zur BEAST-Prävention wie folgt erstellen:

{% highlight ruby %}
ctx             = SSLContext.new
ctx.options     = OP_ALL & ~OP_DONT_INSERT_EMPTY_FRAGMENTS
ctx.verify_mode = OpenSSL::SSL::VERIFY_PEER

SSLSocket.new(socket, ctx)
{% endhighlight %}

Dank geht an Apple für die Meldung des Problems.

### Hinweis

Von einigen SSL-Endpunkten ist bekannt, dass sie einen Fehler haben und
“0/n splitting” nicht korrekt verarbeiten können, daher haben wir (und
OpenSSL) uns dafür entschieden, dies nicht als Standardoption zu setzen.
Bitte testen Sie Ihre SSL-Connectivity bevor Sie diese Option in einer
Produktivumgebung aktivieren. Wenn der andere Endpunkt zu dem Sie sich
verbinden “0/n splitting” nicht versteht, müssen Sie einen anderen
Workaround, wie z.B. das Erzwingen der Benutzung von RC4, verwenden. Für
weitere Details können Sie sich die Diskussionen und Informationen rund
um CVE-2011-3389 durchlesen.



[1]: http://www.openssl.org/~bodo/tls-cbc.txt
[2]: https://www.cve.org/CVERecord?id=CVE-2011-3389
[3]: https://bugs.ruby-lang.org/5353
[4]: http://mla.n-z.jp/?ruby-talk=393484
