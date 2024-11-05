---
layout: news_post
title: "Ruby 3.3.6 Released"
author: k0kubun
translator:
date: 2024-11-05 04:25:00 +0000
lang: en
---

Ruby 3.3.6 has been released.

This is a routine update that includes minor bug fixes.
It also stops warning missing default gem dependencies that will be bundled gems in Ruby 3.5.
For more details, please refer to the [GitHub release notes](https://github.com/ruby/ruby/releases/tag/v3_3_6).

## Download

{% assign release = site.data.releases | where: "version", "3.3.6" | first %}

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
