---
layout: news_post
title: "Ruby CVS Repository Guide"
author: "Unknown Author"
lang: vi
---

The source code of Ruby is stored in CVS repositories. You can walk them
around by CVSweb:

* https://www.ruby-lang.org/cgi-bin/cvsweb.cgi/

Anonymous CVS is also available:

    $ cvs -d :pserver:anonymous@cvs.ruby-lang.org:/src login
    (Logging in to anonymous@cvs.ruby-lang.org)
    CVS password:
    $ cvs -z4 -d :pserver:anonymous@cvs.ruby-lang.org:/src co ruby

    $ cvs -d :pserver:anonymous@cvs.ruby-lang.org:/doc login
    (Logging in to anonymous@cvs.ruby-lang.org)
    CVS password:
    $ cvs -z4 -d :pserver:anonymous@cvs.ruby-lang.org:/doc co doc

    $ cvs -d :pserver:anonymous@cvs.ruby-lang.org:/www login
    (Logging in to anonymous@cvs.ruby-lang.org)
    CVS password:
    $ cvs -z4 -d :pserver:anonymous@cvs.ruby-lang.org:/www co www

No password is required. Please just press Enter.

In addition, CVSup is also available:

* http://cvs.ruby-lang.org/cvsup/

You’ll find “supfiles” here. With them, you can get a part of or a whole
repository by means of CVSup.

That’s all, folks! Happy hacking!
