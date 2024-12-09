---
layout: news_post
title: "Ruby 1.9.1-p129 veröffentlicht"
author: "Daniel Bovensiepen"
lang: de
---

Ruby 1.9.1-p129 wurde veröffentlicht.

Es handelt sich hierbei um ein Patchlevel Release der Version 1.9.1. Da
diese Version zwei sicherheitskritische Fehler beseitigt, empfehlen wir
allen 1.9.1 Benutzern auf diese Version umzusteigen.

#### Download

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p129.tar.bz2&gt;][1]

      Größe:   7183891 bytes
      MD5:    6fa62b20f72da471195830dec4eb2013
      SHA256: cb730f035aec0e3ac104d23d27a79aa9625fdeb115dae2295de65355f449ce27

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p129.tar.gz&gt;][2]

      Größe:   9034947 bytes
      MD5:    c71f413514ee6341c627be2957023a5c
      SHA256: 27b7a8ace1d17cec237020ae9355230b53f8c3875f8d942de903e7d58d14253b

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p129.zip&gt;][3]

      Größe:   10299369 bytes
      MD5:    156305e9633758eb60b419fabc33b6e4
      SHA256: 6cbf0eda4ba0afedd8f0bd320e6a14f826149ef517d8bb967149af0558b0743b

#### Sicherheitskritische Fehler

* DL::Function#call konnte \"tainted\" Argumente an C Funktionen
  weitergeben, obwohl das $SAFE Level größer 0 war
* DL::dlopen konnte Bibliotheken mit \"tainted\" Namen einbinden, obwohl
  das $SAFE Level größer 0 war



[1]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p129.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p129.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p129.zip
