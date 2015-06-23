---
layout: news_post
title: "Ruby 2.0.0-p598 Released"
author: "usa"
translator: "cassiuschen"
date: 2014-11-13 12:00:00 +0000
lang: zh_cn
---

我们很高兴地宣布 Ruby 2.0.0-p598 发布了。

本次发布包括了一个针对 REXML 拒绝服务攻击（DoS）漏洞的安全修复。
下述日志中包含相似内容：
[预发布](https://www.ruby-lang.org/en/news/2014/10/27/ruby-1-9-3-p550-is-released/)中的[漏洞修复](https://www.ruby-lang.org/en/news/2014/10/27/rexml-dos-cve-2014-8080/),
但这次的发布中解决了 XML Entity Expansion的问题。
请看下述文章以了解详情。

* [CVE-2014-8090: Another Denial of Service XML Expansion](https://www.ruby-lang.org/en/news/2014/11/13/rexml-dos-cve-2014-8090/)

此外，本次发布还包含以下修复：
请见 [tickets](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&amp;status_id=5)
和 [ChangeLog](http://svn.ruby-lang.org/repos/ruby/tags/v2_0_0_598/ChangeLog)
以了解详情。

## 下载

* [http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p598.tar.bz2](http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p598.tar.bz2)

      SIZE:   10758882 bytes
      MD5:    a3f3908103a7d209d1d1cf4712e3953c
      SHA256: 67b2a93690f53e12b635ba1bcdbd41e8c5593f13d575fea92fdd8801ca088f0f
      SHA512: 10026a04e01a8ad14ea9c99bbdf4f7d04029b73ee0c01bbf6c2eb2817332d49adacf127b646693b67b5dd7010eaf3b696b23b6335cc0f7ee5a6b56dbba0f6f82

* [http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p598.tar.gz](http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p598.tar.gz)

      SIZE:   13608640 bytes
      MD5:    e043a21ce0d138fd408518a80aa31bba
      SHA256: 4136bf7d764cbcc1c7da2824ed2826c3550f2b62af673c79ddbf9049b12095fd
      SHA512: 0548aba9bf45e380e5f73e73168ea7fea341fc9739e108c7d530d11b677f6a78b2c4e29062d16a73b4286acaa2333ed20cb34e16b65b5b6898da66661f1717da

* [http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p598.tar.xz](http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p598.tar.xz)

      SIZE:   8316092 bytes
      MD5:    2ec36f7018eef05003bf8cf0e0f05def
      SHA256: 9dccf4c30e1bb004b18cb1129d9daac3c0ec510a671f4f4f13a2747897ffab35
      SHA512: bf7b93d9fbaab98a64d1f45c3f3bbcdfebd3e1d0584dfb27696b2716d93c2ba13881e1edaef6d3eccd769ac2e21d6157024c902f3d891951a20b972c1942ef99

* [http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p598.zip](http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p598.zip)

      SIZE:   15126384 bytes
      MD5:    aa6ac22747947e6562d5b0dc9767ecda
      SHA256: d5bdafd7b0fbd4254902ba10385c6e5812beac4ad221805aa4d92a37eff47f97
      SHA512: 6cdaf7f2d27a5f0ead9b94325b9c9fe90cf04c64dedaea8e1d45a8855a73ad61c5c72f1fda835eab73693c25c15a74c7e4e639ed5c18a9433dd79e398600b3ea

## 发布后记

我们对频繁地发布导致的不便深感抱歉。
感谢所有协助本次发布的朋友们。