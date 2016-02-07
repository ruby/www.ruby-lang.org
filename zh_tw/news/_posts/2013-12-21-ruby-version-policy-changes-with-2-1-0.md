---
layout: news_post
title: "Ruby 2.1.0 起版號方針變更"
author: "zzak"
translator: "Juanito Fatas"
date: 2013-12-21 2:00:00 +0000
lang: zh_tw
---

從 Ruby 2.1.0 發佈起，我們決定版號方針開始採用[語意化版本](http://semver.org/lang/zh-TW/)。

為了更好的善用 Ruby 的版本號，會漸漸的朝如下維護方針靠攏。

## 方針變更

本方針基於 ruby-lang.org 系統管理員柴田博志（[@hsbt](https://twitte.com/hsbt)）的提案。

### 版本架構

* `MAJOR`：有向下不相容且無法在 `MINOR` 發佈的更動
  * 為特別事件保留
* `MINOR`：每年聖誕節發佈，API 可能向下相容
* `TEENY`：與 API 相容性有關的安全性或 bug 修復
  * 每 2-3 個月發佈，可能超過 10 次，如 `2.1.11`
* `PATCH`：自從 `MINOR` 版本發佈後有多少補丁（每次發佈 `MINOR` 時歸零）

### 分支架構

未來會持續維護下列分支：

* trunk
* `ruby_{MAJOR}_{MINOR}_{TEENY}`

### API 相容性

具有下列特性的更動是不相容的改動，需要增加 `MINOR` 版本：

* 移除 C 語言層的 API 功能
* 向下不相容的新增或修改

### ABI 相容性

ABI 會採用下列架構 `{MAJOR}.{MINOR}.0`。

我們盡力保證 `MINOR` 版本下，ABI 之間的相容性，所以 `TEENY` 可保持在 0 的狀態。

## 參考

閱讀更多關於此提案的內容，請參考下列連結：

* [語意化版本與分支架構簡介](https://bugs.ruby-lang.org/issues/8835)
* [採納提案（英文）](https://gist.github.com/sorah/7803201)
* [採納提案（日文）](https://gist.github.com/hsbt/7719305)

## 致謝！

感謝所有參與討論的人，我們正一步步朝著更高效穩定的 Ruby 邁進。
