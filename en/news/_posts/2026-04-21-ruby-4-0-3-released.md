---
layout: news_post
title: "Ruby 4.0.3 Released"
author: k0kubun
translator:
date: 2026-04-21 08:45:44 +0000
lang: en
---

Ruby 4.0.3 has been released.

This release only contains ERB 6.0.1.1, which fixes [CVE-2026-41316](https://www.ruby-lang.org/en/news/2026/04/21/erb-cve-2026-41316/).

If your application calls Marshal.load on untrusted data AND has both erb and activesupport loaded, please update your ERB to one of those versions. You can use this Ruby 4.0.3 release to do so.

## Release Schedule

We intend to release the latest stable Ruby version (currently Ruby 4.0) every two months following the most recent *regular* release. Ruby 4.0.4 will be released in May, 4.0.5 in July, 4.0.6 in September, and 4.0.7 in November.

If a change arises that significantly affects users, a release may occur earlier than planned, and the subsequent schedule may shift accordingly.

## Download

{% assign release = site.data.releases | where: "version", "4.0.3" | first %}

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
