---
layout: news_post
title: "Ruby 3.3.0-preview3 發布"
author: "naruse"
translator: "Bear Su"
date: 2023-11-12 00:00:00 +0000
lang: zh_tw
---

{% assign release = site.data.releases | where: "version", "3.3.0-preview3" | first %}
我們很高興宣布 Ruby {{ release.version }} 發佈了。 Ruby 3.3 新增了名為 Prism 的 Parser，使用了 Lrama 做為 Parser 產生器，新增了名為 RJIT，純 Ruby 開發的 JIT 編譯器，以及更多效能提升，尤其是 YJIT。

## Prism

* 導入 [the Prism parser](https://github.com/ruby/prism) 為預設 gem。
    * Prism 是可移植、可容錯、且可維護的 Ruby 語言遞迴下降解析器。
* Prism 已可用於生產環境，並積極維護，您可以用來替代 Ripper。
    * 有關如何使用 Prism 的 [詳細文件](https://ruby.github.io/prism/)。
    * Prism 是 CRuby 內部使用的 C 函式庫，同時也是任何需要解析 Ruby 程式碼的工具鏈可以使用的 Ruby gem。
    * Prism API 中值得注意的方法為:
        * `Prism.parse(source)` 回傳 AST 作為 ParseResult 的一部分。
        * `Prism.dump(source)` 回傳字串型別的序列化的 AST。
        * `Prism.parse_comments(source)` 回傳註解。
* 如果您有興趣貢獻，您可以直接在 [the Prism repository](https://github.com/ruby/prism) 上建立 pull requests 或 issues。

## 使用 Lrama 取代 Bison

* 使用 [Lrama LALR parser generator](https://github.com/yui-knk/lrama) [Feature #19637](https://bugs.ruby-lang.org/issues/19637) 取代 Bison。
  * 如果您感興趣，請參閱 [The future vision of Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)。
  * 為了維護性，Lrama internal parser 改用 Racc 產生的 LR parser。
  * 支援 Parameterizing Rules `(?, *, +)`，能夠在 Ruby parse.y 中被使用。

## RJIT

* 導入純 Ruby 開發的 JIT 編譯器 RJIT 並取代 MJIT。
  * RJIT 僅支援 x86\_64 架構的 Unix 平台。
  * 不同於 MJIT，RJIT 在執行時不需要 C 編譯器。
* RJIT 目前還在實驗階段。
  * 您在生產環境應繼續使用 YJIT。
* 如果您有興趣為 Ruby 開發 JIT，請參閱 [k0kubun's 在 RubyKaigi 第 3 天的演講](https://rubykaigi.org/2023/presentations/k0kubun.html#day3)。

## YJIT

* 自 3.2 主要效能提升
  * 改善 splat 和 rest arguments 的支援。
  * 虛擬機器分配了暫存器，用於堆疊操作。
  * 更多帶有可選參數的呼叫會被編譯。
  * 錯誤處理也會被編譯。
  * Megamorphic Object Shapes 的實體變數不再返回給直譯器。
  * 不支援的呼叫類型不再返回給直譯器。
  * 特別改善了 `Integer#!=`、`String#!=`、`Kernel#block_given?`、`Kernel#is_a?`、
    `Kernel#instance_of?`、`Module#===`。
  * 目前比 optcarrot 的直譯器快上 3 倍！
* 自 3.2 以來顯著提高了記憶體使用率
    * 已編譯的程式碼的 Metadata 使用更少的記憶體。
    * 在 ARM64 產生更緊湊的程式碼。
* 編譯速度比 3.2 稍快一些。
* 新增 `RubyVM::YJIT.enable`，可以在 run-time 中啟用 YJIT。
  * 您可以在不修改指令列參數或環境變數的情況下啟動 YJIT。
  * 可用於僅在您的應用程式完成啟動後啟用 YJIT。 如果您在啟動程式時停用了 YJIT，可以使用 `--yjit-disable` 來使用其他 YJIT 選項。
* 提供了停用程式碼 GC 的選項，並使用 `--yjit-exec-mem-size` 設定硬限制。
  * 可以在使用 unicorn 和 forking 的伺服器上產生更好的 copy-on-write 行為。
* 發布版本現在提供透過 `--yjit-stats` 產生的 `ratio_in_yjit` 統計資訊，不再需要特殊的統計資訊或是開發版本。
* Exit tracing 選項現在支援抽樣
  * `--trace-exits-sample-rate=N`
* 新增 `--yjit-perf` 以便於使用 Linux perf 進行性能分析。
* 更多測試與錯誤修復

### M:N thread scheduler

* 導入 M:N thread scheduler。 [[Feature #19842]](https://bugs.ruby-lang.org/issues/19842)
  * M 個 Ruby 執行緒由 N 個原生執行緒(OS 執行緒)管理，所以能減少執行緒建立與管理的成本。
  * 由於會破壞 C-extension 的相容性，所以預設在主 Ractor 上停用 M:N thread scheduler。
      * 透過 `RUBY_MN_THREADS=1` 環境變數在主 Ractor 啟用 M:N threads。
      * 在非主 Ractors 上啟用 M:N threads。
  * 可使用 `RUBY_MAX_CPU=n` 環境變數設定 `N` 的最大值 (原生執行緒的最大數量)。預設值為 8。
      * 由於每一個 Ractor 同時只能執行一個 Ruby 執行緒，所以將使用原生執行緒的數量，即 `RUBY_MAX_CPU` 和執行 Ractor 數量中較小的值，因此單一 Ractor 應用程式 (大多數應用程式) 會使用一個原生執行緒。
      * 為支援阻塞操作，可以使用多餘 `N` 個原生執行緒。

## 其他值得注意的新功能



### 語言功能



## 效能提升

* `defined?(@ivar)` 透過 Object Shapes 提升效能。
* 像是 `Socket.getaddrinfo` 的域名解析現在可以被中斷 (在可用 pthreads 的環境下)。 [Feature #19965](https://bugs.ruby-lang.org/issues/19965)
  * 為此，現在每當呼叫 getaddrinfo 或 getnameinfo 時都會建立一個 pthread。這會在域名解析中產生一些開銷 (在我們的實驗中約 2.5 倍)。我們預期域名解析的開銷不會對大多數應用程式造成問題，如果您相信您因為此變更收到非預期的影響，請向我們回報。
* 新增環境變數 `RUBY_GC_HEAP_REMEMBERED_WB_UNPROTECTED_OBJECTS_LIMIT_RATIO`。 [Feature #19571](https://bugs.ruby-lang.org/issues/19571)
* 舊物件的子物件不再立即提升為垃圾收集器中的舊世代。 [Feature #19678](https://bugs.ruby-lang.org/issues/19678)
* 垃圾收集器加入弱參考的支援。 [Feature #19783](https://bugs.ruby-lang.org/issues/19783)

## 自 3.2 以來其他值得注意的變更

### IRB

IRB 進行了數項改善，包括但不限於：

- 加強 `irb:rdbg` 整合以提供與 `pry-byebug` 相同的除錯體驗 ([文件](https://github.com/ruby/irb#debugging-with-irb))。
- Pager 支援指令，例如 `ls` 和 `show_cmds`。
- `ls` 和 `show_source` 指令提供了更準確和有幫助的資訊。
- 使用 type 分析的實驗係自動補齊 ([doc](https://github.com/ruby/irb#type-based-completion))。
- 透過新導入的類別 Reline::Face，可以更改補齊視窗中的字體顏色與字體樣式 ([doc](https://github.com/ruby/ruby/blob/master/doc/reline/face.md))。

此外，IRB 還進行了大量重構和修復了許多錯誤，以方便未來強化功能。

## 相容性問題

注意：不包含功能問題的修正。

### 被移除的常數

下列廢棄的常數已被移除。



### 被移除的方法

下列廢棄的方法已被移除。

### 被移除的環境變數

下列廢棄的環境變數已被移除。

* 環境變數 `RUBY_GC_HEAP_INIT_SLOTS` 已經被廢棄且無法使用。請使用環境變數 `RUBY_GC_HEAP_{0,1,2,3,4}_INIT_SLOTS` 作為替代。 [Feature #19785](https://bugs.ruby-lang.org/issues/19785)

## Stdlib 相容性問題

### `ext/readline` 已被淘汰

* 我們使用純 Ruby 實作並相容於 `ext/readline` API 的 `reline`。未來我們將依賴 `reline`。如果您需要使用 `ext/readline`，您可以使用 `gem install readline-ext` 透過 rubygems.org 安裝 `ext/readline`。
* 我們將不再需要安裝函式庫例如 `libreadline` 或 `libedit`。

## C API updates

### 更新的 C APIs

下列的 APIs 已被更新。



### 被移除的 C APIs

下列廢棄的 APIs 已被移除。



## 標準函式庫更新

如果使用者 require 的 gem 已排定在未來 Ruby 版本中變更為 bundled gems，RubyGems 和 Bundler 將會顯示警告。

這些函式庫包括:
  * abbrev
  * base64
  * bigdecimal
  * csv
  * drb
  * getoptlong
  * mutex_m
  * nkf
  * observer
  * racc
  * resolv-replace
  * rinda
  * syslog

加入了以下的預設 gem。

* prism 0.15.1

更新了以下的 bundled gem。

* RubyGems 3.5.0.dev
* base64 0.2.0
* benchmark 0.3.0
* bigdecimal 3.1.5
* bundler 2.5.0.dev
* cgi 0.4.0
* csv 3.2.8
* date 3.3.4
* delegate 0.3.1
* drb 2.2.0
* english 0.8.0
* erb 4.0.3
* etc 1.4.3.dev.1
* fcntl 1.1.0
* fiddle 1.1.2
* fileutils 1.7.2
* find 0.2.0
* getoptlong 0.2.1
* io-console 0.6.1.dev
* irb 1.8.3
* logger 1.6.0
* mutex_m 0.2.0
* net-http 0.4.0
* net-protocol 0.2.2
* nkf 0.1.3
* observer 0.1.2
* open-uri 0.4.0
* open3 0.2.0
* openssl 3.2.0
* optparse 0.4.0
* ostruct 0.6.0
* pathname 0.3.0
* pp 0.5.0
* prettyprint 0.2.0
* pstore 0.1.3
* psych 5.1.1.1
* rdoc 6.6.0
* reline 0.3.9
* rinda 0.2.0
* securerandom 0.3.0
* shellwords 0.2.0
* singleton 0.2.0
* stringio 3.0.9
* strscan 3.0.7
* syntax_suggest 1.1.0
* tempfile 0.2.0
* time 0.3.0
* timeout 0.4.1
* tmpdir 0.2.0
* tsort 0.2.0
* un 0.3.0
* uri 0.13.0
* weakref 0.1.3
* win32ole 1.8.10
* yaml 0.3.0
* zlib 3.1.0

下列的預設 gem 現在是 bundled gems。

* racc 1.7.3

更新了以下的 bundled gem。

* minitest 5.20.0
* rake 13.1.0
* test-unit 3.6.1
* rexml 3.2.6
* rss 0.3.0
* net-imap 0.4.4
* net-smtp 0.4.0
* rbs 3.2.2
* typeprof 0.21.8
* debug 1.8.0

請參閱 GitHub 發布如 [Logger](https://github.com/ruby/logger/releases) 和變更紀錄來了解更多關於預設 gems 與 bundled gems 的資訊。

參見 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
和 [commit logs](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}) 來了解更多。

自 Ruby 3.2.0 以來，計[{{ release.stats.files_changed }} 檔案變更，{{ release.stats.insertions }} 行新增（+），{{ release.stats.deletions }} 行刪減（-）](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)。


## 下載

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby 是什麼

Ruby 最初由 Matz（Yukihiro Matsumoto）於 1993 年開發的開源軟體。可以在許多平台上執行。使用者來自世界各地，特別活躍於網路開發領域。
