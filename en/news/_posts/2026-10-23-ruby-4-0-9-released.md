---
layout: news_post
title: "Ruby 4.0.9 Released"
author: k0kubun
translator:
date: 2026-10-23 03:11:22 +0000
lang: en
---

Ruby 4.0.9 has been released.

This release includes a fix for a bug in Regexp compilation that GitLab's CVE-2026-110264 relies on.
Please see the topic below for details.

* [Regexp compilation fixes related to GitLab's CVE-2026-89078, CVE-2026-93577, CVE-2026-97229 and CVE-2026-110264]({% link en/news/_posts/2026-10-23-regexp-fixes-for-gitlab-cves.md %})

Please see the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v4.0.9) for further details.

## Download

{% assign release = site.data.releases | where: "version", "4.0.9" | first %}

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
