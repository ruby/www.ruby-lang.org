---
layout: news_post
title: "RDoc 中多個 jQeury 安全性風險"
author: "aycabta"
translator: Vincent Lin
date: 2019-08-28 09:00:00 +0000
tags: security
lang: zh_tw
---


在 Ruby 內包含的 RDoc 所附帶的 jQeury 存在關於跨網站指令碼攻擊（XSS）的安全性風險。
建議所有使用者將 Ruby 更新至已包含修復版本 RDoc 的最新版本。

## 詳情

以下為已回報的安全性風險

* [CVE-2012-6708](https://www.cve.org/CVERecord?id=CVE-2012-6708)
* [CVE-2015-9251](https://www.cve.org/CVERecord?id=CVE-2015-9251)

強烈建議所有 Ruby 使用者升級你的 Ruby，或盡快採用以下解決方法。
你仍須重新產生現有的 RDoc 文件，以完全緩解風險。

## 受影響版本

* Ruby 2.3 系列：全部
* Ruby 2.4 系列：2.4.6 以及之前的版本
* Ruby 2.5 系列：2.5.5 以及之前的版本
* Ruby 2.6 系列：2.6.3 以及之前的版本
* 在 master commit f308ab2131ee675000926540cbb8c13c91dc3be5 之前

## 必要措施

RDoc 是靜態文件產生工具。
修補工具本身不足以緩解這些安全性風險。

因此，必須使用新的 RDoc 來重新產生由先前版本生成的 RDoc 文件。

## 因應措施

原則上，你應該要升級你的 Ruby 至最新版本。
RDoc 6.1.2 以及之後的版本包含安全性修復，因此，如果您無法升級 Ruby 本身，請將 RDoc 升級到最新版本。

如同前述，您必須重新生成現有的 RDoc 文件。

```
gem install rdoc -f
```

*更新：* 此文的初始版本部分提到了 rdoc-6.1.1.gem，但其仍存在風險。請確保你安裝了 rdoc-6.1.2 或之後的版本。

至於開發版本，請更新至 master 分支至最新 HEAD。

## 鳴謝

感謝 [Chris Seaton](https://hackerone.com/chrisseaton) 回報此風險。

## 歷史

* 最初發佈於 2019-08-28 09:00:00 UTC
* RDoc 版本修正於 2019-08-28 11:50:00 UTC
* 細部語言修正於 2019-08-28 12:30:00 UTC
