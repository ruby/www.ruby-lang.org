---
layout: news_post
title: "Ruby 4.0.0 preview2 發布"
author: "naruse"
translator: "Bear Su"
date: 2025-11-17 00:00:00 +0000
lang: zh_tw
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview2" | first %}
我們很高興宣布 Ruby {{ release.version }} 發布了。 Ruby 4.0 將 Unicode 版本更新至 17.0.0，以及其他更新。

## 語法變更

* `*nil` 不再呼叫 `nil.to_a`，就跟 `**nil` 不呼叫 `nil.to_hash` 一樣。[[Feature #21047]]

## 核心類別更新

注意：我們只列出特別的類別更新。

* Binding

    * `Binding#local_variables` 不再包含編號參數。
      同時，`Binding#local_variable_get` 和 `Binding#local_variable_set` 也不再處理編號參數。
      [[Bug #21049]]

* IO

    * `IO.select` 允許 +Float::INFINITY+ 作為逾時參數。
      [[Feature #20610]]

* String

    * 更新 Unicode 至版本 17.0.0 和 Emoji 版本 17.0。[[Feature #19908]][[Feature #20724]][[Feature #21275]]
        (也套用到 Regexp)


## 標準函式庫更新

注意：我們只列出特別的標準函式庫更新。

* ostruct 0.6.1
* pstore 0.2.0
* benchmark 0.4.0
* logger 1.7.0
* rdoc 6.13.1
* win32ole 1.9.2
* irb 1.15.2
* reline 0.6.1
* readline 0.0.4
* fiddle 1.1.6

## 相容性問題

注意：不包含功能問題的修正。



## 標準函式庫相容問題


## C API 更新


## JIT

* YJIT
    * YJIT stats
        * `ratio_in_yjit` 不再於預設建置中運作。
          請使用 `--enable-yjit=stats` 在 `configure` 中啟用 `--yjit-stats`。
        * 預設統計新增 `invalidate_everything`，當所有程式碼被 TracePoint 無效化時遞增。
    * `RubyVM::YJIT.enable` 新增 `mem_size:` 和 `call_threshold:` 選項。
* ZJIT
    * 新增基於實驗性方法的 JIT 編譯器。
      使用 `--enable-zjit` 在 `configure` 中啟用 `--zjit` 支援。
    * 截至 Ruby 4.0.0-preview2，ZJIT 尚未準備好加速大多數基準測試。
      請暫時避免評估 ZJIT。敬請期待 Ruby 4.0 發布。
* RJIT
    * 移除 `--rjit`。我們將把第三方 JIT API 的實作移至 [ruby/rjit](https://github.com/ruby/rjit) 儲存庫。

## 其他變更



參見 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
和 [commit logs](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
來了解更多。

自 Ruby 3.4.0 以來，計 [{{ release.stats.files_changed }} 檔案變更，{{ release.stats.insertions }} 行新增（+），{{ release.stats.deletions }}  行刪減（-）](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)!

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


[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]: https://bugs.ruby-lang.org/issues/21049
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #21275]: https://bugs.ruby-lang.org/issues/21275
