---
layout: news_post
title: "Ruby 2.5.9 發佈"
author: "usa"
translator: "twlixin"
date: 2021-04-05 12:00:00 +0000
lang: zh_tw
---

Ruby 2.5.9 發佈了。

這個版本包含以下的脆弱性修正。
請參照以下的詳細記事。

* [CVE-2020-25613: Potential HTTP Request Smuggling Vulnerability in WEBrick]({%link en/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: XML round-trip vulnerability in REXML]({% link en/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

另外、配合Ruby的特性，包含了若干変更。
変更的詳細請參照 [commit logs](https://github.com/ruby/ruby/compare/v2_5_8...v2_5_9)。

隨著這個版本的發佈，Ruby 2.5 系列進入了終了階段(EOL)。
這意味著，Ruby 2.5.9 將成為 Ruby 2.5 系列的最後版本。
以後，即使新脆弱性被發現，Ruby 2.5.10 之類的版本也不會被發佈。
我們鼓勵各用戶盡快遷移到更新的版本，例如 3.0、2.7 和 2.6。

## 下載

{% assign release = site.data.releases | where: "version", "2.5.9" | first %}

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

## 版本發佈的註記

我們要感謝所有對此版本提供協力的人，尤其對於報告漏洞的人致上特別感謝之意。
