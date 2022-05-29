---
layout: news_post
title: "Ruby 2.6.8 Released"
author: "usa"
translator:
date: 2021-07-07 09:00:00 +0000
lang: en
---

Ruby 2.6.8 has been released.

This release includes security fixes.
Please check the topics below for details.

* [CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP]({%link en/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP]({%link en/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: A command injection vulnerability in RDoc]({%link en/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

We ordinally do not fix Ruby 2.6 except security fixes, but this release also includes some regressed bugs and build problem fixes.
See the [commit logs](https://github.com/ruby/ruby/compare/v2_6_7...v2_6_8) for details.

Ruby 2.6 is now under the state of the security maintenance phase, until the end of March of 2022.
After that date, maintenance of Ruby 2.6 will be ended.
We recommend you start planning the migration to newer versions of Ruby, such as 3.0 or 2.7.

## Download

{% assign release = site.data.releases | where: "version", "2.6.8" | first %}

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
