---
layout: news_post
title: "Ruby 2.4.8 發佈"
author: "usa"
translator: "JuanitoFatas"
date: 2019-10-01 11:00:00 +0000
lang: zh_tw
---

Ruby 2.4.8 發佈了。

此次發佈包含了安全性修復。
詳情請參閱下面項目：

* [CVE-2019-16255：Shell#[] 和 Shell#test 存在代碼注入風險]({% link zh_tw/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254：WEBrick 存在 HTTP 響應分割風險（額外修復）]({% link zh_tw/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845：File.fnmatch 及 File.fnmatch? 存在 NUL 字元注入風險]({% link zh_tw/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201：WEBrick 的摘要認證存在正則表達式阻斷服務攻擊風險]({% link zh_tw/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

Ruby 2.4 現處於安全維護期，並將於 2020 年 3 月底停止維護。
此後 Ruby 2.4 的全部維護將終止。
我們建議您開始規劃遷移到更新版本的 Ruby，例如 Ruby 2.6 或 2.5。

__Update (Oct 2nd 4:00 UTC):__ 我們正在解決 Ruby 2.4.8 tarball 無法在非 root 使用者下安裝的問題，請追蹤 [[Bug #16197]](https://bugs.ruby-lang.org/issues/16197) 了解後續。

## 下載

{% assign release = site.data.releases | where: "version", "2.4.8" | first %}

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

感謝所有幫助發佈此版本的所有人，特別是風險的回報者。
