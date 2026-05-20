---
layout: news_post
title: "Ruby 4.0.5 Released"
author: k0kubun
translator:
date: 2026-05-20 00:12:20 +0000
lang: en
---

Ruby 4.0.5 has been released.

This release only contains a security fix for
[CVE-2026-46727: Use-after-free in pthread-based getaddrinfo timeout handler](/en/news/2026/05/20/getaddrinfo-cve-2026-46727/)
and a build system regression in Ruby 4.0.4 under C locale [[Bug #22065]](https://bugs.ruby-lang.org/issues/22065).

Please see the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v4.0.5) for further details.

## Release Schedule

We intend to release the latest stable Ruby version (currently Ruby 4.0) every two months following the most recent *regular* release. Ruby 4.0.6 will be released in July, 4.0.7 in September, and 4.0.8 in November.

If a change arises that significantly affects users, a release may occur earlier than planned, and the subsequent schedule may shift accordingly.

## Download

{% assign release = site.data.releases | where: "version", "4.0.5" | first %}

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
