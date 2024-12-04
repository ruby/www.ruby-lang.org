---
layout: page
title: "Ruby 설치하기"
lang: ko
---

Ruby를 설치하고 관리할 수 있는 다양한 패키지 관리 시스템들과 서드파티 도구들이 있습니다.

{: .summary}

컴퓨터에 이미 Ruby가 설치되어 있을 수도 있습니다.
이를 확인하려면 [터미널][terminal]을 열고 다음 명령어를 입력하세요.

{% highlight sh %}
ruby -v
{% endhighlight %}

이 명령은 설치된 Ruby에 대한 정보를 알려줄 것입니다.

## 설치 방법 선택하기

Ruby를 설치하는 방법은 여럿 있습니다.

* UNIX-계열의 운영체제를 사용하신다면, 운영체제의
  **패키지 관리자**를 사용하는 게 가장 쉽습니다.
  하지만, 패키지의 Ruby는 보통 최신 버전이 아닙니다.
* **인스톨러**는 특정 버전이나 여러 버전을 설치하는데
  사용할 수 있습니다. Windows용 인스톨러도 있습니다.
* **관리자**는 시스템에 설치된 여러 Ruby 버전 간의
  전환을 도와줍니다.
* 마지막으로 **소스에서 빌드** 하실 수도 있습니다.

Windows 10을 사용 중이라면 [Windows Subsystem for Linux][wsl]를 사용하여
지원되는 Linux 배포판 중 하나를 설치하고, 해당 시스템에 맞는 설치 방법을
사용할 수 있습니다.

이 목록은 각 다른 요구사항과 플랫폼을 위한 주요 설치방법입니다.

* [패키지 관리 시스템](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Snap](#snap)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [FreeBSD](#freebsd)
  * [OpenBSD](#openbsd)
  * [OpenIndiana](#openindiana)
  * [Windows 패키지 관리자](#winget)
  * [Chocolatey 패키지 관리자](#chocolatey)
  * [다른 배포판](#other-systems)
* [인스톨러](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [Ruby Stack](#rubystack)
* [관리자](#managers)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [rbenv for Windows](#rbenv-for-windows)
  * [RVM](#rvm)
  * [uru](#uru)
* [소스에서 빌드하기](#building-from-source)


## 패키지 관리 시스템(Package Management Systems)
{: #package-management-systems}

자신의 Ruby를 컴파일할 수 없고, 서드 파티 도구를 사용하고 싶지 않다면,
Ruby를 설치하기 위해 자신의 시스템의 패키지 관리자를 사용할 수 있습니다.

Ruby 커뮤니티의 일부 회원들은 Ruby를 설치할 때 패키지 관리자를 사용하지
말아야 하고, 대신 도구를 사용해야 한다고 느끼고 있습니다.

대부분의 패키지 관리자들은 오래된 버전의 Ruby를 설치합니다.
최신의 Ruby를 사용하고자 한다면, 패키지의 버전 번호가 올바른지 확인하거나
특정 [인스톨러][installers]를 사용하세요.

### apt (Debian이나 Ubuntu)
{: #apt}

Debian GNU/Linux와 Ubuntu는 apt 패키지 관리 시스템을 사용합니다.
다음과 같이 사용할 수 있습니다.

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

### yum (CentOS, Fedora, RHEL)
{: #yum}

CentOS, Fedora, RHEL은 yum 패키지 관리 시스템을 사용합니다.
다음과 같이 사용할 수 있습니다.

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

설치된 버전은 보통 그 특정 배포 버전 릴리스 시기의 최신 버전의 Ruby입니다.


### snap (Ubuntu나 다른 리눅스 배포판)
{: #snap}

Snap은 Canonical에 의해 개발된 패키지 매니저입니다. 이는 Ubuntu에서 바로 사용 가능합니다만, 다른 리눅스 배포판에서도 동작합니다.
다음과 같이 사용할 수 있습니다.

{% highlight sh %}
$ sudo snap install ruby --classic
{% endhighlight %}

Ruby의 마이너 시리즈를 위한 채널을 제공합니다. 예를 들어, 다음 명령은 Ruby 2.3으로 변경할 수 있게 해줍니다.

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
더 자세한 정보는 [Gentoo Ruby 프로젝트 웹 사이트][gentoo-ruby]를 확인하세요.


### pacman (Arch Linux)
{: #pacman}

Arch Linux는 pacman이라는 이름의 패키지 관리자를 사용합니다.
Ruby를 받으려면, 다음과 같이 하면 됩니다.

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

이는 Ruby의 최신 안정판을 설치할 것입니다.


### Homebrew (macOS)
{: #homebrew}

엘 캐피탄(10.11)부터 모하비(10.14)까지의 macOS 릴리스에서는 Ruby 2.0 이상이 포함되어 있습니다.

[Homebrew][homebrew]는 macOS에서 일반적으로 사용되는 패키지 관리자입니다.
Homebrew를 사용해 새로운 버전의 Ruby를 설치하는 것은 쉽습니다.

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

이 명령어는 최신 Ruby 버전을 설치할 것입니다.


### FreeBSD
{: #freebsd}

FreeBSD는 패키지와 소스로부터 설치하는 방법을 모두 제공합니다.
pkg를 이용하여 패키지를 설치할 수 있습니다:

{% highlight sh %}
$ pkg install ruby
{% endhighlight %}

[포트 컬렉션][freebsd-ports-collection]을 사용하여 Ruby를 소스로부터 설치
할 수 있습니다. 이는 설치 설정을 변경하고 싶을 때 유용합니다.

FreeBSD 상의 Ruby와 그 환경에 대해서 더 자세한 정보는
[FreeBSD Ruby Project 웹사이트][freebsd-ruby]에서 얻을 수 있습니다.


### OpenBSD
{: #openbsd}

OpenBSD와 그 배포판인 adJ에는 3개의 Ruby 메이저 버전의 패키지가 있습니다.
다음 명령을 통해 설치 가능한 버전을 확인하고 설치할 수 있습니다.

{% highlight sh %}
$ doas pkg_add ruby
{% endhighlight %}

각 버전의 바이너리는 다른 이름(예: `ruby27`, `ruby26`)을 가지고 있으므로
동시에 여러 메이저 버전을 설치할 수 있습니다.

가장 최신의 Ruby 버전이 릴리스된 며칠 후면 OpenBSD 포트 컬렉션의 `HEAD` 브랜치에
이 플랫폼을 위한 Ruby 버전이 추가되어 있을 것입니다.
[가장 최신의 포트 컬렉션의 lang/ruby 디렉터리][openbsd-current-ruby-ports]를 확인하세요.


### OpenIndiana에서의 Ruby
{: #openindiana}

[OpenIndiana][openindiana]에서 Ruby를 설치하려면,
Image Packaging System (IPS) 클라이언트를 사용해 주십시오.
이것은 OpenSolaris 저장소로부터 최신
Ruby 바이너리와 RubyGems를 직접 받아 설치합니다. 아주 쉽습니다.

{% highlight sh %}
$ pkg install runtime/ruby
{% endhighlight %}

하지만, 서드파티 도구를 사용하는 것이 최신 버전의 Ruby를 얻는 더 좋은 방법입니다.

### Windows 패키지 관리자
{: #winget}

Windows에서 [Windows 패키지 관리자 CLI](https://github.com/microsoft/winget-cli)를
사용해서 Ruby를 설치할 수 있습니다.

{% highlight ps1 %}
> winget install RubyInstallerTeam.Ruby.{MAJOR}.{MINOR}
# 예시
> winget install RubyInstallerTeam.Ruby.3.2
# 사용 가능한 버전 목록
> winget search RubyInstallerTeam.Ruby
# 주의: 프로젝트에 사용할 Ruby를 설치하는 경우, RubyWithDevKit을 설치할 수 있음
> winget install RubyInstallerTeam.RubyWithDevKit.3.2
{% endhighlight %}

### Chocolatey 패키지 관리자
{: #chocolatey}

또한 Windows에서 [Chocolatey 패키지 관리자](https://chocolatey.org/install)를
사용해서 Ruby를 설치할 수 있습니다.

{% highlight sh %}
> choco install ruby
{% endhighlight %}

`msys2`가 이미 설치되어 있다면 이를 그대로 사용하고, 아니면 완전한 Ruby 개발
환경을 위해서 새로 설치합니다.

### 다른 배포판

다른 시스템에서는 자신의 Linux 배포 관리자를 위한 패키지 저장소를 검색할 수 있습니다.
아니면 [서드파티 인스톨러][installers]를 사용할 수도 있습니다.


## 인스톨러
{: #installers}

시스템이나 패키지 관리자에서 제공하는 Ruby가 구 버전이라면, 서드 파티 인스톨러를
사용해 새로운 버전의 Ruby를 설치할 수 있습니다.

어떤 인스톨러는 여러 버전의 Ruby를 같은 시스템에 설치하게 합니다.
관련된 관리자는 다른 Ruby 간의 전환을 도와줍니다.

[RVM](#rvm)을 버전 관리자로 사용할 계획이라면 포함되어 있으므로 별도의 인스톨러는
필요 없습니다.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build]는 다른 버전의 Ruby를 임의의 디렉터리에
컴파일하고 설치할 수 있게 하는 [rbenv](#rbenv)의 플러그인입니다.
ruby-build는 rbenv 없이 독자적으로 사용 할 수도 있습니다.
macOS, Linux나 다른 UNIX-계열 운영체제에서만 사용 가능합니다.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install]은 다른 버전의 Ruby를 임의의 디렉터리에
컴파일하고 설치할 수 있게 합니다. [chruby](#chruby)도 Ruby 버전을 변경하는
좋은 도구입니다.
macOS, Linux나 다른 UNIX-계열 운영체제에서만 사용 가능합니다.


### RubyInstaller
{: #rubyinstaller}

Windows에서는 [RubyInstaller][rubyinstaller]는 전체 Ruby 개발 환경을 설정하는데
필요한 모든 것을 제공합니다.

다운로드 받으시고 인스톨러를 실행하기만 하면 끝입니다!


### Ruby Stack
{: #rubystack}

Ruby on Rails를 사용하기 위해 Ruby를 설치하신다면 다음 인스톨러를 사용할 수 있습니다.

* [Bitnami Ruby Stack][rubystack]는 Ruby on Rails를 위한 완전한 개발환경을 제공합니다.
  macOS, Linux, Windows, 가상 머신, 클라우드 이미지를 지원합니다.


## 관리자

많은 루비스트들이 여러 버전의 Ruby를 관리하기 위해 Ruby 관리자를 사용합니다.
각 프로젝트에서 서로 다른 Ruby 버전을 사용할 수 있도록 간단하게 또는
자동으로 버전을 변경해주며 그 이외의 장점들이 있지만, 공식적으로 지원되는 것은 아닙니다.
하지만, 각각의 커뮤니티에서 도움을 구할 수 있습니다.

### asdf-vm

{: #asdf-vm}

[asdf-vm][asdf-vm]은 프로젝트 단위로 여러 언어 런타임 버전을 관리할 수 있는
확장 가능한 버전 관리자입니다. Ruby를 설치하려면 [asdf-ruby][asdf-ruby]
플러그인이 필요합니다(이는 [ruby-build](#ruby-build)를 사용합니다).


### chruby
{: #chruby}

[chruby][chruby]는 여러 Ruby 간의 전환을 하게 합니다.
chruby는 [ruby-install](#ruby-install)로 설치된 Ruby뿐만
아니라 소스에서 빌드 된 Ruby도 관리할 수 있습니다.


### rbenv
{: #rbenv}

[rbenv][rbenv]는 여러 종류의 Ruby를 설치할 수 있게 합니다.
rbenv 자체는 Ruby 설치를 지원하지 않습니다만, [ruby-build](#ruby-build)라는
유명한 플러그인에서 Ruby를 설치할 수 있습니다.
rbenv, ruby-build 모두 macOS, Linux나 다른 UNIX-계열 운영체제에서 사용가능합니다.

### rbenv for Windows
{: #rbenv-for-windows}

[rbenv for Windows][rbenv-for-windows]는 Windows에서 여러 종류의 Ruby를 설치하고
관리할 수 있도록 합니다. 이는 PowerShell로 작성되었으므로 Windows에서 Ruby를
이용하는 사용자들에게 자연스러운 수단을 제공합니다. 또한 커맨드 라인 인터페이스는
UNIX-계열 운영체제의 [rbenv][rbenv]와 호환됩니다.

### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm]은 시스템에 여러 종류의 Ruby를 설치하고 관리할 수 있게 해줍니다.
RVM은 다른 gemset도 관리해 줍니다.
macOS, Linux나 다른 UNIX-계열 운영체제에서만 사용 가능합니다.


### RVM 4 Windows
{: #rvm-windows}

[RVM 4 Windows][rvm-windows] allows you to install and manage multiple
installations of Ruby on Windows. It is a clone of the original RVM and
supports the classic command line as well as Powershell by providing
the same command line interface as the original RVM.


### uru
{: #uru}

[Uru][uru]는 macOS, Linux, Windows에서 여러 Ruby를 사용하게 하는 가벼운
멀티 플랫폼 커맨드 라인 툴입니다.


## 소스에서 빌드하기
{: #building-from-source}

물론, 소스로부터 Ruby를 설치할 수도 있습니다.
tarball을 [다운로드][download], 압축을 풀고 이 명령어를 입력하세요.

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

기본적으로, 이 명령어는 Ruby를 `/usr/local`에 설치합니다.
변경하시려면 `./configure` 스크립트에 `--prefix=DIR` 옵션을 넘기세요.

[Ruby 빌드하기 문서][building-ruby]에서 소스로부터 Ruby를 설치하는 법에 관련된
추가 정보를 얻을 수 있습니다.

서드파티 도구나 패키지 관리자를 사용하시는 것이 더 좋습니다.
왜냐하면, 이렇게 설치된 Ruby는 어떤 도구로도 관리되지 않기 때문이죠.


[rvm]: http://rvm.io/
[rvm-windows]: https://github.com/magynhard/rvm-windows#readme
[rbenv]: https://github.com/rbenv/rbenv#readme
[rbenv-for-windows]: https://github.com/RubyMetric/rbenv-for-windows#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: https://rubyinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[openindiana]: http://openindiana.org/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[freebsd-ruby]: https://wiki.freebsd.org/Ruby
[freebsd-ports-collection]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/ports-using.html
[homebrew]: http://brew.sh/
[terminal]: https://ko.wikipedia.org/wiki/%EB%8B%A8%EB%A7%90_%EC%97%90%EB%AE%AC%EB%A0%88%EC%9D%B4%ED%84%B0_%EB%AA%A9%EB%A1%9D
[download]: /ko/downloads/
[installers]: /ko/documentation/installation/#installers
[building-ruby]: https://github.com/ruby/ruby/blob/master/doc/contributing/building_ruby.md
[wsl]: https://docs.microsoft.com/ko-kr/windows/wsl/about
[asdf-vm]: https://asdf-vm.com/
[asdf-ruby]: https://github.com/asdf-vm/asdf-ruby
[openbsd-current-ruby-ports]: https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/lang/ruby/?only_with_tag=HEAD
