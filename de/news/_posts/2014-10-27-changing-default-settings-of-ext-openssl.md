---
layout: news_post
title: "Standardeinstellungen von ext/openssl verändert"
author: "usa"
translator: "Quintus"
date: 2014-10-27 12:00:00 +0000
tags: security
lang: de
---

Wir haben die Standardeinstellungen von ext/openssl in Ruby 2.1.4,
Ruby 2.0.0-p594 und Ruby 1.9.3-p550 so verändert, dass unsichere
SSL/TLS-Optionen nun standardmäßig deaktiviert sind. Jedoch kann es
aufgrund dieser Änderung zu Problemen in der SSL-Verbindung kommen.

## Details

OpenSSL implementiert aus historischen Gründen noch immer einige
Protokolle und Chiffren, die aus heutiger Sicht unsicher sind,
darunter etwa die Sicherheitslücke POODLE
([CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)).
Wenn Sie weiterhin diese unsicheren Features von OpenSSL nutzen, riskieren
Sie die Sicherheit der Netzwerkverbindungen. Daher haben wir aufgrund
der Diskussion in [Bug #9424](https://bugs.ruby-lang.org/issues/9424)
entschieden, solch unsichere SSL/TLS-Optionen standardmäßig zu
deaktivieren. Wenn Sie müssen, können Sie diese Änderung (wie unten
gezeigt) durch Anwendung eines Inverspatches rückgängig machen.

2.1.4
: [r48098](https://git.ruby-lang.org/ruby.git)

2.0.0-p594
: [r48110](https://git.ruby-lang.org/ruby.git)

1.9.3-p550
: [r48121](https://git.ruby-lang.org/ruby.git)

Wenn Sie diese Änderung allerdings rückgängig machen, besteht das
Risiko, dass Sie die Sicherheit von Netzwerkverbindungen nicht mehr
garantieren können. Sie sollten daher die Folgen dieser Änderung
verstehen, bevor Sie sie entfernen.

### Mit Ruby verteile Bibliotheken

Diese Änderung wurde in den Bibliotheken net/http, net/imap und
net/pop umgesetzt. Da DRb und WEBrick ihre Einstellungen separat
erhalten, sind sie von der Änderung nicht betroffen.

### Skripte, die ext/openssl direkt verwenden

Diese Änderung wird bei der Instanziierung eines
`OpenSSL::SSL::SSLContext` automatisch beachtet, wenn die
Instanzmethode `set_params` aufgerufen wird, wie etwa insbesondere in
folgendem Code:

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # Wenn Sie einige Optionen wie etwa Zertifikatspeicher, Verifizierungsmodus, usw. ändern wollen, können Sie diese Parameter als Hash übergeben
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

Hinsichtlich der klientseitigen Nutzung von ext/openssl gehen wir
davon aus, dass diese Änderung wohl keine Probleme machen wird. Wenn
Sie ext/openssl allerdings serverseitig ein- und diese Änderung
umsetzen, sind ältere Clients (beispielsweise Internet Explorer 6 auf
Windows XP oder Browser in alten Mobiltelefonen) möglicherweise nicht
mehr in der Lage, sich zum Server zu verbinden.

Es ist Ihre Entscheidung, ob Sie diese Änderung einführen oder nicht;
setzen Sie sich mit den Nachteilen auseinander.

## Workaround

Wenn Sie Ihr Ruby nicht aktualisieren können, aber dennoch mit
unsicheren SSL/TLS-Optionen umgehen müssen, wenden Sie den folgenden
Monkeypatch an:

{% highlight ruby %}
module OpenSSL
  module SSL
    class SSLContext
      remove_const(:DEFAULT_PARAMS)
      DEFAULT_PARAMS = {
        :ssl_version => "SSLv23",
        :verify_mode => OpenSSL::SSL::VERIFY_PEER,
        :ciphers => %w{
          ECDHE-ECDSA-AES128-GCM-SHA256
          ECDHE-RSA-AES128-GCM-SHA256
          ECDHE-ECDSA-AES256-GCM-SHA384
          ECDHE-RSA-AES256-GCM-SHA384
          DHE-RSA-AES128-GCM-SHA256
          DHE-DSS-AES128-GCM-SHA256
          DHE-RSA-AES256-GCM-SHA384
          DHE-DSS-AES256-GCM-SHA384
          ECDHE-ECDSA-AES128-SHA256
          ECDHE-RSA-AES128-SHA256
          ECDHE-ECDSA-AES128-SHA
          ECDHE-RSA-AES128-SHA
          ECDHE-ECDSA-AES256-SHA384
          ECDHE-RSA-AES256-SHA384
          ECDHE-ECDSA-AES256-SHA
          ECDHE-RSA-AES256-SHA
          DHE-RSA-AES128-SHA256
          DHE-RSA-AES256-SHA256
          DHE-RSA-AES128-SHA
          DHE-RSA-AES256-SHA
          DHE-DSS-AES128-SHA256
          DHE-DSS-AES256-SHA256
          DHE-DSS-AES128-SHA
          DHE-DSS-AES256-SHA
          AES128-GCM-SHA256
          AES256-GCM-SHA384
          AES128-SHA256
          AES256-SHA256
          AES128-SHA
          AES256-SHA
          ECDHE-ECDSA-RC4-SHA
          ECDHE-RSA-RC4-SHA
          RC4-SHA
        }.join(":"),
        :options => -> {
          opts = OpenSSL::SSL::OP_ALL
          opts &= ~OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS if defined?(OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS)
          opts |= OpenSSL::SSL::OP_NO_COMPRESSION if defined?(OpenSSL::SSL::OP_NO_COMPRESSION)
          opts |= OpenSSL::SSL::OP_NO_SSLv2 if defined?(OpenSSL::SSL::OP_NO_SSLv2)
          opts |= OpenSSL::SSL::OP_NO_SSLv3 if defined?(OpenSSL::SSL::OP_NO_SSLv3)
          opts
        }.call
      }
    end
  end
end
{% endhighlight %}

## Von dieser Änderung betroffene Versionen

* Ruby 1.9.3 patchlevel 550 und später
* Ruby 2.0.0 patchlevel 594 und später
* Ruby 2.1.4 und später
* Revision 48097 und später auf dem Trunk

## Geschichte

* Erstmals veröffentlicht am 27.10.2014 12:00:00 (UTC)
