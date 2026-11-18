---
layout: news_post
title: "Security advisories: multiple vulnerabilities in Regexp and String case conversion"
author: "mame"
translator:
date: 2026-11-18 22:00:00 +0000
tags: security
lang: en
---

Seven vulnerabilities have been discovered in Ruby's regular expression engine and in the case conversion of strings. We are aware of PoCs that prove some of them can be used to trigger remote code execution. We have released Ruby 4.0.10, 3.4.13 and 3.3.14 to fix them. We strongly recommend upgrading.

CVE identifiers have been requested for these vulnerabilities but have not been assigned yet, so this advisory refers to them by their GitHub Security Advisory (GHSA) identifiers.

## [GHSA-34m4-m9fh-gqp5](https://github.com/ruby/ruby/security/advisories/GHSA-34m4-m9fh-gqp5): Heap buffer overflow in case conversion of strings

Ruby has a one-byte heap-based buffer overflow in the case conversion of strings. Changing the case of a crafted string may allow remote code execution. We are aware of PoCs that prove this flaw can be used to trigger RCE in some scenarios.

## [GHSA-7x2q-68qv-6p8x](https://github.com/ruby/ruby/security/advisories/GHSA-7x2q-68qv-6p8x): Double free in regular expression compilation

Ruby has a double free in its regular expression engine. Compiling a crafted regular expression pattern may allow remote code execution in applications that compile attacker-controlled patterns. We are aware of PoCs that prove this flaw can be used to trigger RCE in some scenarios.

## [GHSA-87fm-7w84-j2px](https://github.com/ruby/ruby/security/advisories/GHSA-87fm-7w84-j2px): Integer overflow in case conversion of strings

Ruby has an integer overflow in the case conversion of strings, which causes a heap-based buffer overflow. Changing the case of a crafted string may allow remote code execution. We are aware of PoCs that prove this flaw can be used to trigger RCE in some scenarios.

## [GHSA-wpqw-5qxg-m68r](https://github.com/ruby/ruby/security/advisories/GHSA-wpqw-5qxg-m68r): Out-of-bounds read in case-insensitive regular expression matching

Ruby has an out-of-bounds read in its regular expression engine. Matching against a crafted regular expression pattern may allow remote code execution in applications that use attacker-controlled patterns. We are aware of PoCs that prove this flaw can lead to memory corruption in an attacker-controlled way.

## [GHSA-3p8q-wmhx-vm2w](https://github.com/ruby/ruby/security/advisories/GHSA-3p8q-wmhx-vm2w): Heap buffer overflow in regular expression compilation

Ruby has an integer overflow in its regular expression engine, which causes a heap-based buffer overflow. Compiling a crafted regular expression pattern may allow remote code execution in applications that compile attacker-controlled patterns. We are aware of PoCs that prove this flaw can be used to trigger RCE in some scenarios.

## [GHSA-7whj-cfh7-xgm4](https://github.com/ruby/ruby/security/advisories/GHSA-7whj-cfh7-xgm4): Heap buffer overflow in Regexp#to_s

Ruby has a heap-based buffer overflow in `Regexp#to_s`. Converting a crafted regular expression to a string may allow information disclosure or remote code execution in applications that compile attacker-controlled patterns. We are aware of PoCs that prove this flaw can be used to trigger RCE in some scenarios.

## [GHSA-pvgc-g7gj-pv6h](https://github.com/ruby/ruby/security/advisories/GHSA-pvgc-g7gj-pv6h): Out-of-bounds read in case-insensitive backreference matching

Ruby has an out-of-bounds read in its regular expression engine. Matching a crafted string may disclose memory contents or crash the process.

## Affected versions

* Ruby 3.3.13 and earlier
* Ruby 3.4.0 through 3.4.12
* Ruby 4.0.0 through 4.0.9

## Recommended action

We strongly recommend upgrading to Ruby 4.0.10, 3.4.13 or 3.3.14.

Ruby 3.3 is in the security maintenance phase. Ruby 3.2 and earlier have reached their end of life and will not receive these fixes.

## Credits

* GHSA-34m4-m9fh-gqp5: Stephan Lipp (Ada Logics) and Anthropic
* GHSA-7x2q-68qv-6p8x: Stephan Lipp (Ada Logics) and Anthropic
* GHSA-87fm-7w84-j2px: [baba__yaga](https://hackerone.com/baba__yaga)
* GHSA-wpqw-5qxg-m68r: Stephan Lipp (Ada Logics) and Anthropic
* GHSA-3p8q-wmhx-vm2w: [aphantom](https://hackerone.com/aphantom)
* GHSA-7whj-cfh7-xgm4: Stephan Lipp (Ada Logics) and Anthropic
* GHSA-pvgc-g7gj-pv6h: Hiroya Fujinami and Hiroshi SHIBATA

## History

* Originally published at 2026-11-19 00:00:00 (UTC)
