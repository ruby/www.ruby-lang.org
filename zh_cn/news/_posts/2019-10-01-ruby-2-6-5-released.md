---
layout: news_post
title: "Ruby 2.6.5 已发布"
author: "nagachika"
translator: Delton Ding
date: 2019-10-01 11:00:00 +0000
lang: zh_cn
---

Ruby 2.6.5 已发布。

此次发布修复了数个安全漏洞。请检查以下主题以了解详情。

* [CVE-2019-16255：Shell#[] 和 Shell#test 存在代码注入漏洞]({% link zh_cn/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254：WEBrick 存在 HTTP 响应切分缺陷（额外修复）]({% link zh_cn/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845：File.fnmatch 及 File.fnmatch? 存在 NUL 字元注入風險]({% link zh_tw/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201：WEBrick 的摘要认证存在正则表达式 DoS 攻击缺陷]({% link zh_cn/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

详细的变动详情请参阅[提交记录](https://github.com/ruby/ruby/compare/v2_6_4...v2_6_5)。

## 下载

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

## 发布记

许多提交者、开发者和漏洞报告者帮助了此版本的发布，在此感谢所有人的贡献。
