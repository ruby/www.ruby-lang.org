---
layout: news_post
title: "Multiple vulnerabilities in RubyGems"
author: "usa"
translator:
date: 2017-08-29 12:00:00 +0000
tags: security
lang: en
---

There are multiple vulnerabilites in RubyGems bundled by Ruby.
It is [reported at the official blog of RubyGems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## Details

The following vulnerabilites have been reported.

* a DNS request hijacking vulnerability
* an ANSI escape sequence vulnerability
* a DOS vulernerability in the query command
* a vulnerability in the gem installer that allowed a malicious gem to overwrite arbitrary files

It is strongly recommended for Ruby users to take one of the following workarounds as soon as possible.

## Affected Versions

* Ruby 2.2.7 and all versions of Ruby 2.2 prior to it
* Ruby 2.3.4 and all versions of Ruby 2.3 prior to it
* Ruby 2.4.1 and all versions of Ruby 2.4 prior to it
* prior to trunk revision 59672

## Workarounds

At this time, the fixed versions of Ruby have not been released yet.
But you can upgrade RubyGems to latest version (2.6.13 or later), then the vulnerabilites will be fixed.

```
gem update --system
```

If you can not upgrade RubyGems, the following patches can be applied as workarounds.

* [for Ruby 2.2.7](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [for Ruby 2.3.4](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* [for Ruby 2.4.1](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)

## Credits

This report is based on [the official blog of RubyGems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## History

* Originally published at 2017-08-29 12:00:00 UTC
