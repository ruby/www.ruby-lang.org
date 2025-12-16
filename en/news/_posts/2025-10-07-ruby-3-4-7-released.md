---
layout: news_post
title: "Ruby 3.4.7 Released"
author: k0kubun
translator:
date: 2025-10-07 17:14:11 +0000
lang: en
---

Ruby 3.4.7 has been released.

This release includes [an update to the uri gem addressing CVE-2025-61594](https://www.ruby-lang.org/en/news/2025/10/07/uri-cve-2025-61594/),
along with other bug fixes. Please refer to [the release notes on GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_7) for further details.

We recommend updating your version of the uri gem. This release has been made for the convenience of those who wish to continue using it as a default gem.

## Release Schedule

We intend to release the latest stable Ruby version (currently Ruby 3.4) every two months following the most recent release.
Ruby 3.4.8 is scheduled for December and 3.4.9 for February.

If a change arises that significantly affects users, a release may occur earlier than planned, and the subsequent schedule may shift accordingly.

## Download

{% assign release = site.data.releases | where: "version", "3.4.7" | first %}

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
