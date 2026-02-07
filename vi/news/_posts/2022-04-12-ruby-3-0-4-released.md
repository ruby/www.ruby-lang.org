---
layout: news_post
title: "Ruby 3.0.4 Released"
author: "nagachika and mame"
translator:
date: 2022-04-12 12:00:00 +0000
lang: vi
---

Ruby 3.0.4 has been released.

This release includes security fixes.
Please check the topics below for details.

* [CVE-2022-28738: Double free in Regexp compilation]({%link en/news/_posts/2022-04-12-double-free-in-regexp-compilation-cve-2022-28738.md %})
* [CVE-2022-28739: Buffer overrun in String-to-Float conversion]({%link en/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

See the [commit logs](https://github.com/ruby/ruby/compare/v3_0_3...v3_0_4) for further details.

## Download

{% assign release = site.data.releases | where: "version", "3.0.4" | first %}

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
