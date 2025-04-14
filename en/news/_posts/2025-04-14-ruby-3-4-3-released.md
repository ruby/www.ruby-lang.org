---
layout: news_post
title: "Ruby 3.4.3 Released"
author: k0kubun
translator:
date: 2025-04-14 08:06:57 +0000
lang: en
---

Ruby 3.4.3 has been released.

Please see the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_4_3) for further details.
[release notes on GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_3) for further details.

## Release Schedule

We intend to release the latest stable Ruby version (currently Ruby 3.4) every 2 months.
Ruby 3.4.4 will be released in June, 3.4.5 in August, 3.4.6 in October, and 3.4.7 in December.

If there's any change that affects a considerable amount of people, those versions may be released earlier than expected.

## Download

{% assign release = site.data.releases | where: "version", "3.4.3" | first %}

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
