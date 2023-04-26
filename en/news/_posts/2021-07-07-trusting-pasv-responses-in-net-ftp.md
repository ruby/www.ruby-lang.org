---
layout: news_post
title: "CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP"
author: "shugo"
translator:
date: 2021-07-07 09:00:00 +0000
tags: security
lang: en
---

A trusting FTP PASV responses vulnerability was discovered in Net::FTP.
This vulnerability has been assigned the CVE identifier [CVE-2021-31810](https://www.cve.org/CVERecord?id=CVE-2021-31810).
We strongly recommend upgrading Ruby.

net-ftp is a default gem in Ruby 3.0.1 but it has a packaging issue, so please upgrade Ruby itself.

## Details

A malicious FTP server can use the PASV response to trick Net::FTP
into connecting back to a given IP address and port. This
potentially makes Net::FTP extract information about services that are
otherwise private and not disclosed (e.g., the attacker can conduct port scans
and service banner extractions).

## Affected Versions

* Ruby 2.6 series: 2.6.7 and earlier
* Ruby 2.7 series: 2.7.3 and earlier
* Ruby 3.0 series: 3.0.1 and earlier

## Credits

Thanks to [Alexandr Savca](https://hackerone.com/chinarulezzz) for reporting the issue.

## History

* Originally published at 2021-07-07 09:00:00 UTC
