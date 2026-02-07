---
layout: news_post
title: "Multiple vulnerabilities in RubyGems"
author: "usa"
translator:
date: 2018-02-17 03:00:00 +0000
tags: security
lang: vi
---

There are multiple vulnerabilities in RubyGems bundled by Ruby.
It is [reported at the official blog of RubyGems](http://blog.rubygems.org/2018/02/15/2.7.6-released.html).

## Details

The following vulnerabilities have been reported.

* Prevent path traversal when writing to a symlinked basedir outside of the root.
* Fix possible Unsafe Object Deserialization Vulnerability in gem owner.
* Strictly interpret octal fields in tar headers.
* Raise a security error when there are duplicate files in a package.
* Enforce URL validation on spec homepage attribute.
* Mitigate XSS vulnerability in homepage attribute when displayed via gem server.
* Prevent Path Traversal issue during gem installation.

It is strongly recommended for Ruby users to upgrade your Ruby installation or take one of the following workarounds as soon as possible.

## Affected Versions

* Ruby 2.2 series: 2.2.9 and earlier
* Ruby 2.3 series: 2.3.6 and earlier
* Ruby 2.4 series: 2.4.3 and earlier
* Ruby 2.5 series: 2.5.0 and earlier
* prior to trunk revision 62422

## Workarounds

In principle, you should upgrade your Ruby installation to the latest version.
RubyGems 2.7.6 or later includes the fix for the vulnerabilities, so upgrade RubyGems to the latest version if you can't upgrade Ruby itself.

```
gem update --system
```

If you can't upgrade RubyGems, you can apply the following patches as a workaround.

* [for Ruby 2.2.9](https://bugs.ruby-lang.org/attachments/download/7030/rubygems-276-for-ruby22.patch)
* [for Ruby 2.3.6](https://bugs.ruby-lang.org/attachments/download/7029/rubygems-276-for-ruby23.patch)
* [for Ruby 2.4.3](https://bugs.ruby-lang.org/attachments/download/7028/rubygems-276-for-ruby24.patch)
* [for Ruby 2.5.0](https://bugs.ruby-lang.org/attachments/download/7027/rubygems-276-for-ruby25.patch)

About the trunk, update to the latest revision.

## Credits

This report is based on [the official blog of RubyGems](http://blog.rubygems.org/2018/02/15/2.7.6-released.html).

## History

* Originally published at 2018-02-17 03:00:00 UTC
* Mention about upgrading Rubies at 2018-03-29 01:00:00 UTC
