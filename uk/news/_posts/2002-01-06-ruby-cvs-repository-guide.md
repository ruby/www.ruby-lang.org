---
layout: news_post
title: "Посібник з репозиторію Ruby CVS"
author: "Unknown Author"
translator: "Andrii Furmanets"
lang: uk
---

Вихідний код Ruby зберігається в репозиторіях CVS. Ви можете переглянути їх
через CVSweb:

* https://www.ruby-lang.org/cgi-bin/cvsweb.cgi/

Анонімний CVS також доступний:

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

Пароль не потрібен. Просто натисніть Enter.

Крім того, CVSup також доступний:

* http://cvs.ruby-lang.org/cvsup/

Ви знайдете тут "supfiles". З ними ви можете отримати частину або весь
репозиторій за допомогою CVSup.

Ось і все, друзі! Веселої роботи!