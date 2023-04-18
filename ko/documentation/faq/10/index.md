---
layout: page
title: "공식 Ruby FAQ"
lang: ko

header: |
  <div class="multi-page">
    <a href="../" title="Content">콘텐츠</a>
    <span class="separator"> | </span>
    <a href="../1/" title="파트 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="파트 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="파트 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="파트 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="파트 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="파트 6">6</a>
    <span class="separator"> | </span>
    <a href="../7/" title="파트 7">7</a>
    <span class="separator"> | </span>
    <a href="../8/" title="파트 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="파트 9">9</a>
    <span class="separator"> | </span>
    <strong>10</strong>
    <span class="separator"> | </span>
    <a href="../11/" title="파트 11">11</a>
  </div>
  <h1>공식 Ruby FAQ</h1>

---

{% include faq-notice.md %}

## 확장 라이브러리

### Ruby를 대화형으로 사용하려면 어떻게 해야 하나요?
{: #irb}

{% include faq-out-of-date.html %}

`irb`를 사용해 보세요. 다음은 고토 Kentaro Goto(Gotoken)의 글을 의역한 것으로,
원래는 [\[ruby-talk:444\]][ruby-talk:444]에 실린 내용입니다.

1. Ruby 아카이브의 [contrib 디렉토리](ftp://ftp.netlab.co.jp/pub/lang/ruby/contrib/)에서
   `irb`의 최신 타볼을 가져옵니다.
2. `irb` 디렉토리 트리를 압축해제합니다.
3. `irb/` 디렉터리 위치를 `$RUBYLIB` 환경 변수에 추가합니다.
4. `$RUBYLIB/irb/irb.rb`에서 `irb`라는 파일에 심볼릭 링크를 경로 어딘가에
   만듭니다.
5. `chmod +x $RUBYLIB/irb/irb.rb`
6. 'rehash'를 사용하여 로그인 셸에 새 명령에 대해 알려줄 수 있습니다.
7. `IRB`를 입력합니다.

readline 확장 모듈이 인터프리터와 함께 작동하면 `irb`를 훨씬 더 재미있게 사용할
수 있습니다.

Ruby 배포판의 `samples/` 디렉토리에 `eval`이라는 간단한 프로그램도 있습니다.
이 프로그램을 사용하면 표현식을 입력하고 그 값을 볼 수 있습니다. `eval`을
Ruby 트리의 `site_ruby` 디렉터리에 복사한 다음 다음을 사용하여 호출할 수
있습니다.

~~~
ruby -r eval -e0
~~~

[ruby-talk:444]: https://blade.ruby-lang.org/ruby-talk/444

### Ruby용 디버거가 있나요?

Ruby용 gdb와 유사한 디버거가 있습니다.

~~~
ruby -r debug your_program
~~~

### Ruby에서 C로 작성된 라이브러리를 사용하려면 어떻게 해야 하나요?

모든 스크립팅 언어 중에서 Ruby는 아마도 가장 확장하기 쉬운 언어일 것입니다.
참조 카운팅과 변수 유형에 대한 문제가 없고 배울 인터페이스도 거의 없습니다.
실제로 Ruby를 확장하는 데 사용되는 C 코드는 놀랍게도 Ruby 코드 자체와 비슷하게
보이는 경우가 많습니다.

먼저 Ruby 소스에서 `doc/extension.rdoc` 파일을 읽거나
[docs.ruby-lang.org][extension-rdoc]의 extension.rdoc을 읽어보세요. 확장
라이브러리를 작성하는 경우뿐만 아니라 Ruby를 더 깊이 이해하고자 하는 경우에도
좋은 문서입니다.

그런 다음 RubyGems 사이트에서 [확장을 사용한 젬 생성 가이드][rubygems-guide]를
제공합니다.
여기에는 설치 시 빌드되는 C 확장을 사용하여 젬을 설정하는 방법이 나와 있습니다.
또한 C 라이브러리를 래핑하는 일부 기존 젬에 대한 링크와 추가 읽을거리에 대한
링크도 있습니다.

인터프리터 자체의 소스와 `ext/` 디렉터리에서 제공되는 다양한 확장기능을
살펴볼 수도 있습니다(GiHub에서 [Ruby 저장소][ruby-github]를 찾아볼 수 있습니다).

[extension-rdoc]: https://docs.ruby-lang.org/en/master/extension_rdoc.html
[rubygems-guide]: http://guides.rubygems.org/gems-with-extensions/
[ruby-github]:    https://github.com/ruby/ruby

### Ruby에서 Tcl/Tk를 사용할 수 있나요?

{% include faq-out-of-date.html %}

표준 배포판에는 Tcl/Tk에 대한 두 개의 인터페이스가 포함되어 있습니다. 하나는
`ext/tcltk/` 아래에 있으며 `require "tcltk"`로 로드됩니다. 이 구문은 Tcl
인터프리터에 전달되는 Tcl과 매우 유사합니다. 안타깝게도 이 라이브러리에 대한
설명은 일본어로 작성되어 있습니다.

다른 하나는 `ext/tk/` 아래에 있으며 `require "tk"`로 로드됩니다. 이 구문은
Perl 및 Python 인터페이스에서 제공하는 Tk 인터페이스 스타일에 더 가깝습니다.

### Tk가 작동하지 않습니다. 왜 그럴까요?

{% include faq-out-of-date.html %}

Tk 버전이 오래되었을 수 있으니 최신 버전을 사용해 보세요.

### Ruby에서 gtk+나 xforms 인터페이스를 사용할 수 있나요?

{% include faq-out-of-date.html %}

Ruby ftp 사이트의 `contrib/`에서 `ruby-gtk-x.xx.tar.gz`,
`ruby-forms-x.x.tar.gz`를 찾을 수 있습니다.

### 날짜 계산은 어떻게 하나요?

{% include faq-out-of-date.html %}

`Time` 개체는 1970년 1월 1일부터 2038년 1월 19일 사이의 날짜만 표현
할 수 있습니다.

두 가지 표준 확장 라이브러리 모듈이 제공됩니다. 단순하고 영어 달력을 사용하는
`require "date"`와 보다 일반적인 용도의 `require "date2"`가 있습니다.

`sample/cal.rb`도 참조하세요.
