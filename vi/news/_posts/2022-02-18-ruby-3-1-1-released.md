---
layout: news_post
title: "Phát hành Ruby 3.1.1"
author: "naruse"
translator:
date: 2022-02-18 12:00:00 +0000
lang: vi
---

Ruby 3.1.1 đã được phát hành.

Đây là phiên bản TEENY đầu tiên của dòng ổn định 3.1.

* [error_highlight does not work for -e option](https://bugs.ruby-lang.org/issues/18434)
* [Fix YJIT passing method arguments in the wrong order when keyword argument and default arguments are mixed. Breaks Rails collection caching](https://bugs.ruby-lang.org/issues/18453)
* [Segmentation fault when missing Warning#warn method](https://bugs.ruby-lang.org/issues/18458)
* [Fix Pathname dot directory globbing](https://bugs.ruby-lang.org/issues/18436)
* [Fix default --jit-max-cache in ruby --help](https://bugs.ruby-lang.org/issues/18469)
* [3.1.0-dev `include` cause Module to be marked as initialized](https://bugs.ruby-lang.org/issues/18292)
* [Tutorial Link for Optionparser is broken](https://bugs.ruby-lang.org/issues/18468)
* [Yielding an element for Enumerator in another thread dumps core](https://bugs.ruby-lang.org/issues/18475)
* [Segmentation fault with ruby 3.1.0 in `active_decorator`](https://bugs.ruby-lang.org/issues/18489)
* [Segfault on use of Process.daemon in a Fiber](https://bugs.ruby-lang.org/issues/18497)
* [0 << (2\*\*40) is NoMemoryError but 0 << (2\*\*80) is 0](https://bugs.ruby-lang.org/issues/18517)
* [IO read/write/wait hook bug fixes.](https://bugs.ruby-lang.org/issues/18443)
* [Memory leak on aliasing method to itself](https://bugs.ruby-lang.org/issues/18516)
* [error: use of undeclared identifier 'MAP_ANONYMOUS'](https://bugs.ruby-lang.org/issues/18556)
* [\[BUG\] try to mark T_NONE object in RubyVM::InstructionSequence. load_from_binary](https://bugs.ruby-lang.org/issues/18501)
* [throw_data passed to rescue through require](https://bugs.ruby-lang.org/issues/18562)
* [Fix `IpAddr#to_range` on frozen `IpAddr` instances.](https://bugs.ruby-lang.org/issues/18570)
* [Fixed path for ipaddr.rb](https://github.com/ruby/ruby/pull/5533)
* [Merge RubyGems-3.3.7 and Bundler-2.3.7](https://github.com/ruby/ruby/pull/5543)
* [Hang when repeating Hash#shift against a empty Hash](https://bugs.ruby-lang.org/issues/18578)

Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v3_1_0...v3_1_1) để biết thêm chi tiết.

## Tải về

{% assign release = site.data.releases | where: "version", "3.1.1" | first %}

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

## Lời nhắn phát hành

Nhiều committer, nhà phát triển và người dùng đã cung cấp báo cáo lỗi đã giúp chúng tôi thực hiện bản phát hành này.
Cảm ơn những đóng góp của họ.
