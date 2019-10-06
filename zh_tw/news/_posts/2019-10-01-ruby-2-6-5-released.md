---
layout: news_post
title: "Ruby 2.6.5 發佈"
author: "nagachika"
translator: "JuanitoFatas"
date: 2019-10-01 11:00:00 +0000
lang: zh_tw
---

Ruby 2.6.5 發佈了。

此次發佈包含了安全性修復。
詳情請參閱下面項目：

* [CVE-2019-16255：Shell#[] 和 Shell#test 存在代碼注入風險]({% link zh_tw/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254：WEBrick 存在 HTTP 響應分割風險（額外修復）]({% link zh_tw/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845：File.fnmatch 及 File.fnmatch? 存在 NUL 字元注入風險]({% link zh_tw/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201：WEBrick 的摘要認證存在正則表達式阻斷服務攻擊風險]({% link zh_tw/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

詳細的變動請參閱[提交紀錄](https://github.com/ruby/ruby/compare/v2_6_4...v2_6_5)。

## 下載

{% assign release = site.data.releases | where: "version", "2.6.5" | first %}

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

許多提交者、開發者和漏洞回報者幫助了此版本的發佈，在此感謝所有人的貢獻。
