---
layout: news_post
title: "Move to Git from Subversion"
author: "hsbt"
translator:
date: 2019-04-23 00:00:00 +0000
lang: en
---

Today, The canonical repository of the Ruby language was moved to Git from Subversion.

The new repository is https://git.ruby-lang.org built by cgit. We can keep your commit hash on the ruby repository directly.

## Development policy

* We don't use a topic branch on cgit.
* GitHub repository will still be just a mirror. We don't use "Merge pull request" feature.
* ruby_2_4, ruby_2_5, ruby_2_6 branches will continue to use SVN. We don't push anything to these branches on cgit.

## Special Thanks

* k0kubun

k0kubun aggressively develops toolchains related release and backport workflow and also updates the hook script for git.

* naruse

naruse updates the feature changes for Ruby CI and Redmine that is bugs.ruby-lang.org.

* mame

mame creates the commit notification script for slack.
