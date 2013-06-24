---
layout: news_post
title: "Ruby 2.0.0-pXXX is released"
author: "nagachika"
translator:
date: 2013-06-25 11:00:00 UTC
lang: en
---

Now Ruby 2.0.0-pXXX is released.

This release includes a security fix about bundled OpenSSL.

* [Hostname check bypassing vulnerability in SSL client (CVE-2013-4073)](/en/news/2013/06/25/hostname-check-bypassing-vulnerability-in-openssl-client-cve-2013-4073/)

And some bugfixes are also included.

## Download

You can download this release from:

* [ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-pXXX.tar.bz2](ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-pXXX.tar.bz2)

      SIZE:   ######## bytes
      MD5:    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
      SHA256: SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS

* [ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-pXXX.tar.gz](ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-pXXX.tar.gz)

      SIZE:   ######## bytes
      MD5:    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
      SHA256: SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS

* [ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-pXXX.zip](ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-pXXX.zip)

      SIZE:   ######## bytes
      MD5:    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
      SHA256: SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS

## Changes

Major fixes are listed below.

See [tickets](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&amp;status_id=5) and [ChangeLog](http://svn.ruby-lang.org/repos/ruby/tags/v2_0_0_XXX/ChangeLog) for details.

### keyword arguments

* [#8040](https://bugs.ruby-lang.org/issues/8040) change pirority between keyword arguments and mandatory arguments.
* [#8416](https://bugs.ruby-lang.org/issues/8416) super does not forward either named or anonymous **
* [#8463](https://bugs.ruby-lang.org/issues/8463) Proc auto-splat bug with named arguments

### VM/Language Processing

* [#8424](https://bugs.ruby-lang.org/issues/8424) fix infinite loop when stack overflow with TH_PUSH_TAG()
* [#8436](https://bugs.ruby-lang.org/issues/8436) \__dir__ not working in eval with binding
* [#8489](https://bugs.ruby-lang.org/issues/8489) Tracepoint API: B_RETURN_EVENT not triggered when "next" used
* [#8341](https://bugs.ruby-lang.org/issues/8341) block_given? (and the actual block) persist between calls to a proc created from a method (using method().to_proc()).
* [#8531](https://bugs.ruby-lang.org/issues/8531) block_given? (and the actual block) persist between calls to a proc created by Symbol#to_proc.

### RubyGems

Bundled RubyGems version is updated to 2.0.3

### Encoding

* [#8516](https://bugs.ruby-lang.org/issues/8516) IO#readchar returns wrong codepoints when converting encoding

### Windows

* [#8431](https://bugs.ruby-lang.org/issues/8431) File.read() crash on Win32SP3 32bit

### Libraries

* [#8467](https://bugs.ruby-lang.org/issues/8467) Rewinding and iterating through gzipped IO leads to segmentation fault
* [#8415](https://bugs.ruby-lang.org/issues/8415) Net::IMAP#capability_response raises "Net::IMAP::ResponseParseError: unexpected token CRLF" for common CAPABILITY

## Release Comment

Many committers, testers and users who gave bug reports helped me to
make this release. Thanks for their contributions.
