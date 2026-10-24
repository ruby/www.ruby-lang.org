---
layout: news_post
title: "Security advisories: CVE-2026-80212 and CVE-2026-80213"
author: "hsbt"
translator:
date: 2026-08-27 00:00:00 +0000
tags: security
lang: en
---

Two vulnerabilities have been discovered in the `resolv` gem bundled with Ruby. They have been assigned the CVE identifiers [CVE-2026-80212](https://www.cve.org/CVERecord?id=CVE-2026-80212) and [CVE-2026-80213](https://www.cve.org/CVERecord?id=CVE-2026-80213). We recommend upgrading the resolv gem.

## CVE-2026-80212: Memory exhaustion through malicious DNS responses

An application that resolves a hostname an attacker can influence, such as a webhook target or a user-supplied URL, can be made to consume memory without bound. The attacker points a domain at a name server they control and returns responses that the library retains permanently. Repeated lookups grow the process until it runs out of memory and the service stops.

## CVE-2026-80213: Hostname validation bypass

An application that checks a hostname against an allow list or an SSRF filter and then resolves it can be made to look up a domain other than the one it checked. The string that passes validation and the name that reaches the network are not the same, so the connection can end up at a host the application never approved. This requires a hostname that exceeds the DNS length limits, so validation that rejects names longer than 255 octets, or labels longer than 63 octets, is not affected.

## Affected versions

* resolv gem 0.4.0 through 0.7.1
* resolv gem 0.3.1 and earlier

The version bundled with Ruby differs per series: Ruby 4.0 ships resolv 0.7.0, Ruby 3.4 ships 0.7.1, and Ruby 3.3 ships 0.3.1.

## What to check

Only code that resolves names through this gem is affected. Ordinary socket connections, including `Net::HTTP` and anything built on `TCPSocket`, use the operating system resolver and are not. `Net::HTTP` does load the gem, but only for its IP address regular expressions, so a loaded gem is not by itself a sign of exposure.

An application reaches the affected code by calling `Resolv` itself, by loading `resolv-replace`, which routes all socket name resolution through the gem, or through a dependency that resolves names this way. Check your dependencies as well as your own code.

## Recommended action

Update the resolv gem to 0.7.2. For the Ruby 3.3 series, update to 0.3.2.

No release is planned for the 0.2.x line that the Ruby 3.2 series ships, because that series has reached its end of life. Install resolv 0.7.2 there instead.

## Credits

Thanks to [dalifit](https://hackerone.com/dalifit) for discovering these issues.

## History

* Originally published at 2026-08-27 00:00:00 (UTC)
