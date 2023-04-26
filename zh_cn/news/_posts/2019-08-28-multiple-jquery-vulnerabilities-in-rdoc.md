---
layout: news_post
title: "RDoc 中多个 jQeury 安全性缺陷"
author: "aycabta"
translator: Delton Ding
date: 2019-08-28 09:00:00 +0000
tags: security
lang: zh_cn
---


Ruby 内置的 RDoc 所附带的 jQuery 存在关于跨站脚本攻击（XSS）的安全性缺陷。建议所有使用者将 Ruby 更新至已包含修复版本的 RDoc 最新版本。

## 详情

以下为被报告的缺陷。

* [CVE-2012-6708](https://www.cve.org/CVERecord?id=CVE-2012-6708)
* [CVE-2015-9251](https://www.cve.org/CVERecord?id=CVE-2015-9251)

强烈建议所有 Ruby 使用者升级你的 Ruby，或尽快采用下述临时解决方案。你还需要重新生成现有的 RDoc 文档以完全解决问题。

## 受影响的版本

* Ruby 2.3 系列：全部
* Ruby 2.4 系列：2.4.6 以及之前的版本
* Ruby 2.5 系列：2.5.5 以及之前的版本
* Ruby 2.6 系列：2.6.3 以及之前的版本
* 在 master commit f308ab2131ee675000926540cbb8c13c91dc3be5 之前

## 必要措施

RDoc 是静态文档的生成工具。修补工具本身不足以解决这些安全性问题。因此你还必须使用新的 RDoc 重新生成由之前版本生成的 RDoc 文档。

## 临时解决方案

原则上，你应该要升级你的 Ruby 至最新版本。
RDoc 6.1.2 以及之后的版本包含安全性修复，因此如果你无法升级 Ruby 本身，请将 RDoc 升级至最新版本。

如同前述，必须重新生成 RDoc 文档。

```
gem install rdoc -f
```

*更新：* 本文的初始版本部分提到了 rdoc-6.1.1.gem，但其仍存在缺陷。请确保你安装了 rdoc-6.1.2 或之后的版本。

至于开发版本，请更新 master 分支至最新 HEAD。

## 鸣谢

感谢 [Chris Seaton](https://hackerone.com/chrisseaton) 报告了这一问题。

## 歷史

* 最早发布于 2019-08-28 09:00:00 UTC
* RDoc 版本修正于 2019-08-28 11:50:00 UTC
* 细节语言修正于 2019-08-28 12:30:00 UTC
