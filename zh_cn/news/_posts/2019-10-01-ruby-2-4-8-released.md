---
layout: news_post
title: "Ruby 2.4.8 已发布"
author: "usa"
translator: Delton Ding
date: 2019-10-01 11:00:00 +0000
lang: zh_cn
---

Ruby 2.4.8 已发布。

此次发布修复了数个安全漏洞。请检查以下主题以了解详情。

* [CVE-2019-16255：Shell#[] 和 Shell#test 存在代码注入漏洞]({% link zh_cn/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254：WEBrick 存在 HTTP 响应切分缺陷（额外修复）]({% link zh_cn/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845：File.fnmatch 及 File.fnmatch? 存在 NUL 字元注入風險]({% link zh_tw/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201：WEBrick 的摘要认证存在正则表达式 DoS 攻击缺陷]({% link zh_cn/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

Ruby 2.4 处于安全维护期，并将于 2020 年 3 月底停止维护。此后 Ruby 2.4 的维护将终止。我们建议您开始规划迁移至更新版本的 Ruby，例如 Ruby 2.6 或 2.5。

__Update (Oct 2nd 4:00 UTC):__ 我们正在解决 Ruby 2.4.8 tarball 无法在非 root 用户下安装的问题，请追踪 [[Bug #16197]](https://bugs.ruby-lang.org/issues/16197) 了解后续。

## 下载

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

## 发布记

感谢帮助发布此版本的所有人，特别是缺陷的报告者。
