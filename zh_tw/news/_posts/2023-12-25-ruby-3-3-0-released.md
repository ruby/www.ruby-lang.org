---
layout: news_post
title: "Ruby 3.3.0 發布"
author: "naruse"
translator: "Bear Su"
date: 2023-12-25 00:00:00 +0000
lang: zh_tw
---

{% assign release = site.data.releases | where: "version", "3.3.0" | first %}
我們很高興宣布 Ruby {{ release.version }} 發佈了。 Ruby 3.3 新增了名為 Prism 的 Parser，使用了 Lrama 做為 Parser 產生器，新增了名為 RJIT，純 Ruby 開發的 JIT 編譯器，以及更多效能提升，尤其是 YJIT。

## Prism

* 導入 [the Prism parser](https://github.com/ruby/prism) 為預設 gem。
    * Prism 是可移植、可容錯、且可維護的 Ruby 語言遞迴下降解析器。
* Prism 已可用於生產環境，並積極維護，您可以用來替代 Ripper。
    * 有關如何使用 Prism 的 [詳細文件](https://ruby.github.io/prism/)。
    * Prism 是 CRuby 內部使用的 C 函式庫，同時也是任何需要解析 Ruby 程式碼的工具鏈可以使用的 Ruby gem。
    * Prism API 中值得注意的方法為:
        * `Prism.parse(source)` 回傳 AST 作為解析結果的一部分。
        * `Prism.parse_comments(source)` 回傳註解。
        * `Prism.parse_success?(source)` 如果沒有發生錯誤回傳 true。
* 如果您有興趣貢獻，您可以直接在 [the Prism repository](https://github.com/ruby/prism) 上建立 pull requests 或 issues。
* 您現在可以使用 `ruby --parser=prism` 或 `RUBYOPT="--parser=prism"` 體驗 Prism 編譯器。請注意這個指令列參數只用來除錯。

## 使用 Lrama 取代 Bison

* 使用 [Lrama LALR parser generator](https://github.com/ruby/lrama) [[Feature #19637]](https://bugs.ruby-lang.org/issues/19637) 取代 Bison。
  * 如果您感興趣，請參閱 [The future vision of Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)。
  * 為了維護性，Lrama internal parser 改用 Racc 產生的 LR parser。
  * 支援 Parameterizing Rules `(?, *, +)`，能夠在 Ruby parse.y 中被使用。

## YJIT

* 自 3.2 主要效能提升
  * 改善 splat 和 rest arguments 的支援。
  * 虛擬機器分配了暫存器，用於堆疊操作。
  * 更多帶有可選參數的呼叫會被編譯。 錯誤處理也會被編譯。
  * 不支援的呼叫類型不再返回給直譯器。
  * 基本方法如 Rails `#blank?` 與 [specialized `#present?`](https://github.com/rails/rails/pull/49909) 變為內聯(inlined)。
  * 特別改善了 `Integer#*`、`Integer#!=`、`String#!=`、`String#getbyte`、`Kernel#block_given?`、`Kernel#is_a?`、`Kernel#instance_of?`、`Module#===`。
  * 編譯速度比 3.2 稍快一些。
  * 目前比 optcarrot 的直譯器快上 3 倍！
* 自 3.2 以來顯著提高了記憶體使用率
    * 已編譯的程式碼的元資料使用更少的記憶體。
    * 當應用程式有超過 40,000 ISEQs 時，`--yjit-call-threshold` 會自動從 30 提高到 120。
    * 新增 `--yjit-cold-threshold` 以略過編譯 cold ISEQs。
    * 在 ARM64 產生更緊湊的程式碼。
* 預設停用程式碼 GC
  * `--yjit-exec-mem-size` 作為新程式碼編譯停止的硬限制。
  * 不會因為程式碼 GC 導致效能突然下降。
    使用 [Pitchfork](https://github.com/shopify/pitchfork) 在伺服器 reforking 有更好的 copy-on-write 行為。
  * 如果需要，您仍然可以使用 `--yjit-code-gc` 啟用程式碼 GC。
* 新增 `RubyVM::YJIT.enable`，可以在 run-time 中啟用 YJIT。
  * 您可以在不修改指令列參數或環境變數的情況下啟動 YJIT。
    Rails 7.2 將透過此方法 [預設啟用 YJIT](https://github.com/rails/rails/pull/49947)。
  * 可用於僅在您的應用程式完成啟動後啟用 YJIT。 如果您在啟動程式時停用了 YJIT，可以使用 `--yjit-disable` 來使用其他 YJIT 選項。
* 預設提供更多 YJIT 統計數據
  * 現在預設提供 `yjit_alloc_size` 和幾個更多與元資料相關的統計。
  * 發布版本現在提供透過 `--yjit-stats` 產生的 `ratio_in_yjit` 統計資訊，不再需要特殊的統計資訊或是開
* 新增更多性能分析功能
  * 新增 `--yjit-perf` 以便於使用 Linux perf 進行性能分析。
  * `--yjit-trace-exits` 現在支援透過 `--yjit-trace-exits-sample-rate=N` 抽樣。
* 更多測試與錯誤修復

## RJIT

* 導入純 Ruby 開發的 JIT 編譯器 RJIT 並取代 MJIT。
  * RJIT 僅支援 x86\_64 架構的 Unix 平台。
  * 不同於 MJIT，RJIT 在執行時不需要 C 編譯器。
* RJIT 目前還在實驗階段。
  * 您在生產環境應繼續使用 YJIT。
* 如果您有興趣為 Ruby 開發 JIT，請參閱 [k0kubun's 在 RubyKaigi 第 3 天的演講](https://rubykaigi.org/2023/presentations/k0kubun.html#day3)。

## M:N thread scheduler

* 導入 M:N thread scheduler。 [[Feature #19842]](https://bugs.ruby-lang.org/issues/19842)
  * M 個 Ruby 執行緒由 N 個原生執行緒(OS 執行緒)管理，所以能減少執行緒建立與管理的成本。
  * 由於會破壞 C-extension 的相容性，所以預設在主 Ractor 上停用 M:N thread scheduler。
      * 透過 `RUBY_MN_THREADS=1` 環境變數在主 Ractor 啟用 M:N threads。
      * 在非主 Ractors 上總是啟用 M:N threads。
  * 可使用 `RUBY_MAX_CPU=n` 環境變數設定 `N` 的最大值 (原生執行緒的最大數量)。預設值為 8。
      * 由於每一個 Ractor 同時只能執行一個 Ruby 執行緒，所以將使用原生執行緒的數量，即 `RUBY_MAX_CPU` 和執行 Ractor 數量中較小的值，因此單一 Ractor 應用程式 (大多數應用程式) 只會使用一個原生執行緒。
      * 為支援阻塞操作，可以使用多餘 `N` 個原生執行緒。

## 效能提升

* `defined?(@ivar)` 透過 Object Shapes 提升效能。
* 像是 `Socket.getaddrinfo` 的域名解析現在可以被中斷 (在可用 pthreads 的環境下)。 [[Feature #19965]](https://bugs.ruby-lang.org/issues/19965)
* 垃圾收集器的一些效能提升
  * 被舊物件參考的年輕物件不再立即提升為舊世代。這顯著降低了 major GC 收集的頻率。 [[Feature #19678]](https://bugs.ruby-lang.org/issues/19678)
  * 新增調整變數 `RUBY_GC_HEAP_REMEMBERED_WB_UNPROTECTED_OBJECTS_LIMIT_RATIO` 用來控制導致觸發 major GC 收集的未受保護物件的數量。預設為 `0.01` (1%)。這顯著降低了 major GC 收集的頻率。 [Feature #19571](https://bugs.ruby-lang.org/issues/19571)
  * 為幾個缺少寫入屏障(Write Barriers)的核心類型進行實作，特別是 `Time`, `Enumerator`, `MatchData`, `Method`, `File::Stat`, `BigDecimal` 等。這顯著地減少 minor GC 收集時間與 major GC 收集頻率。
  * 大部分核心類別現在使用可變寬度分配，特別是 `Hash`, `Time`, `Thread::Backtrace`, `Thread::Backtrace::Location`, `File::Stat`, `Method`。
    這使得這些類別更快被分配與釋放，使用更少的記憶體與減少堆疊碎片。
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

請參見 [Unveiling the big leap in Ruby 3.3's IRB](https://railsatscale.com/2023-12-19-irb-for-ruby-3-3/) 來了解更多。

## 相容性問題

注意：不包含功能問題的修正。

* 棄用在沒有普通參數的區塊中不帶參數呼叫 `it`。 在 Ruby 3.4 中 `it` 將會參考 block 的第一個參數。
  [[Feature #18980]](https://bugs.ruby-lang.org/issues/18980)

### 被移除的環境變數

下列廢棄的環境變數已被移除。

* 環境變數 `RUBY_GC_HEAP_INIT_SLOTS` 已經被廢棄且無法使用。請使用環境變數 `RUBY_GC_HEAP_{0,1,2,3,4}_INIT_SLOTS` 作為替代。 [[Feature #19785]](https://bugs.ruby-lang.org/issues/19785)

## Stdlib 相容性問題

### `ext/readline` 已被淘汰

* 我們使用純 Ruby 實作並相容於 `ext/readline` API 的 `reline`。未來我們將依賴 `reline`。如果您需要使用 `ext/readline`，您可以使用 `gem install readline-ext` 透過 rubygems.org 安裝 `ext/readline`。
* 我們將不再需要安裝函式庫例如 `libreadline` 或 `libedit`。

## 標準函式庫更新

如果使用者 `require` 以下 gems 卻沒有將其加入到 Gemfile 或 gemspec，RubyGems 和 Bundler 將會顯示警告。
因為它們將在 Ruby 未來版本中變為 bundled gem。

如果您使用 bootsnap gem，這個警告將會被抑制。我們建議至少使用環境變數 `DISABLE_BOOTSNAP=1` 執行您的應用程式一次。這是目前版本的限制。

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

* prism 0.19.0

更新了以下的 bundled gem。

* RubyGems 3.5.3
* abbrev 0.1.2
* base64 0.2.0
* benchmark 0.3.0
* bigdecimal 3.1.5
* bundler 2.5.3
* cgi 0.4.1
* csv 3.2.8
* date 3.3.4
* delegate 0.3.1
* drb 2.2.0
* english 0.8.0
* erb 4.0.3
* error_highlight 0.6.0
* etc 1.4.3
* fcntl 1.1.0
* fiddle 1.1.2
* fileutils 1.7.2
* find 0.2.0
* getoptlong 0.2.1
* io-console 0.7.1
* io-nonblock 0.3.0
* io-wait 0.3.1
* ipaddr 1.2.6
* irb 1.11.0
* json 2.7.1
* logger 1.6.0
* mutex_m 0.2.0
* net-http 0.4.0
* net-protocol 0.2.2
* nkf 0.1.3
* observer 0.1.2
* open-uri 0.4.1
* open3 0.2.1
* openssl 3.2.0
* optparse 0.4.0
* ostruct 0.6.0
* pathname 0.3.0
* pp 0.5.0
* prettyprint 0.2.0
* pstore 0.1.3
* psych 5.1.2
* rdoc 6.6.2
* readline 0.0.4
* reline 0.4.1
* resolv 0.3.0
* rinda 0.2.0
* securerandom 0.3.1
* set 1.1.0
* shellwords 0.2.0
* singleton 0.2.0
* stringio 3.1.0
* strscan 3.0.7
* syntax_suggest 2.0.0
* syslog 0.1.2
* tempfile 0.2.1
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
* net-ftp 0.3.3
* net-imap 0.4.9
* net-smtp 0.4.0
* rbs 3.4.0
* typeprof 0.21.9
* debug 1.9.1

請參閱 GitHub 發布如 [Logger](https://github.com/ruby/logger/releases) 和變更紀錄來了解更多關於預設 gems 與 bundled gems 的資訊。

參見 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
和 [commit logs](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}) 來了解更多。

自 Ruby 3.2.0 以來，計[{{ release.stats.files_changed }} 檔案變更，{{ release.stats.insertions }} 行新增（+），{{ release.stats.deletions }} 行刪減（-）](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)。

耶誕快樂、佳節愉快，享受與 Ruby 3.3 一起寫程式的時光！

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
