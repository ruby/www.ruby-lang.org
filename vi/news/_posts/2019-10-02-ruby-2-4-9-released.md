---
layout: news_post
title: "Ruby 2.4.9 Released"
author: "usa"
translator:
date: 2019-10-02 09:00:00 +0000
lang: vi
---

Ruby 2.4.9 has been released.

This release is a re-package of 2.4.8 because the previous Ruby 2.4.8
release tarball does not install.
(See [[Bug #16197]](https://bugs.ruby-lang.org/issues/16197) in detail.)
There are no essential change except their version numbers between 2.4.8 and 2.4.9.

Ruby 2.4 is now under the state of the security maintenance phase, until
the end of March of 2020.  After that date, maintenance of Ruby 2.4
will be ended. We recommend you start planning the migration to newer
versions of Ruby, such as 2.6 or 2.5.

## Download

{% assign release = site.data.releases | where: "version", "2.4.9" | first %}

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

Thanks to everyone who helped with this release.
