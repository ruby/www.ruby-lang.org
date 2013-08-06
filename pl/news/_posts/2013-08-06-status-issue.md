---
layout: news_post
title:  "Problemy usług ruby-lang.org"
author: "hsbt"
translator: "crabonature"
date:   2013-08-06 04:00:00 UTC
lang:   pl
---

Niektóre usługi dostarczane przez ruby-lang.org zostały wstrzymane,
ponieważ serwery ruby-lang.org są obecnie wyłączone.

Ma to wpływ na poniższe:

 * Wszystkie listy mailingowe dostarczane przez ruby-lang.org są wyłączone.
 * Pakiety tar Rubiego dystrybuowane przez ftp.ruby-lang.org są niedostępne.
 * Jeśli korzystasz ze starego cache DNS, nie jesteś w stanie wyświetlić www.ruby-lang.org.

Naprawiamy obecnie te usługi.

## Aktualizacja (9:33 UTC)

Powodem dzisiejszych problemów jest awaria sprzętowa.
Naprawiliśmy następujące błędy:

 * Wszystkie listy mailingowe zaczęły funkcjonować ale nadal mamy pewne problemy. Pracujemy nad nimi.
 * ftp.ruby-lang.org jest ponownie dostępny poprzez http i ftp.

Jeśli odkryjesz inne problemy, proszę zgłoś je na
https://github.com/ruby/www.ruby-lang.org/issues.

## Aktualizacja (13:18 UTC)

Zatrzymaliśmy ftp.ruby-lang.org poprzez http i ftp, ponieważ niektóre stare pakiety z Rubim są zepsute.
MD5 nie jest zgodne z oczekiwaniami.

Badamy to teraz. Dokładniejsze informacje są w następującym błędzie.
https://github.com/ruby/www.ruby-lang.org/issues/259
