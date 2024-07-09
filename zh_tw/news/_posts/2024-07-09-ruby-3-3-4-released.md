---
layout: news_post
title: "Ruby 3.3.4 發布"
author: "k0kubun"
translator: "Bear Su"
date: 2024-07-09 00:30:00 +0000
lang: zh_tw
---

Ruby 3.3.4 已經發布了。

本次發佈版本修復在 Ruby 3.3.3 一些 bundled gems 的 gemspec 缺少依賴套件：`net-pop`、`net-ftp`、`net-imap`、和 `prime` [[Bug #20581]](https://bugs.ruby-lang.org/issues/20581)。

此修復允許 Bundler 在 Heroku 等平台上成功安裝這些 gems。
如果您的 `bundle install` 現在運作正常，則可能不會遇到這個問題。

其他變更主要是修復小型錯誤。
詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_3_4)。

## 發布時程

在未來，我們打算在「.1」版本發布後每 2 個月發布一次最新的穩定 Ruby 版本（目前為 Ruby 3.3）。
對於 Ruby 3.3，3.3.5 預計於 9 月 3 日發布，3.3.6 於 11 月 5 日發布，3.3.7 於 1 月 7 日發布。

如果有任何變更影響到相當多的人，例如本次發布版本提到的在 Heroku 上使用 Ruby 3.3.3 的使用者。
我們可能會比預期更早發佈新版本。

## 下載

{% assign release = site.data.releases | where: "version", "3.3.4" | first %}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## 發布紀錄

許多提交者、開發者和漏洞回報者幫助了此版本的發布，在此感謝所有人的貢獻。
