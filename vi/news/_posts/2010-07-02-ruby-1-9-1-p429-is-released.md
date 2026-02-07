---
layout: news_post
title: "Ruby 1.9.1-p429 is released"
author: "Yugui"
lang: vi
---

Ruby 1.9.1-p429 has just been released. This is a patchlevel release for
Ruby 1.9.1. This fixes many bugs and includes the fix for a security
vulnerability that allows an attacker to execute an arbitrary code.

## Vulnerability

### Description

A security vulnerability that causes buffer overflow when you assign a
danger value to `ARGF.inplace_mode` on Windows. It possibly allows an
attacker to execute an arbitrary code.

The affected versions are:

* Ruby 1.9.1 patchlevel 378 and all prior versions;
* Ruby 1.9.2 preview 3 and all prior versions;
* Development versions of Ruby 1.9 (1.9.3dev).

I recommend you to upgrade your ruby 1.9 to 1.9.1-p429 or 1.9.2-rc1.

The vulnerability does not directly affect to Ruby 1.8 series.

### Credit

The vulnerability was found and reported by Masaya TARUI.

## Download

* [ruby-1.9.1-p429.tar.bz2][1]
  * SIZE: 7300923 bytes
  * MD5: 09df32ae51b6337f7a2e3b1909b26213
  * SHA256: e0b9471d77354628a8041068f45734eb2d99f5b5df08fe5a76d785d989a47bfb

* [ruby-1.9.1-p429.tar.gz][2]
  * SIZE: 9078126 bytes
  * MD5: 0f6d7630f26042e00bc59875755cf879
  * SHA256: fdd97f52873b70f378ac73c76a1b2778e210582ce5fe1e1c241c37bd906b43b2

* [ruby-1.9.1-p429.zip][3]
  * SIZE: 10347659 bytes
  * MD5: fcd031414e5e4534f97aa195bb586d6c
  * SHA256: c9fe2364b477ad004030f4feeb89aeaa2a01675ff95db1bed31a932806f85680



[1]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.zip
