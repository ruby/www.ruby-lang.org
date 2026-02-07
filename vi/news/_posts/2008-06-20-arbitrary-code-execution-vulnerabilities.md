---
layout: news_post
title: "Arbitrary code execution vulnerabilities"
author: "Shugo Maeda"
lang: vi
---

Multiple vulnerabilities in Ruby may lead to a denial of service (DoS)
condition or allow execution of arbitrary code.

## Impact

With the following vulnerabilities, an attacker can lead to denial of
service condition or execute arbitrary code.

* [CVE-2008-2662][1]
* [CVE-2008-2663][2]
* [CVE-2008-2725][3]
* [CVE-2008-2726][4]
* [CVE-2008-2664][5]

## Vulnerable versions

1.8 series
: * 1\.8.4 and all prior versions
  * 1\.8.5-p230 and all prior versions
  * 1\.8.6-p229 and all prior versions
  * 1\.8.7-p21 and all prior versions

1.9 series
: * 1\.9.0-1 and all prior versions

## Solution

1.8 series
: Please upgrade to 1.8.5-p231, or 1.8.6-p230, or 1.8.7-p22.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p231.tar.gz&gt;][6]
    (md5sum: e900cf225d55414bffe878f00a85807c)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p230.tar.gz&gt;][7]
    (md5sum: 5e8247e39be2dc3c1a755579c340857f)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p22.tar.gz&gt;][8]
    (md5sum: fc3ede83a98f48d8cb6de2145f680ef2)

1.9 series
: Please upgrade to 1.9.0-2.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.0-2.tar.gz&gt;][9]
    (md5sum: 2a848b81ed1d6393b88eec8aa6173b75)

These versions also fix the vulnerability of WEBrick
([CVE-2008-1891][10]).

Please note that a package that corrects this weakness may already be
available through your package management software.

## Credit

Credit to Drew Yao of Apple Product Security for disclosing the problem
to Ruby Security Team.

## Changes

* 2008-06-21 00:29 +09:00 removed wrong CVE IDs (CVE-2008-2727,
  CVE-2008-2728).



[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2662
[2]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2663
[3]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2725
[4]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2726
[5]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2664
[6]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p231.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p230.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p22.tar.gz
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.0-2.tar.gz
[10]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1891
