---
layout: news_post
title: "Ruby 3.4.2 Released"
author:
translator:
date: 2025-02-14 21:55:17 +0000
lang: en
---

Ruby 3.4.2 has been released.

Please see the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_4_2) for further details.

## Download

{% assign release = site.data.releases | where: "version", "3.4.2" | first %}

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
