---
layout: news_post
title: "CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP"
author: "shugo"
translator:
date: 2021-07-07 09:00:00 +0000
tags: security
lang: en
---

A StartTLS stripping vulnerability was discovered in Net::IMAP.
This vulnerability has been assigned the CVE identifier [CVE-2021-32066](https://www.cve.org/CVERecord?id=CVE-2021-32066).
We strongly recommend upgrading Ruby.

net-imap is a default gem in Ruby 3.0.1 but it has a packaging issue, so please upgrade Ruby itself.

## Details

Net::IMAP does not raise an exception when StartTLS
fails with an unknown response, which might allow man-in-the-middle
attackers to bypass the TLS protections by leveraging a network
position between the client and the registry to block the StartTLS
command, aka a "StartTLS stripping attack."

## Affected Versions

* Ruby 2.6 series: 2.6.7 and earlier
* Ruby 2.7 series: 2.7.3 and earlier
* Ruby 3.0 series: 3.0.1 and earlier

## Credits

Thanks to [Alexandr Savca](https://hackerone.com/chinarulezzz) for reporting the issue.

## History

* Originally published at 2021-07-07 09:00:00 UTC
