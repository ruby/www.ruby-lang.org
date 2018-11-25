---
layout: news_post
title: "RubyGems 存在多个安全风险"
author: "usa"
translator: "Alex S"
date: 2018-02-17 03:00:00 +0000
tags: security
lang: zh_cn
---

Ruby 内置的 RubyGems 发现存在多个安全风险。RubyGems 官方博客[对此事的声明](https://blog.rubygems.org/2018/02/15/2.7.6-released.html)。

## 详细

以下为已报到的安全风险。

* 在写入 root 以外软链目录的时候阻止路径遍历
* 修复 gem owner 命令可能存在的不安全对象反序列化风险
* 严格解析 tar 文件头的八进制列
* 当 gem 包存在重复文件时抛出安全性错误
* 强制对 spec 的 homepage 属性进行 URL 验证
* 缓和通过 gem server 展示的 homepage 属性的 XSS 风险
* 阻止在安装 gem 时的路径遍历风险

强烈建议 Ruby 使用者尽快采用以下应急之策。

## 受影响的版本

* Ruby 2.2 系列: 2.2.9 以及之前的版本
* Ruby 2.3 系列: 2.3.6 以及之前的版本
* Ruby 2.4 系列: 2.4.3 以及之前的版本
* Ruby 2.5 系列: 2.5.0 以及之前的版本
* trunk revision 62422 之前的版本

## 应急之策

RubyGems 2.7.6 和后续版本已经修复了上述风险，请将 RubyGems 升级到最新版本。

```
gem update --system
```

如果您无法更新 RubyGems，您可以采用以下补丁。

* [对应 Ruby 2.2.9 的补丁](https://bugs.ruby-lang.org/attachments/download/7030/rubygems-276-for-ruby22.patch)
* [对应 Ruby 2.3.6 的补丁](https://bugs.ruby-lang.org/attachments/download/7029/rubygems-276-for-ruby23.patch)
* [对应 Ruby 2.4.3 的补丁](https://bugs.ruby-lang.org/attachments/download/7028/rubygems-276-for-ruby24.patch)
* [对应 Ruby 2.5.0 的补丁](https://bugs.ruby-lang.org/attachments/download/7027/rubygems-276-for-ruby25.patch)

对于 trunk，更新到最新版本即可。

## 致谢

本文基于 RubyGems [官方博客](https://blog.rubygems.org/2018/02/15/2.7.6-released.html)。

## 历史

* 首发于 2018-02-17 03:00:00 UTC
