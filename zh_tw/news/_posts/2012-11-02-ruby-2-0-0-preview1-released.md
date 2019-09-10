---
layout: news_post
title: "Ruby 2.0.0-preview1 released"
author: "SJH"
date: 2012-11-02 02:58:21 +0000
lang: zh_tw
---

Subject: \[ruby-dev:46348\] \[ANN\] ruby 2.0.0-preview1 released From:
Yusuke Endoh &lt;mame tsg.ne.jp&gt; Date: Fri, 2 Nov 2012 09:17:39 +0900

Hello all --

We are pleased to announce the release of Ruby 2.0.0-preview1. Please
check out the new features in Ruby 2.0 before final release!

* https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-preview1.tar.bz2
  * SIZE: 10309440 bytes
  * MD5: 47a0f662f0e258aa1c5e429c310861b3
  * SHA256: 79e5605003bf6766fbd123ce00a0027df716ba6d28494c35185909f7e61a5bdf

* https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-preview1.tar.gz
  * SIZE: 12937316 bytes
  * MD5: c7d73f3ddb6d25e7733626ddbad04158
  * SHA256: 94b585560c05cb40fadd03e675bd3beb8271c2e976b45644cc765bf854cfd80c

* https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-preview1.zip
  * SIZE: 14470260 bytes
  * MD5: 4adb51aa69b56b81c81a8c5f892689cf
  * SHA256: c327f3d91ed7033790244d5b263d7b346f3d8efe808079f5a598507fad90ee6e

## The new features in 2.0.0

* Refinements
* Keyword arguments
* Enumerator#lazy
* Module#prepend
* Converting convention to Hash: #to\_h
* %i: a literal for symbol array
* regexp engine is changed to Onigmo
* DTrace support

... and more improvements. See NEWS for details.

Unfortunately, no introductory document is available yet. (If you
volunteer to write and provide, we may cite or refer to it in the next
release announcement.)

## The targets

All Ruby users, especially, the following people are strongly encouraged
to provide feedback on anything you notice.

* All developers who want to make your products \"2.0 ready\".
* Those who proposed 2.0 features.
* Ruby committers.

Some 2.0 features are not implemented yet. In particular, we are
planning to update Rubygems, Rdoc and Rake. DTrace support is NOT
included in preview1; will be in preview2.

* 6670: str.chars.last should be possible
* 3346: \_\_DIR\_\_ revisited
* 3731: Easier Embedding API for Ruby
* 1586: Including a module already present in ancestors should not be
  ignored
* 2294: \[PATCH\] ruby\_bind\_stack() to embed Ruby in coroutine
* 1952: cannot stop with Ctrl+C
* 2255: unicode parameters cannot be passed to ruby

If you know other features that are accepted but not implemented, let us
know.

The stdlib Syck was completely replaced with Psych, which requires
libyaml if you want to use YAML.

We have taken considerable care in source-level compatibility with 1.9.
We believe all \"normal\" programs will work without modification. So,
please give it a try, and report if your program does not work.

## The (rough) schedule

* in early December: 2.0.0-preview2
* around Christmas time: code freeze
* at/after New Year: 2.0.0-rc1
* in early February: 2.0.0-rc2
* 24 February: 2.0.0-p0

## special thanks

I appreciate all who helped me (a lazy release manager). In particular,
ko1 coordinated a lot, naruse covered almost all release jobs in place
of me, and unak and Aaron Patterson reviewed the draft of this
announcement. Thank you all!

Yusuke Endoh &lt;mame / tsg.ne.jp&gt;
