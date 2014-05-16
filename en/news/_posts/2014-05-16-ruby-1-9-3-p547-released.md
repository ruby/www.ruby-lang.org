---
layout: news_post
title: "Ruby 1.9.3-p547 is released"
author: "usa"
translator:
date: 2014-05-16 14:59:59 +0000
lang: en
---

Now Ruby 1.9.3-p547 is released.

Ruby 1.9.3 is now in the security maintenance phase.
This means that we release Ruby 1.9.3 only when a security incident occurs.
However, there is one exception.
As stated previously, we release it if a critical regression is found.

Some users reported that they are in trouble in environments, such as Ubuntu 10.04 LTS, that use the old openssl.
This is a regression introduced at Ruby 1.9.3-p545.
(Ruby 2.1.1 and Ruby 2.0.0-p451 also have same problem, and already fixed at Ruby 2.1.2 and Ruby 2.0.0-p481.)
So, we decide to release this fix.
Only if you are in such a trouble, you should upgrade.

This release includes only two changes:

* a fix for old OpenSSL (show above)
* a trivial change of common.mk for our release management (does not affect users)

## Download

* [http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p547.tar.bz2](http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p547.tar.bz2)

      SIZE:   10036828 bytes
      MD5:    5363d399be7f827c77bf8ae5d1a69b38
      SHA256: ef588ed3ff53009b4c1833c83187ae252dd6c20db45e21a326cd4a16a102ef4c

* [http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p547.tar.gz](http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p547.tar.gz)

      SIZE:   12582375 bytes
      MD5:    7531f9b1b35b16f3eb3d7bea786babfd
      SHA256: 9ba118e4aba04c430bc4d5efb09b31a0277e101c9fd2ef3b80b9c684d7ae57a1

* [http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.zip](http://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p481.zip)

      SIZE:   13970935 bytes
      MD5:    40ce2040860b18a330efe70b5ef072ba
      SHA256: 89c7639c75dd58af7ac77d01a6d035992f8c39de90fc5cbfcf6e8b54a6305900

## Release Comment

Thank you for reports.
