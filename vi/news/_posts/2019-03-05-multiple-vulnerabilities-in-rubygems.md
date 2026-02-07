---
layout: news_post
title: "Multiple vulnerabilities in RubyGems"
author: "hsbt"
translator:
date: 2019-03-05 00:00:00 +0000
tags: security
lang: vi
---

There are multiple vulnerabilities in RubyGems bundled with Ruby.
It is [reported at the official blog of RubyGems](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## Details

The following vulnerabilities have been reported.

* CVE-2019-8320: Delete directory using symlink when decompressing tar
* CVE-2019-8321: Escape sequence injection vulnerability in `verbose`
* CVE-2019-8322: Escape sequence injection vulnerability in `gem owner`
* CVE-2019-8323: Escape sequence injection vulnerability in API response handling
* CVE-2019-8324: Installing a malicious gem may lead to arbitrary code execution
* CVE-2019-8325: Escape sequence injection vulnerability in errors

It is strongly recommended for Ruby users to upgrade your Ruby installation or take one of the following workarounds as soon as possible.

## Affected Versions

* Ruby 2.3 series: all
* Ruby 2.4 series: 2.4.5 and earlier
* Ruby 2.5 series: 2.5.3 and earlier
* Ruby 2.6 series: 2.6.1 and earlier
* prior to trunk revision 67168

## Workarounds

In principle, you should upgrade your Ruby installation to the latest version.
RubyGems 3.0.3 or later includes the fix for the vulnerabilities, so upgrade RubyGems to the latest version if you can’t upgrade Ruby itself.

```
gem update --system
```

If you can't upgrade RubyGems, you can apply the following patches as a workaround.

* [for Ruby 2.4.5](https://bugs.ruby-lang.org/attachments/7669)
* [for Ruby 2.5.3](https://bugs.ruby-lang.org/attachments/7670)
* [for Ruby 2.6.1](https://bugs.ruby-lang.org/attachments/7671)

Regarding Ruby trunk, update to the latest revision.

## Credits

This report is based on [the official blog of RubyGems](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## History

* Originally published at 2019-03-05 00:00:00 UTC
* Link to updated patches at 2019-03-06 05:26:27 UTC
* Mention about upgrading Ruby itself at 2019-04-01 06:00:00 UTC
