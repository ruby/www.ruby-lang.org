---
layout: news_post
title: "helium.ruby-lang.org was cracked"
author: "Shugo Maeda"
lang: vi
---

On Fri May 28, we found that someone cracked helium.ruby-lang.org
via CVS.

Fortunately, the cvs process was running in the chroot environment,
so the affects to other services/contents were not so probable, but
we are confirming it now.
Currently there are no interpolations found out of the chroot
environment.

The most worrisome contents are the CVS repositories, but these
distributions are not affected at least.

    5d52c7d0e6a6eb6e3bc68d77e794898e  ruby-1.8.1.tar.gz
    bf48d49dbd94b5c0eda5f75b3bfbac16  ruby-1.6.8.tar.gz

The mailing list services are restarted, but CVS/WWW/FTP/RSYNC
are stopped yet, sorry.

Further information will be provided on https://www.ruby-lang.org/.
For more information, send mail to admin@ruby-lang.org please.
