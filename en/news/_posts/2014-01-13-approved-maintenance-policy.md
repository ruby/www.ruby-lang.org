---
layout: news_post
title: "Approved Maintenance Policy"
author: "zzak"
translator:
date: 2014-01-13 03:28:19 UTC
lang: en
---

We've decided our plans for ruby-core supported maintenance periods of Ruby.

For context, you should read our recent policy changes for [semantic versioning](/en/news/2013/12/21/semantic-versioning-after-2-1-0).

Given the current supported version scheme, the ruby-core policy is as follows:

  * `MINOR`: With "best effort" goal with at least 6 months and at best 3 years or after two newer `MINOR` releases.
  * `TEENY`: Will be released approximately every 2-4 months.

During this time, the ruby-core team will support maintained versions of Ruby in the following groups:

## Bug fix

For general bug fixes, we will support the latest release until a decision is made to end support.

## Security fix

After bug fix period has ended, security maintenance will continue until the version is End-of-Life.

## End-of-Life and Unsupported Versions

Once a version is End-of-Life, it's your responsibility to deal with bugs and security fixes. An approved commercial party may be able to accept responsibility of maintaining an End-of-Life version.

It's important to recognize the maintainer for each version may decide they can no longer support a version, in which case ruby-core would work to responsibly discontinue the version.

## Your encouragement is appreciated

Please understand that we want to focus on improving Ruby for future releases and encourage the use of the latest stable release. The longer a version lives the harder it becomes to maintain it. With the limited resources of ruby-core, it makes it hard for us to maintain more than 2 stable versions at a time.

We're going to give our best effort to support this policy in order to provide a sustainable upgrade path to modern versions of Ruby.

Thank you for your support as we continue to provide a stable and healthy Ruby.

