---
layout: news_post
title: "Ruby 3.2.9 Released"
author: "hsbt"
translator:
date: 2025-07-24 08:51:53 +0000
lang: en
---

Ruby 3.2.9 has been released.

This release includes the following security fixes:

* [CVE-2025-24294: Possible Denial of Service in resolv gem](https://www.ruby-lang.org/en/news/2025/07/08/dos-resolv-cve-2025-24294/)
* [CVE-2025-43857: DoS vulnerability in net-imap](https://www.ruby-lang.org/en/news/2025/04/28/dos-net-imap-cve-2025-43857/)

and the following fixes for build issues:

* GCC 15.1
* Visual Studio 2022 Version 17.14

Please see the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_2_9) for further details.

## Download

{% assign release = site.data.releases | where: "version", "3.2.9" | first %}

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
