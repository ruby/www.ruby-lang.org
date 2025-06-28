---
layout: news_post
title: "Ruby 3.4.0 veröffentlicht"
author: "naruse"
translator: "Thomas Ritter"
date: 2024-12-25 00:00:00 +0000
lang: de
---

{% assign release = site.data.releases | where: "version", "3.4.0" | first %}
Wir freuen uns, die Veröffentlichung von Ruby {{ release.version }} bekannt zu geben. Ruby 3.4 führt den `it`-Blockparameter ein, ändert Prism zum Standardparser, bietet Happy Eyeballs Version 2-Unterstützung in der Socket-Bibliothek, verbessert YJIT, integriert Modular GC und mehr.

## `it` wird eingeführt

`it` wurde hinzugefügt, um auf einen Blockparameter ohne Variablennamen zu verweisen. [[Feature #18980]]

```ruby
ary = ["foo", "bar", "baz"]

p ary.map { it.upcase } #=> ["FOO", "BAR", "BAZ"]
```

`it` verhält sich weitgehend wie `_1`. Wenn die Absicht besteht, nur `_1` in einem Block zu verwenden, sind andere nummerierte Parameter wie `_2` eine zusätzliche kognitive Belastung für Leser. Daher wurde `it` als praktische Alternative eingeführt. Verwenden Sie `it` in einfachen Fällen, in denen es sich von selbst erklärt, z. B. in Einzeilern.

## Prism ist jetzt der Standardparser

Der Standardparser wurde von parse.y auf Prism umgestellt. [[Feature #20564]]

Dies ist eine interne Verbesserung, und für den Benutzer sollte es kaum sichtbare Änderungen geben. Wenn Sie Kompatibilitätsprobleme bemerken, melden Sie diese bitte.

Um den konventionellen Parser zu verwenden, nutzen Sie das Kommandozeilenargument `--parser=parse.y`.

## Die Socket-Bibliothek unterstützt jetzt Happy Eyeballs Version 2 (RFC 8305)

Die Socket-Bibliothek unterstützt jetzt [Happy Eyeballs Version 2 (RFC 8305)](https://datatracker.ietf.org/doc/html/rfc8305), die neueste standardisierte Version eines weit verbreiteten Ansatzes für bessere Konnektivität in vielen Programmiersprachen, in `TCPSocket.new` (`TCPSocket.open`) und `Socket.tcp`.

Diese Verbesserung ermöglicht Ruby, effiziente und zuverlässige Netzwerkverbindungen anzubieten, die an moderne Internetumgebungen angepasst sind.

Bis Ruby 3.3 wurden Namensauflösung und Verbindungsversuche seriell durchgeführt. Mit diesem Algorithmus funktionieren sie nun wie folgt:

1. Gleichzeitige Ausführung von IPv6- und IPv4-Namensauflösung
2. Verbindungsversuche mit den aufgelösten IP-Adressen, wobei IPv6 priorisiert wird, mit parallelen Versuchen im Abstand von 250ms
3. Rückgabe der ersten erfolgreichen Verbindung, während alle anderen abgebrochen werden

Dies minimiert Verbindungsverzögerungen, selbst wenn ein bestimmtes Protokoll oder eine bestimmte IP-Adresse verzögert oder nicht verfügbar ist.

Diese Funktion ist standardmäßig aktiviert, sodass keine zusätzliche Konfiguration erforderlich ist. Um sie global zu deaktivieren, setzen Sie die Umgebungsvariable `RUBY_TCP_NO_FAST_FALLBACK=1` oder rufen Sie `Socket.tcp_fast_fallback=false` auf. Um sie auf Methodenebene zu deaktivieren, verwenden Sie das Schlüsselwortargument `fast_fallback: false`.

## YJIT

### TL;DR

- Bessere Leistung bei den meisten Benchmarks auf den Plattformen x86-64 und arm64.
- Reduzierter Speicherverbrauch durch komprimierte Metadaten und ein einheitliches Speicherlimit.
- Verschiedene Fehlerbehebungen: YJIT ist jetzt robuster und gründlicher getestet.

### Neue Funktionen

- Kommandozeilenoptionen
  - `--yjit-mem-size` führt ein einheitliches Speicherlimit ein (Standard 128 MiB), um die gesamte YJIT-Speichernutzung zu verfolgen, und bietet eine intuitivere Alternative zur alten Option `--yjit-exec-mem-size`.
  - `--yjit-log` aktiviert ein Kompilierungsprotokoll, um nachzuverfolgen, was kompiliert wird.
- Ruby-API
  - `RubyVM::YJIT.log` bietet Zugriff auf das Ende des Kompilierungsprotokolls zur Laufzeit.
- YJIT-Statistiken
  - `RubyVM::YJIT.runtime_stats` liefert jetzt immer zusätzliche Statistiken zu Invalidierung, Inline-Verarbeitung und Metadaten-Codierung.

### Neue Optimierungen

- Komprimierter Kontext reduziert den Speicherbedarf für die Speicherung von YJIT-Metadaten
- Register für lokale Variablen und Ruby-Methodenargumente zuweisen
- Wenn YJIT aktiviert ist, werden mehr in Ruby geschriebene Kernprimitive verwendet:
  - `Array#each`, `Array#select`, `Array#map` wurden in Ruby neu geschrieben, um die Leistung zu verbessern [[Feature #20182]].
- Möglichkeit, kleine/triviale Methoden zu inlinen, wie z. B.:
  - Leere Methoden
  - Methoden, die eine Konstante zurückgeben
  - Methoden, die `self` zurückgeben
  - Methoden, die direkt ein Argument zurückgeben
- Spezialisiertes Codegen für viele weitere Laufzeitmethoden
- Optimierung von `String#getbyte`, `String#setbyte` und anderen String-Methoden
- Optimierung von bitweisen Operationen zur Beschleunigung der Low-Level-Bit/Byte-Manipulation
- Unterstützung von teilbaren Konstanten im Multi-Ractor-Modus
- Verschiedene andere inkrementelle Optimierungen

## Modularer GC

- Alternative Implementierungen für den Garbage Collector (GC) können durch die modulare Garbage-Collector-Funktion dynamisch geladen werden. Um diese Funktion zu aktivieren, konfigurieren Sie Ruby zur Build-Zeit mit `--with-modular-gc`. GC-Bibliotheken können zur Laufzeit mithilfe der Umgebungsvariable `RUBY_GC_LIBRARY` geladen werden. [[Feature #20351]]

- Der eingebaute Garbage Collector von Ruby wurde in eine separate Datei unter `gc/default/default.c` ausgelagert und interagiert über eine in `gc/gc_impl.h` definierte API mit Ruby. Der eingebaute Garbage Collector kann jetzt auch als Bibliothek gebaut werden, indem `make modular-gc MODULAR_GC=default` verwendet wird, und kann mit der Umgebungsvariable `RUBY_GC_LIBRARY=default` aktiviert werden. [[Feature #20470]]

- Eine experimentelle GC-Bibliothek basierend auf [MMTk](https://www.mmtk.io/) wird bereitgestellt. Diese GC-Bibliothek kann mit `make modular-gc MODULAR_GC=mmtk` gebaut und mit der Umgebungsvariable `RUBY_GC_LIBRARY=mmtk` aktiviert werden. Dies erfordert die Rust-Toolchain auf der Build-Maschine. [[Feature #20860]]

## Sprachänderungen

- String-Literale in Dateien ohne einen `frozen_string_literal`-Kommentar geben jetzt eine Deprecation-Warnung aus, wenn sie mutiert werden. Diese Warnungen können mit `-W:deprecated` oder durch Setzen von `Warning[:deprecated] = true` aktiviert werden. Um diese Änderung zu deaktivieren, können Sie Ruby mit dem Kommandozeilenargument `--disable-frozen-string-literal` ausführen. [[Feature #20205]]

- Keyword-Splatting von `nil` beim Aufrufen von Methoden wird jetzt unterstützt. `**nil` wird ähnlich wie `**{}` behandelt, übergibt keine Schlüsselwörter und ruft keine Konvertierungsmethoden auf. [[Bug #20064]]

- Die Blockübergabe ist im Index nicht mehr erlaubt. [[Bug #19918]]

- Keyword-Argumente sind im Index nicht mehr erlaubt. [[Bug #20218]]

- Der Toplevel-Name `::Ruby` ist jetzt reserviert, und die Definition wird verwarnt, wenn `Warning[:deprecated]` aktiviert ist. [[Feature #20884]]

## Updates für Kernklassen

Hinweis: Es werden nur bemerkenswerte Updates der Kernklassen aufgeführt.

- Exception

  - `Exception#set_backtrace` akzeptiert jetzt ein Array von `Thread::Backtrace::Location`.
    Auch `Kernel#raise`, `Thread#raise` und `Fiber#raise` akzeptieren dieses neue Format. [[Feature #13557]]

- GC

  - `GC.config` hinzugefügt, um Konfigurationsvariablen für den Garbage Collector zu setzen. [[Feature #20443]]

  - Der GC-Konfigurationsparameter `rgengc_allow_full_mark` wird eingeführt. Wenn `false`, markiert GC nur junge Objekte. Standardwert ist `true`. [[Feature #20443]]

- Ractor

  - `require` in einem Ractor ist erlaubt. Der Ladeprozess wird im Haupt-Ractor ausgeführt.
    `Ractor._require(feature)` wurde hinzugefügt, um den Ladeprozess im Haupt-Ractor auszuführen. [[Feature #20627]]

  - `Ractor.main?` wurde hinzugefügt. [[Feature #20627]]

  - `Ractor.[]` und `Ractor.[]=` wurden hinzugefügt, um auf den ractor-lokalen Speicher des aktuellen Ractors zuzugreifen. [[Feature #20715]]

  - `Ractor.store_if_absent(key){ init }` wurde hinzugefügt, um ractor-lokale Variablen threadsicher zu initialisieren. [[Feature #20875]]

- Range

  - `Range#size` löst jetzt einen `TypeError` aus, wenn der Bereich nicht iterierbar ist. [[Misc #18984]]

## Updates der Standardbibliothek

Hinweis: Es werden nur erwähnenswerte Updates der Standardbibliotheken aufgeführt.

- RubyGems

  - Option `--attestation` zu `gem push` hinzugefügt. Sie ermöglicht das Speichern von Signaturen bei [sigstore.dev].

- Bundler

  - Eine `lockfile_checksums`-Konfiguration wurde hinzugefügt, um Prüfsummen in neue Lockfiles einzuschließen.
  - `bundle lock --add-checksums` wurde hinzugefügt, um Prüfsummen zu einem bestehenden Lockfile hinzuzufügen.

- JSON

  - Leistungsverbesserungen von `JSON.parse`, etwa 1,5-mal schneller als json in Version 2.7.x.

- Tempfile

  - Das Schlüsselwortargument `anonymous: true` wurde für `Tempfile.create` implementiert.
    `Tempfile.create(anonymous: true)` entfernt die erstellte temporäre Datei sofort.
    Anwendungen müssen die Datei daher nicht mehr entfernen. [[Feature #20497]]

- win32/sspi.rb

  - Diese Bibliothek wurde aus dem Ruby-Repository nach [ruby/net-http-sspi] extrahiert. [[Feature #20775]]

Das folgende mitinstallierten Gem wird von Standard-Gems gefördert.

- mutex_m 0.3.0
- getoptlong 0.2.1
- base64 0.2.0
- bigdecimal 3.1.8
- observer 0.1.2
- abbrev 0.1.2
- resolv-replace 0.1.1
- rinda 0.2.0
- drb 2.2.1
- nkf 0.2.0
- syslog 0.2.0
- csv 3.3.2
- repl_type_completor 0.1.9

## Kompatibilitätsprobleme

Hinweis: Ausgenommen Fehlerbehebungen bei Funktionen.

- Fehlermeldungen und Backtrace-Anzeigen wurden geändert.

  - Ein einfacher Anführungsstrich wird anstelle eines Backticks als öffnendes Anführungszeichen verwendet. [[Feature #16495]]
  - Ein Klassenname wird vor einem Methodennamen angezeigt (nur wenn die Klasse einen permanenten Namen hat). [[Feature #19117]]
  - Methoden von `Kernel#caller`, `Thread::Backtrace::Location` usw. wurden entsprechend geändert.

  ```
  Alt:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  Neu:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

- Die Darstellung von Hash#inspect wurde geändert. [[Bug #20433]]

  - Symbolschlüssel werden in der modernen Symbolschlüssel-Syntax angezeigt: `"{user: 1}"`
  - Andere Schlüssel haben jetzt Leerzeichen um `=>`: `'{"user" => 1}'`, während vorher keine da waren: `'{"user"=>1}'`

- Kernel#Float() akzeptiert jetzt Dezimalzeichenketten ohne Dezimalteil. [[Feature #20705]]

  ```rb
  Float("1.")    #=> 1.0 (zuvor wurde ein ArgumentError ausgelöst)
  Float("1.E-1") #=> 0.1 (zuvor wurde ein ArgumentError ausgelöst)
  ```

- String#to_f akzeptiert jetzt Dezimalzeichenketten ohne Dezimalteil. Beachten Sie, dass sich das Ergebnis ändert, wenn ein Exponent angegeben wird. [[Feature #20705]]

  ```rb
  "1.".to_f    #=> 1.0
  "1.E-1".to_f #=> 0.1 (zuvor wurde 1.0 zurückgegeben)
  ```

- Refinement#refined_class wurde entfernt. [[Feature #19714]]

## Kompatibilitätsprobleme in der Standardbibliothek

- DidYouMean

  - `DidYouMean::SPELL_CHECKERS[]=` und `DidYouMean::SPELL_CHECKERS.merge!` wurden entfernt.

- Net::HTTP

  - Die folgenden veralteten Konstanten wurden entfernt:

    - `Net::HTTP::ProxyMod`
    - `Net::NetPrivate::HTTPRequest`
    - `Net::HTTPInformationCode`
    - `Net::HTTPSuccessCode`
    - `Net::HTTPRedirectionCode`
    - `Net::HTTPRetriableCode`
    - `Net::HTTPClientErrorCode`
    - `Net::HTTPFatalErrorCode`
    - `Net::HTTPServerErrorCode`
    - `Net::HTTPResponseReceiver`
    - `Net::HTTPResponceReceiver`

    Diese Konstanten wurden seit 2012 als veraltet markiert.

- Timeout

  - Negative Werte für Timeout.timeout werden abgelehnt. [[Bug #20795]]

- URI

  - Standardparser wurde von RFC 2396-konform auf RFC 3986-konform umgestellt.
    [[Bug #19266]]

## C-API-Updates

- `rb_newobj` und `rb_newobj_of` (sowie die entsprechenden Makros `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) wurden entfernt. [[Feature #20265]]
- Die veraltete Funktion `rb_gc_force_recycle` wurde entfernt. [[Feature #18290]]

## Sonstige Änderungen

- Wenn ein Block an eine Methode übergeben wird, die den Block nicht nutzt, wird im verbosen Modus (`-w`) eine Warnung angezeigt.
  [[Feature #15554]]

- Die Neudefinition einiger Kernmethoden, die speziell durch den Interpreter
  und JIT optimiert wurden, wie `String.freeze` oder `Integer#+`, gibt jetzt eine Performance-Warnung aus (`-W:performance` oder `Warning[:performance] = true`).
  [[Feature #20429]]

Siehe [NEWS](https://docs.ruby-lang.org/en/3.4/NEWS_md.html)
oder [Commit-Logs](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})
für weitere Details.

Mit diesen Änderungen wurden [{{ release.stats.files_changed }} Dateien geändert, {{ release.stats.insertions }} Einfügungen(+), {{ release.stats.deletions }} Löschungen(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
seit Ruby 3.3.0!

Frohe Weihnachten, schöne Feiertage und viel Spaß beim Programmieren mit Ruby 3.4!

## Herunterladen

- <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

- <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

- <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Was ist Ruby

Ruby wurde erstmals 1993 von Matz (Yukihiro Matsumoto) entwickelt
und wird jetzt als Open Source entwickelt. Es läuft auf mehreren Plattformen
und wird weltweit vor allem für die Webentwicklung verwendet.

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]: https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19266]: https://bugs.ruby-lang.org/issues/19266
[Feature #19714]: https://bugs.ruby-lang.org/issues/19714
[Bug #19918]: https://bugs.ruby-lang.org/issues/19918
[Bug #20064]: https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]: https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20443]: https://bugs.ruby-lang.org/issues/20443
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20497]: https://bugs.ruby-lang.org/issues/20497
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Bug #20620]: https://bugs.ruby-lang.org/issues/20620
[Feature #20627]: https://bugs.ruby-lang.org/issues/20627
[Feature #20705]: https://bugs.ruby-lang.org/issues/20705
[Feature #20715]: https://bugs.ruby-lang.org/issues/20715
[Feature #20775]: https://bugs.ruby-lang.org/issues/20775
[Bug #20795]: https://bugs.ruby-lang.org/issues/20795
[Bug #20433]: https://bugs.ruby-lang.org/issues/20433
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
[Feature #20875]: https://bugs.ruby-lang.org/issues/20875
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[sigstore.dev]: https://www.sigstore.dev
[ruby/net-http-sspi]: https://github.com/ruby/net-http-sspi
