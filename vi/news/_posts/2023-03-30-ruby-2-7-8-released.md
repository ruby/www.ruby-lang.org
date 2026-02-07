---
layout: news_post
title: "Ruby 2.7.8 Released"
author: "usa"
translator:
date: 2023-03-30 12:00:00 +0000
lang: vi
---

Ruby 2.7.8 has been released.

This release includes security fixes.
Please check the topics below for details.

* [CVE-2023-28755: ReDoS vulnerability in URI]({%link en/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: ReDoS vulnerability in Time]({%link en/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

This release also includes some build problem fixes.
See the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v2_7_8) for further details.

After this release, Ruby 2.7 reaches EOL. In other words, this is expected to be the last release of Ruby 2.7 series.
We will not release Ruby 2.7.9 even if a security vulnerability is found (but could release if a severe regression is found).
We recommend all Ruby 2.7 users to start migration to Ruby 3.2, 3.1, or 3.0 immediately.

## Download

{% assign release = site.data.releases | where: "version", "2.7.8" | first %}

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

Many committers, developers, and users who provided bug reports helped us make this release.
Thanks for their contributions.
