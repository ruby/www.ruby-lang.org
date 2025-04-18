---
layout: news_post
title: "Ruby 3.5.0 preview1 リリース"
author: "naruse"
translator:
date: 2025-04-18 00:00:00 +0000
lang: ja
---

{% assign release = site.data.releases | where: "version", "3.5.0-preview1" | first %}
Ruby {{ release.version }} が公開されました。Ruby 3.5では、Unicodeバージョンの15.1.0へのアップデートなど様々な改善が行われています。



## 言語機能の変更



* `*nil` no longer calls `nil.to_a`, similar to how `**nil` does
  not call `nil.to_hash`.  [[Feature #21047]]

## コアクラスのアップデート

注: 複数のアップデートの中から注目すべきアップデートのみを掲載しています。

* Binding

    * `Binding#local_variables` does no longer include numbered parameters.
      Also, `Binding#local_variable_get` and `Binding#local_variable_set` reject to handle numbered parameters.
      [[Bug #21049]]

* IO

    * `IO.select` accepts +Float::INFINITY+ as a timeout argument.
      [[Feature #20610]]

* String

    * Update Unicode to Version 15.1.0 and Emoji Version 15.1. [[Feature #19908]]
        (also applies to Regexp)


## 標準ライブラリのアップデート

注: 複数のアップデートの中から注目すべき標準ライブラリのアップデートのみを掲載しています。



## 互換性に関する変更

注: 不具合修正を除きます。



## 標準ライブラリの互換性の変更



## C API のアップデート



## その他の変更点



より詳細な情報は [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
か [commit logs](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}) を参照してください。


これらの変更により、Ruby 3.4.0から [{{ release.stats.files_changed }} ファイルが変更され、 {{ release.stats.insertions }} 行が追加され、 {{ release.stats.deletions }} 行が削除されました!deletions(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)


## Download

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

## What is Ruby

Rubyはまつもとゆきひろ (Matz) によって1993年に開発が始められ、今もオープンソースソフトウェアとして開発が続けられています。Rubyは様々なプラットフォームで動き、世界中で、特にWebアプリケーション開発のために使われています。
