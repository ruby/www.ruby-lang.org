---
layout: news_post
title: "Support plans for Ruby 2.0.0 and Ruby 2.1"
author: "usa"
translator:
date: 2016-02-24 09:00:00 +0000
lang: vi
---

We announce the future support plans for Ruby 2.0.0 and Ruby 2.1.

## About Ruby 2.0.0

As it has been announced before, all support for Ruby 2.0.0 has ended today.
Bug and security fixes from more recent Ruby versions will no longer be
backported to 2.0.0, and no further patch release of 2.0.0 will be released.

We highly recommend that you upgrade to Ruby 2.3 or 2.2 as soon as possible.

Please contact us via the ruby-core ML if you'd like to continue maintaining
the 2.0.0 branch as for some justifiable reason you can't upgrade.

## About Ruby 2.1

We are planning to release Ruby 2.1.9 by the end of March.
After the release, we will end the normal maintenance phase of 2.1,
and start the security maintenance phase of it.
This means that after the release of 2.1.9 we will never backport
any bug fixes to 2.1 except security fixes.

We recommend that you start planning to upgrade to Ruby 2.3 or 2.2.

By the way, we are also planning to release Ruby 2.1.10 just after
releasing 2.1.9. This is not a bug fix release nor a security fix release.
We have never experienced a two-digit version number of Ruby.
Therefore, we consider it important to test such a release
without any critical security fixes.

Ruby 2.1.10 will not include any changes from 2.1.9,
except for its version number.
You do not have to use it on production, but you should test it before
the release of 2.1.11 which will probably include security fixes.
