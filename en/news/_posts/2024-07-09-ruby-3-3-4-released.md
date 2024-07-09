---
layout: news_post
title: "Ruby 3.3.4 Released"
author: "k0kubun"
translator:
date: 2024-07-09 00:30:00 +0000
lang: en
---

Ruby 3.3.4 has been released.

This release fixes a regression in Ruby 3.3.3 that dependencies are missing in the gemspec
of some bundled gems: `net-pop`, `net-ftp`, `net-imap`, and `prime`
[[Bug #20581]](https://bugs.ruby-lang.org/issues/20581).
The fix allows Bundler to successfully install those gems on platforms like Heroku.
If your `bundle install` runs correctly now, you may not have this issue.

Other changes are mostly minor bug fixes.
Please see the [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_3_4) for further details.

## Release Schedule

Going forward, we intend to release the latest stable Ruby version (currently Ruby 3.3) every 2 months after a `.1` release.
For Ruby 3.3, 3.3.5 is supposed to be released on Sep 3rd, 3.3.6 on Nov 5th, and 3.3.7 on Jan 7th.

If there's any change that affects a considerable amount of people, e.g. Ruby 3.3.3 users on Heroku for this release,
we may release a new version earlier than expected.

## Download

{% assign release = site.data.releases | where: "version", "3.3.4" | first %}

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
