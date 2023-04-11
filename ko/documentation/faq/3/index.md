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
    <strong>3</strong>
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
    <a href="/en/documentation/faq/9/" title="파트 9">9</a>
    <span class="separator"> | </span>
    <a href="/en/documentation/faq/10/" title="파트 10">10</a>
    <span class="separator"> | </span>
    <a href="/en/documentation/faq/11/" title="파트 11">11</a>
  </div>
  <h1>공식 Ruby FAQ</h1>

---

{% include faq-notice.md %}

## Ruby 설치하기

Ruby 다운로드 및 설치에 대한 최신 정보는
[설치](/ko/documentation/installation/)나 [다운로드](/ko/downloads/) 페이지를
참조하세요.

### 어떤 운영 체제에서 Ruby를 지원하나요?

{% include faq-out-of-date.html %}

Ruby는 Linux에서 개발되었으며 매우 간단한 C로 작성되었습니다. Linux 및 기타
UNIX와 유사한 운영 체제 macOS, Windows, DOS, BeOS, Amiga, Acorn Risc OS,
OS/2에서 실행됩니다.

### Ruby 소스는 어디서 구할 수 있나요?

[www.ruby-lang.org/ko/downloads/](/ko/downloads/)에서 최신 버전의 Ruby를
다운로드할 수 있습니다. 미러 사이트도 이 페이지에 나열되어 있습니다.

또한 이 페이지에는 개발 트리의 나이틀리 스냅숏에 대한 링크도 있습니다.

### 개발 소스 트리를 볼 수 있나요?

{% include faq-out-of-date.html %}

CVS 클라이언트가 있는 경우 다음을 사용하여 현재 소스 트리를 확인할 수 있습니다.

~~~
$ cvs -d :pserver:anonymous@cvs.netlab.co.jp:/home/cvs login
(Logging in to anonymous@cvs.netlab.co.jp)
CVS password: guest
$ cvs -d :pserver:anonymous@cvs.netlab.co.jp:/home/cvs co ruby
~~~

CVS가 없는 경우 다음 링크에서 개발 소스의 나이틀리 스냅숏을 받을 수 있습니다.
[https://cache.ruby-lang.org/pub/ruby/snapshot.tar.gz](https://cache.ruby-lang.org/pub/ruby/snapshot.tar.gz).

### Ruby를 컴파일하려면 어떻게 하나요?

Unix에서 Ruby는 빌드 환경을 구성하기 위해 `autoconf` 시스템을 사용합니다.
배포판에서 Ruby를 빌드하기 위해 `autoconf` 명령이 필요하지 않으며, 그냥 아래
명령을 사용하면 됩니다.

~~~
$ ./configure [configure options]
$ make
$ make test
$ make install
~~~

기본 설치 위치(`/usr/local`)를 바꾸지 않고 Ruby를 설치하려면 슈퍼유저 권한이
필요할 수 있습니다. 다음 명령을 사용하여 `configure` 옵션의 전체 목록을 볼 수
있습니다.

~~~
$ ./configure --help
~~~

소스 저장소에서 작업하는 경우, `configure`를 실행하기 전에 `autoconf`를
실행해야 할 수 있습니다.

### 내 라이브러리가 어디에 있는지 Ruby에게 알려주려면 어떻게 하나요?

{% include faq-out-of-date.html %}

일부 시스템에서는 빌드 프로세스가 확장 모듈에서 사용하는
라이브러리(예: `dbm` 라이브러리)를 찾지 못할 수 있습니다.

`configure` 옵션을 사용하여 Ruby에게 라이브러리 위치를 알려줄 수 있습니다.
다음은 [\[ruby-talk:5041\]][ruby-talk:5041]에서 가져온 것입니다.

~~~
$ ./configure --with-xxx-yyy=DIR
~~~

여기서 xxx는 다음 중 하나입니다.

~~~
opt           extra software path in general
dbm           path for dbm library
gdbm          path for gdbm library
x11           ...for X11..
tk            ...for Tk...
tcl           ...for Tcl...
~~~

그리고 yyy는 다음 중 하나입니다.

~~~
dir           specifies -I DIR/include -L DIR/lib
include       specifies -I DIR
lib           specifies -L DIR
~~~

HP-UX에서는 `gcc`로 빌드하는 데 문제가 있을 수 있습니다. 대신 네이티브
컴파일러를 사용해 보세요. WATANABE Tetsuya는 다음 옵션을 추천합니다.

~~~
$ CC="cc -Ae" CFLAGS=-O ./configure --prefix=/opt/gnu
~~~

HP의 기본 `sed`에도 문제가 있을 수 있습니다. 그는 GNU 버전을 설치할
것을 권장합니다.

[ruby-talk:5041]: https://blade.ruby-lang.org/ruby-talk/5041

### 미리 컴파일된 바이너리를 사용할 수 있나요?

다양한 Windows 운영 체제에서 Ruby를 실행하는 데 필요한 모든 것이 포함된 단일
다운로드는 [RubyInstaller](https://rubyinstaller.org/)에서 제공합니다.

[Reuben Thomas](mailto:Reuben.Thomas@cl.cam.ac.uk)의 글입니다.

> 현재 v1.4.3의 Acorn RISC OS에 대한 포트가 있다고 언급할 수 있습니다.
> 제가 포트를 만들었고 유지 보수할 계획은 없지만
> 패치를 matz에 보냈으므로 나중 버전도 잘 컴파일될 수 있습니다.

### "cygwin", "mingw", "djgpp"는 다 뭐죠?

{% include faq-out-of-date.html %}

Ruby는 Unix 환경의 풍부한 기능 세트를 활용하도록 작성되었습니다.
안타깝게도 Windows에는 일부 기능이 누락되어 있고 다른 기능도 다르게 구현되어
있습니다. 따라서 Windows에서 Ruby(또는 기타 Unix 기반 프로그램)를 실행하려면
일종의 매핑 계층이 필요합니다.

서로 다른 래퍼 매핑 계층을 사용하는 다양한 버전의 Ruby 실행 파일을 발견할
수 있습니다.

rbdj 버전은 Ruby의 Windows 바이너리 중 독립 실행 버전입니다. 이 버전은 DJ
Delorie 도구를 사용합니다.
([http://www.delorie.com](http://www.delorie.com)).

rbcw 버전은 [http://www.cygwin.com](http://www.cygwin.com) 또는 Ruby 다운로드
페이지에서 제공하는 Cygwin 라이브러리가 필요한 Ruby의 Windows 바이너리입니다.
Cygwin은 에뮬레이션 계층이자 Cygnus Solutions(현재 Redhat의 일부)에서
처음 제작한 유틸리티 세트입니다. 대부분의 프로그래머는 Windows에서
가장 많은 기능을 제공하는 Ruby의 Cygwin 버전을 사용하기를 원할 것입니다.

rbcw 버전을 사용하려면 Cygwin의 .dll을 별도로 설치해야 합니다. 컴퓨터에 Cygwin을
설치한 후, Cygwin 배포의 `bin` 하위 디렉터리에 있는 `cygwin1.dll`을
`Windows\System32` 폴더(또는 PATH에 있는 다른 경로)에 복사합니다.

이 설명의 기초를 제공한 Anders Schneiderman에게 감사드립니다.

### Windows에서 Tk 그래픽이 작동하지 않는 이유는 무엇인가요?

{% include faq-out-of-date.html %}

Windows에 Tk가 올바르게 설치되었나요? <http://dev.scriptics.com/software/tcltk/>로
이동하여 해당 운영 체제에 대해 미리 컴파일된 Tcl/Tk 바이너리 배포판을 찾아보세요.

환경 변수 `TCL_LIBRARY` 및 `TK_LIBRARY`가 tcl 및 tk가 포함된 디렉터리를 가리키고
있습니까?

PATH에 tk 라이브러리가 있나요?
