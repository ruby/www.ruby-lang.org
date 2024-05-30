---
layout: news_post
title: "Datadog 為 ruby-lang.org 提供開源社群支援"
author: "hsbt"
translator: "Bear Su"
date: 2024-05-30 00:00:00 +0000
lang: zh_tw
---

我們很高興宣佈 Ruby 官方網站 ruby-lang.org 透過 [Datadog 開源社群支援](https://opensource.datadoghq.com/projects/oss-program/) 建立了 Datadog 監控。

這使得我們能夠為 Ruby 使用者有效地即時監控網站的效能與可用性。使用 Datadog 的主要好處包含如下：

## CDN 可見性

透過 Fastly 提供的 cache.ruby-lang.org 是 Ruby 生態系最重要的基礎建設。Datadog 可以監控 Content Delivery Network (CDN) 效能。追蹤快取覆蓋率、錯誤率，以增強使用者體驗。

## 統一資料視覺化

我們為 ruby-lang.org 建立了多種網路服務。Datadog 可以在相同的儀表板中視覺化日誌分析資料、監控指標和 application performance monitoring (APM) 資料。

## JIT Trace 可見性

借助 Datadog 的 tracing 功能，我們可以抓取請求執行過程中經過網頁伺服器與資料庫的 trace 資料。這有助於識別效能瓶頸和有問題的請求。

我們為主要監控指標發布了[公開儀表板](https://p.ap1.datadoghq.com/sb/1271b83e-af90-11ee-9072-da7ad0900009-01633a8fa8c0b0c0051f1889afdf55dc)。我們將會持續更新儀表板以改善監控，特別是 YJIT 效能。

我們希望採用 Datadog 將有助於提高 Ruby 社群的網站效能。請繼續使用 ruby​​-lang.org 並享受增強的用戶體驗。
