---
layout: page
title: "루비 코어"
lang: ko
---

루비 개발 과정에 참여하고 싶다면 바로 지금이 최고의 타이밍입니다. 최근 몇 년간
주목이 집중됨에 따라, 루비 자체와 그 문서화의 향상이 더욱더 필요하게 되었습니다.
어디서부터 시작해야 할까요?
{: .summary}

루비 개발에 관련된 주제들입니다.

* [Subversion을 사용하여 루비 개발을 트레킹하기](#following-ruby)
* [주 루비 저장소로 Git을 사용하는 방법](#git-ruby)
* [패치들로 루비 개선하기](#patching-ruby)
* [코어 개발자를 위한 룰](#coding-standards)

### Subversion을 사용하여 루비 개발을 트레킹하기
{: #following-ruby}

루비 코드를 받으려면 [Subversion][1] 저장소에서 익명으로 체크하웃하면 됩니다
커맨드 라인에서 다음을 입력하세요.

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

이제 `ruby` 디렉터리에는 루비의 최신 개발 버전(ruby-trunk)이 들어 있을 것입니다.
현재 트렁크에 적용되는 패치는 안정 브랜치들({{ site.svn.stable.version }},
{{ site.svn.previous.version }}, {{ site.svn.old.version }})에 백포트되고
있습니다.(밑을 참고하세요.)

루비 {{ site.svn.stable.version }}의 패치들을 보고 싶다면, 체크아웃 하실 때
`{{ site.svn.stable.branch }}` 브랜치를 사용하십시오.

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.stable.branch }}
{% endhighlight %}

비슷하게 루비 {{ site.svn.previous.version }}에서는..

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.previous.branch }}
{% endhighlight %}

이 명령은 `{{ site.svn.stable.branch }}` 나 `{{ site.svn.previous.branch }}` 디렉터리에
각각의 루비 개발 트리를 체크아웃합니다. 메인터넌스 브랜치에서 개발하는 개발자들은
메인터넌스에서의 변경사항을 루비 트렁크에도 마이그레이트할 것입니다. 그래서 마츠나
노부가 언어레벨의 수정을 한 경우를 제외하면 두 브랜치는 매우 비슷합니다.

더 자세한 내용은 [루비의 Subversion 저장소][2]의 웹사이트를 참조하세요.

Subversion에 대한 정보는 [Subversion FAQ][3]나 [the Subversion book][4]를
보십시오. 혹은 [Pragmatic Version Control with Subversion][5]도 매우 유용한
입문서입니다.

### 패치들로 루비 개선하기
{: #patching-ruby}

코어 팀은 패치나 버그 리포트를 [이슈 트랙커][10]에서
관리하고 있습니다. 이 리포트들은 토론을 위해
[Ruby-Core 메일링 리스트][mailing-lists]에도 등록됩니다. 그러므로 당신의 리퀘스트가
공지되지 않을 염려는 없습니다. 또한, 메일링 리스트에 직접 패치를 보낼 수도
있습니다. 어떤 방식을 사용하셔도, 계속 토론에 참여하시는 것이 좋습니다.

패치를 다루는 방법에 대해 구체적인 가이드를 원하시면 마츠가 직접 쓴
[패치 작성자 가이드][11]를 확인하세요.

패치를 만드는 순서를 요약하자면,

1.  서브버전에서 루비 소스코드를 체크아웃합니다.
    일반적으로 버그 수정을 위한 패치나 새로운 기능이 이미 루비 소스의 트렁크에
    등록되어 있습니다. {{ site.svn.previous.branch }}에 추가하고 싶다고 하더라도
    트렁크에서 먼저 입증되어야 합니다.

        $ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby

    한 관리 브랜치에서만 일어나는 버그를 수정하려고 한다면, 해당 브랜치를
    체크아웃합니다. 예를 들어 `{{ site.svn.previous.branch }}`의 경우

        $ svn co http://svn.ruby-lang.org/repos/ruby/branches/{{ site.svn.previous.branch }}

2.  개선된 코드를 추가합니다.

3.  패치를 만듭니다.

        $ svn diff > ruby-changes.patch

4.  [이슈 트랙커][10]에 티켓을 만들거나
    [Ruby-Core 메일링 리스트][mailing-lists]에 패치와 패치를 설명한
    ChangeLog를 함께 메일로 보냅니다.

5.  패치에 대한 이의가 없으면 커미터들이 적용을 승인해 줄 것입니다.

**주의사항:** 패치는 [unified diff][12]로 등록되어야 합니다. 패치의 머지에 관한
더 자세한 정보는 [the diffutils reference][13]를 확인해 주세요.

루비 개발에 관한 토론들은 [Ruby-Core 메일링 리스트][mailing-lists]에
모여집니다. 그러므로 당신의 패치가 가치
있는지 알고 싶거나, 루비의 미래에 관한 토론을 하고 싶으시면 망설이지 말고
참여하세요. 주제와 관련 없거나 논란을 일으킬만한 토론은 허용되지 않습니다.
주제는 명확해야 하고 잘 생각해서 잘 쓰여야 합니다. 우리는 루비의 창조자에게 말을
걸고 있으니 예의를 갖춥시다.

루비의 코어 개발자들이 영어를 잘한다고 해도 일본에 살고 있으니 시차가 있습니다.
또한, 영어와 동시에 진행되는 일어 개발 리스트가 있습니다. 클래임이 해결되지
않았을 경우에도 인내심을 가지고 며칠 후에 다시 시도해주시길 바랍니다.

### 코어 개발자를 위한 규칙
{: #coding-standards}

일반적으로, 루비의 개발자는 소스코드와 팀이 사용하는 개발 스타일에
친숙해야 합니다. 다시 말하자면, Subversion에 체크인할 때 다음 가이드
라인들은 지켜져야 합니다.

* 모든 체크인은 [GNU conventions][14]에따라 `ChangeLog`에 기술되어야
  합니다. (많은 루비 코어 개발자들은 이멕스의 `add-log`모드를 사용합니다.
  `add-log`모드는 단축키 `C-x 4 a`로 열 수 있습니다.)
* 체크인 날짜는 일본 표준시(UTC+9)여야 합니다.
* ChangeLog에 추가할때에는 Subversion 커밋 메세지도 같은 내용을 넣어야
  합니다. 이 메세지는 커밋과 동시에 Ruby-CVS 메일 리스트에 자동으로
  공지됩니다.
* 함수 프로토타입은 루비의 코드와 코드의 확장기능 전체에서 사용됩니다.
* C++스타일의 커맨트(`//`)를 쓰지 마세요.  루비의 메인테이너는 표준 C의
  멀티 라인 커맨트(`/* .. */`)를 사용하길 권장합니다.

더 자세한 정보는 [루비의 이슈 트랙커][10]를 참조하세요.



[mailing-lists]: /ko/community/mailing-lists/
[1]: http://subversion.apache.org/
[2]: http://svn.ruby-lang.org/cgi-bin/viewvc.cgi/
[3]: http://subversion.apache.org/faq.html
[4]: http://svnbook.org
[5]: http://www.pragmaticprogrammer.com/titles/svn/
[6]: http://git-scm.com/
[7]: http://github.com/ruby/ruby
[8]: http://wiki.github.com/shyouhei/ruby/committerhowto
[9]: http://wiki.github.com/shyouhei/ruby/noncommitterhowto
[10]: https://bugs.ruby-lang.org/
[11]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/25139
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[14]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
