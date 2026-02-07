---
layout: news_post
title: "Ruby 2.7.2 Released"
author: "nagachika"
translator:
date: 2020-10-02 11:00:00 +0000
lang: vi
---

Ruby 2.7.2 has been released.

This release contains intentional incompatibility. Deprecation warnings are off by default on 2.7.2 and later.
You can turn on deprecation warnings by specifying the -w or -W:deprecated option at the command-line.
Please check the topics below for details.

* [Feature #17000 2.7.2 turns off deprecation warnings by default](https://bugs.ruby-lang.org/issues/17000)
* [Feature #16345 Don't emit deprecation warnings by default.](https://bugs.ruby-lang.org/issues/16345)

This release contains the new version of webrick with a security fix described in the article.

* [CVE-2020-25613: Potential HTTP Request Smuggling Vulnerability in WEBrick](/en/news/2020/09/29/http-request-smuggling-cve-2020-25613/)

See the [commit logs](https://github.com/ruby/ruby/compare/v2_7_1...v2_7_2) for other changes.

## Download

{% assign release = site.data.releases | where: "version", "2.7.2" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

Thanks to the many committers, developers and users who provided bug reports and contributions that made this release possible.
