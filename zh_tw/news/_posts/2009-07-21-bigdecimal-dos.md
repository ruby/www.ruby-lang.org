---
layout: news_post
title: "BigDecimal 中的 DoS 弱點"
author: "SJH"
lang: zh_tw
---

日前在 Ruby 的標準函式庫 BigDecimal 中發現了易受 中斷服務攻擊 (DOS) 的弱點。由 BigDecimal
物件轉換到浮點數有問題，導致攻擊者能造成 segmentation faults。

ActiveRecord 也用了 BigDecimal 轉換到浮點數，因此大部分的 Rails 應用程式也都受到影響。

## 影響

攻擊者因為 BigDecimal 解析一個錯誤的極大的數字而造成中斷服務。 如以下例子:


    BigDecimal("9E69999999").to_s("F")

## 有問題的版本

### 1.8 系列

* 1\.8.6-p368 以及之前所有版本
* 1\.8.7-p160 以及之前所有版本

### 1.9 系列

* 所有 1.9.1 版本皆無此問題

## 解決方式

### 1.8 系列

請更新到 to 1.8.6-p369 或 ruby-1.8.7-p174.

* [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p369.tar.gz][1]
* [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p174.tar.gz][2]

## 更新

* 先前 Ruby 1.8.7-p173 有些問題。如果已經下載，請改抓 p174。而 1.8.6-p369 沒有前述問題。



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p369.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p174.tar.gz
