---
layout: news_post
title: "Ruby 3.5.0 preview1 發布"
author: "naruse"
translator: "Bear Su"
date: 2025-04-18 00:00:00 +0000
lang: zh_tw
---

{% assign release = site.data.releases | where: "version", "3.5.0-preview1" | first %}
我們很高興宣布 Ruby {{ release.version }} 發布了。
Ruby 3.5 的 Unicode 版本升級為 15.1.0 與其他更新。

## 語法變更

* `*nil` 不再呼叫 `nil.to_a`，就跟 `**nil` 不呼叫 `nil.to_hash` 一樣。[[Feature #21047]]

## 核心類別更新

注意：我們只列出特別的類別更新。

* Binding

    * `Binding#local_variables` 不再包含編號參數。
      並且，`Binding#local_variable_get` 和 `Binding#local_variable_set` 拒絕處理編號參數。
      [[Bug #21049]]

* IO

    * `IO.select` 同意 +Float::INFINITY+ 作為逾時參數。
      [[Feature #20610]]

* String

    * 更新 Unicode 至版本 15.1.0 和 Emoji 版本 15.1. [[Feature #19908]]
        (也套用至 Regexp)


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

## 標準函式庫相容性問題

## C API 更新

## 其他變更

參見 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
和 [commit logs](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
來了解更多。

自 Ruby 3.4.0 以來，計 [{{ release.stats.files_changed }} 檔案變更，{{ release.stats.insertions }} 行新增（+），{{ release.stats.deletions }}  行刪減（-）](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)!

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
