---
layout: news_post
title: "Ruby 4.0.9 已发布"
author: k0kubun
translator: "GAO Jun"
date: 2026-10-23 03:11:22 +0000
lang: zh_cn
---

Ruby 4.0.9 已发布。

此版本修复了 Regexp 编译中的一个问题，该问题与 GitLab 的 CVE-2026-110264 有关。
请查看下面的主题以获取详情。

* [修复了与 GitLab 的 CVE-2026-89078、CVE-2026-93577、CVE-2026-97229 和 CVE-2026-110264 相关的正则表达式编译问题]({% link zh_cn/news/_posts/2026-10-23-regexp-fixes-for-gitlab-cves.md %})

详情可参考 [GitHub 发布说明](https://github.com/ruby/ruby/releases/tag/v4.0.9)。

## 下载

{% assign release = site.data.releases | where: "version", "4.0.9" | first %}

* <{{ release.url.gz }}>

      文件大小: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      文件大小: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      文件大小: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## 发布说明

许多提交者、开发人员以及用户提供了问题报告，帮助我们完成了此版本。
感谢他们的贡献。
