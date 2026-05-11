---
layout: news_post
title: "Ruby 4.0.4 Released"
author: k0kubun
translator:
date: 2026-05-11 21:41:38 +0000
lang: en
---

Ruby 4.0.4 has been released.

This is a routine update that includes bugfixes.
Please see the [GitHub Releases](https://github.com/ruby/ruby/releases/tag/v4.0.4) for further details.

## Release Schedule

We intend to release the latest stable Ruby version (currently Ruby 4.0) every two months following the most recent *regular* release. Ruby 4.0.5 will be released in July, 4.0.6 in September, and 4.0.7 in November.

If a change arises that significantly affects users, a release may occur earlier than planned, and the subsequent schedule may shift accordingly.

## Download

{% assign release = site.data.releases | where: "version", "4.0.4" | first %}

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
