---
layout: news_post
title: "Ruby 2.5.9 Released"
author: "usa"
translator:
date: 2021-04-05 12:00:00 +0000
lang: vi
---

Ruby 2.5.9 has been released.

This release includes security fixes.
Please check the topics below for details.

* [CVE-2020-25613: Potential HTTP Request Smuggling Vulnerability in WEBrick]({%link en/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: XML round-trip vulnerability in REXML]({% link en/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

See the [commit logs](https://github.com/ruby/ruby/compare/v2_5_8...v2_5_9) for details.

After this release, Ruby 2.5 reaches EOL. In other words, this is the last release of Ruby 2.5 series.
We will not release Ruby 2.5.10 even if a security vulnerability is found.
We recommend all Ruby 2.5 users to upgrade to Ruby 3.0, 2.7 or 2.6 immediately.

## Download

{% assign release = site.data.releases | where: "version", "2.5.9" | first %}

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

Thanks to everyone who helped with this release, especially, to reporters of the vulnerability.
