---
layout: news_post
title: "Ruby 3.0.5 Released"
author: "usa"
translator:
date: 2022-11-24 12:00:00 +0000
lang: en
---

Ruby 3.0.5 has been released.

This release includes a security fix.
Please check the topics below for details.

* [CVE-2021-33621: HTTP response splitting in CGI]({%link en/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

This release also includes some bug fixes.
See the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_0_5) for further details.

## Download

{% assign release = site.data.releases | where: "version", "3.0.5" | first %}

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
