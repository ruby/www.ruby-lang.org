---
layout: news_post
title: "Ruby 3.1.3 Released"
author: "nagachika"
translator:
date: 2022-11-24 12:00:00 +0000
lang: vi
---

Ruby 3.1.3 has been released.

This release includes a security fix.
Please check the topics below for details.

* [CVE-2021-33621: HTTP response splitting in CGI]({%link en/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

This release also includes a fix for build failure with Xcode 14 and macOS 13 (Ventura).
See [the related ticket](https://bugs.ruby-lang.org/issues/18912) for more details.

See the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_1_3) for further details.

## Download

{% assign release = site.data.releases | where: "version", "3.1.3" | first %}

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
