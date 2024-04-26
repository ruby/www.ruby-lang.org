---
layout: news_post
title: "Ruby 3.0.7 Released"
author: "hsbt"
translator:
date: 2024-04-23 10:00:00 +0000
lang: en
---

Ruby 3.0.7 has been released.

This release includes security fixes.
Please check the topics below for details.

* [CVE-2024-27282: Arbitrary memory address read vulnerability with Regex search]({%link en/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %})
* [CVE-2024-27281: RCE vulnerability with .rdoc_options in RDoc](https://www.ruby-lang.org/en/news/2024/03/21/rce-rdoc-cve-2024-27281/)
* [CVE-2024-27280: Buffer overread vulnerability in StringIO](https://www.ruby-lang.org/en/news/2024/03/21/buffer-overread-cve-2024-27280/)

See the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_0_7) for further details.

After this release, Ruby 3.0 reaches EOL. In other words, this is expected to be the last release of Ruby 3.0 series.
We will not release Ruby 3.0.8 even if a security vulnerability is found (but could release if a severe regression is found).
We recommend all Ruby 3.0 users to start migration to Ruby 3.3, 3.2, or 3.1 immediately.

## Download

{% assign release = site.data.releases | where: "version", "3.0.7" | first %}

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
