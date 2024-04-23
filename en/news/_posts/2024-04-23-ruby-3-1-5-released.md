---
layout: news_post
title: "Ruby 3.1.5 Released"
author: "hsbt"
translator:
date: 2024-04-23 10:00:00 +0000
lang: en
---

Ruby 3.1.5 has been released.

This release includes security fixes.
Please check the topic below for details.

* [CVE-2024-27282: Information disclosure vulnerability with Regex search]({%link en/news/_posts/2024-04-23-information-disclosure-regexp-cve-2024-27282.md %})

See the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_1_5) for further details.

## Download

{% assign release = site.data.releases | where: "version", "3.1.5" | first %}

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
