---
layout: news_post
title: "Security Maintenance Extension of Ruby 1.8.7 and 1.9.2"
author: "zzak"
translator:
date: 2013-12-17 20:49:03 +0000
lang: vi
---

Effective immediately, 1.8.7 and 1.9.2 will be supported for security patches
until June 2014.

* Terence Lee ([@hone02](https://twitter.com/hone02))
  and Zachary Scott ([@_zzak](https://twitter.com/_zzak))
  will assume maintainership.
* After the 6 month maintenance period, we can add more committers to extend
  another 6 months.

This maintenance extension is made possible by [Heroku][heroku],
see their blog post [A Patch in Time: Securing Ruby][securing-ruby]
for more information.

### Reporting issues

During this extended maintenance period we will _only_ apply security patches
to the source code repository for [1.8.7][source-187] and [1.9.2][source-192].

We take security very seriously, if you find a vulnerability please report it
to security@ruby-lang.org immediately. This mailing list is private and
reported problems will be published after a fix is released.

Please see [ruby-lang.org/en/security][security-en] for more information.

### On Release Management

As I mentioned above, we will only be applying security patches and
incrementing the patch level.

We will not be releasing a patched version of 1.8.7 or 1.9.2 to ruby-lang.org.
However, you are free to repackage binaries from source.

Reason being, we don't want any new tickets, as an official release will result
in continued responsibility of ruby-core to follow up on maintenance. Our team
resources are already low, and we want to encourage upgrades, not support
outdated versions.

### Why resurrect 1.8.7?

You may remember an announcement approximately 6 months ago that
[sunset 1.8.7][sunset-187-en].

While ruby-core will no longer resume maintenance of 1.8.7 or 1.9.2, Terence
and Zachary will support these versions for security maintenance as part of a
corporate sponsorship.

In the past we have supported vendors who wish to maintain legacy versions. In
2009 the maintenance of Ruby 1.8.6 was transferred to Engine Yard when they
released 1.8.6-p369.

### Words of encouragement

We would like to take this chance to strongly encourage you to upgrade to a
supported version of Ruby as soon as possible. Many ruby-core members have put
countless hours into improving the performance and features of Ruby in 2.0+ and
we wish you would take advantage of it.

Thank you for your continued support and lets keep making Ruby better!


[heroku]:        http://heroku.com/
[securing-ruby]: https://blog.heroku.com/archives/2013/12/5/a_patch_in_time_securing_ruby/
[source-187]:    https://bugs.ruby-lang.org/projects/ruby-187/repository
[source-192]:    https://bugs.ruby-lang.org/projects/ruby-192/repository
[security-en]:   https://www.ruby-lang.org/en/security/
[sunset-187-en]: https://www.ruby-lang.org/en/news/2013/06/30/we-retire-1-8-7/
