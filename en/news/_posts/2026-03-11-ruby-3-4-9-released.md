---
layout: news_post
title: "Ruby 3.4.9 Released"
author: nagachika
translator:
date: 2026-03-11 11:00:00 +0000
lang: en
---

Ruby 3.4.9 has been released.

This release includes [an update to the zlib gem addressing CVE-2026-27820](https://www.ruby-lang.org/en/news/2026/03/05/buffer-overflow-zlib-cve-2026-27820/),
along with other bug fixes.
Please see the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_4_9) for further details.

We recommend updating your version of the zlib gem. This release has been made for the convenience of those who wish to continue using it as a default gem.


## Download

{% assign release = site.data.releases | where: "version", "3.4.9" | first %}

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
