---
layout: news_post
title: "Ruby 2.7.5 Released"
author: "usa"
translator:
date: 2021-11-24 12:00:00 +0000
lang: en
---

Ruby 2.7.5 has been released.

This release includes security fixes.
Please check the topics below for details.

* [CVE-2021-41817: Regular Expression Denial of Service Vulnerability of Date Parsing Methods]({%link en/news/_posts/2021-11-15-date-parsing-method-regexp-dos-cve-2021-41817.md %})
* [CVE-2021-41816: Buffer Overrun in CGI.escape_html]({%link en/news/_posts/2021-11-24-buffer-overrun-in-cgi-escape_html-cve-2021-41816.md %})
* [CVE-2021-41819: Cookie Prefix Spoofing in CGI::Cookie.parse]({%link en/news/_posts/2021-11-24-cookie-prefix-spoofing-in-cgi-cookie-parse-cve-2021-41819.md %})

See the [commit logs](https://github.com/ruby/ruby/compare/v2_7_4...v2_7_5) for details.

## Download

{% assign release = site.data.releases | where: "version", "2.7.5" | first %}

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
