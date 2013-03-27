---
layout: page
title: "Ruby 다운로드"
lang: ko
---

### Ruby 라이센스

Ruby는 다음의 라이센스를 기반으로 사용할 수 있습니다. Ruby 라이센스([영문][1]).

### Ruby 소스 코드

현재 사용중인 플랫폼에 익숙하고, 작업 환경에 최적화된 설정이 필요하다면 소스 코드를 이용해서 설치하는 방법이 최적입니다. 그리고
플랫폼에 맞는 바이너리 배포본이 없는 경우에도 좋은 해결책입니다. 아래의 미러 사이트를 통해 각 버전의 Ruby 소스 코드를
다운로드할 수 있습니다.

* 1\.9 안정화 버젼: Ruby 1.9.2-p290([tar.bz2][2] \| [tar.gz][3] \| [zip][4])
* 1\.8 안정화 버젼: Ruby 1.8.7-p352([tar.bz2][5] \| [tar.gz][6] \| [zip][7])
* [최신 안정화 버전][8]\: 최신 안정화 버전입니다. 이 버전의 생성은 정해진 일정에 따라 자동적으로 실시되기 때문에 예기치
  않은 문제점이 포함될 가능성이 있습니다.
* [최신 개발 버전][9]\: 가장 최근의 소스 저장소를 압축한 것입니다. 아직 수정되지 않은 문제점이 있을 수도 있습니다.

Ruby 서브버전 저장소에 대한 자세한 설명은 [Ruby 코어][10] 페이지를 참조하세요.

### Windows

윈도우 플랫폼에 Ruby를 설치하는 방법은 몇가지가 있습니다. 그 중 첫번째 방법은 간단하게 컴파일된 바이너리를 설치하는
것입니다. 두번째는 원클릭 인스톨러를 사용하는 것입니다. Ruby를 설치하는 방법을 잘 모르겠다면 원클릭 인스톨러가 아마 가장
좋은 솔루션이 될 것입니다. 원클릭 인스톨러에는 몇가지 추가 라이브러리들이 포함되어있으므로 더 편리하기도 합니다.

* [Ruby 1.8.6 원클릭 인스톨러][11] 안정화 버전 (md5:
  69945dfae60224cc64139c91e000590e)
* [Ruby 1.8.7-p72 바이너리][12] 안정화 버전 (md5:
  d4b04ba03a76dc70120fe96ffa22e5df)
* [Ruby 1.9.1-p129 바이너리][13] 안정화 버전 (md5:
  d9a014199d5d52e9fd170704d2c318e6)

일부 Ruby 바이너리의 경우 추가 라이브러리 등 일부 기능이 포함되어 있지 않을 수도 있습니다. 이에 대해서는
Ruby-mswin32 프로젝트 페이지([영문][14])을 참조하시기 바랍니다.

### Linux

현재 사용중인 리눅스 배포본에 따라 Ruby를 설치하는 방법이 달라집니다. 물론, 소스코드를 내려받아 직접 컴파일해도 됩니다.
하지만 일부 플랫폼에서는 Ruby를 정말 쉽게 설치할 수 있는 패키지 매니저가 포함되어있습니다.

예를 들어 데비안이나 우분투 리눅스를 사용중이라면, `apt-get`을 이용해 쉽고 간편하게 설치할 수 있습니다.

{% highlight sh %}
% sudo apt-get install ruby irb rdoc
{% endhighlight %}

irb와rdoc을 이용하기 위해서는 universe 저장소를 등록해야 합니다.

### OS X

매킨토시 OS X 플랫폼에 최신 버전의 Ruby를 설치하는 방법은 몇가지가 있습니다. 레일스 개발 환경을 최대한 빨리
구축하고자한다면 [Locomotive][15] 가 좋은 선택이 될 것 입니다. 그리고 맥 [OS X용 원클릭 인스톨러][16] 도
있습니다. 가능하다면 [DarwinPorts][17] 나 [Fink][18] 를 이용해도 됩니다.

DarwinPorts의 경우 아래와 같은 명령으로 설치할 수 있습니다.

{% highlight sh %}
% sudo port install ruby
{% endhighlight %}

Fink는 Fink Commander라고 하는 그래픽 인터페이스를 제공하므로 보다 쉽게 Ruby를 설치할 수 있습니다.

OS X가 유닉스 기반이기때문에, 소스 코드를 내려받아 설치하는 방법도 다른 방법처럼 쉽고 효과적입니다.

Ruby(레일스와 함께)를 설치하는 자세한 방법은 Dan Benjamin씨의 훌륭한 설명 [*Building Ruby,
Rails, LightTPD, and MySQL on Tiger*][19] 를 참조하셔도 됩니다.

### Solaris / OpenSolaris

Solaris 플랫폼에서도 Ruby를 이용할 수 있습니다. Solaris용 Ruby 바이너리는 [Sunfreeware][20]와
[Blastwave][20]에서 구하실 수 있습니다. Sunfreeware와 Blastwave는 Solaris 바이너리를 제공하는
우수한 사이트로서 여러 지원자에 의해 패키지가 제공되고 있습니다. 따라서 설치에 따른 문제점에 대해 책임을 지지 않습니다.

* Blastwave는 pkgutil이라는 독자적인 패키지 관리툴을 사용하고 있습니다. 자세한 설명은 [Blastwave in 5
  steps][21]을 참조하시기 바랍니다.

OpenSolaris의 경우 [IPS][22]를 통해 간단히 설치할 수 있습니다.

{% highlight sh %}
$ pfexec pkg install SUNWruby18
{% endhighlight %}

Solaris 플랫폼용 Ruby는 RubyForge에 등록되어있습니다. 자세한 사항은
[rubyopensolaris@rubyforge][23]를 참조하여 주십시오.

### AIX

AIX용 바이너리는 Perry Smith씨에 의해 제공되고 있으며, [AIX Consulting: Ruby Page][24]에서
다운로드할 수 있습니다. 페이지 열람에 문제가 있을 경우는 아래의 다운로드 링크를 이용하여 주시기 바랍니다.

* ruby1.9.1-p243: [aix-consulting.net][25]



[1]: /en/about/license.txt
[2]: ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.tar.bz2
[3]: ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.tar.gz
[4]: ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.zip
[5]: ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p352.tar.bz2
[6]: ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p352.tar.gz
[7]: ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p352.zip
[8]: ftp://ftp.ruby-lang.org/pub/ruby/stable-snapshot.tar.gz
[9]: ftp://ftp.ruby-lang.org/pub/ruby/snapshot.tar.gz
[10]: /en/community/ruby-core/
[11]: http://rubyforge.org/frs/download.php/47082/ruby186-27_rc2.exe
[12]: ftp://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.8.7-i386-mswin32.zip
[13]: ftp://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.9.1-p129-i386-mswin32.zip
[14]: http://www.garbagecollect.jp/ruby/mswin32/en/documents/install.html
[15]: http://locomotive.raaum.org/
[16]: http://rubyosx.rubyforge.org/
[17]: http://darwinports.opendarwin.org/
[18]: http://fink.sourceforge.net/
[19]: http://hivelogic.com/articles/2005/12/01/ruby_rails_lighttpd_mysql_tiger
[20]: http://www.sunfreeware.com/
[21]: http://www.blastwave.org/jir/blastwave.fam "영문"
[22]: http://pkg.opensolaris.org/release/en/index.shtml
[23]: http://rubyforge.org/projects/rubyopensolaris
[24]: http://aix-consulting.net/downloads/14
[25]: http://aix-consulting.net/downloads/14/download
