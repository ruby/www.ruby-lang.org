---
layout: news_post
title: "Ruby 3.0.6 Released"
author: "usa"
translator:
date: 2023-03-30 12:00:00 +0000
lang: en
---

Ruby 3.0.6 has been released.

This release includes security fixes.
Please check the topics below for details.

* [CVE-2023-28755: ReDoS vulnerability in URI]({%link en/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28755: ReDoS vulnerability in Time]({%link en/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

This release also includes some bug fixes.
See the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_0_6) for further details.

## Download

{% assign release = site.data.releases | where: "version", "3.0.6" | first %}

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

The maintenance of Ruby 3.0, including this release, is based on the "Agreement for the Ruby stable version" of the Ruby Association.
