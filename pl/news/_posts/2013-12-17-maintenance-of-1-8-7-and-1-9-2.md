---
layout: news_post
title: "Rozszerzenie utrzymania bezpieczeństwa Rubiego 1.8.7 i 1.9.2"
author: "zzak"
translator: "crabonature"
date: 2013-12-17 20:49:03 +0000
lang: pl
---

Ze skutkiem natychmiastowym 1.8.7 i 1.9.2 wspierane będą dla poprawek bezpieczeństwa
do czerwca 2014 roku.

* Terence Lee ([@hone02](https://twitter.com/hone02))
  i Zachary Scott ([@_zzak](https://twitter.com/_zzak))
  będą zarządzać utrzymaniem.
* Po sześciomiesięcznym okresie utrzymania możemy dodać więcej osób by rozszerzyć
  na kolejne 6 miesięcy.

To rozszerzenie jest możliwe dzięki [Heroku][heroku],
zobacz ich artykuł na blogu [A Patch in Time: Securing Ruby][securing-ruby]
po więcej informacji.

### Zgłaszanie problemów

W trakcie tego przedłużonego okresu utrzymywania będziemy _tylko_ aplikować
łatki bezpieczeństwa do repozytorium kodu źródłowego [1.8.7] [source-187]
i [1.9.2] [source-192].

Bierzemy bezpieczeństwo bardzo poważnie, jeśli znajdziesz lukę, zgłoś ją
natychmiast na security@ruby-lang.org. Ta lista jest prywatna, a
zgłoszone problemy zostaną opublikowane gdy poprawka zostanie wydana.

Proszę zobaczyć [ruby-lang.org/en/security] [security-en] by uzyskać więcej
informacji.

### Zarządzanie wydaniami

Jak wspomniałem powyżej, będziemy tylko aplikować łatki bezpieczeństwa oraz
zwiększać wersję na odpowiednim poziomie.

Nie będziemy wydawać poprawionych wersji 1.8.7 lub 1.9.2 na ruby-lang.org.
Jednakże, masz swobodę, aby przepakować pliki binarne ze źródeł.

Powodem jest, że nie chcemy żadnych nowych zgłoszeń, jako oficjalnej wersji,
która spowodowałaby dalszą odpowiedzialność ruby-core do kontynuacji utrzymania.
Zasoby naszego zespołu są obecnie niskie, a chcemy zachęcić do uaktualnień, a nie
wsparcia przestarzałych wersji.

### Dlaczego wskrzesiliśmy 1.8.7?

Pamiętacie zapowiedź około 6 miesięcy temu, że to
[zachód słońca dla 1.8.7] [sunset-187-pl].

Podczas gdy ruby-core nie będzie już utrzymywać 1.8.7 lub 1.9.2, Terence
i Zachary będą wspierać te wersje dla utrzymania bezpieczeństwa w ramach
sponsoringu korporacyjnego.

W przeszłości wspieraliśmy podmioty, które chciały utrzymać starsze wersje. W
2009 konserwacja Rubiego 1.8.6 została przeniesiona do Engine Yard kiedy
wydali 1.8.6-p369.

### Słowa zachęty

Chcielibyśmy wykorzystać tę okazję do zachęcenia do aktualizacji do
wspieranej wersji Rubiego tak szybko jak to możliwe. Wielu członków ruby-core
poświęciły niezliczone godziny na poprawienie wydajności i możliwości Rubiego
w wersji 2.0 + i chcemy, by skorzystał z nich.

Dziękujemy za nieustające wsparcie i uczyńmy Rubiego lepszym!

[heroku]:        http://heroku.com/
[securing-ruby]: https://blog.heroku.com/archives/2013/12/5/a_patch_in_time_securing_ruby/
[source-187]:    https://bugs.ruby-lang.org/projects/ruby-187/repository
[source-192]:    https://bugs.ruby-lang.org/projects/ruby-192/repository
[security-en]:   https://www.ruby-lang.org/en/security/
[sunset-187-pl]: https://www.ruby-lang.org/pl/news/2013/06/30/we-retire-1-8-7/
