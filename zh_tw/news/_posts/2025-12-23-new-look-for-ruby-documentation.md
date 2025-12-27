---
layout: news_post
title: "Ruby 文件的新樣貌"
author: "Stan Lo"
translator: "Bear Su"
date: 2025-12-23 00:00:00 +0000
lang: zh_tw
---

繼[重新設計 ruby-lang.org](https://www.ruby-lang.org/zh_tw/news/2025/12/22/redesign-site-identity/) 之後，我們還有更多消息來慶祝 Ruby 誕生 30 週年：
[docs.ruby-lang.org][ruby-doc] 採用了 Aliki—[RDoc](https://github.com/ruby/rdoc)'s 的全新預設主題。

## 換然一新的 Ruby 文件

編寫 Ruby 程式碼一直都是一種樂趣，現在閱讀 Ruby 文件也能帶來同樣的體驗。
Aliki 為 [docs.ruby-lang.org][ruby-doc] 以及任何使用 RDoc v7.0+ 產生文件的 gem 帶來了現代、簡潔的設計風格。

## 主要特色

- **改善搜尋**: 支援區分大小寫的排序、模糊匹配和搜尋常數
- **深色模式**: 遵循作業系統設定，並可透過手動切換
- **三欄式佈局**: 左側邊欄用於導航，中間部分用於內容，右側邊欄用於目錄
- **改善程式碼區塊**: 新增程式碼區塊上的複製按鈕和 C 語法高亮顯示
- **客製化頁腳**: Gem 維護者可以新增指向其程式碼儲存庫、問題追蹤系統和其他資源的連結

## 給 Gem 作者

如果您使用 RDoc 7.0 或更高版本產生文件，您的使用者將自動看到 Aliki 主題。
您可以在 `.rdoc_options` 檔案中自訂頁腳連結或切換回 Darkfish 主題。

## 試試看

請造訪 [docs.ruby-lang.org][ruby-doc] 查看新介面的實際效果。

如果您發現問題或有任何建議，歡迎在 GitHub 上[提交 issue](https://github.com/ruby/rdoc/issues)。

[ruby-doc]: https://docs.ruby-lang.org/en/master/
