---
layout: news_post
title: "安全公告：Regexp 和字符串大小写转换中的多个漏洞"
author: "mame"
translator: "GAO Jun"
date: 2026-11-18 22:00:00 +0000
tags: security
lang: zh_cn
---

我们在 Ruby 的正则表达式引擎和字符串大小写转换中发现了七个漏洞。我们已知有一些概念验证（PoC）证明其中部分漏洞可用于触发远程代码执行。
我们已发布 Ruby 4.0.10、3.4.13 和 3.3.14 以修复这些漏洞。我们强烈建议您升级 Ruby。

这些漏洞的 CVE 编号已申请但尚未分配，因此本公告使用 GitHub 安全公告（GHSA）标识符来指代它们。

## [GHSA-34m4-m9fh-gqp5](https://github.com/ruby/ruby/security/advisories/GHSA-34m4-m9fh-gqp5): 字符串大小写转换中的堆缓冲区溢出

Ruby 的字符串大小写转换中存在一个单字节堆缓冲区溢出。对精心构造的字符串进行大小写转换可能导致远程代码执行。
我们已知有一些概念验证证明此漏洞在某些场景下可用于触发远程代码执行。

## [GHSA-7x2q-68qv-6p8x](https://github.com/ruby/ruby/security/advisories/GHSA-7x2q-68qv-6p8x): 正则表达式编译中的内存双重释放

Ruby 的正则表达式引擎中存在双重释放漏洞。编译攻击者精心构造的正则表达式时，可能在应用程序中导致远程代码执行。
我们已知有一些概念验证证明此漏洞在某些场景下可用于触发远程代码执行。

## [GHSA-87fm-7w84-j2px](https://github.com/ruby/ruby/security/advisories/GHSA-87fm-7w84-j2px): 字符串大小写转换中的整数溢出

Ruby 的字符串大小写转换中存在整数溢出，会导致堆缓冲区溢出。对精心构造的字符串进行大小写转换可能导致远程代码执行。
我们已知有一些概念验证证明此漏洞在某些场景下可用于触发远程代码执行。

## [GHSA-wpqw-5qxg-m68r](https://github.com/ruby/ruby/security/advisories/GHSA-wpqw-5qxg-m68r): 大小写不敏感的正则表达式匹配中的越界读取

Ruby 的正则表达式引擎中存在越界读取漏洞。编译攻击者精心构造的正则表达式进行匹配时，可能在应用程序中导致远程代码执行。
我们已知有一些概念验证证明此漏洞可以以攻击者可控的方式导致内存损坏。

## [GHSA-3p8q-wmhx-vm2w](https://github.com/ruby/ruby/security/advisories/GHSA-3p8q-wmhx-vm2w): 编译正则表达式时的堆缓冲区溢出

Ruby 的正则表达式引擎中存在整数溢出，会导致堆缓冲区溢出。编译攻击者精心构造的正则表达式时，可能在应用程序中导致远程代码执行。
我们已知有一些概念验证证明此漏洞在某些场景下可用于触发远程代码执行。

## [GHSA-7whj-cfh7-xgm4](https://github.com/ruby/ruby/security/advisories/GHSA-7whj-cfh7-xgm4): Regexp#to_s 中的堆缓冲区溢出

Ruby 的 `Regexp#to_s` 中存在堆缓冲区溢出。将攻击者精心构造的正则表达式转换为字符串时，可能在应用程序中导致信息泄露或远程代码执行。
我们已知有一些概念验证证明此漏洞在某些场景下可用于触发远程代码执行。

## [GHSA-pvgc-g7gj-pv6h](https://github.com/ruby/ruby/security/advisories/GHSA-pvgc-g7gj-pv6h): 大小写不敏感的反向引用匹配中的越界读取

Ruby 的正则表达式引擎中存在越界读取漏洞。与精心构造的字符串进行匹配时，可能泄露内存内容或导致进程崩溃。

## 受影响版本

* Ruby 3.3.13 及更早版本
* Ruby 3.4.0 至 3.4.12
* Ruby 4.0.0 至 4.0.9

## 建议操作

我们强烈建议升级至 Ruby 4.0.10、3.4.13 或 3.3.14。

Ruby 3.3 处于安全维护阶段。Ruby 3.2 及更早版本已停止维护，将不会收到这些修复。

## 致谢

* GHSA-34m4-m9fh-gqp5: Stephan Lipp (Ada Logics) 和 Anthropic
* GHSA-7x2q-68qv-6p8x: Stephan Lipp (Ada Logics) 和 Anthropic
* GHSA-87fm-7w84-j2px: [baba__yaga](https://hackerone.com/baba__yaga)
* GHSA-wpqw-5qxg-m68r: Stephan Lipp (Ada Logics) 和 Anthropic
* GHSA-3p8q-wmhx-vm2w: [aphantom](https://hackerone.com/aphantom)
* GHSA-7whj-cfh7-xgm4: Stephan Lipp (Ada Logics) 和 Anthropic
* GHSA-pvgc-g7gj-pv6h: Hiroya Fujinami 和 Hiroshi SHIBATA

## 历史

* 最初发布于 2026-11-19 00:00:00 (UTC)
