---
layout: page
title: "文件"
lang: zh_tw
---

當想要寫 Ruby 程式時，這裡是一些可以幫上忙的入門教學、學習手冊和參考文件：
{: .summary}

### 安裝 Ruby

除了可以輕鬆[在瀏覽器試玩 Ruby ][1]，你也可以閱讀[安裝指南](installation/)來瞭解如何安裝 Ruby。

### 官方 Ruby 文件

[docs.ruby-lang.org/en][docs-rlo]: 包含所有 Ruby 2.1 版本之後的文件。

[docs.ruby-lang.org/en/3.4][docs-rlo-3.4]: Ruby 3.4 版本文件。

[docs.ruby-lang.org/en/master][docs-rlo-master]: Ruby master 分支版本文件。

[C Extension Guide][docs-rlo-extension]: 為 Ruby 建立 C 延伸套件的深度指南。

### 入門

[Try Ruby][1]
: 您可以在您的瀏覽器上體驗 Ruby。

[Learn to Program][8]
: 由 Chris Pine 撰寫的程式語言入門。適合完全沒有程式設計經驗的朋友。

[Ruby in Twenty Minutes][rubyin20]
: 少於 20 分鐘就能完成的 Ruby 小型教學。

[The Odin Project][odin]
: 開源的全端課程。

[Exercism][exercism]
: 包含 120 個題目、自動分析與個人指導。

[Codecademy][codecademy]
: 包含多種主題的線上教學網站。

### 手冊 / 書籍

#### 初學者

[Programming Ruby 3.3][pickaxe]
: 這是 Ruby 經典名著，最近更新到了 Ruby 3.3 。

[The Well-Grounded Rubyist][grounded]
: 本教學從您的第一個 Ruby 程式開始，並帶您逐步了解反射、執行緒和遞迴等複雜主題。

#### 進階者

[Practical OOD in Ruby (POODR)][poodr]
: 關於一個程式設計師如何撰寫物件導向程式碼的故事。

#### 專家

[Metaprogramming][meta]
: 用簡單易懂的方式解釋 metaprogramming。

[Ruby Under a Microscope (RUM)][microscope]
: Ruby 內部結構的圖解指南。

### 社群文件

以下文件網站是由 Ruby 社群共同維護。

[RubyDoc.info][16]
: 一站式站點，擁有 RubyGems 與 GitHub 上托管的 Ruby 專案的文件。

[RubyAPI.org][rubyapi-org]
: 簡單搜尋瀏覽 Ruby 類別、模組及方法。

[ruby-doc.org][39]
: 線上 API 文件。

[DevDocs.io][40]
: 線上 API 文件。

[Dash][41]
: 離線 API 文件瀏覽器（macOS）

[Ruby QuickRef][42]
: Ruby 快速參考文件。

[rubyreferences][43]
: 參考文件 + 版本變更細節。

### 程式碼風格指南

[rubystyle.guide][44]
: RuboCop 的 Ruby 程式碼風格指南。

[RuboCop][45]
: 自動化檢查與執行程式碼風格指南。

[Shopify][46]
: Shopify 的 Ruby 程式碼風格指南。

[GitLab][47]
: GitLab 的 Ruby 程式碼風格指南。

[Airbnb][48]
: Airbnb 的 Ruby 程式碼風格指南。

[w3resource][49]
: W3 的 Ruby 程式碼風格指南。

# 工具

[IRB][50]
: 互動式 Ruby Read-Eval-Print-Loop (REPL)。

[Pry][51]
: Ruby REPL 的替代方案。

[Rake][52]
: make-like 的 Ruby 建置工具。

[RI][53]
: (Ruby Information) 是 Ruby 命令列工具，可以快速、輕鬆地線上存取 Ruby 文件。

[RBS][54]
: Ruby 的類型簽名。

[TypeProf][55]
: 一種實驗性的類型級 Ruby 解釋器，用於測試和理解 Ruby 程式碼。

[Steep][56]
: Ruby 靜態類型檢查器。

### 編輯器與整合開發環境

您可以用作業系統內建的編輯器來撰寫 Ruby。為了更有效的寫程式，值得選個 Ruby 基本特性支援良好的編輯器（如：語法高亮、檔案瀏覽）或是有更進階功能的整合開發環境（如：程式碼補齊、重構、支持測試等。）

以下是依學習曲線分類，Ruby 程式設計師（Rubyist）間流行使用的開發工具清單：

* 幾天內上手：
  * [Sublime Text][37]（付費）
  * [Visual Studio Code][vscode]
  * [Zed][zed]
* 幾個月內熟悉：
	*	[RubyMine][27]（付費）
* 需要「幾年」才能掌握（真的會一直有東西可以學）：
	*	[Emacs][20]，搭配 [Ruby mode][21] 或 [Enhanced Ruby mode][enh-ruby-mode]
	*	[Vim][25]，搭配 [vim-ruby][26] 插件
	*	[NeoVim][neovim]

不管是透過內建或是插件實現，這些編輯器都支援 Language Server Protocol（LSP）。Shopify 的 [ruby-lsp][ruby-lsp] 是目前最受歡迎的 Ruby 語言伺服器之一，並且[支援上述所有編輯器][ruby-lsp-supported-editors]。

### 較舊的閱讀資源

這些連結曾經非常熱門，但已多年未更新。

[Ruby Koans][2]
: Ruby Koans 導引你走上學習 Ruby 的啟蒙之路。可以學到 Ruby 語言、語法、結構、常用函數與函式庫。
  當然也少不了 Ruby 的文化。

[Ruby Essentials][7]
: 免費的線上電子書，讓你可以一步步地學習 Ruby。

[Why’s (Poignant) Guide to Ruby][5]
: 非比尋常但玩味無窮的書，透過故事、幽默與漫畫來教會你 Ruby。由 *why the lucky
  stiff* 創作，本書是學習 Ruby 的經典大作。

[Learn Ruby the Hard Way][38]
: 一系列說明完善的練習，導引你從完全零基礎一直介紹到物件導向程式設計與 Web 開發，

[Programming Ruby][9]
: 這是 Ruby 經典名著，第一版開放線上免費閱讀 [Pragmatic Programmers' book][10] 。

[The Ruby Programming Wikibook][12]
: 給初學者到中等程度的線上手冊以及語言參考。

[1]: https://try.ruby-lang.org/
[2]: https://rubykoans.com/
[5]: https://poignant.guide
[7]: https://www.techotopia.com/index.php/Ruby_Essentials
[8]: https://pine.fm/LearnToProgram/
[9]: https://ruby-doc.com/docs/ProgrammingRuby/
[10]: https://pragprog.com/titles/ruby5/programming-ruby-3-3-5th-edition/
[12]: https://en.wikibooks.org/wiki/Ruby_programming_language
[16]: https://www.rubydoc.info/
[20]: https://www.gnu.org/software/emacs/
[21]: https://www.emacswiki.org/emacs/RubyMode
[25]: https://www.vim.org/
[26]: https://github.com/vim-ruby/vim-ruby
[27]: https://www.jetbrains.com/ruby/
[37]: https://www.sublimetext.com/
[38]: https://learncodethehardway.org/ruby/
[39]: https://ruby-doc.org/
[40]: https://devdocs.io/ruby/
[41]: https://kapeli.com/dash
[42]: https://www.zenspider.com/ruby/quickref.html
[43]: https://rubyreferences.github.io/
[44]: https://rubystyle.guide/
[45]: https://github.com/rubocop/ruby-style-guide
[46]: https://ruby-style-guide.shopify.dev/
[47]: https://docs.gitlab.com/ee/development/backend/ruby_style_guide.html
[48]: https://github.com/airbnb/ruby
[49]: https://www.w3resource.com/ruby/ruby-style-guide.php
[50]: https://github.com/ruby/irb
[51]: https://github.com/pry/pry
[52]: https://github.com/ruby/rake
[53]: https://ruby.github.io/rdoc/RI_md.html
[54]: https://github.com/ruby/rbs
[55]: https://github.com/ruby/typeprof
[56]: https://github.com/soutaro/steep
[codecademy]: https://www.codecademy.com/learn/learn-ruby
[docs-rlo]: https://docs.ruby-lang.org/en
[docs-rlo-3.4]: https://docs.ruby-lang.org/en/3.4
[docs-rlo-master]: https://docs.ruby-lang.org/en/master
[docs-rlo-extension]: https://docs.ruby-lang.org/en/master/extension_rdoc.html
[enh-ruby-mode]: https://github.com/zenspider/enhanced-ruby-mode/
[exercism]: https://exercism.org/tracks/ruby
[grounded]: https://www.manning.com/books/the-well-grounded-rubyist-third-edition
[meta]: https://pragprog.com/titles/ppmetr2/metaprogramming-ruby-2/
[microscope]: https://patshaughnessy.net/ruby-under-a-microscope
[neovim]: https://neovim.io/
[odin]: https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby
[pickaxe]: https://pragprog.com/titles/ruby5/programming-ruby-3-3-5th-edition/
[poodr]: https://www.poodr.com/
[ruby-lsp]: https://github.com/Shopify/ruby-lsp
[ruby-lsp-supported-editors]: https://shopify.github.io/ruby-lsp/editors.html
[rubyapi-org]: https://rubyapi.org/
[rubyin20]: https://www.ruby-lang.org/en/documentation/quickstart/
[vscode]: https://code.visualstudio.com/docs/languages/ruby
[zed]: https://zed.dev/
