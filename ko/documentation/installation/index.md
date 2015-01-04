---
layout: page
title: "루비 설치하기"
lang: ko
---

루비를 설치할 때 몇 가지 도구를 사용할 수 있습니다.
이 페이지에서는 루비를 설치하고 관리하는 주요 패키지
관리 시스템들과 서드파티 도구들의 사용법과
소스에서 루비를 빌드하는 법을 설명합니다.
{: .summary}


## 설치 방법 선택하기

루비를 설치하는 방법은 여럿 있습니다.

* UNIX-계열의 운영체제를 사용하신다면, 운영체제의
  **패키지 관리자**를 사용하는 게 가장 쉽습니다.
  하지만, 패키지의 루비는 보통 최신 버전이 아닙니다.
* **인스톨러** 는 특정 버전이나 여러 버전을 설치하는데
  사용할 수 있습니다. Windows용 인스톨러도 있습니다.
* **관리자** 는 시스템에 설치된 여러 루비 버전 간의
  전환을 도와줍니다.
* 마지막으로 **소스에서 빌드** 하실 수도 있습니다.

이 리스트는 각 다른 요구사항과 플랫폼을 위한 주요 설치방법입니다.

* [패키지 관리 시스템](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [OS X](#homebrew)
  * [Solaris, OpenIndiana](#solaris)
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
말아야 하고, 대신 도구를 사용해야 한다고 강하게 느끼고 있습니다.
모든 장단점의 리스트는 이 페이지에서 설명할 내용이 아니지만, 가장 기본적인
이유는 대부분의 패키지 관리자들의 공식 저장소에는 오래된 버전의 루비가 있기
때문입니다.
최신의 루비를 사용하고자 한다면, 올바른 패키지 명을 사용했는지 확인하거나
밑에 설명할 도구를 사용하십시오.


### apt (Debian 이나 Ubuntu)
{: #apt}

Debian GNU/Linux와 Ubuntu는 apt 패키지 관리 시스템을 사용합니다.
다음과 같이 사용할 수 있습니다.

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

글을 쓰는 시점에서, `ruby-full` 패키지는 루비 1.9.3을 설치합니다.
이 버전은 Debian이나 Ubuntu의 오래된 안정 버전입니다.


### yum (CentOS, Fedora, RHEL)
{: #yum}

CentOS, Fedora, RHEL은 yum 패키지 관리 시스템을 사용합니다.
다음과 같이 사용할 수 있습니다.

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

설치된 버전은 보통 그 특정 배포 버전 릴리즈 시기의 최신 버전의 루비입니다.


### portage (Gentoo)
{: #portage}

Gentoo는 portage 패키지 관리자를 사용합니다.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

기본적으로, 이 명령어는 1.9와 2.0 버전을 설치하려 하지만, 더 많은 버전도
사용할 수 있습니다.
특정 버전을 설치하려면, `make.conf`에 `RUBY_TARGETS`를 설정하세요.
더 자세한 정보는 [Gentoo 루비 프로젝트 웹 사이트][gentoo-ruby]를 확인하세요.


### pacman (Arch Linux)
{: #pacman}

Arch Linux는 pacman이라는 이름의 패키지 관리자를 사용합니다.
루비를 받으려면, 다음과 같이 하면 됩니다.

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}


### Homebrew (OS X)
{: #homebrew}

OS X 요세미티, 매버릭스에는 루비 2.0이 포함되어 있습니다.
OS X 마운틴 라이언, 라이언, 스노 레퍼드는 루비 1.8.7을
탑재하여 출시되었습니다.

많은 OS X 사용자들은 패키지 관리자로 [Homebrew][homebrew]를 사용합니다.
Homebrew를 사용해 새로운 버전의 루비를 얻는 방법은 정말로 쉽습니다.

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

이 명령어는 최신 루비 버전을 설치할 것입니다.


### Solaris와 OpenIndiana 에서의 루비
{: #solaris}

Solaris 8에서 Solaris 10까지 [Sunfreeware][sunfreeware]에서 루비 1.8.7을 사용 가능하며
[Blastwave][blastwave]에서 루비 1.8.7을 사용 가능합니다.
[Sunfreeware][sunfreeware]에서 루비 1.9.2p0을 사용 가능하지만, 이는 구 버전입니다.
서드파티 도구를 사용하면 최신 버전의 루비를 얻을 수 있습니다.

[OpenIndiana][openindiana]에서 루비를 설치하려면,
[Image Packaging System (IPS)][opensolaris-pkg]클라이언트를 사용해 주십시오.
이것은 루비 1.9를 위한 OpenSolaris 네트워크 저장소로부터 최신
루비 바이너리와 루비젬을 직접 받아 설치합니다. 아주 쉽습니다.

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

하지만, 서드파티 도구를 사용하는 것이 최신 버전의 루비를 얻는 더 좋은 방법입니다.


### 다른 배포판

다른 시스템에서는 자신의 Linux 배포 관리자를 위한 패키지 저장소를 검색할 수 있습니다.
아니면 서드파티 도구가 당신을 위한 올바른 선택일 수 있습니다.


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
ruby-build는 rbenv없이 독자적으로 사용 할 수도 있습니다.
맥 OS X, Linux나 다른 UNIX-계열 운영체제에서만 사용 가능합니다.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install]은 다른 버전의 루비를 임의의 디렉토리에
컴파일하고 설치할 수 있게 합니다.
루비 버전을 전환하는 [chruby](#chruby)와 형제 관계입니다.
맥 OS X, Linux나 다른 UNIX-계열 운영체제에서만 사용 가능합니다.


### RubyInstaller
{: #rubyinstaller}

Windows를 사용하고 있다면, 루비 설치를 도와줄 훌륭한 프로젝트 [RubyInstaller][rubyinstaller]
가 있습니다. RubyInstaller는 Windows 환경에서 전체 루비 개발 환경을 설정하는데 필요한 모든
것을 제공합니다.

다운로드 받으시고 인스톨러를 실행하기만 하면 끝입니다!


### RailsInstaller와 Ruby Stack
{: #railsinstaller}

루비온레일즈를 사용하기 위해 루비를 설치하신다면 다음 인스톨러를 사용할 수 있습니다.

* [RailsInstaller][railsinstaller]는 RubyInstaller를 사용하지만, 레일즈 개발을
  도와줄 추가 도구들을 제공합니다.
  OS X, Windows를 지원합니다.
* [Bitnami Ruby Stack][rubystack]는 루비온레일즈를 위한 완전한 개발환경을 제공합니다.
  OS X, Linux, Windows, 가상머신, 클라우드 이미지를 지원합니다.


## 관리자

많은 루비스트들이 여러 버전의 루비를 관리하기 위해 루비 관리자를 사용합니다.
그들은 다양한 장점을 부여하지만, 공식적으로 지원되는 것은 아닙니다.
하지만, 그들 각각의 커뮤니티는 매우 유용합니다.


### chruby
{: #chruby}

[chruby][chruby] 는 여러 루비들 간의 전환을 하게 합니다.
chruby는 [ruby-install](#ruby-install)로 설치된 루비 뿐만
아니라 소스에서 빌드 된 루비도 관리할 수 있습니다.


### rbenv
{: #rbenv}

[rbenv][rbenv]는 여러 종류의 루비를 설치할 수 있게 합니다.
rbenv 자체는 루비 설치를 지원하지 않습니다만, [ruby-build](#ruby-build)라는
유명한 플러그인에서 루비를 설치할 수 있습니다.
rbenv, ruby-build 모두 맥 OS X, Linux나 다른 UNIX-계열 운영체제에서 사용가능합니다.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm]은 시스템에 여러 종류의 루비를 설치하고 관리할 수 있게 해줍니다.
RVM은 다른 gemsets도 관리 해 줍니다.
맥 OS X, Linux나 다른 UNIX-계열 운영체제에서만 사용 가능합니다.


## uru
{: #uru}

[Uru][uru]는 OS X, Linux, Windows에서 여러 루비를 사용하게 하는 가벼운
멀티 플랫폼 커맨드 라인 툴입니다.


## 소스에서 빌드하기
{: #building-from-source}

물론, 소스로부터 루비를 설치할 수도 있습니다.
타르볼을 [다운로드](/ko/downloads/), 압축을 풀고 이 명령어를 입력하세요.

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

기본적으로, 이 명령어는 루비를 `/usr/local`에 설치합니다.
변경하시려면 `./configure` 스크립트에 `--prefix=DIR` 옵션을 넘기세요.

서드파티 도구나 패키지 관리자를 사용하시는 것이 더 좋습니다.
왜냐하면, 이렇게 설치된 루비는 어떤 도구로도 관리되지 않기 때문이죠.


[rvm]: http://rvm.io/
[rbenv]: https://github.com/sstephenson/rbenv#readme
[ruby-build]: https://github.com/sstephenson/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: http://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[sunfreeware]: http://www.sunfreeware.com
[blastwave]: http://www.blastwave.org
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
