---
layout: news_post
title: "Ruby 2.3.7 已发布"
author: "usa"
translator: "Delton Ding"
date: 2018-03-28 17:00:00 +0000
lang: zh_cn
---

Ruby 2.3.7 已发布。此次发布修复了近 70 个漏洞，包括数个安全漏洞。请检查以下主题以了解详情。

* [CVE-2017-17742: WEBrick 回复分离缺陷](/zh_cn/news/2018/03/28/http-response-splitting-in-webrick-cve-2017-17742/)
* [CVE-2018-8777: WEBrick 大请求 DoS 缺陷](/zh_cn/news/2018/03/28/large-request-dos-in-webrick-cve-2018-8777/)
* [CVE-2018-6914: tempfile 和 tmpdir 库中意外创建文件和目录的缺陷](/zh_cn/news/2018/03/28/unintentional-file-and-directory-creation-with-directory-traversal-cve-2018-6914/)
* [CVE-2018-8778: String#unpack 中缓冲区欠读缺陷](/zh_cn/news/2018/03/28/buffer-under-read-unpack-cve-2018-8778/)
* [CVE-2018-8779: UNIXServer 与 UNIXSocket 中污染的 NUL 字节可创建意外的 Socket](/zh_cn/news/2018/03/28/poisoned-nul-byte-unixsocket-cve-2018-8779/)
* [CVE-2018-8780: Dir 中污染的 NUL 字节可触发意外目录穿越](/zh_cn/news/2018/03/28/poisoned-nul-byte-dir-cve-2018-8780/)
* [RubyGems 存在多个安全风险](/en/news/2018/02/17/multiple-vulnerabilities-in-rubygems/)

请查看 [ChangeLog](https://github.com/ruby/ruby/blob//v2_3_7/ChangeLog) 以了解细节。

此版本后，我们会终止 Ruby 2.3 的正常维护，并启动安全性维护阶段。这意味着 Ruby 2.3.7 版本后除了安全性修复将不会被移植任何漏洞修复。安全性维护阶段计划持续 1 年，在此阶段后，Ruby 2.3 的维护会彻底结束。因此，我们建议您着手升级至 Ruby 2.5 或 2.4。

## 下载

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.bz2)

      SIZE:   14421177 bytes
      SHA1:   3bb88965405da5e4de2432eeb445fffa8a66fb33
      SHA256: 18b12fafaf37d5f6c7139c1b445355aec76baa625a40300598a6c8597fc04d8e
      SHA512: e72754f7703f0706c4b0bccd053035536053451fe069a55427984cc0bc5692b86bd51c243c5f62f78527c66b08300d2e4aa19b73e6ded13d6020aa2450e66a7d

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.gz)

      SIZE:   17859100 bytes
      SHA1:   540996fec64984ab6099e34d2f5820b14904f15a
      SHA256: 35cd349cddf78e4a0640d28ec8c7e88a2ae0db51ebd8926cd232bb70db2c7d7f
      SHA512: 1ceccf00981d6d60e7587e89a04cc028f976950313ee445db5afd03e323472d3e69a35423733b24f9cbd9729f034cf80d2233b5c159764839f5bee4ca7052fe0

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.xz)

      SIZE:   11438124 bytes
      SHA1:   c489248730cbce7721edd3e97de81e68eec938b2
      SHA256: c61f8f2b9d3ffff5567e186421fa191f0d5e7c2b189b426bb84498825d548edb
      SHA512: fd91c8db3d3aa4cc962a62f27b4d1a71f6b5567ab836e6dbfbbb1553eb269d11e12faf9e36af6c489c33b54fd89dab99bfe81a563158b704877f0628d6f5bc5a

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.zip](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.zip)

      SIZE:   19911423 bytes
      SHA1:   ec6870b39125238d8d57d642225592896ed3b6d9
      SHA256: ffa42eeff928624a05dc7ad39426c855c6e9a757417f17b6fe9e54664ec91012
      SHA512: c85255a7f43c7df2fb11be4f9aa96e2ae70a94d3e963ccff4d8c1349ad6d455d9a436812efb24c91e451e68b8f81e5d335c6d5811b2a0e945a7070c305054434

## 发布记

感谢所有帮助此版本发布的人。

Ruby 2.3 的维护，包括这个版本是基于 Ruby 协会的「Ruby 稳定版本协议」进行维护的。
