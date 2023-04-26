---
layout: news_post
title: "Multiple jQuery vulnerabilities in RDoc"
author: "aycabta"
translator:
date: 2019-08-28 09:00:00 +0000
tags: security
lang: en
---


There are multiple vulnerabilities about Cross-Site Scripting (XSS) in jQuery shipped with RDoc which bundled in Ruby.
All Ruby users are recommended to update Ruby to the latest release which includes the fixed version of RDoc.

## Details

The following vulnerabilities have been reported.

* [CVE-2012-6708](https://www.cve.org/CVERecord?id=CVE-2012-6708)
* [CVE-2015-9251](https://www.cve.org/CVERecord?id=CVE-2015-9251)

It is strongly recommended for all Ruby users to upgrade your Ruby installation or take one of the following workarounds as soon as possible.
You also have to re-generate existing RDoc documentations to completely mitigate the vulnerabilities.

## Affected Versions

* Ruby 2.3 series: all
* Ruby 2.4 series: 2.4.6 and earlier
* Ruby 2.5 series: 2.5.5 and earlier
* Ruby 2.6 series: 2.6.3 and earlier
* prior to master commit f308ab2131ee675000926540cbb8c13c91dc3be5

## Required actions

RDoc is a static documentation generation tool.
Patching the tool itself is insufficient to mitigate these vulnerabilities.

So, RDoc documentations generated with previous versions have to be re-generated with newer RDoc.

## Workarounds

In principle, you should upgrade your Ruby installation to the latest version.
RDoc 6.1.2 or later includes the fix for the vulnerabilities, so upgrade RDoc to the latest version if you can’t upgrade Ruby itself.

Note that as mentioned earlier, you have to regenerate existing RDoc documentations.

```
gem install rdoc -f
```

*Update:* The initial version of this post partially mentioned rdoc-6.1.1.gem, which was still vulnerable. Please make sure that you install rdoc-6.1.2 or later.

Regarding the development version, update to the latest HEAD of master branch.

## Credits

Thanks to [Chris Seaton](https://hackerone.com/chrisseaton) for reporting the issue.

## History

* Originally published at 2019-08-28 09:00:00 UTC
* RDoc version fixed at 2019-08-28 11:50:00 UTC
* Minor language fixes at 2019-08-28 12:30:00 UTC
