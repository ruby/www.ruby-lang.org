---
layout: news_post
title: "Ruby Repository Moved to Git from Subversion"
author: "hsbt"
translator:
date: 2019-04-23 00:00:00 +0000
lang: vi
---

Today, the canonical repository of the Ruby programming language was moved to Git from Subversion.

The web interface for the new repository is [https://git.ruby-lang.org](https://git.ruby-lang.org), and is provided by cgit. We can keep the commit hash from the contributor on the Ruby repository directly.

## Development policy

* We don't use a topic branch on cgit.
* The GitHub repository will still be just a mirror. We don't use the "Merge pull request" feature.
* The ruby_2_4, ruby_2_5, and ruby_2_6 branches will continue to use SVN. We don't push anything to these branches on cgit.
* Starting with ruby_2_7, we'll use cgit to develop stable branches.
* We don't use merge commits.

## Special Thanks

* k0kubun

  k0kubun aggressively developed toolchains related to release and backport workflows and also updated the hook script for git.

* naruse

  naruse updated the feature changes for Ruby CI and Redmine (bugs.ruby-lang.org).

* mame

  mame created the commit notification script for slack.

## Future Work

We still have to complete some tasks. If you find an issue related to the Git migration, please file it to [https://bugs.ruby-lang.org/issues/14632](https://bugs.ruby-lang.org/issues/14632).

Enjoy!
