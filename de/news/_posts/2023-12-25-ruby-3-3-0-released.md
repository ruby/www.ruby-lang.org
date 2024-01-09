---
layout: news_post
title: "Ruby 3.3.0 veröffentlicht"
author: "naruse"
translator: Thomas Ritter
date: 2023-12-25 00:00:00 +0000
lang: de
---

{% assign release = site.data.releases | where: "version", "3.3.0" | first %}
Wir freuen uns, die Veröffentlichung von Ruby {{ release.version }} anzukündigen. Ruby 3.3 fügt einen neuen Parser namens Prism hinzu, verwendet Lrama als Parser-Generator, fügt einen neuen reinen Ruby JIT-Compiler namens RJIT hinzu und viele Leistungsverbesserungen, insbesondere YJIT.

## Prism

- Einführung des [Prism-Parser](https://github.com/ruby/prism) als Standard-Gem
  - Prism ist ein portabler, fehlertoleranter und wartbarer rekursiver Abstiegsparser für die Ruby-Sprache
- Prism ist produktionsreif und wird aktiv gepflegt, Sie können es anstelle von Ripper verwenden
  - Es gibt [umfangreiche Dokumentation](https://ruby.github.io/prism/) zur Nutzung von Prism
  - Prism ist sowohl eine C-Bibliothek, die intern von CRuby verwendet wird, als auch ein Ruby-Gem, das von jedem Werkzeug verwendet werden kann, das Ruby-Code parsen muss
  - Nennenswerte Methoden in der Prism-API sind:
    - `Prism.parse(source)`, das den AST als Teil eines Parseergebnisobjekts zurückgibt
    - `Prism.parse_comments(source)`, das die Kommentare zurückgibt
    - `Prism.parse_success?(source)`, das true zurückgibt, wenn keine Fehler vorliegen
- Sie können Pull-Requests oder Issues direkt im [Prism-Repository](https://github.com/ruby/prism) erstellen, wenn Sie an der Mitarbeit interessiert sind
- Sie können jetzt `ruby --parser=prism` oder `RUBYOPT="--parser=prism"` verwenden, um mit dem Prism-Compiler zu experimentieren. Bitte beachten Sie, dass dieser Flag nur für das Debugging gedacht ist.

## Verwendung von Lrama anstelle von Bison

- Ersetzen von Bison durch [Lrama LALR-Parsergenerator](https://github.com/ruby/lrama) [[Feature #19637]](https://bugs.ruby-lang.org/issues/19637)
  - Wenn Sie interessiert sind, sehen Sie sich bitte [Die Zukunftsvision des Ruby-Parsers](https://rubykaigi.org/2023/presentations/spikeolaf.html) an
  - Der interne Lrama-Parser wird durch einen LR-Parser von Racc ersetzt, um die Wartbarkeit sicherzustellen
  - Parameterisierende Regeln `(?, *, +)` werden unterstützt, sie werden im Ruby parse.y verwendet

## YJIT

- Große Leistungsverbesserungen gegenüber Ruby 3.2
  - Die Unterstützung für Splat- und Rest-Argumente wurde verbessert.
  - Register werden für Stack-Operationen der virtuellen Maschine zugewiesen.
  - Mehr Aufrufe mit optionalen Argumenten werden kompiliert. Ausnahmebehandler werden ebenfalls kompiliert.
  - Nicht unterstützte Aufruftypen und megamorphe Aufrufstellen werden nicht mehr an den Interpreter übergeben.
  - Grundlegende Methoden wie Rails `#blank?` und
    [spezialisiertes `#present?`](https://github.com/rails/rails/pull/49909) werden eingebettet (inlined).
  - `Integer#*`, `Integer#!=`, `String#!=`, `String#getbyte`,
    `Kernel#block_given?`, `Kernel#is_a?`, `Kernel#instance_of?` und `Module#===`
    sind speziell optimiert.
  - Die Kompilierungsgeschwindigkeit ist jetzt etwas schneller als bei Ruby 3.2.
  - Jetzt mehr als 3x schneller als der Interpreter auf Optcarrot!
- Deutlich verbesserte Speichernutzung gegenüber Ruby 3.2
  - Metadaten für kompilierten Code verwenden viel weniger Speicher.
  - `--yjit-call-threshold` wird automatisch von 30 auf 120 erhöht
    wenn die Anwendung mehr als 40.000 ISEQs hat.
  - `--yjit-cold-threshold` wird hinzugefügt, um das Kompilieren von kalten ISEQs zu überspringen.
  - Kompakterer Code wird auf Arm64 generiert.
- Code GC ist jetzt standardmäßig deaktiviert
  - `--yjit-exec-mem-size` wird als hartes Limit behandelt, bei der die Kompilierung neuer Codes stoppt.
  - Keine plötzlichen Leistungseinbrüche aufgrund von Code GC.
    Besseres Copy-on-Write-Verhalten auf Servern mit Reforking mit
    [Pitchfork](https://github.com/shopify/pitchfork).
  - Sie können Code GC weiterhin mit `--yjit-code-gc` aktivieren, falls gewünscht
- Hinzufügen von `RubyVM::YJIT.enable`, das YJIT zur Laufzeit aktivieren kann
  - Sie können YJIT starten, ohne Kommandozeilenargumente oder Umgebungsvariablen zu ändern.
    Rails 7.2 wird [YJIT standardmäßig aktivieren](https://github.com/rails/rails/pull/49947)
    mit dieser Methode.
  - Dies kann auch verwendet werden, um YJIT nur zu aktivieren, sobald Ihre Anwendung
    hochgefahren ist. `--yjit-disable` kann verwendet werden, wenn Sie andere
    YJIT-Optionen verwenden möchten, während YJIT beim Booten deaktiviert ist.
- Mehr YJIT-Statistiken sind standardmäßig verfügbar
  - `yjit_alloc_size` und mehrere weitere metadatenbezogene Statistiken sind jetzt standardmäßig verfügbar.
  - Die von `--yjit-stats` produzierte `ratio_in_yjit`-Statistik ist jetzt in Release-Builds verfügbar,
    ein spezieller Statistik- oder Dev-Build ist nicht mehr erforderlich, um die meisten Statistiken abzurufen.
- Hinzufügen weiterer Profiling-Fähigkeiten
  - `--yjit-perf` wird hinzugefügt, um das Profiling mit Linux perf zu erleichtern.
  - `--yjit-trace-exits` unterstützt jetzt das Sampling mit `--yjit-trace-exits-sample-rate=N`
- Gründlicheres Testing und mehrere Bugfixes

## RJIT

- Einführung eines reinen Ruby JIT-Compilers RJIT und Ersatz von MJIT.
  - RJIT unterstützt nur die x86-64-Architektur auf Unix-Plattformen.
  - Im Gegensatz zu MJIT wird zur Laufzeit kein C-Compiler benötigt.
- RJIT existiert nur zu experimentellen Zwecken.
  - Sie sollten in der Produktion weiterhin YJIT verwenden.
- Wenn Sie an der Entwicklung von JIT für Ruby interessiert sind, schauen Sie sich bitte [k0kubuns Präsentation am Tag 3 von RubyKaigi](https://rubykaigi.org/2023/presentations/k0kubun.html#day3) an.

## M:N-Thread-Scheduler

- M:N-Thread-Scheduler wurde eingeführt. [[Feature #19842]](https://bugs.ruby-lang.org/issues/19842)
  - M Ruby-Threads werden von N nativen Threads (OS-Threads) verwaltet, sodass die Thread-Erstellungs- und Verwaltungskosten reduziert werden.
  - Es kann die Kompatibilität mit C-Erweiterungen brechen, sodass der M:N-Thread-Scheduler standardmäßig auf dem Haupt-Ractor deaktiviert ist.
    - Die Umgebungsvariable `RUBY_MN_THREADS=1` aktiviert M:N-Threads auf dem Haupt-Ractor.
    - M:N-Threads sind immer auf Nicht-Haupt-Ractors aktiviert.
  - Die Umgebungsvariable `RUBY_MAX_CPU=n` legt die maximale Anzahl von `N` (maximale Anzahl nativer Threads) fest. Der Standardwert ist 8.
    - Da nur ein Ruby-Thread pro Ractor gleichzeitig ausgeführt werden kann, wird die Anzahl der verwendeten nativen Threads verwendet, die kleiner ist als die in `RUBY_MAX_CPU` angegebene Anzahl und die Anzahl der laufenden Ractors. Einzelne Ractor-Anwendungen (die meisten Anwendungen) verwenden daher nur 1 nativen Thread.
    - Zur Unterstützung von blockierenden Operationen können mehr als `N` native Threads verwendet werden.

## Leistungsverbesserungen

- `defined?(@ivar)` ist mit Object Shapes optimiert.
- Namensauflösungen wie `Socket.getaddrinfo` können jetzt unterbrochen werden (in Umgebungen, in denen pthreads verfügbar sind). [[Feature #19965]](https://bugs.ruby-lang.org/issues/19965)
- Mehrere Leistungsverbesserungen beim Garbage Collector
  - Junge Objekte, die von alten Objekten referenziert werden, werden nicht mehr sofort
    in die alte Generation befördert. Dies reduziert die Häufigkeit von
    großen GC-Sammlungen erheblich. [[Feature #19678]](https://bugs.ruby-lang.org/issues/19678)
  - Eine neue Tuning-Variable `REMEMBERED_WB_UNPROTECTED_OBJECTS_LIMIT_RATIO` wurde
    eingeführt, um die Anzahl der ungeschützten Objekte zu steuern, die eine große GC-
    Sammlung auslösen. Der Standardwert ist auf `0.01` (1%) festgelegt. Dies reduziert die Häufigkeit von großen GC-Sammlungen erheblich. [[Feature #19571]](https://bugs.ruby-lang.org/issues/19571)
  - Write Barriers wurden für viele Kerntypen implementiert, die sie bisher vermisst haben,
    insbesondere `Time`, `Enumerator`, `MatchData`, `Method`, `File::Stat`, `BigDecimal`
    und mehrere andere. Dies reduziert die Zeit für kleine GC-Sammlungen und die Häufigkeit großer GC-Sammlungen erheblich.
  - Die meisten Kerntypen verwenden jetzt Variable Width Allocation, insbesondere `Hash`, `Time`,
    `Thread::Backtrace`, `Thread::Backtrace::Location`, `File::Stat`, `Method`.
    Dadurch sind diese Klassen schneller zugeteilt und freigegeben, verwenden weniger Speicher und reduzieren
    die Heapfragmentierung.
  - Unterstützung für schwache Referenzen wurde dem Garbage Collector hinzugefügt. [[Feature #19783]](https://bugs.ruby-lang.org/issues/19783)

## Weitere bemerkenswerte Änderungen seit 3.2

### IRB

IRB hat mehrere Verbesserungen erhalten, einschließlich, aber nicht beschränkt auf:

- Fortgeschrittene `irb:rdbg`-Integration, die ein äquivalentes Debugging-Erlebnis zu `pry-byebug` bietet ([Dokumentation](https://github.com/ruby/irb#debugging-with-irb)).
- Pager-Unterstützung für die Befehle `ls`, `show_source` und `show_cmds`.
- Genauere und hilfreichere Informationen, die von den Befehlen `ls` und `show_source` bereitgestellt werden.
- Experimentelle Autovervollständigung mit Typenanalyse ([Dokumentation](https://github.com/ruby/irb#type-based-completion)).
- Es ist jetzt möglich, die Schriftfarbe und den Schriftstil im Vervollständigungsdialog durch eine neu eingeführte Klasse Reline::Face zu ändern ([Dokumentation](https://github.com/ruby/ruby/blob/master/doc/reline/face.md))

Zusätzlich dazu hat IRB umfangreiche Refactorings durchlaufen und Dutzende von Bugfixes erhalten, um zukünftige Verbesserungen zu erleichtern.

Für detailliertere Updates lesen Sie bitte [Die große Weiterentwicklung von Ruby 3.3's IRB enthüllt](https://railsatscale.com/2023-12-19-irb-for-ruby-3-3/).

## Kompatibilitätsprobleme

Hinweis: Ausschließlich Bugfixes von Features.

- `it`-Aufrufe ohne Argumente in einem Block ohne gewöhnliche Parameter sind
  veraltet (deprecated). `it` wird in Ruby 3.4 eine Referenz auf den ersten Blockparameter sein.
  [[Feature #18980]](https://bugs.ruby-lang.org/issues/18980)

### Entfernte Umgebungsvariablen

Die folgenden veralteten Methoden werden entfernt.

- Umgebungsvariable `RUBY_GC_HEAP_INIT_SLOTS` wurde veraltet (deprecated) und ist eine No-Op. Bitte verwenden Sie stattdessen die Umgebungsvariablen `RUBY_GC_HEAP_{0,1,2,3,4}_INIT_SLOTS`. [[Feature #19785]](https://bugs.ruby-lang.org/issues/19785)

## Stdlib-Kompatibilitätsprobleme

### `ext/readline` wird eingestellt

- Wir haben `reline`, das eine reine Ruby-Implementierung kompatibel mit der `ext/readline` API ist. In Zukunft setzen wir auf `reline`. Wenn Sie `ext/readline` verwenden müssen, können Sie `ext/readline` über rubygems.org mit `gem install readline-ext` installieren.
- Wir müssen keine Bibliotheken wie `libreadline` oder `libedit` mehr installieren.

## Aktualisierungen der Standardbibliothek

RubyGems und Bundler warnen, wenn Benutzer die folgenden Gems mit `require` laden ohne sie zum Gemfile oder gemspec hinzuzufügen. Dies liegt daran, dass sie in einer zukünftigen Version von Ruby zu mitinstallierten Gems werden.

Diese Warnung wird unterdrückt, wenn Sie das Bootsnap-Gem verwenden. Wir empfehlen, Ihre Anwendung mindestens einmal mit der Umgebungsvariable `DISABLE_BOOTSNAP=1` auszuführen. Dies ist eine Einschränkung dieser Version.

Zielbibliotheken sind:

- abbrev
- base64
- bigdecimal
- csv
- drb
- getoptlong
- mutex_m
- nkf
- observer
- racc
- resolv-replace
- rinda
- syslog

Das folgende Standard-Gem wird hinzugefügt.

- prism 0.19.0

Die folgenden Standard-Gems werden aktualisiert.

- RubyGems 3.5.3
- abbrev 0.1.2
- base64 0.2.0
- benchmark 0.3.0
- bigdecimal 3.1.5
- bundler 2.5.3
- cgi 0.4.1
- csv 3.2.8
- date 3.3.4
- delegate 0.3.1
- drb 2.2.0
- english 0.8.0
- erb 4.0.3
- error_highlight 0.6.0
- etc 1.4.3
- fcntl 1.1.0
- fiddle 1.1.2
- fileutils 1.7.2
- find 0.2.0
- getoptlong 0.2.1
- io-console 0.7.1
- io-nonblock 0.3.0
- io-wait 0.3.1
- ipaddr 1.2.6
- irb 1.11.0
- json 2.7.1
- logger 1.6.0
- mutex_m 0.2.0
- net-http 0.4.0
- net-protocol 0.2.2
- nkf 0.1.3
- observer 0.1.2
- open-uri 0.4.1
- open3 0.2.1
- openssl 3.2.0
- optparse 0.4.0
- ostruct 0.6.0
- pathname 0.3.0
- pp 0.5.0
- prettyprint 0.2.0
- pstore 0.1.3
- psych 5.1.2
- rdoc 6.6.2
- readline 0.0.4
- reline 0.4.1
- resolv 0.3.0
- rinda 0.2.0
- securerandom 0.3.1
- set 1.1.0
- shellwords 0.2.0
- singleton 0.2.0
- stringio 3.1.0
- strscan 3.0.7
- syntax_suggest 2.0.0
- syslog 0.1.2
- tempfile 0.2.1
- time 0.3.0
- timeout 0.4.1
- tmpdir 0.2.0
- tsort 0.2.0
- un 0.3.0
- uri 0.13.0
- weakref 0.1.3
- win32ole 1.8.10
- yaml 0.3.0
- zlib 3.1.0

Das folgende mitinstallierten Gem wird von Standard-Gems gefördert.

- racc 1.7.3

Die folgenden mitinstallierten Gems werden aktualisiert.

- minitest 5.20.0
- rake 13.1.0
- test-unit 3.6.1
- rexml 3.2.6
- rss 0.3.0
- net-ftp 0.3.3
- net-imap 0.4.9
- net-smtp 0.4.0
- rbs 3.4.0
- typeprof 0.21.9
- debug 1.9.1

Weitere Informationen finden Sie in den GitHub-Releases wie [Logger](https://github.com/ruby/logger/releases) oder
Änderungsprotokoll für Details zu den Standard-Gems oder mitinstallierten Gems.

Siehe [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
oder [Commit-Protokolle](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})
für weitere Details.

Mit diesen Änderungen haben sich [{{ release.stats.files_changed }} Dateien geändert, {{ release.stats.insertions }} Einfügungen(+), {{ release.stats.deletions }} Löschungen(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)
seit Ruby 3.2.0!

Frohe Weihnachten, schöne Feiertage und viel Spaß beim Programmieren mit Ruby 3.3!

## Download

- <{{ release.url.gz }}>

      GRÖSSE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

- <{{ release.url.xz }}>

      GRÖSSE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

- <{{ release.url.zip }}>

      GRÖSSE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Was ist Ruby

Ruby wurde erstmals 1993 von Matz (Yukihiro Matsumoto) entwickelt
und wird jetzt als Open Source entwickelt. Es läuft auf mehreren Plattformen
und wird weltweit vor allem für die Webentwicklung verwendet.
