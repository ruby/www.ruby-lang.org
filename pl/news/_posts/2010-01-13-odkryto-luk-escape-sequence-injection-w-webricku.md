---
layout: news_post
title: "Odkryto lukę \"Escape Sequence Injection\" w WEBrick'u"
author: "hosiawak"
date: 2010-01-13 22:02:59 +0000
lang: pl
---

Odkryto lukę bezpieczeństwa w serwerze WEBrick, który jest częścią
biblioteki standardowej Rubiego. WEBrick umożliwia atakującemu
wstrzyknięcie niebezpiecznych sekwencji znaków do logów serwera. W
wyniku tego niebezpieczne znaki sterujące mogą zostać wykonane w
terminalu ofiary.

Mamy już przygotowaną łatkę, wkrótce zostaną wydane uaktualnienia
wszystkich aktywnych gałęzi Rubiego. W międzyczasie zalecamy aby nie
przeglądać logów WEBrick\'a.

## Szczegółowy opis

Znaki specjalne terminala używane są do interakcji pomiędzy terminalem a
procesem w nim działającym. . Problem w tym, że zakłada się, że
sekwencje tych znaków pochodzą z zaufanych źródeł a nie na przykład z
sieci. Jeśli więc możliwe byłoby wstrzyknięcie specjalnie przygotowanej
sekwencji znaków do logów serwera WEBrick, którą potencjalna ofiara
otworzyłaby w terminalu, atakujący mógłby wykorzystać pewne [problemy
dotyczące bezpieczeństwa w terminalach][1].

WEBrick nie filtruje wyżej wspomnianych specjalnych sekwencji znaków.

Przykład:

    % xterm -e ruby -rwebrick -e 'WEBrick::HTTPServer.new(:Port=>8080).start' &
    % wget http://localhost:8080/%1b%5d%32%3b%6f%77%6e%65%64%07%0a

Obserwuj tytuł okienka xterm.

## Wersje Rubiego, których ten problem dotyczy

* Ruby 1.8.6 patchlevel 383 i wszystkie poprzednie wersje
* Ruby 1.8.7 patchlevel 248 i wszystkie poprzednie wersje
* Wersje deweloperskie Ruby 1.8 (1.8.8dev)
* Ruby 1.9.1 patchlevel 376 i wszystkie poprzednie wersje
* Wersje deweloperskie Ruby 1.9 (1.9.2dev)

## Poprawki

* Poprawki dla 1.8.6, 1.8.7, oraz 1.9.1 znajdują się poniżej.
  * 1\.8.7 patch-level 249 naprawia ten problem. Użytkowników 1.8.7
    zachęca się do aktualizacji.
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.gz][2]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.bz2][3]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.zip][4]

  * 1\.9.1 patch-level 378 naprawia ten problem. Użytkowników 1.9.1
    zachęca się do aktualizacji.
    * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.gz][5]
    * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.bz2][6]
    * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.zip][7]

  * 1\.8.6 patch-level 388 naprawia ten problem. Użytkowników 1.8.6
    zachęca się do aktualizacji.
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.gz][8]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.bz2][9]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.zip][10]

* Wersje deweloperskie prosimy zaktualizować do najnowszej wersji.

## Podziękowania

Podziekowania należą się Giovanni \"evilaliv3\" Pellerano, Alessandro
\"jekil\" Tanasi, oraz Francesco \"ascii\" Ongaro za odkrycie tej luki.



[1]: http://marc.info/?l=bugtraq&amp;m=104612710031920&amp;w=2 "Terminal Emulator Security Issues"
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.bz2
[4]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.zip
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.bz2
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.zip
[8]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p388.tar.gz
[9]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p388.tar.bz2
[10]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p388.zip
