---
layout: page
title: "函式庫"
lang: zh_tw
---

多數程式語言有著許多廣泛的第三方函式庫，Ruby 也受益於許多第三方函式庫。
{: .summary}

多數函式庫以 **Gem** 格式發佈。 [**RubyGems**][1] 是 Ruby 函式庫打包系統，特別針對新建、分享、
安裝函式庫而設計（某種程度上與套件管理系統 `apt-get` 很相似，但針對的是 Ruby 軟體的發佈）。從 Ruby 1.9 起，Ruby 內建 RubyGems，1.9 以前的 Ruby 得[手動安裝][2]。

有些其他的函式庫透過把**原始碼**壓縮成 .zip 或 .tar.gz 的形式發佈。通常可以透過
閱讀 `README` 或 `INSTALL` 檔案，根據步驟來安裝。

讓我們看看怎麼尋找和安裝你需要的函式庫。

### 尋找函式庫

函式庫（Gem）主要放在 [**RubyGems.org**][1] 網站上。可直接前往網站查找，或透過 `gem` 命令查找。

使用 `gem search -r`，可以對 RubyGems 的 Repository 做查詢。比如要找 rails，輸入 `gem search -r rails` 會返回與 Rails 相關的 Gem。`--local` (`-l`) 選項可搜索本機與 Rails 有關，已安裝的 Gem。要安裝一個 Gem，使用 `gem install [gem]`。瀏覽已安裝的 Gem 可輸入 `gem list`。更多關於 `gem` 命令的說明，請參考下文，或直接查 [RubyGems 的文件][3]。

除了 RubyGems.org 之外，也有其它的站點可查找函式庫。[RubyForge][4] 曾經是 Ruby 函式庫的家，但近年來 [**GitHub**][5] 的興起，GitHub 成為了 Ruby 相關資源的主要 Repository。現在，通常 Gem 的原始碼會放在 GitHub，而 Gem 會發佈到 RubyGems.org。

[**The Ruby Toolbox**][6] 使得尋找開源 Ruby 專案非常簡單。按照許多常見的開發任務分類，蒐集專案許多的相關資訊，像是版本發佈歷史、提交活躍度、函式庫相依的軟體、與其它類似專案的流行程度比較（在 GitHub 與 RubyGems.org 上的流行程度），讓你輕鬆找到想找到的函式庫。

### 更多關於 RubyGems 的說明

以下是 `gem` 命令的快速回顧。關於 `gem` 命令的所有使用方式，請查閱[更詳細的文件][7]。

#### 搜索可用的 Gem

`search` 命令可用來搜尋 Gem，根據傳入的關鍵字。比如輸入 `html` 會返回與 `html` 相關的 Gem（按字母排序）：

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

* `--remote`（縮寫 `-r`）選項，查詢 RubyGems.org 上的 Gem。
* `--local` （縮寫 `-l`）選項，查詢本機安裝的 Gem。

#### 安裝 Gem

找到 Gem，就可以安裝。安裝最流行的 Rails 看看：

{% highlight sh %}
$ gem install rails
{% endhighlight %}

可以傳入 `--version`（縮寫 `-v`）來指定版本：

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

RubyGems 提倡語義化版本，請參考 [Semantic Versioning 2.0.0][semver]。

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

輸入 `gem help` 可查看 `gem` 命令的說明文件terminal:

{% highlight sh %}
$ gem help
{% endhighlight %}

`gem help commands` 可查看特定子命令的說明，如 `gem help install`。

#### 打造自己的 Gem

RubyGems.org 上有關於[多篇教學文件][3]，推薦使用 [Bundler][9] 來將函式庫打包成 Gem。Bundler 是管理 application 軟體相依的工具，同時可搭配 RubyGems 一起使用。



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[4]: http://rubyforge.org/
[5]: https://github.com/
[6]: https://www.ruby-toolbox.com/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/

[semver]: http://semver.org/
