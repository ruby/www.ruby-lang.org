---
layout: news_post
title: "Ruby 2.7.6 Released"
author: "usa and mame"
translator:
date: 2022-04-12 12:00:00 +0000
lang: vi
---

Ruby 2.7.6 has been released.

This release includes a security fix.
Please check the topics below for details.

* [CVE-2022-28739: Buffer overrun in String-to-Float conversion]({%link en/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

This release also includes some bug fixes.
See the [commit logs](https://github.com/ruby/ruby/compare/v2_7_5...v2_7_6) for further details.

After this release, we end the normal maintenance phase of Ruby 2.7, and Ruby 2.7 enters the security maintenance phase.
This means that we will no longer backport any bug fixes to Ruby 2.7 except security fixes.

The term of the security maintenance phase is scheduled for a year.
Ruby 2.7 reaches EOL and its official support ends by the end of the security maintenance phase.
Therefore, we recommend that you start to plan upgrade to Ruby 3.0 or 3.1.

## Download

{% assign release = site.data.releases | where: "version", "2.7.6" | first %}

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

Many committers, developers, and users who provided bug reports helped us make this release.
Thanks for their contributions.

The maintenance of Ruby 2.7, including this release, is based on the "Agreement for the Ruby stable version" of the Ruby Association.
