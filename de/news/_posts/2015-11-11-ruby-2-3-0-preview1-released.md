---
layout: news_post
title: "Ruby 2.3.0-preview1 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2015-11-11 14:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.3.0-preview1
bekanntgeben zu können.

Ruby 2.3.0-preview1 ist die erste Vorschau auf Ruby 2.3.0, in die
viele neue Features und Verbesserungen eingeflossen sind.

So wird etwa das
[Pragma für eingefrorene String-Literale](https://bugs.ruby-lang.org/issues/11473)
eingeführt. Bereits seit Ruby 2.1 handelt es sich bei `"str".freeze`
um eine auf besseren Speicherverbrauch optimierte Operation, mit Ruby
2.3 werden nunmehr ein neuer magischer Kommentar und eine
Kommandozeilenoption eingeführt, die alle String-Literale im Quellcode
einfrieren. Zu Debugging-Zwecken können Sie mithilfe der Option
`--enable-frozen-string-literal-debug` feststellen, an welcher Stelle
das Objekt erstellt wird, welches den Fehler `"can't modify frozen
String"` auslöst.

Daneben wird der [Safe Navigation Operator](https://bugs.ruby-lang.org/issues/11537)
eingeführt, wie er
bereits aus C#, Groovy und Swift bekannt ist. Er erleichtert die
Behandlung von `nil` als `obj.&foo`. Außerdem wurden `Array#dig` und
`Hash#dig` hinzugefügt.

Das [`did_you_mean`-Gem wird mitgeliefert](https://bugs.ruby-lang.org/issues/11252).
Dieses Gem gibt mögliche Kandidaten bei einem `NameError` oder `NoMethodError`
aus, um so das Debugging zu vereinfachen.

Probieren Sie Ruby 2.3.0-preview1 aus, haben Sie Spaß daran und lassen
Sie uns an Ihren Erfahrungen teilhaben!

## Wesentliche Änderungen seit 2.2

* TBD

Siehe die
[NEWS](https://github.com/ruby/ruby/blob/v2_3_0_preview1/NEWS) und das
[ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0_preview1/ChangeLog)
für weitere Informationen.

Mit diesen Änderungen wurden seit Ruby 2.2.0 1036 Dateien geändert,
81312 Einfügungen(+), 51322 Löschungen(-).

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.bz2>

  * SIZE:   14174035 bytes
  * SHA1:   55ad4f04d7a33ab780458ee0999de9f6124217ea
  * SHA256: 42b9c9e1740a5abe2855d11803524370bd95744c8dcb0068572ed5c969ac7f0f
  * SHA512: ae6d46c87f59e1fd3703b76dfc45bfcf208625f95ab9f4559f0b9f7050e8681f1a6e419f5fa06b704c83e56879c3a9ff1337dba443bcfca76fadb49c97d97a93

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.gz>

  * SIZE:   17560800 bytes
  * SHA1:   6249572e5dca27d8c73a0cbf036e24e5d88fe82f
  * SHA256: dc8f9d48392a2bb226df5f4b4fd2074d81af155cdf3f3799139a6e31e012aefe
  * SHA512: 58384ef6e743dde20ea263692dab86ce9d6d22d722ef4c02a84396aa3128ce06d933d9b69078a3cd666d72320a8a6ffdc93296bc0d5338595b2a44c29d4db383

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.xz>

  * SIZE:   11225228 bytes
  * SHA1:   85b4f631efa4b6435b2b41df6ce6c46da294c4d4
  * SHA256: a88e19d9dc001db8f49ca3986a8a4e69980affff876854585725e40de0eedcd8
  * SHA512: 3be0f3ed4de73509b2f6975fe3fbe28bb4d51df87db6e2c0019e8a107edf49be60b2127ba5b18bca91f9f5964b07f1adde3042dac6327017359eeb130760672b

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.zip>

  * SIZE:   19777010 bytes
  * SHA1:   3458666c250dd333ac4b537be25f1913dd311ea1
  * SHA256: 0fc1d4450e9141f541038a4433f8fb49fb929e43c7bf5985685a4fa7b213a811
  * SHA512: f53653cf11d8dce1d627f7db3a15acca29c74c78735406a5d64bbbdc39fac232ef63110eb4d83521bef40c6f3006d55bbeaf54d1ddab1d4b6e5a13cee9247e85

## Veröffentlichungskommentar

Siehe den Veröffentlichungszeitplan und andere Informationen:

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)
