---
layout: news_post
title: "Ruby 3.0.2 Released"
author: "nagachika"
translator:
date: 2021-07-07 09:00:00 +0000
lang: vi
---

Ruby 3.0.2 has been released.

This release includes security fixes.
Please check the topics below for details.

* [CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP]({%link en/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP]({%link en/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: A command injection vulnerability in RDoc]({%link en/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

See the [commit logs](https://github.com/ruby/ruby/compare/v3_0_1...v3_0_2) for details.

## Download

{% assign release = site.data.releases | where: "version", "3.0.2" | first %}

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
