---
layout: news_post
title: "Multiple vulnerabilities in resolv gem"
author: "hsbt"
translator:
date: 2026-08-27 00:00:00 +0000
tags: security
lang: en
---

Two vulnerabilities have been discovered in the `resolv` gem bundled with Ruby. They have been assigned the CVE identifiers [CVE-2026-80212](https://www.cve.org/CVERecord?id=CVE-2026-80212) and [CVE-2026-80213](https://www.cve.org/CVERecord?id=CVE-2026-80213). We recommend upgrading the resolv gem.

## CVE-2026-80212: Memory exhaustion through unknown resource records

Decoding a resource record with an unknown type and class pair, or an unknown SvcParamKey, generated a Ruby class for it and registered that class permanently. A malicious DNS response carrying many distinct unknown values grew the process until it ran out of memory.

## CVE-2026-80213: Query name confusion through an over-long DNS label

A DNS label is prefixed by a single length octet and may not exceed 63 octets, but the encoder wrote the length without checking its range. A label longer than 255 octets had its length truncated to the low 8 bits while its bytes were written unchanged. The remainder was then read back as further labels, so the query sent on the wire asked for a different domain than the one the caller passed in. A label between 64 and 255 octets wrote a length octet in a range reserved for other uses.

An application that validates a hostname before resolving it can therefore be made to look up an attacker-chosen domain, because the string it checked and the name that reaches the network are not the same.

## Affected versions

* resolv gem 0.4.0 through 0.7.1
* resolv gem 0.3.1 and earlier

The version bundled with Ruby differs per series: Ruby 4.0 ships resolv 0.7.0, Ruby 3.4 ships 0.7.1, and Ruby 3.3 ships 0.3.1.

## Recommended action

Update the resolv gem to 0.7.2. For the Ruby 3.3 series, update to 0.3.2.

No release is planned for the 0.2.x line that the Ruby 3.2 series ships, because that series has reached its end of life. Install resolv 0.7.2 there instead.

## Credits

Thanks to [dalifit](https://hackerone.com/dalifit) for discovering these issues.

## History

* Originally published at 2026-08-27 00:00:00 (UTC)
