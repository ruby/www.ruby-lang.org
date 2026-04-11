---
layout: news_post
title: "루비 CVS 리포지터리 가이드"
author: "Unknown Author"
lang: ko
---

루비 소스 코드는 CVS 리포지터리에 저장되어 있습니다. CVSweb을 통해 탐색할 수
있습니다:

* https://www.ruby-lang.org/cgi-bin/cvsweb.cgi/

익명 CVS도 이용 가능합니다:

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

비밀번호는 필요하지 않습니다. 엔터 키를 누르시면 됩니다.

또한 CVSup도 이용 가능합니다:

* http://cvs.ruby-lang.org/cvsup/

여기서 "supfiles"를 찾을 수 있습니다. 이를 통해 CVSup으로 리포지터리의
일부 또는 전체를 가져올 수 있습니다.

이상입니다! 즐거운 해킹 되세요!
