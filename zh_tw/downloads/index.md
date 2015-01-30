---
layout: page
title: "下載安裝"
lang: zh_tw
---

您可以在這裡下載適合最新的 Ruby 發行版。目前最新的穩定版本是
{{ site.downloads.stable.version }}。另外，請先閱讀 [Ruby 版權說明][license]。
{: .summary}

### 安裝 Ruby 的方法

每個主要的平台都有多種工具可安裝 Ruby：

* Linux/UNIX 平台，可以使用第三方工具（如 rbenv 或 RVM）或使用系統套件管理工具；
* OS X 平台，可以使用第三方工具（如 rbenv 或 RVM）；
* Windows 平台，可以使用 RubyInstaller。

進一步了解請參考[安裝][installation]頁面上關於套件管理工具與第三方工具的內容。

當然各個平台也可以從原始碼來安裝 Ruby。

### 從原始碼編譯 Ruby

如果您非常熟悉您的作業系統，或是您的環境需要特別設定，那麼直接使用原始碼來安裝是個極佳的方式。如果您的平台沒有編譯好的套件，則會需要透過原始碼來安裝。

進一步關於從原始碼編譯 Ruby 的資訊，請參考[安裝][installation]頁面。若編譯 Ruby 時遇到任何問題，請參考安裝頁面羅列的第三方工具，可能會有幫助。

* **當前穩定版：**
  [Ruby {{ site.downloads.stable.version }}][stable-gz]<br>
  sha256: {{ site.downloads.stable.sha256.gz }}

* **穩定上一版：**
  [Ruby {{ site.downloads.previous.version }}][previous-gz]<br>
  sha256: {{ site.downloads.previous.sha256.gz }}

* **舊穩定版（2.0.0 系列）：**
  [Ruby {{ site.downloads.previous20.version }}][previous20-gz]<br>
  sha256: {{ site.downloads.previous20.sha256.gz }}

* **舊穩定版（1.9.3 系列）：**
  [Ruby {{ site.downloads.previous19.version }}][previous19-gz]<br>
  sha256: {{ site.downloads.previous19.sha256.gz }}

* **快照：**
  * [Stable Snapshot][stable-snapshot-gz]:
    當前穩定版 tarball 的最新快照
  * [Nightly Snapshot][nightly-gz]:
    這是 SVN 上的 tarball，每晚更新。
    可能有問題或 bug，謹慎使用！

關於 Ruby Subversion 與 Git Repositories 的資訊，參見 [Ruby Core](/en/community/ruby-core/) 頁面。

Ruby 原始碼可從世界各地的[鏡像站][mirrors]獲得。請嘗試離您最近的鏡像站。



[license]: {{ site.license.url }}
[installation]: /zh_tw/documentation/installation/
[stable-gz]: {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[previous20-gz]: {{ site.downloads.previous20.url.gz }}
[previous19-gz]: {{ site.downloads.previous19.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[mirrors]: /en/downloads/mirrors/
