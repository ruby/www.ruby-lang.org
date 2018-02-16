---
layout: news_post
title: "RubyGems 存在多個安全性風險"
author: "usa"
translator: "Juanito Fatas"
date: 2018-02-17 03:00:00 +0000
tags: security
lang: zh_tw
---

Ruby 內建的 RubyGems 發現帶有多個安全性風險。 RubyGems 官方部落格[對此事的說明](http://blog.rubygems.org/2018/02/15/2.7.6-released.html)。

## Details

以下為已回報的安全性風險。

* 預防寫入 root 以外的軟連結所存在的路徑遍歷風險
* 修復 gem owner 指令可能存在的物件反序列化風險
* 嚴格解析 tar 表頭的八進位資料
* 當 gem 包有重複檔案存在時回報安全性錯誤
* 強制對 spec 的 homepage 屬性進行 URL 驗證
* 緩解 gem server 顯示的 homepage 屬性 XSS 風險
* 預防安裝 gem 所存在的路徑遍歷風險

強烈建議 Ruby 使用者儘速採用下列任一個因應措施。

## 受影響版本

* Ruby 2.2 系列: 2.2.9 以及之前的版本
* Ruby 2.3 系列: 2.3.6 以及之前的版本
* Ruby 2.4 系列: 2.4.3 以及之前的版本
* Ruby 2.5 系列: 2.5.0 以及之前的版本
* trunk revision 62422 之前的版本

## 因應措施

請將 RubyGems 升級至最新版本。RubyGems 2.7.6 及後續版本修正了上述風險。

```
gem update --system
```

如您無法更新 RubyGems，您可以採用下列補丁。

* [對應 Ruby 2.2.9 的補丁](https://bugs.ruby-lang.org/attachments/download/7030/rubygems-276-for-ruby22.patch)
* [對應 Ruby 2.3.6 的補丁](https://bugs.ruby-lang.org/attachments/download/7029/rubygems-276-for-ruby23.patch)
* [對應 Ruby 2.4.3 的補丁](https://bugs.ruby-lang.org/attachments/download/7028/rubygems-276-for-ruby24.patch)
* [對應 Ruby 2.5.0 的補丁](https://bugs.ruby-lang.org/attachments/download/7027/rubygems-276-for-ruby25.patch)

至於 trunk 則是更新到最新版本即可。

## 致謝

本文基於 RubyGems [官方部落格的這篇文章](http://blog.rubygems.org/2018/02/15/2.7.6-released.html)。

## 歷史

* 初次發佈於 2018-02-17 03:00:00 UTC
