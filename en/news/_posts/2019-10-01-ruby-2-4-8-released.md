---
layout: news_post
title: "Ruby 2.4.8 Released"
author: "usa"
translator:
date: 2019-10-01 11:00:00 +0000
lang: en
---

Ruby 2.4.8 has been released.

This release includes security fixes.
Please check the topics below for details.

* [CVE-2019-16255: A code injection vulnerability of Shell#[] and Shell#test](/en/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md)
* [CVE-2019-16254: HTTP response splitting in WEBrick (Additional fix)"](/en/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md)
* [CVE-2019-15845: A NUL injection vulnerability of File.fnmatch and File.fnmatch?"](/en/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md)
* [CVE-2019-16201: Regular Expression Denial of Service vulnerability of WEBrick's Digest access authentication"](/en/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md)

Ruby 2.4 is now under the state of the security maintenance phase, until
the end of March of 2020.  After that date, maintenance of Ruby 2.4
will be ended. We recommend you start planning the migration to newer
versions of Ruby, such as 2.6 or 2.5.

## Download

{% assign release = site.data.releases | where: "version", "2.4.8" | first %}

* <{{ release.url.bz2 }}>

      SHA256: {{ release.sha256.bz2 }}

* <{{ release.url.gz }}>

      SHA256: {{ release.sha256.gz }}

* <{{ release.url.xz }}>

      SHA256: {{ release.sha256.xz }}

* <{{ release.url.zip }}>

      SHA256: {{ release.sha256.zip }}

## Release Comment

Thanks to everyone who helped with this release, especially, to reporters of the vulnerability.
