---
layout: news_post
title: "WEBrick::이스케이프 시퀀스 취약점"
author: "Moru"
lang: ko
---

루비 표준 라이브러리의 일부인 WEBrick에서 보안 취약점이 발견되었습니다. 공격자는 WEBrick을 통해 악의적인
이스케이프 시퀀스를 로그에 삽입할 수 있으며, 로그를 열람할시 공격자가 삽입한 제어문자가 사용자측 터미널에서 실행될 가능성이
있습니다.

이번 보안 취약점에 대한 조치는 이미 취해졌으며 이와 동시에 배포 중인 모든 버전에 대해서도 릴리스가 이루어질 것입니다. **단, WEBrick 프로세스를 재실행 혹은 업데이트하기 전까지는 로그를 열람하지 않기를 권장합니다.**

#### 상세설명

터미널 이스케이프 시퀀스는 터미널과 내부 프로세스 간의 다양한 상호작용에 사용됩니다. 이번 취약점은 네트워크 입력과 같은 신뢰성
없는 정보원으로부터 시퀀스가 발행되는 것을 고려하지 않은 것이 문제였습니다. 따라서 외부 공격자가 이스케이프 시퀀스를
WEBrick 로그에 삽입할 수 있게 되고, 해당 로그 열람시 터미널은 공격자의 의도대로 보안에 취약해질 수 있습니다.

WEBrick은 그와 같은 이스케이프 시퀀스를 필터링하지 못했습니다.

#### 취약점 확인하기

아래의 코드로 이번 취약점을 확인할 수 있습니다.

% xterm -e ruby -rwebrick -e
\'WEBrick::HTTPServer.new(:Port=&gt;8080).start\' &amp; % wget
http://localhost:8080/%1b%5d%32%3b%6f%77%6e%65%64%07%0a

xterm의 창 제목을 확인해 보세요.

#### 취약한 버전

* 루비 1.8.6 patchlevel 383 및 이전의 모든 버전
* 루비 1.8.7 patchlevel 248 및 이전의 모든 버전
* 루비 1.8 개발 버전(1.8.8dev)
* 루비 1.9.1 patchlevel 376 및 이전의 모든 버전
* 루비 1.9 개발 버전(1.9.2dev)

#### 해결책

* 1\.8.6, 1.8.7, 1.9.1의 경우
  * 1\.8.7 pl.249 업데이트 버전은 이 이슈를 수정하기 위해 공개 되었습니다. 1.8.7 사용자들에게 업그레이드를
    권장합니다.
    * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.gz&gt;][1]
    * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.bz2&gt;][2]
    * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.zip&gt;][3]

  * 1\.9.1 pl. 378 업데이트 버전은 이 이슈를 수정하기 위해 공개 되었습니다. 1.9.1 사용자들에게 업그레이드를
    권장합니다.
    * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.gz&gt;][4]
    * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.bz2&gt;][5]
    * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.zip&gt;][6]

  * 1\.8.6 pl. 388 업데이트 버전은 이 이슈를 수정하기 위해 공개 되었습니다. 1.8.6 사용자들에게 업그레이드를
    권장합니다.
    * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.gz&gt;][7]
    * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.bz2&gt;][8]
    * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.zip&gt;][9]

* 개발 버전의 경우 각 개발 브랜치에 릴리스된 최신 리비전으로 업데이트 하세요.

#### 보고자

Giovanni \"evilaliv3\" Pellerano, Alessandro \"jekil\" Tanasi, Francesco
\"ascii\" Ongaro



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.zip
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.zip
[7]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.tar.bz2
[9]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p388.zip
