---
layout: news_post
title: "Ruby 3.1.7 Released"
author: hsbt
translator:
date: 2025-03-26 04:44:27 +0000
lang: en
---

Ruby 3.1.7 has been released. This release includes [CVE-2025-27219, CVE-2025-27220 and CVE-2025-27221 fixes](https://www.ruby-lang.org/en/news/2025/02/26/security-advisories/) and update bundled REXML and RSS gems.

Please see the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_1_7) for further details.

This version is a final release of Ruby 3.1 series. We will not provide any further updates including security fixes for Ruby 3.1 series.

We recommend you to upgrade to Ruby 3.3 or 3.4 series.

## Download

{% assign release = site.data.releases | where: "version", "3.1.7" | first %}

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
