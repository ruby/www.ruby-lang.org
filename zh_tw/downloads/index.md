---
layout: page
title: "下載安裝"
lang: zh_tw
---

您可以在這裡下載最適合的 Ruby 發行版。目前最新的穩定版本是
{{ site.downloads.stable[0].version }}。請記得詳閱 [Ruby 版權說明][license]。
{: .summary}

### 安裝 Ruby 的方法

每個主要的平台都有多種工具可安裝 Ruby：

* Linux/UNIX 平台，可以使用第三方工具（如 rbenv 或 RVM）或使用系統套件管理工具；
* OS X 平台，可以使用第三方工具（如 rbenv 或 RVM）；
* Windows 平台，可以使用 RubyInstaller。

進一步了解請參考[安裝][installation]頁面上關於套件管理工具與第三方工具的內容。

當然各個平台也可以從原始碼來安裝 Ruby。

### 從原始碼編譯 Ruby

如果您非常熟悉您的作業系統，或是您的環境需要特別設定，那麼直接使用原始碼來安裝是最適合的方式。如果您的平台沒有編譯好的套件，則會需要透過原始碼來安裝。

進一步關於從原始碼編譯 Ruby 的資訊，請參考[安裝][installation]頁面。若編譯 Ruby 時遇到任何問題，請參考安裝頁面羅列的第三方工具，可能會有幫助。

* **穩定版本：**{% for release in site.downloads.stable %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.downloads.security_maintenance %}
* **處於安全維護週期（即將停止維護！）：**{% for release in site.downloads.security_maintenance %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.downloads.eol %}
* **不再維護（停止維護）：**{% for release in site.downloads.eol %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **快照：**
  * [穩定版快照]({{ site.downloads.stable_snapshot.url.gz }})：
    這是當前穩定版本分支的 tarball 的最新快照；
  * [最新版本]({{ site.downloads.nightly_snapshot.url.gz }})：
    這是 SVN 上的 tarball，每晚更新。
    可能有問題或 bug，謹慎使用，風險自負！

關於 Ruby Subversion 與 Git Repositories 的資訊，參見 [Ruby Core](/en/community/ruby-core/) 頁面。

Ruby 原始碼可從世界各地的[鏡像站][mirrors]獲得。請嘗試離您最近的鏡像站。



[license]: {{ site.license.url }}
[installation]: /zh_tw/documentation/installation/
[mirrors]: /en/downloads/mirrors/
