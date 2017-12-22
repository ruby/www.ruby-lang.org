---
layout: news_post
title: "RubyGems 发现多个漏洞"
author: "usa"
translator: "安道"
date: 2017-08-29 12:00:00 +0000
tags: security
lang: zh_cn
---

Ruby 自带的 RubyGems 发现了多个漏洞。RubyGems 官方博客[对此有报道](http://blog.rubygems.org/2017/08/27/2.6.13-released.html)。

## 详情

发现的漏洞有：

* DNS 请求劫持漏洞（CVE-2017-0902）
* ANSI 转义序列漏洞（CVE-2017-0899）
* `query` 命令中的 DoS 漏洞（CVE-2017-0900）
* gem 安装程序中的一个漏洞，能让恶意 gem 覆盖任意文件（CVE-2017-0901）

强烈建议 Ruby 用户采用下述临时方案规避这些漏洞。

## 受影响的版本

* Ruby 2.2 系列：2.2.7 及之前的版本
* Ruby 2.3 系列：2.3.4 及之前的版本
* Ruby 2.4 系列：2.4.1 及之前的版本
* trunk 修订版 59672 之前的版本

## 临时解决方案

目前，Ruby 尚未发布新版修正上述 RubyGems 漏洞。不过你可以把 RubyGems 升级到最新的版本。RubyGems 2.6.13 或以上版本修正了上述漏洞。

```
gem update --system
```

如果你无法升级 RubyGems，可以变通一下，打下述补丁。

* [针对 Ruby 2.2.7 的补丁](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [针对 Ruby 2.3.4 的补丁](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* Ruby 2.4.1 需要两个补丁，请按下述顺序打补丁：
  1. [RubyGems 2.6.11~2.6.12](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
  2. [RubyGems 2.6.12~2.6.13](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

trunk 中的版本，升级到最新修订版即可。

## 致谢

本文基于 RubyGems 官方博客中的[这篇文章](http://blog.rubygems.org/2017/08/27/2.6.13-released.html)。

## 历史

* 2017-08-29 12:00:00 UTC 最初发布
* 2017-08-31 2:00:00 UTC 添加 CVE 编号
