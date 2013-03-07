---
layout: page
title: "라이브러리"
lang: ko
---

루비에서 사용할 수 있는 아주 매력적이고 재미있는 라이브러리들이 매우 많이 있습니다. 그 중 다수가 편리한 *젬* 방식으로
배포되고 있습니다. 그 외의 라이브러리는 소스 코드 디렉터리를 압축(.zip, .tar.gz)한 형태로 배포됩니다. 루비
라이브러리를 찾는 방법과 이를 설치하여 사용하는 것에 대해 알아봅니다.

### 라이브러리 찾기
{: #finding-libraries}

[**루비포지**][1]는 가장 유명한 루비 라이브러리 홈페이지입니다. 이 사이트를 살펴보는 유용한 방법중 하나가 바로
[소프트웨어 맵][2]인데 여기서 주제에 대한 라이브러리 목록을 볼 수 있습니다. (혹시 자신만의 라이브러리를 만들었다면, 이를
루비포지에 프로젝트로 [등록][3]해서 서브버전 접근, 웹 공간, 메일링 리스트 등의 지원을 무료로 받을 수 있습니다.)

[**루비 애플리케이션 아카이브**][4] (줄여서 RAA)는 모든 종류의 루비 소프트웨어가 기능별로 분류되어 있는 디렉터리
입니다. 현재는 [Net][5] 분류에 가장 많은 항목이 있고, 뒤를 이어 [Database][6] 분류가 있습니다.
[HTML][7]과 [XML][8] 도 인기있는 분류입니다. [물리][9] 항목에도 4개의 애플리케이션이 등록되어 있네요.

### RubyGems 사용하기
{: #using-rubygems}

윈도우 설치 프로그램에는 RubyGems가 포함되어 있지만, 대부분의 운영체제에서는 직접 설치를 해야 합니다. 만일 아래의
명령어가 동작하지 않는다면, 아래의 [RubyGems 설치하기](#installing-rubygems) 항목을 참조하기 바랍니다.

#### 젬 찾기

특정 이름으로 젬을 찾기 위해서는 **search** 명령을 사용합니다. 예를 들어 “html”이란 단어를 포함한 젬을 찾고
싶다면,


     $ gem search html --remote

     *** REMOTE GEMS ***

     html-sample (1.0, 1.1)
        A sample Ruby gem, just to illustrate how RubyGems works.

(*@—remote@ 플래그는 루비포지의 공식 젬 서버에서 찾겠다는 의미입니다.*)

#### 젬 설치하기

어떤 젬을 설치하기를 원한다면 **install** 명령을 사용합니다.


     $ gem install html-sample

`--version` 플래그를 이용하면 특정 버전을 지칭해서 설치할 수도 있습니다.


     $ gem install html-sample --version 1.0

#### 모든 젬의 목록

루비포지에 등록된 모든 젬의 목록을 볼 수도 있습니다.


     $ gem list --remote

현재 설치된 젬의 목록을 원한다면 플래그 없이 실행합니다.


     $ gem list

RubyGems에 대한 보다 자세한 설명은 [**공식 매뉴얼**][10]을 참고하기 바랍니다. 여기에는 루비 스크립트에서 젬을
사용하는 예제도 포함되어 있습니다.

### RubyGems 설치하기
{: #installing-rubygems}

RubyGems를 설치하기 위해서는 홈페이지에서 최신 버전을 [내려받아야][11] 합치니다. 압축을 풀고 `setup.rb`를
실행합니다. 일부 운영체제에서는 root 권한이 필요할 수도 있습니다.

예를 들어 리눅스 환경이라면,


    $ tar xzvf rubygems-0.9.0.tar.gz
    $ cd rubygems-0.9.0
    $ su -
    # ruby setup.rb

설치 방법에 대한 더 자세한 지침을 보고 싶다면 RubyGems 매뉴얼에서 [**installation**][12] 부분을
참고하기 바랍니다.



[1]: http://rubyforge.org/ 
[2]: http://rubyforge.org/softwaremap/trove_list.php 
[3]: http://rubyforge.org/register/ 
[4]: http://raa.ruby-lang.org/ 
[5]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Net 
[6]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Database 
[7]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=HTML 
[8]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=XML 
[9]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Physics 
[10]: http://rubygems.org/read/chapter/1 
[11]: http://rubyforge.org/frs/?group_id=126 
[12]: http://rubygems.org/read/chapter/3 
