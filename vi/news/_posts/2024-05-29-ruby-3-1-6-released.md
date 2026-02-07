---
layout: news_post
title: "Ruby 3.1.6 Released"
author: "hsbt"
translator:
date: 2024-05-29 9:00:00 +0000
lang: vi
---

Ruby 3.1.6 has been released.

Ruby 3.1 series is now in the security maintenance phase. In general, we will fix only security issues in this phase. But we have several build failure issues after the release of Ruby 3.1.5. We decided to release Ruby 3.1.6 to fix these issues.

Please check the topics below for details.

* [Bug #20151: Can't build Ruby 3.1 on FreeBSD 14.0](https://bugs.ruby-lang.org/issues/20151)
* [Bug #20451: Bad Ruby 3.1.5 backport causes fiddle to fail to build](https://bugs.ruby-lang.org/issues/20451)
* [Bug #20431: Ruby 3.3.0 build fail with make: *** \[io_buffer.o\] Error 1](https://bugs.ruby-lang.org/issues/20431)

See the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_1_6) for further details.

## Download

{% assign release = site.data.releases | where: "version", "3.1.6" | first %}

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

## Release Comment

Many committers, developers, and users who provided bug reports helped us make this release.
Thanks for their contributions.
