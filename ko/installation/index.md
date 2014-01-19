---
layout: page
title: "루비 설치하기"
lang: ko
---

루비를 설치할때 몇가지 도구를 사용할 수 있습니다.
이 페이지에서는 루비를 설치하고 관리하는 주요 패키지 관리 시스템들과 서드파티 도구들을 설명합니다.

## 시스템에 따라 설치 방법 선택하기

이 목록은 가능한 설치방법입니다.
편한 방법을 고르세요.

- OS X

  - [rbenv](#rbenv)
  - [RVM](#rvm)
  - [homebrew](#homebrew)
  - [소스에서 빌드하기](#building-from-source)

- Linux, UNIX

  - [rbenv](#rbenv)
  - [RVM](#rvm)
  - [패키지 관리 시스템](#package-management-systems)
  - [소스에서 빌드하기](#building-from-source)

- Windows

  - [RubyInstaller](#rubyinstaller)
  - [pik][pik]

<a name="third-party-tools">

## 서드파티 도구

많은 루비 사용자들이 루비를 설치할 때 서드파티 도구들을 이용하여 도움을 받고 있습니다.
그들은 다양한 장점을 부여하지만, 공식적으로 지원되는 것은 아닙니다.
하지만, 그들 각각의 커뮤니티는 매우 유용합니다.

<a name="rbenv">

### rbenv

rbenv는 여러 종류의 루비를 설치할 수 있게 합니다.

rbenv 자체는 루비 설치를 지원하지 않습니다만, ruby-build라는 유명한
플러그인에서 루비를 설치할 수 있습니다.

rbenv, ruby-build 모두 OS X, 리눅스, UNIX-계열 운영채제에서 사용가능합니다.

rbenv를 설치하는 가장 최신의 방법은, [rbenv 페이지][rbenv]에서 확인하십시오.

다음 단락에서 RVM이라는 비슷한 툴을 설명하겠습니다.
이쪽도 살펴보시고 편한쪽을 고르세요.

<a name="rvm">

### RVM ("Ruby Version Manager")

RVM은 시스템에 여러 종류의 루비를 설치하고 관리할 수 있게 해줍니다.
RVM은 맥 OS X, 리눅스, 그리고 UNIX-계열 운영체제에서만 사용 가능합니다.

RVM을 설치하는 가장 최신의 방법은, [rvm.io][rvm]에서 확인하십시오.

<a name="rubyinstaller">

### RubyInstaller

Windows를 사용하고 있다면, 루비 설치를 도와줄 훌륭한 프로젝트 [RubyInstaller][rubyinstaller]가 있습니다.
RubyInstaller는 Windows 환경에서 전체 루비 개발 환경을 설정하는데 필요한 모든 것을 제공합니다.

RubyInstaller를 사용하려면, [RubyInstaller 다운로드 페이지][rubyinstaller-downloads]에서 다운로드 받으십시오.
그런 다음 인스톨러를 실행하기만 하면, 모든 작업은 완료됩니다!


<a name="package-management-systems">

## 패키지 관리 시스템(Package Management Systems)

자신의 루비를 컴파일할 수 없고, 서드파티 도구를 사용하고 싶지 않다면, 루비를 설치하기 위해 자신의 시스템의
패키지 매니저를 사용할 수 있습니다.

루비 커뮤니티의 일부 회원들은 루비를 설치할 때 패키지 매니저를 사용하지 말아야 하고, 대신 도구를 사용해야 한다고 강하게 느끼고 있습니다.
장점과 단점의 전체 목록은 본 페이지의 범위 밖에 있는 것이지만, 가장 기본적인 이유는 대부분의 패키지 매니저들이 저장소에 오래된 버전의 루비를 보유하고 있기 때문입니다.
만약 최신의 루비를 사용하고자 한다면, 올바른 패키지 명을 사용했는지 확인하거나 대신 위에 기술된 도구를 사용하십시오.

여기에서는 다음 패키지 관리자에 대해 기술합니다.

- [apt (Debian or Ubuntu)](#apt)
- [yum (CentOS, Fedora, or RHEL)](#yum)
- [portage (Gentoo)](#gentoo)
- [pacman (Arch Linux)](#pacman)
- [Solaris, OpenIndiana](#solaris)

<a name="apt">

### apt (Debian 이나 Ubuntu)

Debian GNU/Linux 나 Ubuntu 는 apt 패키지 관리 시스템을 사용합니다.
다음과 같이 사용할 수 있습니다:

{% highlight sh %}
$ sudo apt-get install ruby
{% endhighlight %}

만약 `ruby` 패키지를 설치하면, Debian이나 Ubuntu의 배포본에 따라
오래된 루비 1.9.3을 얻게 될 수 있습니다.

### yum (CentOS, Fedora, RHEL)

CentOS, Fedora, RHEL은 yum 패키지 관리 시스템을 사용합니다.
다음과 같이 사용할 수 있습니다:

{% highlight sh %}
$ su -c "yum install ruby"
{% endhighlight %}

설치된 버전은 보통 그 Fedora의 릴리즈 시기의 최신 버전의 루비입니다.

<a name="portage">

### portage (Gentoo)

Gentoo 는 portage 패키지 메니져를 사용합니다.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

기본적으로, 이 명령어는 모든 가능한 버전(1.8, 1.9, 2.0)을 설치하려 합니다.
특정 버전을 설치하려면, `make.conf`에 `RUBY_TARGETS`를 설정하세요.
더 자세한 정보는 [Gentoo 루비 프로젝트 페이지][gentoo-ruby]를 확인하세요.

<a name="pacman">

### pacman (Arch Linux)

Arch Linux는 pacman이라는 이름의 패키지 매니저를 사용합니다. 루비를 얻으려면, 다음과 같이 하면 됩니다:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

<a name="homebrew">

### Homebrew (Mac OS X)

메버릭에서는 루비 2.0.0이 마운틴라이언, 라이언, 레오파드에서는 1.8.7을 탑재하여 출시되었습니다.

2.0과 1.8은 예전 버전이지만, 여기에 최신 버전의 루비를 설치할 수 있는 몇 가지 옵션이 있습니다.

대부분의 루비 커뮤니티의 OS X 유저는 서드파티 도구를 사용합니다. 하지만 몇가지의
루비를 지원하는 패키지 관리자가 있습니다.

Mac OS X Tiger는 루비 1.8.2를 탑재하여 패키징되었고 Leopard는 1.8.6를 탑재하여 출시되었습니다.
하지만, Leopard로 업그레이드 하지 않은 사용자들을 위해, 최신 버전의 루비를 설치할 수 있는 몇 가지 옵션이 있습니다.

많은 Mac OS X 사용자들은 패키지 매니저로 [Homebrew][homebrew]를 사용합니다.
루비를 얻는 방법은 정말로 쉽습니다.

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

또한, OS X는 Unix 기반이기 때문에, 소스를 다운로드 받고 설치하는 것은 다른 솔루션들과 마찬가지로 손쉽고 효과적입니다.
OS X에서 새로운 루비 버전을 설치하는 것을 돕기 위해, 서드파티 도구를 사용하는 것은 좋은 아이디어일 것입니다.

<a name="solaris">

### Solaris와 OpenIndiana 에서의 루비

Solaris 8에서 Solaris 10까지 [Sunfreeware][sunfreeware]에서 루비 1.8.7을 사용 가능하며
[Blastwave][blastwave]에서 루비 1.8.7을 사용 가능합니다.
[Sunfreeware][sunfreeware]에서 루비 1.9.2p0를 사용 가능하지만, 이것은 구버전입니다.
서드파티 도구를 사용하면 최신 버전의 루비를 얻을 수 있습니다.

[OpenIndiana][openindiana]에서 루비를 설치하려면, [Image Packaging System, 혹은 IPS][opensolaris-pkg]를 사용해 주십시오.
이것은 루비 1.9를 위한 OpenSolaris 네트워크 저장소로부터 최신 루비 바이너리와 루비젬을 직접 받아 설치합니다.
아주 쉽습니다:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

이전과 마찬가지로, 서드파티 도구는 최신 버전의 루비를 얻는 좋은 방법입니다.

<a name="other">


### 다른 배포판

다른 시스템에서는 자신의 리눅스 배포 매니저를 위한 패키지 저장소를 검색할 수 있습니다.
아니면 서드파티 도구가 당신을 위한 올바른 선택일 수 있습니다.

<a name="building-from-source">

## 소스에서 빌드하기

물론, 소스로부터 루비를 설치할 수도 있습니다.
타르볼을 다운로드, 압축해제하고 이 명령어를 입력하세요.

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

기본적으로, 이 명령어는 루비를 `/usr/local`에 설치합니다.
변경하시려면 `./configure` 스크립트에 `--prefix=DIR` 옵션을 넘기세요.

하지만, 서드파티 도구나 패키지 관리자를 사용하시는 것이 더 좋습니다.
왜냐하면, 이렇게 설치된 루비는 어떤 도구로도 관리되지 않기 때문이죠.


[rvm]: http://rvm.io/
[rbenv]: https://github.com/sstephenson/rbenv
[rubyinstaller]: http://rubyinstaller.org/
[pik]: https://github.com/vertiginous/pik
[sunfreeware]: http://www.sunfreeware.com
[blastwave]: http://www.blastwave.org
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[macosforge-ruby]: http://trac.macosforge.org/projects/ruby/wiki
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
