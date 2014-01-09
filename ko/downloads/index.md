---
layout: page
title: "Ruby 다운로드"
lang: ko
---

자신이 선호하는 방식으로 최신 루비 배포판을 설치할 수 있습니다.
현재 안정 버전은 {{ site.downloads.stable.version }} 입니다.
[Ruby 라이센스]({{ site.license.url }})를 읽어 보십시오.
{: .summary}

### 루비를 설치하는 세 가지 방법

여러가지 방법으로 루비를 얻을 수 있으며, 사람들은 각자 다른 이유로 세 가지 방법 중 한 가지를 선호합니다.
각각의 방법은 아래 별도의 섹션에 설명되어 있습니다. 개요는 아래와 같습니다.

* **소스로부터 컴파일하기** 는 오랜 기간동안 소브트웨어를 전달해 온 표준 방법입니다.
  이 방법은 다수의 소프트웨어 개발자들에게 가장 친숙한 방법일 것입니다.
* 루비를 설치하기 위한 몇몇 **서드파티 도구들** 이 있습니다.
  이들은 완전 초심자 혹은 가장 숙련된 사용자들을 위해 설치과정을 단순화해줍니다.
* 마지막으로, 몇몇 **패키지 관리 시스템** 이 루비를 지원합니다.
  이것은 전체 시스템에서 단일 운영체제를 사용하고 단일 표준을 지키고자 하는 사람들에게 가장 친숙한 방법일 것입니다.

마지막으로, 동일 머신에서 여러 버전의 루비를 실행하고자 한다면, **서드파티 도구** 섹션을 점검하시고 RVM을 사용하십시오.
이것은 정확하게 자신이 어떤 일을 하는지 알지 못하더라도, 해당 목표를 성취하는데 훨씬 좋은 방법입니다.

### 루비 컴파일하기 - 소스 코드

소스 코드로 설치하기는 당신이 자신의 플랫폼에 충분히 익숙하고 자신의 환경을 위한 특정한 설정이 필요할 때 훌륭한 솔루션입니다.
또한 이 방법은 자신의 플랫폼을 위해 미리 만들어진 패키지가 없을 때 좋은 솔루션입니다.

만약 루비를 컴파일할 때 문제가 있다면, 다음 섹션에 소개하는 서드파티 도구 중 하나를 이용해볼 것을 고려해 보십시오.
도움이 될 것입니다.

* [Ruby {{ site.downloads.stable.version }}][1]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }}) 안정버전
* [Ruby {{ site.downloads.previous.version }}][2]
  (md5:&nbsp;{{ site.downloads.previous.md5.gz }}) 이전버전
* [Stable Snapshot][3] 안정 브랜치 (ruby\_2\_0\_0)의 최신 스냅샷을 타르볼로 압축한 것.
* [Nightly Snapshot][4] 나이틀리로 제작된 SVN 상의 모든 것을 타르볼로 압축한 것.
  본 스냅샷은 버그 혹은 기타 이슈를 포함하고 있을 수 있으니 주의하여 사용하십시오!

루비 서브버전과 Git 저장소에 대한 정보는, [Ruby Core](/en/community/ruby-core/) 페이지를 읽어 보십시오.

### 미러 사이트

루비 소스는 전세계의 미러 사이트에서 사용하실 수 있습니다.
자신과 가까운 곳의 미러를 이용해 주십시오.

#### HTTP 경유 미러 사이트

* [CDN][mirror-http-cdn] (fastly.com)
* [Japan 1][mirror-https-jp] (Master) - HTTPS
* Japan 2 (RingServer)
  * [shibaura-it.ac.jp][mirror-http-jp-ring-shibaura-it]
  * [tohoku.ac.jp][mirror-http-jp-ring-tohoku]
  * [u-toyama.ac.jp][mirror-http-jp-ring-u-toyama]
  * [yamanashi.ac.jp][mirror-http-jp-ring-yamanashi]
  * [airnet.ne.jp][mirror-http-jp-ring-airnet]
  * [maffin.ad.jp][mirror-http-jp-ring-maffin]
* [Britain][mirror-http-uk] (The Mirror Service)
* [Germany][mirror-http-de] (AmbiWeb GmbH)
* [Belgium][mirror-http-be] (Easynet)
* [Denmark][mirror-http-dk] (sunsite.dk)
* [Holland][mirror-http-nl] (XS4ALL) - only release packages
* [USA 1][mirror-http-us1] (ibiblio.org)
* [USA 2][mirror-http-us2] (lcs.mit.edu)
* [USA 3][mirror-http-us3] (binarycode.org)
* [USA 4][mirror-http-us4] (online-mirror.org)
* [USA 5][mirror-http-us5] (trexle.com)
* [Austria][mirror-http-at] (tuwien.ac.at)
* [Taiwan 1][mirror-http-tw1] (cdpa.nsysu.edu.tw)
* [Taiwan 2][mirror-http-tw2] (ftp.cs.pu.edu.tw)
* [China][mirror-http-cn] (ruby.taobao.org)

#### FTP 경유 미러 사이트

* [Japan 1][mirror-ftp-jp1] (Master: ruby-lang.org)
* Japan 2 (RingServer)
  * [shibaura-it.ac.jp][mirror-ftp-jp-ring-shibaura-it]
  * [tohoku.ac.jp][mirror-ftp-jp-ring-tohoku]
  * [u-toyama.ac.jp][mirror-ftp-jp-ring-u-toyama]
  * [yamanashi.ac.jp][mirror-ftp-jp-ring-yamanashi]
  * [airnet.ne.jp][mirror-ftp-jp-ring-airnet]
  * [maffin.ad.jp][mirror-ftp-jp-ring-maffin]
* [Japan 3][mirror-ftp-jp3] (IIJ)
* [South Korea][mirror-ftp-kr] (Korea FreeBSD Users Group)
* [Britain][mirror-ftp-uk] (The Mirror Service)
* [Germany][mirror-ftp-de] (FU Berlin)
* [Belgium][mirror-ftp-be] (Easynet)
* [Russia][mirror-ftp-ru] (ChgNet)
* [Greece][mirror-ftp-gr] (ntua.gr)
* [Denmark][mirror-ftp-dk] (sunsite.dk)
* [USA 1][mirror-ftp-us1] (ibiblio.org)
* [USA 2][mirror-ftp-us2] (lcs.mit.edu)
* [Austria][mirror-ftp-at] (tuwien.ac.at)
* [Taiwan 1][mirro-ftp-tw1] (cdpa.nsysu.edu.tw)
* [Taiwan 2][mirror-ftp-tw2] (ftp.cs.pu.edu.tw)
* [Canada][mirror-ftp-ca] (mirror.cs.mun.ca)

#### rsync 경유 미러 사이트

* rsync://rsync.mirrorservice.org/ftp.ruby-lang.org/pub/ruby/ (Britain)
* rsync://sunsite.dk/ftp/mirrors/ruby/ (Denmark)
* rsync://gd.tuwien.ac.at/languages/ruby/ (Austria)
* rsync://mirror.cs.mun.ca/ruby/ (Canada)
* rsync://ftp.cs.pu.edu.tw/Ruby/ (Taiwan)

### 서드파티 도구

많은 루비 사용자들이 루비를 설치할 때 서드파티 도구들을 이용하여 도움을 받고 있습니다.
그들은 다양한 장점을 부여하지만, 공식적으로 지원되는 것은 아닙니다.
하지만, 그들 각각의 커뮤니티는 매우 유용합니다.

#### RVM

루비를 설치하는 가장 유명한 도구는 **RVM** (“Ruby Version Manager”) 입니다.
RVM은 루비 설치를 믿을 수 없을만큼 쉽게 해줄 뿐만 아니라, 당신의 시스템에 루비의 여러 다른 구현을 포함, 여러 카피의 루비를 설치하고 관리할 수 있게 해줍니다.

RVM은 맥 OS X, 리눅스, 그리고 UNIX-계열 운영체제에서만 사용 가능합니다.
윈도 사용자는 유사한 프로젝트인 [pik][5]를 검토하거나, 다음 섹션에서 기술할 RubyInstaller 사용을 고려해야 합니다.

본 글을 쓰는 시점에서, 당신은 다음과 같이 RVM을 설치할 수 있어야 합니다:

{% highlight sh %}
$ \curl -L https://get.rvm.io | bash -s stable --ruby
{% endhighlight %}

RVM을 설치하는 가장 최신의 방법은, [the RVM installation page][7]에서 확인하십시오.
위의 명령은 RVM과 최신 버전의 루비를 함께 설치합니다.
RVM은 또한 아래 나열된 루비 구현체의 대부분을 설치할 수 있습니다.
지원하는 모든 버전을 확인하려면, `rvm list known`를 입력하십시오.

#### RubyInstaller

만약 윈도를 사용하고 있다면, 루비 설치를 도와줄 훌륭한 프로젝트 [RubyInstaller][8]가 있습니다.
이것은 윈도 환경에서 전체 루비 개발 환경을 설정하는데 필요한 모든 것을 제공합니다.

RubyInstaller를 사용하려면, [RubyInstaller 다운로드 페이지][9]에서 다운로드 받으십시오.
그런 다음 인스톨러를 실행하기만 하면, 모든 작업은 완료됩니다!

만약 레일스를 사용하고자 루비를 설치하려면, [RailsInstaller][10]를 사용해야 합니다.
RailsInstaller는 RubyInstaller를 사용하지만 레일스 개발을 돕는 추가 도구를 제공합니다.

### 패키지 관리 시스템(Package Management Systems)

자신의 루비를 컴파일할 수 없고, 서드파티 도구를 사용하고 싶지 않다면, 루비를 설치하기 위해 자신의 시스템의
패키지 매니저를 사용할 수 있습니다.

루비 커뮤니티의 일부 회원들은 루비를 설치할 때 패키지 매니저를 사용하지 말아야 하고, 대신 RVM을 새용해야 한다고 강하게 느끼고 있습니다.
장점과 단점의 전체 목록은 본 페이지의 범위 밖에 있는 것이지만, 가장 기본적인 이유는 대부분의 패키지 매니저들이 저장소에 오래된 버전의 루비를 보유하고 있기 때문입니다.
만약 최신의 루비를 사용하고자 한다면, 올바른 패키지 명을 사용했는지 확인하거나 대신 RVM을 사용하십시오.

#### Linux에서의 루비

Debian GNU/Linux 나 Ubuntu 는 apt 패키지 관리 시스템을 사용합니다.
다음과 같이 사용할 수 있습니다:

{% highlight sh %}
$ sudo apt-get install ruby1.9.1
{% endhighlight %}

이 명령은 1.9.2 혹은 더 최신의 루비를 설치합니다. 이것은 1.9.1의 ‘라이브러리 호환 버전’을 갖고 있기 때문에, 이름이 그렇게 된 것입니다.

만약 ‘ruby’ 패키지를 설치하면, 배포본에 따라 오래된 루비 1.8을 얻게 될 수 있습니다.

Arch Linux는 pacman이라는 이름의 패키지 매니저를 사용합니다. 루비를 얻으려면, 다음과 같이 하면 됩니다:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

다른 시스템에서는 자신의 리눅스 배포 매니저를 위한 패키지 저장소를 검색할 수 있습니다.
아니면 RVM이 당신을 위한 올바른 선택일 수 있습니다.

#### Mac OS X에서의 루비

Mac OS X Lion에서는 많은 유명 루비 젬들(패키지)은 물론 루비 1.8.7이 완전히 지원됩니다.
세부정보는 [Ruby wiki at Mac OS Forge][11]를 읽어 보십시오.

Mac OS X Tiger는 루비 1.8.2를 탑재하여 패키징되었고 Leopard는 1.8.6를 탑재하여 출시되었습니다.
하지만, Leopard로 업그레이드 하지 않은 사용자들을 위해, 최신 버전의 루비를 설치할 수 있는 몇 가지 옵션이 있습니다.

많은 Mac OS X 사용자들은 패키지 매니저로 [Homebrew][12]를 사용합니다.
루비를 얻는 방법은 정말로 쉽습니다.

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

또한, OS X는 Unix 기반이기 떄문에, 소스를 다운로드 받고 설치하는 것은 다른 솔루션들과 마찬가지로 손쉽고 효과적입니다.
OS X에서 새로운 루비 버전을 설치하는 것을 돕기 위해, RVM을 사용하는 것은 좋은 아이디어일 것입니다.
시스템별 정보를 얻으려면 `rvm notes`를 입력하십시오.

루비(와 레일스)를 설치하는 상세한 내용을 보려면, Dan Benjamin의 멋진 기사 [for Tiger][13], [for Leopard][14], 그리고 [for Snow
Leopard][15]가 당신을 매우 빠르게 적용할 수 있도록 해줄 것입니다.
Lion에서는 [본 기사][16] 가 도움이 될 것입니다.

#### Solaris와 OpenIndiana 에서의 루비

Solaris 8에서 Solaris 10까지 [Sunfreeware][17]에서 루비 1.8.7을 사용 가능하며
[Blastwave][18]에서 루비 1.8.7을 사용 가능합니다.
[Sunfreeware][17]에서 루비 1.9.2p0를 사용 가능하지만, 이것은 구버전입니다.
RVM을 사용하면 최신 버전의 루비를 얻을 수 있습니다.

[OpenIndiana][19]에서 루비를 설치하려면, [Image Packaging System, 혹은 IPS][20]를 사용해 주십시오.
이것은 루비 1.9를 위한 OpenSolaris 네트워크 저장소로부터 최신 루비 바이너리와 루비젬을 직접 받아 설치합니다.
아주 쉽습니다:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

이전과 마찬가지로, RVM은 최신 버전의 루비를 얻는 좋은 방법입니다.

### 루비의 다른 구현체들

언어로서 루비는 몇몇 다른 구현체들이 있습니다. 본 가이드에서는 **MRI** (“Matz의 루비 인터프리터”) 혹은 **CRuby**를 참조 구현한 것들에 대해 이야기하고 있습니다만,
다른 것들도 있습니다.
이들은 특정 상황에서 유용할 때가 있는데, 다른 언어 혹은 환경과의 추가 통합을 지원한다거나 MRI가 지원하지 않는 특별한 기능을 가진 것들입니다.

여기 목록이 있습니다:

* [JRuby][21]는 JVM(자바 가상 머신) 위에서 구동되는 루비입니다. JVM의 최적화 JIT 컴파일러, 가비지 컬렉터, 컨커런트 쓰레드, 툴 에코시스템,
  그리고 다양한 라이브러리 집합을 활용합니다.
* [Rubinius][22]는 ‘루비로 씌어진 루비’ 입니다. LLVM 위에 구축되어,
  Rubinius는 다른 언어 역시 구축된 멋진 가상 머신 위에서 활동합니다.
* [MacRuby][23]는 Mac OS X를 위한 애플의 Cocoa 라이브러리에 강력하게 통합된 루비로, 손쉽게 데스크톱 응용프로그램을 작성할 수 있도록 해줍니다.
* [mruby][mruby] 는 루비의 경량 구현체로 어플리케이션 안에 링크되거나 포함시킬 수 있습니다.
  루비의 창시자인 유키히로 “Matz” 마츠모토가 개발을 이끌고 있습니다.
* [IronRuby][26]는 “.NET Framework과 강력하게 통합된” 구현체입니다.
* [MagLev][27]는 “통합된 개체 지속성과 분산 공유 캐시를 가진 빠르고, 안정적인 루비 구현체” 입니다.
* [Cardinal][24]는 “[Parrot][25] 가상머신을 위한 루비 컴파일러”(Perl 6)입니다.

MRI를 포함, 일부 구현체들은 “complete executable specification for the Ruby programming language”인 [RubySpec][28]의 가이드라인을 준수합니다.

[1]: {{ site.downloads.stable.url.gz }}
[2]: {{ site.downloads.previous.url.gz }}
[3]: {{ site.downloads.stable_snapshot.url.gz }}
[4]: {{ site.downloads.nightly_snapshot.url.gz }}
[5]: https://github.com/vertiginous/pik
[7]: https://rvm.io/rvm/install/
[8]: http://rubyinstaller.org/
[9]: http://rubyinstaller.org/downloads/
[10]: http://railsinstaller.org/
[11]: http://trac.macosforge.org/projects/ruby/wiki
[12]: http://brew.sh/
[13]: http://hivelogic.com/articles/ruby-rails-mongrel-mysql-osx
[14]: http://hivelogic.com/articles/ruby-rails-leopard
[15]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/
[16]: http://intridea.com/2011/7/26/setting-up-ruby-dev-on-lion?blog=company
[17]: http://www.sunfreeware.com
[18]: http://www.blastwave.org
[19]: http://openindiana.org/
[20]: http://opensolaris.org/os/project/pkg/
[21]: http://jruby.org
[22]: http://rubini.us
[23]: http://www.macruby.org
[mruby]: https://github.com/mruby/mruby
[24]: https://github.com/parrot/cardinal
[25]: http://parrot.org
[26]: http://www.ironruby.net
[27]: http://ruby.gemstone.com
[28]: http://rubyspec.org
[mirror-http-cdn]: http://cache.ruby-lang.org/pub/ruby/
[mirror-http-jp-ring-shibaura-it]: http://ring.shibaura-it.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-tohoku]: http://ring.tains.tohoku.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-u-toyama]: http://ring.u-toyama.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-yamanashi]: http://ring.yamanashi.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-airnet]: http://ring.airnet.ne.jp/archives/lang/ruby/
[mirror-http-jp-ring-maffin]: http://ring.maffin.ad.jp/archives/lang/ruby/
[mirror-https-jp]: https://ftp.ruby-lang.org/pub/ruby/
[mirror-http-uk]: http://www.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[mirror-http-de]: http://dl.ambiweb.de/mirrors/ftp.ruby-lang.org/
[mirror-http-be]: http://ruby.mirror.easynet.be/
[mirror-http-dk]: http://mirrors.sunsite.dk/ruby/
[mirror-http-nl]: http://www.xs4all.nl/~hipster/lib/mirror/ruby/
[mirror-http-us1]: http://www.ibiblio.org/pub/languages/ruby/
[mirror-http-us2]: http://xyz.lcs.mit.edu/ruby/
[mirror-http-us3]: http://www.binarycode.org/ruby/
[mirror-http-us4]: http://www.online-mirror.org/ruby/
[mirror-http-us5]: http://ruby.trexle.com/
[mirror-http-at]: http://gd.tuwien.ac.at/languages/ruby/
[mirror-http-tw1]: http://pluto.cdpa.nsysu.edu.tw/ruby/
[mirror-http-tw2]: http://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[mirror-http-cn]: http://ruby.taobao.org/mirrors/ruby/
[mirror-ftp-jp1]: ftp://ftp.iij.ad.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-shibaura-it]: ftp://ring.shibaura-it.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-tohoku]: ftp://ring.tains.tohoku.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-u-toyama]: ftp://ring.u-toyama.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-yamanashi]: ftp://ring.yamanashi.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-airnet]: ftp://ring.airnet.ne.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-maffin]: ftp://ring.maffin.ad.jp/pub/lang/ruby/
[mirror-ftp-jp3]: ftp://ftp.ruby-lang.org/pub/ruby/
[mirror-ftp-kr]: ftp://ftp.kr.freebsd.org/pub/ruby/
[mirror-ftp-de]: ftp://ftp.fu-berlin.de/unix/languages/ruby/
[mirror-ftp-uk]: ftp://ftp.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[mirror-ftp-be]: ftp://ftp.easynet.be/ruby/ruby/
[mirror-ftp-ru]: ftp://ftp.chg.ru/pub/lang/ruby/
[mirror-ftp-gr]: ftp://ftp.ntua.gr/pub/lang/ruby/
[mirror-ftp-dk]: ftp://sunsite.dk/mirrors/ruby/
[mirror-ftp-us1]: ftp://www.ibiblio.org/pub/languages/ruby/
[mirror-ftp-us2]: ftp://xyz.lcs.mit.edu/pub/ruby/
[mirror-ftp-at]: ftp://gd.tuwien.ac.at/languages/ruby/
[mirror-ftp-tw1]: ftp://ruby.cdpa.nsysu.edu.tw/ruby/
[mirror-ftp-tw2]: ftp://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[mirror-ftp-ca]: ftp://mirror.cs.mun.ca/pub/mirror/ruby/
