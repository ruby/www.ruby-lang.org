---
layout: news_post
title: "Heap overflow in String (CVE-2009-4124)"
author: "Yugui"
lang: vi
---

There is a heap overflow vulnerability in `String#ljust`,
`String#center` and `String#rjust`. This has allowed an attacker to run
arbitrary code in some rare cases.

* [CVE-2009-4124][1]

## Vulnerable versions

* All releases of Ruby 1.9.1.

This vulnerability does not affect Ruby 1.8 series.

## Solution

Please upgrade to Ruby 1.9.1-p376.

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2&gt;][2]

## Credit

Credit to Emmanouel Kellinis, KPMG London for disclosing the problem to
Ruby Security team.

## Changes

* 2009-12-07 14:52 +0900 add link to CVE (but not opened yet when
  writing this page)



[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-4124
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2
