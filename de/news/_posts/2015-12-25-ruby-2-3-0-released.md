---
layout: news_post
title: "Ruby 2.3.0 veröffentlicht"
author: "naruse"
translator: "Marvin Gülker"
date: 2015-12-25 17:00:00 +0000
lang: de
---

Wir freuen uns, die Veröffentlichung von Ruby 2.3.0 bekannt geben zu
können.

Dabei handelt es sich um die erste stabile Veröffentlichung der
2.3er-Serie von Ruby. Sie enthält viele neue Features, beispielsweise:

Es wurde ein [Literal-Pragma für eingefrorene Strings](https://bugs.ruby-lang.org/issues/11473)
hinzugefügt.
Bereits mit Ruby 2.1 war `"str".freeze` so optimiert worden, dass
weniger Objekte alloziert werden mussten. Ruby 2.3 führt nun einen
neuen magischen Kommentar und eine entsprechende Kommandozeilenoption
ein, mit der alle String-Literale im Quelltext eingefroren werden
können.
Zu Debugging-Zwecken besteht zudem die Möglichkeit, mithilfe der
Kommandozeilenoption `--debug=frozen-string-literal` herauszufinden,
wo das Objekt erstellt wird, welches den Fehler `"can't modify frozen
String"` auslöst.

Der [Safe Navigation Operator](https://bugs.ruby-lang.org/issues/11537)
([auch bekannt als Einsamkeitsoperator](https://instagram.com/p/-M9l6mRPLR/))
`&.`, wie er auch aus C#, Groovy und Swift bekannt ist, wird mit dem
Ziel eingeführt, die Behandlung von `nil` als `obj&.foo` zu
erleichtern. Daneben wurden `Array#dig` und `Hash#dig`
eingeführt. Dies verhält sich wie [try! bei Active Support](http://api.rubyonrails.org/v4.2.5/classes/Object.html#method-i-try-21),
welches speziell auf die Behandlung von nil zugeschnitten ist.

Das [`did_you_mean`-Gem wird mitgeliefert](https://bugs.ruby-lang.org/issues/11252).
Dieses Gem gibt mögliche Kandidaten bei einem `NameError` oder `NoMethodError`
aus, um so das Debugging zu vereinfachen.

Experimentell eingeführt werden
[RubyVM::InstructionSequence#to_binary und .load_from_binary](https://bugs.ruby-lang.org/issues/11788).
Diese beiden Features ermöglichen die Einrichtung eines auf ISeq (Bytecode)
basierenden Vorkompilationssystems.

Daneben enthält Ruby 2.3 zahlreiche die Performanz betreffende Verbesserungen,
darunter
[die Neuausrichtung der Datenstruktur für Methodeneinträge](https://bugs.ruby-lang.org/issues/11278),
[die Einführung einer neuen tabellarischen Datenstruktur](https://bugs.ruby-lang.org/issues/11420),
ein [optimiertes Proc#call](https://bugs.ruby-lang.org/issues/11569),
Feinjustierung auf Maschinencode-Ebene im Bezug auf Objektallozierung
und Methodenaufrufscode,
eine [intelligentere Datenstruktur für Instanzvariablen](https://bugs.ruby-lang.org/issues/11170),
[Unterstützung des Keyword-Arguments „exception: false“ für Socket#*_nonblock-Methoden](https://bugs.ruby-lang.org/issues/11229)
und so weiter. Werfen Sie einen Blick auf den Abschnitt
„Implementation improvements“ in der NEWS-Datei.

Eine vollständige Liste neuer Features und Kompatibilitätshinweise
finden Sie in den [NEWS](https://github.com/ruby/ruby/blob/v2_3_0/NEWS)
und im [ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0/ChangeLog).

Mit diesen Änderungen wurden seit Ruby 2.2.0 [2946 Dateien geändert, 104057 Einfügungen(+), 59478 Löschungen(-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0)!

Frohe Weihnachten, schöne Ferien und haben Sie Spaß an der
Programmierung mit Ruby 2.3!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.bz2>

      SIZE:   14185617 bytes
      SHA1:   6c8a832d49d22755ea8c45b6d53faf2ccc6d6ac9
      SHA256: ec7579eaba2e4c402a089dbc86c98e5f1f62507880fd800b9b34ca30166bfa5e
      SHA512: 77b707359e754c3616699d21697752741497c719dc3d6fdfb55ed639e76d52560d293ae54cbe5c63be78dc73fbe60f1b8615d704d017bdfe1994aa9747d26a6c

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz>

      SIZE:   17648682 bytes
      SHA1:   2dfcf7f33bda4078efca30ae28cb89cd0e36ddc4
      SHA256: ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507
      SHA512: 914d0201ecefaeb67aca0531146d2e89900833d8d2a597ec8a19be94529ab6b4be367f9b0cee2868b407288896cc14b64d96150223cac0aef8aafc46fc3dd7cc

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.xz>

      SIZE:   11294412 bytes
      SHA1:   96e620e38af351c8da63e40cfe217ec79f912ba1
      SHA256: 70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097
      SHA512: d893c5e6db5a0533e0da48d899c619964388852ef90e7d1b92a4363d5f189cd2dba32a009581f62b9f42a8e6027975fc3c18b64faf356f5e3ac43a8d69ec5327

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.zip>

      SIZE:   19840511 bytes
      SHA1:   3f88617568d9a4f491e8b32dca532363f73eaa71
      SHA256: 8270bdcbc6b62a18fdf1b75bd28d5d6fc0fc26b9bd778d422393a1b98006020a
      SHA512: a3f397bb3c9c19d9b797552c5d60bb01c82db884cfa966df84881125bea35713cffd99f88fb86b271bae72d9cfb09ad9b33838cffcf6365c091459479914fdef
