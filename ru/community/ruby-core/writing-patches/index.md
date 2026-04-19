---
layout: page
title: "Patch Writer’s Guide"
lang: ru
---

Here follow some tips, straight from Matz, on how to get
your patches considered.
{: .summary}

These guidelines were adopted from a [post by Matz][ruby-core-post]
on the Ruby-Core mailing list:

* Implement one modification per patch

  This is the biggest issue for most deferred patches. When you
  submit a patch that fixes multiple bugs (and adds features) at once,
  we have to separate them before applying it. It is a rather hard task
  for us busy developers, so this kind of patches tends to be deferred.
  No big patches please.

* Provide descriptions

  Sometimes a mere patch does not sufficiently describe the problem it fixes.
  A better description (the problem it fixes, preconditions, platform, etc.)
  would help a patch to be merged earlier.

* Diff to the latest revision

  Your problem might have been fixed in the latest revision. Or the code
  might be totally different by now. Before submitting a patch, try to fetch
  the latest version (the `trunk` branch for the latest development version,
  `{{ site.svn.stable.branch }}` for {{ site.svn.stable.version }})
  from the Subversion repository, please.

* Use `diff -u`

  We prefer `diff -u` style unified diff patches to `diff -c`
  or any other style of patches. They are far easier to review.
  Do not send modified files, we do not want to make a diff by ourselves.

* Provide test cases (optional)

  A patch providing test cases (preferably a patch to `test/*/test_*.rb`)
  would help us understand the patch and your intention.

We might move to a Git style push/pull workflow in the future.
But until then, following the above guidelines would help you to avoid
frustration.


[ruby-core-post]: https://blade.ruby-lang.org/ruby-core/25139
