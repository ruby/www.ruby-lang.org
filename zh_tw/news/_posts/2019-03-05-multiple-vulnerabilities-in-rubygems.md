---
layout: news_post
title: "RubyGems 多個安全性風險"
author: "hsbt"
translator: Vincent Lin
date: 2019-03-05 00:00:00 +0000
tags: security
lang: zh_tw
---

Ruby 內建的 RubyGems 發現帶有多個安全性風險。
RubyGems 官方部落格[對此事的說明](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html)。

## 詳情

以下為已回報的安全性風險

* CVE-2019-8320：解壓縮時 tar 時使用 symlink 刪除目錄。
* CVE-2019-8321：`verbose` 中的轉義序列注入安全性風險。
* CVE-2019-8322：`gem owner` 中的轉義序列注入安全性風險。
* CVE-2019-8323：API 回應處理中的轉義序列注入安全性風險。
* CVE-2019-8324：安裝惡意 gem 後導致任意程式碼被執行。
* CVE-2019-8325：errors 中的轉義序列注入安全性風險。

強烈建議 Ruby 使用者儘速採用下列任一個因應措施。

## 受影響版本

* Ruby 2.4 系列：2.4.5 以及之前的版本
* Ruby 2.5 系列：2.5.3 以及之前的版本
* Ruby 2.6 系列：2.6.1 以及之前的版本
* trunk revision 67168 之前的版本

## 因應措施

RubyGems 2.7.9/3.0.3 及後續版本修正了上述風險，請將 RubyGems 升級至最新版。

```
gem update --system
```

若你無法升級 RubyGems，你可以使用補丁作為應急。

* [對應 Ruby 2.4.5 的補丁](https://bugs.ruby-lang.org/attachments/7669)
* [對應 Ruby 2.5.3 的補丁](https://bugs.ruby-lang.org/attachments/7670)
* [對應 Ruby 2.6.1 的補丁](https://bugs.ruby-lang.org/attachments/7671)

至於 trunk 則是更新到最新版本即可。

## 致謝

本文基於 RubyGems 官方部落格的[這篇文章](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## 歷史

* 初次發佈於 2019-03-05 00:00:00 UTC
