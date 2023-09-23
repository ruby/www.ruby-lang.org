---
layout: news_post
title: "Ruby 3.3.0-preview2 發布"
author: "naruse"
translator: "Bear Su"
date: 2023-09-14 00:00:00 +0000
lang: zh_tw
---

{% assign release = site.data.releases | where: "version", "3.3.0-preview2" | first %}

我們很高興宣布 Ruby {{ release.version }} 發佈了。Ruby 3.3 新增了名為 RJIT，純 Ruby 開發的 JIT 編譯器，使用了 Lrama 做為 Parser 產生器，以及更多效能提升，尤其是 YJIT。

## RJIT

* 導入純 Ruby 開發的 JIT 編譯器 RJIT 並取代 MJIT。
  * RJIT 僅支援 x86\_64 架構的 Unix 平台。
  * 不同於 MJIT，RJIT 在執行時不需要 C 編譯器。
* RJIT 目前還在實驗階段。
  * 您在生產環境應繼續使用 YJIT。
* 如果您有興趣為 Ruby 開發 JIT，請參閱 [k0kubun's 在 RubyKaigi 第 3 天的演講](https://rubykaigi.org/2023/presentations/k0kubun.html#day3)。

## 使用 Lrama 取代 Bison

* 使用 [Lrama LALR parser generator](https://github.com/yui-knk/lrama) [Feature #19637](https://bugs.ruby-lang.org/issues/19637) 取代 Bison。
  * 如果您感興趣，請參閱 [The future vision of Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)。

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
* 已編譯的程式碼的 Metadata 使用更少的記憶體。
* 在 ARM64 產生更緊湊的程式碼。
* 選擇以暫停模式開啟 YJIT，然後再手動啟用
  * `--yjit-pause` 和 `RubyVM::YJIT.resume`
  * 這可用於僅在您的應用程式完成啟動後啟用 YJIT。
* 發布版本現在提供透過 `--yjit-stats` 產生的 `ratio_in_yjit` 統計資訊，不再需要特殊的統計資訊或是開發版本。
* Exit tracing 選項現在支援抽樣
  * `--trace-exits-sample-rate=N`
* 更多測試與錯誤修復



## 其他值得注意的新功能

### 語言功能



## 效能提升

* `defined?(@ivar)` 透過 Object Shapes 提升效能。

## 自 3.2 以來其他值得注意的變更

### IRB

IRB 進行了數項改善，包括但不限於：

- 加強 `irb:rdbg` 整合以提供與 `pry-byebug` 相同的除錯體驗 ([文件](https://github.com/ruby/irb#debugging-with-irb))。
- Pager 支援指令，例如 `ls` 和 `show_cmds`。
- `ls` 和 `show_source` 指令提供了更準確和有幫助的資訊。

此外，IRB 還進行了大量重構和修復了許多錯誤，以方便未來強化功能。


## 相容性問題

注意：不包含功能問題的修正。

### 被移除的常數

下列廢棄的常數已被移除。



### 被移除的方法

下列廢棄的方法已被移除。



## Stdlib 相容性問題

### `ext/readline` 已被淘汰

* 我們使用純 Ruby 實作並相容於 `ext/readline` API 的 `reline`。未來我們將依賴 `reline`。如果您需要使用 `ext/readline`，您可以使用 `gem install readline-ext` 透過 rubygems.org 安裝 `ext/readline`。
* 我們將不再需要安裝函式庫例如 `libreadline` 或 `libedit`。


## C API 更新

### 更新的 C APIs

下列的 APIs 已被更新。



### 被移除的 C APIs

下列廢棄的 APIs 已被移除。



## 標準函式庫更新

如果使用者 require 的 gem 已排定在未來 Ruby 版本中變更為 bundled gems，RubyGems 和 Bundler 將會顯示警告。

更新了以下的預設 gem。

* RubyGems 3.5.0.dev
* bigdecimal 3.1.4
* bundler 2.5.0.dev
* csv 3.2.8
* erb 4.0.3
* fiddle 1.1.2
* fileutils 1.7.1
* irb 1.7.4
* nkf 0.1.3
* optparse 0.4.0.pre.1
* psych 5.1.0
* reline 0.3.8
* stringio 3.0.9
* strscan 3.0.7
* syntax_suggest 1.1.0
* time 0.2.2
* timeout 0.4.0
* uri 0.12.2
* yarp 0.9.0

更新了以下的 bundled gem。

* minitest 5.19.0
* test-unit 3.6.1
* rexml 3.2.6
* rss 0.3.0
* net-imap 0.3.7
* rbs 3.2.1
* typeprof 0.21.8
* debug 1.8.0

下列的預設 gem 現在是 bundled gems。

* racc 1.7.1

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
