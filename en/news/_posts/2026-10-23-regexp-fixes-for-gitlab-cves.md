---
layout: news_post
title: "Regexp compilation fixes related to GitLab's CVE-2026-89078, CVE-2026-93577, CVE-2026-97229 and CVE-2026-110264"
author: "k0kubun"
translator:
date: 2026-10-23 03:11:22 +0000
tags: security
lang: en
---

We have released Ruby 4.0.9, 3.4.12 and 3.3.13. They fix several bugs in Ruby's regular expression engine (Onigmo) that GitLab found could be used for remote code execution on GitLab servers. GitLab published four CVEs for these issues, and the Ruby releases contain the fixes for the underlying bugs in Ruby.

## Background

GitLab compiles regular expressions supplied by its users, such as patterns in CI configuration, with `Regexp.new`. GitLab found that specially crafted patterns could corrupt memory while Ruby compiles them, and that this could be turned into remote code execution on GitLab servers. GitLab addressed these issues in its own releases by patching the Ruby it ships, and assigned the following CVE identifiers:

* [CVE-2026-89078](https://www.cve.org/CVERecord?id=CVE-2026-89078): Double Free issue in Regular Expression Parser ([GitLab 19.4.1](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-1-released/))
* [CVE-2026-93577](https://www.cve.org/CVERecord?id=CVE-2026-93577): Integer Overflow issue in Regular Expression Compiler ([GitLab 19.4.1](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-1-released/))
* [CVE-2026-97229](https://www.cve.org/CVERecord?id=CVE-2026-97229): Integer Overflow issue in CI/CD Regular Expression Compiler ([GitLab 19.4.2](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-2-released/))
* [CVE-2026-110264](https://www.cve.org/CVERecord?id=CVE-2026-110264): Integer Overflow issue in Regular Expression Compiler ([GitLab 19.5.1](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-5-1-released/))

## Fixes in Ruby

The following table shows the change in Ruby that fixes the bug behind each CVE, and the first release of each series that contains it.

| CVE | Bug in Ruby | Change | Ruby advisory | Ruby 4.0 | Ruby 3.4 | Ruby 3.3 |
|---|---|---|---|---|---|---|
| CVE-2026-89078 | Double free when parsing a pattern fails after an alternation | [#13332](https://github.com/ruby/ruby/pull/13332) | [GHSA-gfj3-8wj9-qx8p](https://github.com/ruby/ruby/security/advisories/GHSA-gfj3-8wj9-qx8p) | 4.0.0 | 3.4.12 | 3.3.13 |
| CVE-2026-93577, CVE-2026-97229 | Integer overflow in the size of a compiled pattern | [#19020](https://github.com/ruby/ruby/pull/19020) | [GHSA-22mf-ggw7-pxfx](https://github.com/ruby/ruby/security/advisories/GHSA-22mf-ggw7-pxfx) | 4.0.8 | 3.4.12 | 3.3.13 |
| CVE-2026-110264 | Overflow of internal IDs in a pattern with many repeats | [#16801](https://github.com/ruby/ruby/pull/16801) | [GHSA-qm4g-8pfh-6996](https://github.com/ruby/ruby/security/advisories/GHSA-qm4g-8pfh-6996) | 4.0.9 | 3.4.12 | 3.3.13 |

Ruby 4.0.9, 3.4.12 and 3.3.13 contain all of these fixes.

## Who is affected

These bugs are reached only when an application compiles a regular expression from a string that an attacker controls, for example by passing it to `Regexp.new`, `Regexp.union` or `Regexp.compile`, or by interpolating it into a regexp literal such as `/#{input}/`. Applications that only use regular expressions written by their own developers are not affected.

`Regexp.timeout` does not protect against these bugs. Limiting the length of patterns does not reliably protect against them either, because some of them can be triggered by short patterns.

## Recommended action

We recommend upgrading to Ruby 4.0.9, 3.4.12 or 3.3.13 or later.

If you cannot upgrade, please avoid compiling regular expressions from untrusted input.

Ruby 3.3 is in the security maintenance phase, in which we normally release only fixes for vulnerabilities. Ruby 3.3.13 includes these fixes as an exception, because GitLab assigned CVEs to issues that rely on them.

## About CVE identifiers

Update (2026-11-20): The CVE identifiers of these vulnerabilities in Ruby are the ones GitLab assigned: CVE-2026-89078, CVE-2026-93577, CVE-2026-97229 and CVE-2026-110264. We requested separate identifiers for the Ruby advisories, but the CVE Program assigns a single identifier to a vulnerability in code that several products share, and GitLab is affected through the Ruby it ships. Please use these identifiers, together with the Ruby advisories listed in the table above, when you track these issues, for example in a security scanner. The CVE records currently list only GitLab as the affected product. We have asked GitLab, which maintains the records, to add Ruby to them.

Update (2026-11-17): We now treat these issues as vulnerabilities in Ruby. We have published a security advisory for each of them in the ruby/ruby repository, listed in the table above.

When we originally published this page, we had not requested CVE identifiers in Ruby for these fixes, for the following reason.

Ruby has generally considered it unsafe to compile and use a regular expression created from untrusted input. We stated this in the advisory for [CVE-2022-28738]({% link en/news/_posts/2022-04-12-double-free-in-regexp-compilation-cve-2022-28738.md %}), where we nevertheless treated a double free in Regexp compilation as a vulnerability after a comprehensive assessment. We did the same for [CVE-2024-27282]({% link en/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %}).

However, the [Regexp documentation](https://docs.ruby-lang.org/en/master/Regexp.html#class-Regexp-label-Timeouts) discussed untrusted patterns only in terms of denial of service, and recommended a timeout for them. It did not clearly say whether compiling an untrusted pattern is a use case that Ruby supports. We have since discussed this and decided that memory corruption reachable by compiling an untrusted pattern is a vulnerability in Ruby, which is why we have published the advisories above.

## Credits

Thanks to Johan Carlsson ([joaxcar](https://github.com/joaxcar)) for discovering the integer overflow fixed by [#19020](https://github.com/ruby/ruby/pull/19020) through GitLab's bug bounty program, and to GitLab for reporting these issues to us and coordinating the fixes.

## History

* Originally published at 2026-10-23 03:11:22 (UTC)
* Updated at 2026-11-17 04:28:40 (UTC): Added the Ruby security advisories and marked this page as a security announcement
* Updated at 2026-11-20 00:37:50 (UTC): Stated that the CVE identifiers assigned by GitLab are the identifiers of these vulnerabilities in Ruby
