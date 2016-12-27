---
layout: news_post
title:  "Service issue of ruby-lang.org"
author: "hsbt"
translator: "antipop"
date:   2013-08-06 04:00:00 +0000
lang:   en
---

Some services provided by ruby-lang.org are stopped,
because the servers of ruby-lang.org are currently down.

Impact is as follows:

 * All mailing lists provided by ruby-lang.org are down.
 * Ruby's tar packages distributed by ftp.ruby-lang.org are unreachable.
 * If you lookup old DNS cache, you cannot reach www.ruby-lang.org.

We are repairing these services now.

## Update (2013-08-06 9:33 UTC)

The reason of today's problems is a hardware failure.
We repaired the following issues:

 * All mailing lists are back, but we still have some problem. We are repairing it.
 * ftp.ruby-lang.org is available again via http and ftp.

If you discover other problems, please report them to
https://github.com/ruby/www.ruby-lang.org/issues.

## Update (2013-08-06 13:18 UTC)

We stopped ftp.ruby-lang.org via http and ftp, because some old packages of Ruby are broken. MD5 doesn't match as expected.

We are investigating now. Detail information can be found in the following issue.
https://github.com/ruby/www.ruby-lang.org/issues/259

## Update (2013-08-07 05:08 UTC)

We confirmed that the following packages were broken. We restored these packages via http://mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/.

<pre>
ruby-1.9.3-p426.tar.bz2
ruby-1.9.3-p426.tar.gz
ruby-1.9.3-p426.zip
ruby-1.9.3-p429.tar.bz2
ruby-1.9.3-p429.tar.gz
ruby-1.9.3-p429.zip
ruby-2.0.0-p0.tar.bz2
ruby-2.0.0-p0.tar.gz
ruby-2.0.0-p0.zip
ruby-2.0.0-p195.tar.bz2
ruby-2.0.0-p195.tar.gz
ruby-2.0.0-p195.zip
</pre>

We checked that the MD5 checksums of these files are the same as in our release announcements. ftp.ruby-lang.org via http and ftp is available now.

## Update (2013-08-09 10:30 UTC)

Some of our services have been backed now, which had been suspended since Aug. 6 2013 by the server accident we reported before:

  * Mailing lists: We changed the software that provides the service from FML to Mailman.
    * For details, please check out http://lists.ruby-lang.org.
  * Package distribution: You can now download the packages we're providing from ftp.ruby-lang.org via both http and ftp.
  * Snapshot packages: We restarted daily snapshot building and packaging.

If you find any problems on our services, please notify us at https://github.com/ruby/www.ruby-lang.org/issues.
