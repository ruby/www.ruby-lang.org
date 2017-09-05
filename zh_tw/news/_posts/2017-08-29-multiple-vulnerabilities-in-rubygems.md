---
layout: news_post
title: "RubyGems 多個安全性風險"
author: "usa"
translator: "Vincent Lin"
date: 2017-08-29 12:00:00 +0000
tags: security
lang: zh_tw
---

Ruby 內建的 RubyGems 發現帶有多個安全性風險。 RubyGems 官方部落格[對此事的說明](http://blog.rubygems.org/2017/08/27/2.6.13-released.html)。

## 詳情

以下為已回報的安全性風險

* DNS 請求劫持安全性風險 (CVE-2017-0902)
* ANSI 轉義序列安全性風險 (CVE-2017-0899)
* `query` 命令中的 DoS 安全性風險 (CVE-2017-0900)
* 存在於 gem 安裝程式中，一個能讓惡意 gem 隨意複寫檔案的安全性風險 (CVE-2017-0901)

強烈建議 Ruby 使用者儘速採用下列的因應措施。

## 受影響版本

* Ruby 2.2 系列: 2.2.7 以及之前的版本
* Ruby 2.3 系列: 2.3.4 以及之前的版本
* Ruby 2.4 系列: 2.4.1 以及之前的版本
* trunk revision 59672 之前的版本

## 因應措施

目前 Ruby 尚未發布新版本修復上述 RubyGems 的安全性風險，但你可以將 RubyGems 升級至最新版本。RubyGems 2.6.13 或後續版本修正了上述風險。

```
gem update --system
```

若你無法升級 RubyGems ，你可以使用補丁作為應急。

* [對應 Ruby 2.2.7 的補丁](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [對應 Ruby 2.3.4 的補丁](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* 對應 Ruby 2.4.1 則需要兩個補丁，請按照下列依序使用
  1. [RubyGems 2.6.11 to 2.6.12](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
  2. [RubyGems 2.6.12 to 2.6.13](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

至於 trunk 則是更新到最新版本即可。

## 致謝

本文基於 RubyGems 官方部落格的[這篇文章](http://blog.rubygems.org/2017/08/27/2.6.13-released.html)。

## 歷史

* 初次發佈於 2017-08-29 12:00:00 UTC
* 補充 CVE 編號於 2017-08-31 2:00:00 UTC
