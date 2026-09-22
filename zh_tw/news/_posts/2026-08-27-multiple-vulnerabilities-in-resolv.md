---
layout: news_post
title: "安全性公告：CVE-2026-80212 和 CVE-2026-80213"
author: "hsbt"
translator: "Bear Su"
date: 2026-08-27 00:00:00 +0000
tags: security
lang: zh_tw
---

Ruby 內建的 `resolv` gem 中發現了兩個漏洞，CVE 編號分別為 [CVE-2026-80212](https://www.cve.org/CVERecord?id=CVE-2026-80212) 和 [CVE-2026-80213](https://www.cve.org/CVERecord?id=CVE-2026-80213)。我們建議您升級 resolv gem。

## CVE-2026-80212: 惡意 DNS 回應導致的記憶體耗盡

當應用程式解析攻擊者可影響的主機名稱（例如 webhook 目標或使用者提供的 URL）時，可能被誘使無限制地消耗記憶體。
攻擊者將網域指向自己控制的名稱伺服器，並回傳會被函式庫永久保留的回應。
重複查詢會使程序的記憶體持續成長，直到耗盡記憶體(Out of Memory)導致服務停止。

## CVE-2026-80213: 繞過主機名稱驗證

當應用程式先以允許清單或 SSRF 過濾器檢查主機名稱，再進行解析時，可能被誘使查詢與檢查主機名稱時不同的網域。
通過驗證的字串與實際送往網路的名稱並不相同，因此連線可能會送往應用程式從未核准的主機。
此問題需要主機名稱超出 DNS 長度限制才會觸發，因此拒絕超過 255 octets 的名稱、或超過 63 octets 標籤的驗證邏輯不受影響。

## 受影響版本

* resolv gem 0.4.0 至 0.7.1
* resolv gem 0.3.1 和更早版本

Ruby 各系列所綑綁的版本並不相同：Ruby 4.0 綑綁 resolv 0.7.0，Ruby 3.4 綑綁 0.7.1，Ruby 3.3 綑綁 0.3.1。

## 檢查項目

只有透過此 gem 解析名稱的程式碼會受到影響。一般的 socket 連線，包括 `Net::HTTP` 以及任何建立在 `TCPSocket` 之上的功能，都是使用作業系統的解析器，不受影響。`Net::HTTP` 確實會載入此 gem，但僅用於其 IP 位址的正規表示式，因此載入了這個 gem 本身並不代表有風險。

應用程式可能透過直接呼叫 `Resolv`、載入會將所有 socket 名稱解析導向此 gem 的 `resolv-replace`，或是透過以此方式解析名稱的相依套件，而受到影響。
請一併檢查您的相依套件與自己的程式碼。

## 建議行動

更新 resolv gem 至 0.7.2。若使用 Ruby 3.3 系列，請更新至 0.3.2。

Ruby 3.2 系列所綑綁的 0.2.x 系列不會發布新版本，因為該系列已達到生命週期終止。請改為安裝 resolv 0.7.2。

## 致謝

感謝 [dalifit](https://hackerone.com/dalifit) 發現這些問題。

## 歷史

* 最初發布於 2026-08-27 00:00:00 (UTC)
