---
layout: news_post
title: "Ruby 2.4.9 已发布"
author: "usa"
translator: Delton Ding
date: 2019-10-02 09:00:00 +0000
lang: zh_cn
---

Ruby 2.4.9 已发布。

此发布为 2.4.8 的重新打包。
由于先前的 Ruby 2.4.8 无法安装（详情请参阅 [[Bug #16197]](https://bugs.ruby-lang.org/issues/16197) ），所以此版本除了版本号差异没有其它更改。

Ruby 2.4 处于安全维护期，并将于 2020 年 3 月底停止维护。此后 Ruby 2.4 的维护将终止。我们建议您开始规划迁移至更新版本的 Ruby，例如 Ruby 2.6 或 2.5。

## 下载

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

## 发布记

感谢帮助发布此版本的所有人。
