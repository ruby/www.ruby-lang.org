---
layout: news_post
title: "Approved Maintenance Policy"
author: "zzak"
translator:
date: 2014-01-13 03:28:19 UTC
lang: en
---

We'd like to take a minute and discuss our plans for ruby-core supported maintenance periods of Ruby.

For context, you should read our recent policy changes for [semantic versioning](/en/news/2013/12/21/semantic-versioning-after-2-1-0).

Given the previously mentioned versioning scheme, ruby-core aims to support the following policy:

  * `MINOR`: With "best effort" goal with at least 6 months and at best 3 years or after two newer `MINOR` releases.
  * `TEENY`: Will be released approximately every 2-4 months, backports will be made to the `ruby_MAJOR_MINOR` branch

During this time, the ruby-core team will support maintained versions of Ruby for general bug fixes until a decision is made to end support. At which point, security maintenance will continue until the version is End-of-Life.

The ruby-core team is responsible for a proper End-of-Life for each `MINOR` version of Ruby.

Our current format is to assign a maintainer for each `MINOR` series of Ruby. It's important to note that this person is not obligated to commit for the entire 3 year suggested maintenance period.

Our main goal to avoid sudden death.

Please understand that we want to focus on improving Ruby for future releases and encourage the use of the latest stable release. The longer a version lives the harder it becomes to maintain it. With the limited resources of ruby-core, it makes it hard for us to maintain more than 2 stable versions at a time.

Any decision made on Ruby development is based on the consensus of ruby-core as a team. The decision must be implicitly or explicitly approved by members of the maintenance policy team:

* [naruse](https://twitter.com/nalsh)
* [usa](https://twitter.com/unak)
* [nagachika](https://twitter.com/nagachika)

This request should be made explicitly on the [ruby-core mailing list](mailto:ruby-core@ruby-lang.org).

Thank you for your support as we continue to provide a stable and healthy Ruby.

