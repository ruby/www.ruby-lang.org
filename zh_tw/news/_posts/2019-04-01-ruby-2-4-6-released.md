---
layout: news_post
title: "Ruby 2.4.6 發佈"
author: "usa"
translator: Vincent Lin
date: 2019-04-01 06:00:00 +0000
lang: zh_tw
---

Ruby 2.4.6 發佈了。

此次發佈修復了從上一次發佈後大約 20 個漏洞，還包含了一些安全性修復。
詳情請參閱下面項目：

* [RubyGems 多個安全性風險](/en/news/2019/03/05/multiple-vulnerabilities-in-rubygems/)

詳細的變動請參閱[提交紀錄](https://github.com/ruby/ruby/compare/v2_4_5...v2_4_6)。

本次發布後，我們將結束 2.4 的正常維護週期，進入安全性維護週期。
這代表在 2.4.6 之後，除了安全性修正外，我們將不會移植任何錯誤修正回去 2.4 系列。
安全性維護週期為期一年，一年後 2.4 將會結束維護。因此，我們建議您著手更新至新版本如 Ruby 2.6 或 2.5。

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.6.tar.bz2>

      SIZE:   12623913 bytes
      SHA1:   b44b5c6637a69b3b95971b1937ecb583dc1de568
      SHA256: 909f360debed1f22fdcfc9f5335c6eaa0713198db4a6c13bab426f8b89b28b02
      SHA512: 292802984e5cff6d526d817bde08216fe801d255c4cede0646e450f22d4a3a81ae612ec5d193dcc2a888e3e98b2531af845b6b863a2952bcf3fb863f95368bcf

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.6.tar.gz>

      SIZE:   15880585 bytes
      SHA1:   3bc2d9ab3381887c57e0fb7937dc14e9f419f06c
      SHA256: de0dc8097023716099f7c8a6ffc751511b90de7f5694f401b59f2d071db910be
      SHA512: 7eb7720961e98e22e4335c38eeead9db96d049ef3ac1da437769b98fee7a10feb092643ce75822a2fe3bd5fd94938417ab5c2de7c6056afe0abf6e4cf03ca282

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.6.tar.xz>

      SIZE:   10005544 bytes
      SHA1:   86a4fa22cb3547005ec4bfcf77489a4254226187
      SHA256: 25da31b9815bfa9bba9f9b793c055a40a35c43c6adfb1fdbd81a09099f9b529c
      SHA512: eafb2257747f99e2ed262af142e71175b70f7cceaa4d1253b92c8337f075a9a58a2d93b029d75e11a9b124f112a8f0983273b2b30afc147b5cf71a8dbb5fa0ba

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.6.zip>

      SIZE:   17469891 bytes
      SHA1:   0e55d231c0e119304e077e42923ce6a1c3daa1d1
      SHA256: c5de9f11d4b7608d57139b96f7bc94899bb2fc9dee2e192c8951f6647a9d60f7
      SHA512: cfa779cdb970dfd35dc2a97951310cb3cde1d380b040c283fda6609c591039817a2847ab7174f7a9ee7f7adbb610709b57914bb26e5c015a20d5fe880c569855

## 發佈記

不好意思讓你久候，感謝幫助此次發佈的每個人。

Ruby 2.4 的維護（包含本版本）是基於 Ruby 協會的「穩定版本協議」。
