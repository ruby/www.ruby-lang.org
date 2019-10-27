---
layout: news_post
title: "Ruby 2.4.9 發佈"
author: "usa"
translator: Vincent Lin
date: 2019-10-02 09:00:00 +0000
lang: zh_tw
---

Ruby 2.4.9 發佈了。

此發佈為 2.4.8 的重新包裝，
因為先前 Ruby 2.4.8 的發佈無法安裝
（詳情請參閱 [[Bug #16197]](https://bugs.ruby-lang.org/issues/16197) ），
除了版本號的差異外沒有其他的更改。

Ruby 2.4 現處於安全維護期，並將於 2020 年 3 月底停止維護。
此後 Ruby 2.4 的全部維護將終止。
我們建議您開始規劃遷移到更新版本的 Ruby，例如 Ruby 2.6 或 2.5。

## 下載

{% assign release = site.data.releases | where: "version", "2.4.9" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## 發佈記

感謝所有幫助發佈此版本的所有人。
