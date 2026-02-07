---
layout: news_post
title: "Ruby 3.2.3 Released"
author: "nagachika"
translator:
date: 2024-01-18 09:00:00 +0000
lang: vi
---

Ruby 3.2.3 has been released.

This release includes many bug-fixes.
See the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_2_3) for further details.

This release also includes the update of uri.gem to 0.12.2 which contains the security fix.
Please check the topics below for details.

* [CVE-2023-36617: ReDoS vulnerability in URI]({%link en/news/_posts/2023-06-29-redos-in-uri-CVE-2023-36617.md %})

## Download

{% assign release = site.data.releases | where: "version", "3.2.3" | first %}

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
