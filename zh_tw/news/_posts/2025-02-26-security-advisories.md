---
layout: news_post
title: "安全性公告：CVE-2025-27219、CVE-2025-27220 和 CVE-2025-27221"
author: "hsbt"
translator: "Bear Su"
date: 2025-02-26 07:00:00 +0000
tags: security
lang: zh_tw
---

我們發布了安全性公告 CVE-2025-27219、CVE-2025-27220 和 CVE-2025-27221。
請閱讀以下風險細節。

## CVE-2025-27219：`CGI::Cookie.parse` 中發生服務阻斷。

在 cgi gem 中可能會發生服務阻斷。該漏洞的 CVE 編號為 [CVE-2025-27219](https://www.cve.org/CVERecord?id=CVE-2025-27219)。
我們強烈建議您升級 cgi gem。

### 風險細節

在某些情況下 `CGI::Cookie.parse` 解析 cookie 字串會花費超級線性時間。
將刻意的 cookie 字串傳入該方法可能會導致服務阻斷。

請更新 CGI gem 至 0.3.5.1、0.3.7、0.4.2 或較新版本。

### 受影響版本

* cgi gem 版本 <= 0.3.5、0.3.6、0.4.0 和 0.4.1。

### 致謝

感謝 [lio346](https://hackerone.com/lio346) 發現此問題。同樣感謝 [mame](https://github.com/mame) 修復此漏洞。

## CVE-2025-27220：`CGI::Util#escapeElement` 中發生正規表示式服務阻斷(ReDoS)。

在 cgi gem 中可能會發生正規表示式服務阻斷(ReDoS)。
該漏洞的 CVE 編號為 [CVE-2025-27220](https://www.cve.org/CVERecord?id=CVE-2025-27220)。
我們強烈建議您升級 cgi gem。

### 風險細節

`CGI::Util#escapeElement` 使用的正規表示式容易受到 ReDos 的攻擊。
特別設計的輸入資料可能會導致高 CPU 用量。

此漏洞只影響 Ruby 3.1 和 3.2。如果您使用這些版本，請更新 CGI gem 至 0.3.5.1、0.3.7、0.4.2 或較新版本。

### 受影響版本

* cgi gem 版本 <= 0.3.5、0.3.6、0.4.0 和 0.4.1。

### 致謝

感謝 [svalkanov](https://hackerone.com/svalkanov) 發現此問題。同樣感謝 [nobu](https://github.com/nobu) 修復此漏洞。


## CVE-2025-27221：`URI#join`、`URI#merge` 和 `URI#+` 中發生使用者資訊外洩。

在 uri gem 中可能會發生使用者資訊外洩。
該漏洞的 CVE 編號為 [CVE-2025-27221](https://www.cve.org/CVERecord?id=CVE-2025-27221)。
我們強烈建議您升級 uri gem。

### 風險細節

`URI#join`、`URI#merge`、和 `URI#+` 方法會保留使用者資訊，例如 `user:password`，即使替換掉主機位址也仍保留著。
當使用這些方法從包含機敏使用者資訊的 URL 產生指向惡意主機的 URL 時，並讓某些使用者存取該 URL，就會導致非預期的使用者資訊外洩。

請更新 URI gem 至 0.11.3、0.12.4、0.13.2、1.0.3 或較新版本。

### 受影響版本

* uri gem 版本 < 0.11.3、0.12.0 至 0.12.3、0.13.0、0.13.1 和 1.0.0 至 1.0.2。

### 致謝

感謝 [Tsubasa Irisawa (lambdasawa)](https://hackerone.com/lambdasawa) 發現此問題。同樣感謝 [nobu](https://github.com/nobu) 修復此漏洞。

## 歷史

* 最初發布於 2025-02-26 7:00:00 (UTC)
