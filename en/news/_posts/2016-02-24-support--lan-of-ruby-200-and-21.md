---
layout: news_post
title: "Support plans for Ruby 2.0.0 and Ruby 2.1"
author: "usa"
translator:
date: 2016-02-24 09:00:00 +0000
lang: en
---

We announce about the future support plans for Ruby 2.0.0 and Ruby 2.1.

## About Ruby 2.0.0

As it has been announced from before, all support for Ruby 2.0.0 has ended today.
Bug and security fixes from more recent Ruby versions will no longer be backported to 2.0.0, and no patch release of 2.0.0 will be released.

We highly recommend that you upgrade to Ruby 2.3 or 2.2 as soon as possible.

Please contact us via ruby-core ML if you'd like to continue maintaining the 2.0.0 branch for some justifiable reason you can't upgrade.

## About Ruby 2.1

We are planning to release Ruby 2.1.9 until the end of March.
After the release, we will end the normal maintenance phase of 2.1, and start the security maintenance phase of it.
This means that we will never backport any bug fixes to 2.1 except security fixes after the release of 2.1.9.

We recommend that you start planning to upgrate Ruby 2.3 or 2.2.

By the way, we are also planning to release Ruby 2.1.10 just after releacing 2.1.9.
This is not a bug fix release nor security fix release.
We have never experienced two-digits version number of Ruby.
Therefore, we consider that we have to test it instead of releacing such version with critical security fixes.
Ruby 2.1.10 will not include any changes from 2.1.9, instead of its version number.
Users does not have to use it on production, but should test it before the release of 2.1.11 which will include some security fixes.
