---
layout: page
title: "函式庫"
lang: zh_tw
---

和多數程式語言一樣，Ruby 也仰賴大量第三方函式庫。
{: .summary}

這些函式庫幾乎所有都會以 **Gem** 的形式發佈，**Gem** 是可安裝的函式庫或應用程式的封裝格式，透過名為 [**RubyGems**][1] 的工具進行管理。

RubyGems 是為了簡化函式庫的建立、分享與安裝而設計的 Ruby 專屬套件管理系統（某種程度上類似 apt-get，但專門針對 Ruby 軟體）。從 Ruby 1.9 起，Ruby 內建 RubyGems，1.9 以前的 Ruby 得[手動安裝][2]。

有些其他的函式庫透過把**原始碼**壓縮成 .zip 或 .tar.gz 的形式發佈。通常可以透過
閱讀 `README` 或 `INSTALL` 檔案，根據步驟來安裝。

讓我們看看怎麼尋找和安裝你需要的函式庫。

### 尋找函式庫

函式庫（Gem）主要放在 [**RubyGems.org**][1] 網站上。可直接前往網站查找，或透過 `gem` 命令查找。

使用 `gem search -r`，可以對 RubyGems 的 Repository 做查詢。比如要找 rails，輸入 `gem search -r rails` 會返回與 Rails 相關的 Gem。`--local` (`-l`) 選項可搜索本機與 Rails 有關，已安裝的 Gem。要安裝一個 Gem，使用 `gem install [gem]`。瀏覽已安裝的 Gem 可輸入 `gem list`。更多關於 `gem` 命令的說明，請參考下文，或直接查 [RubyGems 的文件][3]。

除了 RubyGems.org 之外，還有其他來源可以找到函式庫。[**GitHub**][5] 是目前 Ruby 相關內容的主要原始碼儲存庫。多數情況下，Gem 的原始碼會託管在 GitHub 上，同時發佈為完整的 Gem 至 RubyGems.org。

[**The Ruby Toolbox**][6] 使得尋找開源 Ruby 專案非常簡單。它依據各種常見開發任務進行分類，並整理出專案的豐富資訊，包括版本更新歷史、提交活躍度、相依函式庫，以及在 GitHub 和 RubyGems.org 上的受歡迎程度。這讓你可以更輕鬆地找到合適的函式庫。

### 更多關於 RubyGems 的說明

以下是 `gem` 命令的快速回顧。關於 `gem` 命令的所有使用方式，請查閱[更詳細的文件][7]。

#### 搜索可用的 Gem

**search** 命令可用來搜尋 Gem，根據傳入的關鍵字。比如輸入 `html`，會列出所有名稱以 `html` 開頭的 Gem：

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

* `--remote`（縮寫 `-r`）選項，查詢 RubyGems.org 上的 Gem。
* `--local` （縮寫 `-l`）選項，查詢本機安裝的 Gem。

#### 安裝 Gem

確定要安裝的 Gem 之後，例如最受歡迎的 Rails，可以這樣安裝：

{% highlight sh %}
$ gem install rails
{% endhighlight %}

可以傳入 `--version`（縮寫 `-v`）來指定版本：

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

#### 列出所有的 Gem

列出本機安裝的所有 Gem：

{% highlight sh %}
$ gem list
{% endhighlight %}

列出 RubyGems.org 上所有可用的 Gem：

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### 尋求幫助

輸入 `gem help` 可在終端機中查看 `gem` 指令的說明文件：

{% highlight sh %}
$ gem help
{% endhighlight %}

例如輸入 `gem help commands` 可列出所有子指令；輸入 `gem help install` 則可查詢安裝指令說明。

#### 打造自己的 Gem

RubyGems.org 上有關於[多篇教學文件][3]，推薦使用 [Bundler][9] 來將函式庫打包成 Gem。Bundler 是用來管理應用程式相依函式庫的工具，同時可搭配 RubyGems 一起使用。



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[5]: https://github.com/
[6]: https://www.ruby-toolbox.com/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
