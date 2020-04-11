---
layout: news_post
title: "Ruby 2.3.0-preview2 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2015-12-11 14:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.3.0-preview2
bekanntgeben zu können.

Bei Ruby 2.3.0-preview2 handelt es sich um die zweite Vorschau auf
Ruby 2.3.0, in die viele neue Features und Verbesserungen eingeflossen
sind.

So wird etwa das
[Pragma für eingefrorene String-Literale](https://bugs.ruby-lang.org/issues/11473)
eingeführt. Bereits seit Ruby 2.1 handelt es sich bei `"str".freeze`
um eine auf besseren Speicherverbrauch optimierte Operation;
mit Ruby 2.3 werden nunmehr ein neuer magischer Kommentar und eine
Kommandozeilenoption eingeführt, die alle String-Literale im Quellcode
einfrieren. Zu Debugging-Zwecken können Sie mithilfe des Schalters
`--debug=frozen-string-literal` feststellen, an welcher Stelle
das Objekt erstellt wird, welches den Fehler
`"can't modify frozen String"` auslöst.

Daneben wird der [Safe Navigation Operator](https://bugs.ruby-lang.org/issues/11537)
eingeführt, wie er
bereits aus C#, Groovy und Swift bekannt ist. Er erleichtert die
Behandlung von `nil` als `obj.&foo`. Außerdem wurden `Array#dig` und
`Hash#dig` hinzugefügt.

Das [`did_you_mean`-Gem wird mitgeliefert](https://bugs.ruby-lang.org/issues/11252).
Dieses Gem gibt mögliche Kandidaten bei einem `NameError` oder `NoMethodError`
aus, um so das Debugging zu vereinfachen.

Experimentell eingeführt werden
[RubyVM::InstructionSequence#to_binary und .load_from_binary](https://bugs.ruby-lang.org/issues/11788).
Diese beiden Features ermöglichen die Einrichtung eines auf ISeq (Bytecode)
basierenden Vorkompilationssystems.

Daneben enthält Ruby 2.3 zahlreiche die Performanzoptimierung
betreffende Verbesserungen, darunter etwa die
[Optimierung von Proc#call](https://bugs.ruby-lang.org/issues/11569),
[eine neue tabellarische Datenstruktur](https://bugs.ruby-lang.org/issues/11278),
Optimierungen auf Maschinencodeebene für Objektallozierung und
Methodenaufrufverarbeitung, und vieles andere mehr.

Probieren Sie Ruby 2.3.0-preview2 aus, haben Sie Spaß daran und lassen
Sie uns an Ihren Erfahrungen teilhaben!

## Wesentliche Änderungen seit 2.2

Siehe die [NEWS](https://github.com/ruby/ruby/blob/v2_3_0_preview2/NEWS)
und das [ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0_preview2/ChangeLog)
für Details.

Mit diesen Änderungen wurden seit Ruby 2.2.0 [1097 Dateien geändert, 97466 Einfügungen(+), 58685 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0_preview2)!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.bz2>

  * SIZE:   14126752 bytes
  * SHA1:   7e717ef7a0a1523ad696b5fe693f7f7a613a3810
  * SHA256: e9b0464e50b2e5c31546e6b8ca8cad71fe2d2146ccf88b7419bbe9626af741cb
  * SHA512: e397f321d4338edba8d005d871408775f03d975da90c8abcfdb457a1bc7e6c87efe58c53b2c3bc122e9f58f619767b271bcc8d5d9663ed4b4288c60556e8d288

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.gz>

  * SIZE:   17623519 bytes
  * SHA1:   2deaf3ccbbfc5e08d3d840a4f1c33ff5f62f931d
  * SHA256: cb1c745bda33ba9e812b48c87852571ef6486f985c5e6ff4508a137d1c9734a3
  * SHA512: 83022f99775eb139beec281d59029dcc7c59de1e313182685b0a785334ac53d0c445212460d00d065169b922949263f30a1f981e19fc6e59814e79e6e53ae8e0

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.xz>

  * SIZE:   11249780 bytes
  * SHA1:   e1dfca06cd3c2cf6456a7feb0b1cd0752bde1a3b
  * SHA256: 7c3119268af87c137f415301b299281762453ad78f86e35562be014dabd67b11
  * SHA512: ab3376145d95a2188e6345984f0e5592c8d33515d7046a2ab2565dc418fa2306cdcf797aae9494d4d10446ada54ba638d8a8ad2d4b7510544d7eaea3de4faa87

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.zip>

  * SIZE:   19841531 bytes
  * SHA1:   db7fa5291d90e0a9c6f75c0cd068bc54050520d6
  * SHA256: 90d036fd1ec40aa8f5493821ac162bf69f505c5977db54afe53b8bf689d79b9d
  * SHA512: 05784df420018aaae7d09d41e872df708e861cacc74dc8ee97a9e3ac7458cb12b937523ad6def34d5ae2890a0cf037a8d61e365beb88d28acd84879b9391ad65

## Veröffentlichungskommentar

Siehe den Veröffentlichungszeitplan und andere Informationen:

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)
