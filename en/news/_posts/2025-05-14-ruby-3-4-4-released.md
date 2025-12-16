---
layout: news_post
title: "Ruby 3.4.4 Released"
author: k0kubun
translator:
date: 2025-05-14 18:20:00 +0000
lang: en
---

Ruby 3.4.4 has been released.

This release includes a fix for a YJIT bug related to local variables and addresses a build issue on Windows when using GCC 15.
It was released ahead of schedule to make these fixes available as soon as possible.
A few other bug fixes are also included.

Please see the [release notes on GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_4) for further details.

## Release Schedule

We intend to release the latest stable Ruby version (currently Ruby 3.4) every two months following the most recent release.
Following this release (3.4.4), Ruby 3.4.5 is scheduled for July, 3.4.6 for September, 3.4.7 for November, and 3.4.8 for January.

If a change arises that significantly affects users, a release may occur earlier than planned, and the subsequent schedule may shift accordingly.

## Download

{% assign release = site.data.releases | where: "version", "3.4.4" | first %}

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
