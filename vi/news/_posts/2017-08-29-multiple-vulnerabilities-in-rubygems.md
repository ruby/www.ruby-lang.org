---
layout: news_post
title: "Multiple vulnerabilities in RubyGems"
author: "usa"
translator:
date: 2017-08-29 12:00:00 +0000
tags: security
lang: vi
---

There are multiple vulnerabilities in RubyGems bundled by Ruby.
It is [reported at the official blog of RubyGems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## Details

The following vulnerabilities have been reported.

* a DNS request hijacking vulnerability. (CVE-2017-0902)
* an ANSI escape sequence vulnerability. (CVE-2017-0899)
* a DoS vulnerability in the query command. (CVE-2017-0900)
* a vulnerability in the gem installer that allowed a malicious gem to overwrite arbitrary files. (CVE-2017-0901)

It is strongly recommended for Ruby users to upgrade or take one of the following workarounds as soon as possible.

## Affected Versions

* Ruby 2.2 series: 2.2.7 and earlier
* Ruby 2.3 series: 2.3.4 and earlier
* Ruby 2.4 series: 2.4.1 and earlier
* prior to trunk revision 59672

## Workarounds

If you can't upgrade Ruby itself, upgrade RubyGems to the latest version.
RubyGems 2.6.13 or later includes the fix for the vulnerabilities.

```
gem update --system
```

If you can't upgrade RubyGems, you can apply the following patches as a workaround.

* [for Ruby 2.2.7](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [for Ruby 2.3.4](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* for Ruby 2.4.1: need 2 patches.  Apply sequentially as follows:
  1. [RubyGems 2.6.11 to 2.6.12](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
  2. [RubyGems 2.6.12 to 2.6.13](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

About the trunk, update to the latest revision.

## Credits

This report is based on [the official blog of RubyGems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## History

* Originally published at 2017-08-29 12:00:00 UTC
* Added CVE numbers at 2017-08-31 2:00:00 UTC
* Mention about upgrading Rubies at 2017-09-15 12:00:00 UTC
