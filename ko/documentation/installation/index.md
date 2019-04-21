---
layout: page
title: "루비 설치하기"
lang: ko
---

루비를 설치하고 관리할 수 있는 다양한 패키지 관리 시스템들과 서드파티 도구들이 있습니다.

{: .summary}

컴퓨터에 이미 루비가 설치되어 있을 수도 있습니다.
이를 확인하려면 [터미널][terminal]을 열고 다음 명령어를 입력하세요.

{% highlight sh %}
ruby -v
{% endhighlight %}

이 명령은 설치된 루비에 대한 정보를 알려줄 것입니다.

## 설치 방법 선택하기

루비를 설치하는 방법은 여럿 있습니다.

* UNIX-계열의 운영체제를 사용하신다면, 운영체제의
  **패키지 관리자**를 사용하는 게 가장 쉽습니다.
  하지만, 패키지의 루비는 보통 최신 버전이 아닙니다.
* **인스톨러**는 특정 버전이나 여러 버전을 설치하는데
  사용할 수 있습니다. Windows용 인스톨러도 있습니다.
* **관리자**는 시스템에 설치된 여러 루비 버전 간의
  전환을 도와줍니다.
* 마지막으로 **소스에서 빌드** 하실 수도 있습니다.

이 목록은 각 다른 요구사항과 플랫폼을 위한 주요 설치방법입니다.

* [패키지 관리 시스템](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [Windows WSL Ubuntu](#apt-wsl)
  * [CentOS, Fedora, RHEL](#yum)
  * [Snap](#snap)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [FreeBSD](#freebsd)
  * [OpenIndiana](#openindiana)
  * [다른 배포판](#other-systems)
* [인스톨러](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [RailsInstaller and Ruby Stack](#railsinstaller)
* [관리자](#managers)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [소스에서 빌드하기](#building-from-source)


## 패키지 관리 시스템(Package Management Systems)
{: #package-management-systems}

자신의 루비를 컴파일할 수 없고, 서드 파티 도구를 사용하고 싶지 않다면,
루비를 설치하기 위해 자신의 시스템의 패키지 관리자를 사용할 수 있습니다.

루비 커뮤니티의 일부 회원들은 루비를 설치할 때 패키지 관리자를 사용하지
말아야 하고, 대신 도구를 사용해야 한다고 느끼고 있습니다.

대부분의 패키지 관리자들은 오래된 버전의 루비를 설치합니다.
최신의 루비를 사용하고자 한다면, 패키지의 버전 번호가 올바른지 확인하거나
특정 [인스톨러][installers]를 사용하세요.

### apt (Debian이나 Ubuntu)
{: #apt}

Debian GNU/Linux와 Ubuntu는 apt 패키지 관리 시스템을 사용합니다.
다음과 같이 사용할 수 있습니다.

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

### apt (Windows WSL Ubuntu)
{: #apt-wsl}

Windows 10을 사용 중이라면 WSL을 통해 Linux Ubuntu OS를 사용할 수 있습니다.
또한 apt를 통해 루비를 사용할 수 있습니다.

다음 페이지에서 WSL을 설치하는 방법에 대해 알아보세요.

[Windows Subsystem for Linux Installation Guide for Windows 10](https://docs.microsoft.com/ko-kr/windows/wsl/install-win10)

다음과 같이 Linux OS와 동일하게 apt를 사용할 수 있습니다.

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

WSL에서 rbenv와 같은 루비 관리자를 사용하는 것도 가능합니다.

### yum (CentOS, Fedora, RHEL)
{: #yum}

CentOS, Fedora, RHEL은 yum 패키지 관리 시스템을 사용합니다.
다음과 같이 사용할 수 있습니다.

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

설치된 버전은 보통 그 특정 배포 버전 릴리스 시기의 최신 버전의 루비입니다.


### snap (Ubuntu나 다른 리눅스 배포판)
{: #snap}

Snap은 Canonical에 의해 개발된 패키지 매니저입니다. 이는 Ubuntu에서 바로 사용 가능합니다만, 다른 리눅스 배포판에서도 동작합니다.
다음과 같이 사용할 수 있습니다.

{% highlight sh %}
$ sudo snap install ruby --classic
{% endhighlight %}

루비의 마이너 시리즈를 위한 채널을 제공합니다. 예를 들어, 다음 명령은 루비 2.3으로 변경할 수 있게 해줍니다.

{% highlight sh %}
$ sudo snap switch ruby --channel=2.3/stable
$ sudo snap refresh
{% endhighlight %}


### portage (Gentoo)
{: #portage}

Gentoo는 portage 패키지 관리자를 사용합니다.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

특정 버전을 설치하려면, `make.conf`에 `RUBY_TARGETS`를 설정하세요.
더 자세한 정보는 [Gentoo 루비 프로젝트 웹 사이트][gentoo-ruby]를 확인하세요.


### pacman (Arch Linux)
{: #pacman}

Arch Linux는 pacman이라는 이름의 패키지 관리자를 사용합니다.
루비를 받으려면, 다음과 같이 하면 됩니다.

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

이는 루비의 최신 안정판을 설치할 것입니다.


### Homebrew (macOS)
{: #homebrew}

엘 캐피탄(10.11)부터 모하비(10.14)까지의 macOS 릴리스에서는 루비 2.0 이상이 포함되어 있습니다.

[Homebrew][homebrew]는 macOS에서 일반적으로 사용되는 패키지 관리자입니다.
Homebrew를 사용해 새로운 버전의 루비를 설치하는 것은 쉽습니다.

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

이 명령어는 최신 루비 버전을 설치할 것입니다.


### FreeBSD
{: #freebsd}

FreeBSD는 패키지와 소스로부터 설치하는 방법을 모두 제공합니다.
pkg를 이용하여 패키지를 설치할 수 있습니다:

{% highlight sh %}
$ pkg install ruby
{% endhighlight %}

[포트 컬렉션][freebsd-ports-collection]을 사용하여 루비를 소스로부터 설치
할 수 있습니다. 이는 설치 설정을 변경하고 싶을 때 유용합니다.

FreeBSD 상의 루비와 그 환경에 대해서 더 자세한 정보는
[FreeBSD Ruby Project 웹사이트][freebsd-ruby]에서 얻을 수 있습니다.


### OpenIndiana에서의 루비
{: #openindiana}

[OpenIndiana][openindiana]에서 루비를 설치하려면,
Image Packaging System (IPS) 클라이언트를 사용해 주십시오.
이것은 OpenSolaris 저장소로부터 최신
루비 바이너리와 RubyGems를 직접 받아 설치합니다. 아주 쉽습니다.

{% highlight sh %}
$ pkg install runtime/ruby
{% endhighlight %}

하지만, 서드파티 도구를 사용하는 것이 최신 버전의 루비를 얻는 더 좋은 방법입니다.


### 다른 배포판

다른 시스템에서는 자신의 Linux 배포 관리자를 위한 패키지 저장소를 검색할 수 있습니다.
아니면 [서드파티 인스톨러][installers]를 사용할 수도 있습니다.


## 인스톨러
{: #installers}

시스템이나 패키지 관리자에서 제공하는 루비가 구 버전이라면, 서드 파티 인스톨러를
사용해 새로운 버전의 루비를 설치할 수 있습니다.

어떤 인스톨러는 여러 버전의 루비를 같은 시스템에 설치하게 합니다.
관련된 관리자는 다른 루비 간의 전환을 도와줍니다.

[RVM](#rvm)을 버전 관리자로 사용할 계획이라면 포함되어 있으므로 별도의 인스톨러는
필요 없습니다.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build]는 다른 버전의 루비를 임의의 디렉터리에
컴파일하고 설치할 수 있게 하는 [rbenv](#rbenv)의 플러그인입니다.
ruby-build는 rbenv 없이 독자적으로 사용 할 수도 있습니다.
macOS, Linux나 다른 UNIX-계열 운영체제에서만 사용 가능합니다.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install]은 다른 버전의 루비를 임의의 디렉터리에
컴파일하고 설치할 수 있게 합니다. [chruby](#chruby)도 루비 버전을 변경하는
좋은 도구입니다.
macOS, Linux나 다른 UNIX-계열 운영체제에서만 사용 가능합니다.


### RubyInstaller
{: #rubyinstaller}

Windows에서는 [RubyInstaller][rubyinstaller]는 전체 루비 개발 환경을 설정하는데
필요한 모든 것을 제공합니다.

다운로드 받으시고 인스톨러를 실행하기만 하면 끝입니다!


### RailsInstaller와 Ruby Stack
{: #railsinstaller}

루비 온 레일즈를 사용하기 위해 루비를 설치하신다면 다음 인스톨러를 사용할 수 있습니다.

* [RailsInstaller][railsinstaller]는 [RubyInstaller][rubyinstaller]를
  사용하지만, 레일즈 개발을 도와줄 추가 도구들을 제공합니다. macOS, Windows를
  지원합니다.
* [Bitnami Ruby Stack][rubystack]는 루비 온 레일즈를 위한 완전한 개발환경을 제공합니다.
  macOS, Linux, Windows, 가상 머신, 클라우드 이미지를 지원합니다.


## 관리자

많은 루비스트들이 여러 버전의 루비를 관리하기 위해 루비 관리자를 사용합니다.
그들은 각 프로젝트에서 서로 다른 루비 버전을 사용할 수 있도록 간단하게 또는
자동으로 버전을 변경해주며 그 이외의 장점들이 있지만, 공식적으로 지원되는 것은 아닙니다.
하지만, 각각의 커뮤니티에서 도움을 구할 수 있습니다.


### chruby
{: #chruby}

[chruby][chruby]는 여러 루비들 간의 전환을 하게 합니다.
chruby는 [ruby-install](#ruby-install)로 설치된 루비뿐만
아니라 소스에서 빌드 된 루비도 관리할 수 있습니다.


### rbenv
{: #rbenv}

[rbenv][rbenv]는 여러 종류의 루비를 설치할 수 있게 합니다.
rbenv 자체는 루비 설치를 지원하지 않습니다만, [ruby-build](#ruby-build)라는
유명한 플러그인에서 루비를 설치할 수 있습니다.
rbenv, ruby-build 모두 macOS, Linux나 다른 UNIX-계열 운영체제에서 사용가능합니다.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm]은 시스템에 여러 종류의 루비를 설치하고 관리할 수 있게 해줍니다.
RVM은 다른 gemsets도 관리해 줍니다.
macOS, Linux나 다른 UNIX-계열 운영체제에서만 사용 가능합니다.


### uru
{: #uru}

[Uru][uru]는 macOS, Linux, Windows에서 여러 루비를 사용하게 하는 가벼운
멀티 플랫폼 커맨드 라인 툴입니다.


## 소스에서 빌드하기
{: #building-from-source}

물론, 소스로부터 루비를 설치할 수도 있습니다.
tarball을 [다운로드][download], 압축을 풀고 이 명령어를 입력하세요.

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

기본적으로, 이 명령어는 루비를 `/usr/local`에 설치합니다.
변경하시려면 `./configure` 스크립트에 `--prefix=DIR` 옵션을 넘기세요.

[루비 README 파일][readme]에서 소스로부터 루비를 설치하는 법에 관련된
추가 정보를 얻을 수 있습니다.

서드파티 도구나 패키지 관리자를 사용하시는 것이 더 좋습니다.
왜냐하면, 이렇게 설치된 루비는 어떤 도구로도 관리되지 않기 때문이죠.


[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: https://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[openindiana]: http://openindiana.org/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[freebsd-ruby]: https://wiki.freebsd.org/Ruby
[freebsd-ports-collection]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/ports-using.html
[homebrew]: http://brew.sh/
[terminal]: https://ko.wikipedia.org/wiki/%EB%8B%A8%EB%A7%90_%EC%97%90%EB%AE%AC%EB%A0%88%EC%9D%B4%ED%84%B0_%EB%AA%A9%EB%A1%9D
[download]: /ko/downloads/
[installers]: /ko/documentation/installation/#installers
[readme]: https://github.com/ruby/ruby#how-to-compile-and-install
