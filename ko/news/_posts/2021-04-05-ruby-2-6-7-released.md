---
layout: news_post
title: "Ruby 2.6.7 Released"
author: "usa"
translator:
date: 2021-04-05 12:00:00 +0000
lang: en
---

Ruby 2.6.7 has been released.

This release includes security fixes.
Please check the topics below for details.

* [CVE-2020-25613: Potential HTTP Request Smuggling Vulnerability in WEBrick]({%link en/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: XML round-trip vulnerability in REXML]({% link en/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

See the [commit logs](https://github.com/ruby/ruby/compare/v2_6_6...v2_6_7) for details.

By this release, we end the normal maintenance phase of Ruby 2.6,
and Ruby 2.6 enters the security maintenance phase.
This means that we will no longer backport any bug fixes to Ruby 2.6 except security fixes.
The term of the security maintenance phase is scheduled for a year.
Ruby 2.6 reaches EOL and its official support ends by the end of the security maintenance phase.
Therefore, we recommend that you start to plan upgrade to Ruby 2.7 or 3.0.

## Download

{% assign release = site.data.releases | where: "version", "2.6.7" | first %}

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

The maintenance of Ruby 2.6, including this release, is based on the "Agreement for the Ruby stable version" of the Ruby Association.
