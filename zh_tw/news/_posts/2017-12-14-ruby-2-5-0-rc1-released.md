---
layout: news_post
title: "Ruby 2.5.0-rc1 發布"
author: "naruse"
translator: "Delton Ding"
date: 2017-12-14 00:00:00 +0000
lang: zh_tw
---

我們高興地宣佈 Ruby 2.5.0-rc1 已發佈。

Ruby 2.5.0-rc1 是 Ruby 2.5.0 的第一個候選版本。此版本包括數個新特性和效能提升。例如：

## 新功能

* 如果標準錯誤輸出沒有更改的話，會使用倒序印出錯誤訊息。[功能 #8661] [試驗性質]

* 移除了最高層級常數的查找。[功能 #11547]

* rescue/else/ensure 可允許出現在 do/end 區塊。[功能 #12906]

* yield\_self [功能 #6721]

## 效能提升

* 使用 TracePoint hook 動態指令替代 "trace" 指令以降低間接效能開銷。[功能 #14104]

* 通過 lazy 的 Proc 分配提升了使用參數傳 block 時的效能。[功能 #14045]

* 互斥鎖修改變得更輕量和快速。[功能 #13517]

* SecureRandom 傾向使用作業系統方法而非 OpenSSL。[漏洞 #9569]

## 自 2.4 起重要的變化

* 合併 Onigmo 至 6.1.3 版本。
  新增了 [absence operator](https://github.com/k-takata/Onigmo/issues/87)
  Ruby 2.4.1 也同樣包含此變更。
* 合併 bundler 至標準函式庫。
* 合併 rubygems-2.77.0。
* 合併 rdoc-6.0.0。
  將 IRB 的詞法分析器更新為 Ripper。
  它提升了生成文件的速度
  https://github.com/ruby/rdoc/pull/512
  同時包含
  * 修復了許多最近幾年的錯誤。
  * 支援近幾年 Ruby 的新語法。
* 更新支援的 Unicode 版本至 10.0.0。

詳見 [NEWS](https://github.com/ruby/ruby/blob/v2_5_0_rc1/NEWS) 或 commit 記錄獲取詳細訊息。

自 Ruby 2.4.0 以來，已發生 [6162 個文件變更，339744 行增加(+)，28699 行刪減(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0_rc1)！

享受 Ruby 2.5.0-rc1 吧！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.gz>

      SIZE:   31049529 bytes
      SHA1:   15df7e8ff99f360a14f7747a07a3021447d65594
      SHA256: 46c11b347522de174566503d35d2b46e1529b979d292b1f7f7019cfedcd4b07f
      SHA512: 41cd298e99d7a25fe5f2ec42946ae5dbc4421bb18f39350ba8a1b02e999541ec1b21b5f6ce0489b3a159f47e37d409178ba7c21c00e177b0fdb410ca6e9d6142

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.zip>

      SIZE:   35579788 bytes
      SHA1:   b7ae42eb733d4a0e3a2d135c9f8d4af043daa728
      SHA256: 9858e39fd2e7bf207cc9f8846197b11ada5f4424f433ff4df149fe3d48be8e36
      SHA512: 86c93791d312fd2175909020e448a44892740feb809a532ed706c6d850cb92722fb7ca02ecbdf7a1fbeb5b4f42f1338ce9a15b7c0a41055937bd1fdfb4be6f11

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.bz2>

      SIZE:   29238901 bytes
      SHA1:   6aad74ed3d30de63c6ff22048cd0fcbcbe123586
      SHA256: 862a8e9e52432ba383660a23d3e87af11dbc18c863a19ef6367eb8259fc47c09
      SHA512: bf0eb114097f9e505ff846f25e7556a2fb393573b4e8b773f94cf5b47998e221f3962a291db15a3cdbdf4ced5a523812937f80d95f4ee3f7b13c4e37f178d7a7

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.xz>

      SIZE:   26096412 bytes
      SHA1:   05cacd0341b7a23cc68239c2061640643a30da38
      SHA256: a479a1bce69b2cf656821f10104dcb8b426922b56d3d6cbdf48318842fae752c
      SHA512: 9f9040abf69337439a3f31b80d440d97736555b0df6533d9d34c141ce52226bc40c3f4f7e596e74b080c879e933649c17a073c893be1a304d9a883bab02e9494
