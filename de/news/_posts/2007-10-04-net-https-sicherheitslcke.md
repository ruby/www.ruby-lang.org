---
layout: news_post
title: "Net::HTTPS Sicherheitslücke"
author: "Daniel Bovensiepen"
lang: de
---

Es wurde eine Sicherheitslücke in der net/https Bibliothek entdeckt.

Detailierte Informationen finden Sie in [der ursprünglichen
Veröffentlichung][1].

#### Auswirkung

Die Sicherheitslücke liegt in der connect Methode innerhalb von http.rb,
welche fehlerhafter Weise den post\_connection\_check, nach einem
erfolgreichen SSL Verbindungsaufbau, nicht aufruft. Dadurch wird das
Server Zertifikat nicht gegen den angeforderten DNS Namen validiert. Ein
Angreifer kann dadurch einen Zielserver bei einer SSL Verbindung
imitieren. Die Vertrauenswürdigkeit einer so aufgebauten SSL Verbindung
ist damit nicht mehr vorhanden.

#### Gefährdete Versionen

1.8 Serie
: * 1\.8.4 und alle vorherigen
  * 1\.8.5-p113 und alle vorherigen
  * 1\.8.6-p110 und alle vorherigen

Entwicklerversion (1.9 Serien)
: Alle Versionen vor dem 2006-09-23

#### Lösung

1.8 Serie

: Bitte aktualisieren Sie auf die Version 1.8.6-p111 oder 1.8.5-p114.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p111.tar.gz&gt;][2]
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p114.tar.gz&gt;][3]

  Weiterhin sollten sie die Methode
  Net::HTTP#enable\_post\_connection\_check= nutzen um den
  post\_connection\_check zu aktivieren.

      http = Net::HTTP.new(host, 443)
      http.use_ssl = true
      http.enable_post_connection_check = true
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      store = OpenSSL::X509::Store.new
      store.set_default_paths
      http.cert_store = store
      http.start {
        response = http.get("/")
      }

  Beachten Sie, dass eine fehlerbereinigte Version eventuell bereits
  über Ihren Paketmanager zur Verfügung stehen könnte.

Entwicklerversion (1.9 Serie)
: Bitte aktualsieren Sie Ihr Ruby auf eine Version nach 2006-09-23. Der
  Standardwert von Net::HTTP#enable\_post\_connection\_check wurde auf
  true in Ruby 1.9 gesetzt.



[1]: http://www.isecpartners.com/advisories/2007-006-rubyssl.txt
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p111.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p114.tar.gz
