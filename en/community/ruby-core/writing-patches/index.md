---
layout: page
title: "Patch Writer’s Guide"
lang: en
---

Here follow some tips, straight from Matz, on how to get
your patches considered. They were originally
[posted on the Ruby-Core mailing list][ruby-core-post].
{: .summary}

~~~
Subject: [ruby-core:25139] Patch writer's guide to submit
From: Yukihiro Matsumoto <matz ruby-lang.org>
Date: Wed, 26 Aug 2009 22:06:22 +0900

Hi,

Sometimes we laze core developers have procrastinated to review
submitted patches, been late to merge patchs, and frustrated
submitters.  That's unfortunate for both side.  Here's the guideline
to avoid such miscommunication.

 * one modification per a patch

   This is the biggest issue for most deferred patches.  When you
   submit a patch that fix multiple bugs (and add features) at once,
   we have to separate them before applying it.  It is kinda hard task
   for us, busy developers, so this kind of patches tend to be
   deferred.  No big patches please.

 * more description

   Sometimes mere patches do not describe problems that fix.  Better
   description (a problem that fix, precondition, platform, etc.)
   would help a patch to be merged earlier.

 * diff to the latest

   Your problem might have been fixed in the latest.  Or the code
   might be totally different.  Before submitting a patch, try fetch
   the latest (trunk for 1.9, ruby_1_8 for 1.8) from Subversion,
   please.

 * diff -u

   We perefer diff -u style unified diff patches to diff -c or any
   other style of patches.  They are far easier to review.  Do not
   send modifed files, we don't want to make diff by ourselves.

 * (optional) test cases

   a patch to test cases (preferably in a patch to test/*/test_*.rb)
   would help us understand the patch and your intention.

We might move to git style push/pull in the future.  But until then,
the above guideline would help you to avoid your frustration.

Thank you.


                                                        matz.
~~~

[ruby-core-post]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/25139
