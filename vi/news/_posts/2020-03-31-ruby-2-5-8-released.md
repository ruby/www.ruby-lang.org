---
layout: news_post
title: "Ruby 2.5.8 Released"
author: "usa"
translator:
date: 2020-03-31 12:00:00 +0000
lang: vi
---

Ruby 2.5.8 has been released.

This release includes security fixes.
Please check the topics below for details.

* [CVE-2020-10663: Unsafe Object Creation Vulnerability in JSON (Additional fix)]({% link en/news/_posts/2020-03-19-json-dos-cve-2020-10663.md %})
* [CVE-2020-10933: Heap exposure vulnerability in the socket library]({% link en/news/_posts/2020-03-31-heap-exposure-in-socket-cve-2020-10933.md %})

See the [commit logs](https://github.com/ruby/ruby/compare/v2_5_7...v2_5_8) for details.

## Download

{% assign release = site.data.releases | where: "version", "2.5.8" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

Thanks to everyone who helped with this release, especially, to reporters of the vulnerability.
