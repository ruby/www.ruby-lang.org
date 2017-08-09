---
layout: news_post
title:  "Problemy usług ruby-lang.org"
author: "hsbt"
translator: "crabonature"
date:   2013-08-06 04:00:00 +0000
lang:   pl
---

Niektóre usługi dostarczane przez ruby-lang.org zostały wstrzymane,
ponieważ serwery ruby-lang.org są obecnie wyłączone.

Ma to wpływ na poniższe:

 * Wszystkie listy mailingowe dostarczane przez ruby-lang.org są wyłączone.
 * Pakiety tar Rubiego dystrybuowane przez ftp.ruby-lang.org są niedostępne.
 * Jeśli korzystasz ze starego cache DNS, nie jesteś w stanie wyświetlić www.ruby-lang.org.

Naprawiamy obecnie te usługi.

## Aktualizacja (2013-08-06 9:33 UTC)

Powodem dzisiejszych problemów jest awaria sprzętowa.
Naprawiliśmy następujące błędy:

 * Wszystkie listy mailingowe zaczęły funkcjonować ale nadal mamy pewne problemy. Pracujemy nad nimi.
 * ftp.ruby-lang.org jest ponownie dostępny poprzez http i ftp.

Jeśli odkryjesz inne problemy, proszę zgłoś je na
https://github.com/ruby/www.ruby-lang.org/issues.

## Aktualizacja (2013-08-06 13:18 UTC)

Zatrzymaliśmy ftp.ruby-lang.org poprzez http i ftp, ponieważ niektóre stare pakiety z Rubim są zepsute.
MD5 nie jest zgodne z oczekiwaniami.

Badamy to teraz. Dokładniejsze informacje są w następującym błędzie.
https://github.com/ruby/www.ruby-lang.org/issues/259

## Aktualizacja (2013-08-07 05:08 UTC)

Potwierdziliśmy, że następujące pakiety są zepsute. Mamy niektóre pakiety z
http://mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
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

Sprawdziliśmy, że sumy MD5 tych plików są identyczne z sumami z naszych ogłaszanych wydań.
ftp.ruby-lang.org poprzez http i ftp jest teraz dostępny.

## Aktualizacja (2013-08-09 10:30 UTC)

Część z naszych usług zostało przywróconych, kiedy to 6 sierpnia 2013
zostały zawieszone z powodu problemów z serwerem, które zgłosiliśmy wcześniej.

  * Listy mailingowe: Zastąpiliśmy oprogramowanie do świadczenia tej usługi z FML na Mailman.
    * Proszę sprawdzić http://lists.ruby-lang.org by uzyskać więcej informacji
  * Dystrybucja pakietów: Możecie ściągać pakiety, które udostępniamy z ftp.ruby-lang.org poprzez http lub ftp.
  * Pakiety snapshot: Zrestartowaliśmy codzienne budowanie snapshotów i pakowania.

Jeśli macie jakieś problemy z naszymi usługami, proszę poinformujcie nas na https://github.com/ruby/www.ruby-lang.org/issues
