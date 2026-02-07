---
layout: news_post
title: "Ruby 2.6.5 Released"
author: "nagachika"
translator:
date: 2019-10-01 11:00:00 +0000
lang: vi
---

Ruby 2.6.5 has been released.

This release includes security fixes.
Please check the topics below for details.

* [CVE-2019-16255: A code injection vulnerability of Shell#[] and Shell#test]({% link en/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254: HTTP response splitting in WEBrick (Additional fix)]({% link en/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845: A NUL injection vulnerability of File.fnmatch and File.fnmatch?]({% link en/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201: Regular Expression Denial of Service vulnerability of WEBrick's Digest access authentication]({% link en/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

See the [commit logs](https://github.com/ruby/ruby/compare/v2_6_4...v2_6_5) for changes in detail.

## Download

{% assign release = site.data.releases | where: "version", "2.6.5" | first %}

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
