---
layout: page
title: "Ruby 코어"
lang: ko
---

Ruby 개발 과정에 참여하고 싶다면 바로 지금이 최고의 타이밍입니다. 최근 몇 년간
주목이 집중됨에 따라, Ruby 자체와 그 문서화의 향상이 더욱더 필요하게 되었습니다.
어디서부터 시작해야 할까요?
{: .summary}

Ruby 개발에 관련된 주제들입니다.

* [Git을 사용하여 Ruby 개발을 트래킹하기](#following-ruby)
* [패치들로 Ruby 개선하기](#patching-ruby)
* [브랜치에 대한 안내](#branches-ruby)

### Git을 사용하여 Ruby 개발을 트래킹하기
{: #following-ruby}

현재 최신 Ruby 코드의 주 저장소는 [git.ruby-lang.org/ruby.git][gitrlo]입니다.
또한 [GitHub에도 미러][7]가 있습니다. 기본적으로는 이 미러를 이용하세요.

최신 Ruby 코드는 Git을 사용하여 받을 수 있습니다.

{% highlight sh %}
$ git clone https://github.com/ruby/ruby.git
{% endhighlight %}

이제 `ruby` 디렉터리에는 Ruby의 최신 개발 버전(ruby-trunk)이 들어 있을 것입니다.

[커미터가 아닌 사람들을 위한 개발 참가 방법][noncommitterhowto]도 참고하세요.


만약 커밋 권한을 가지고 있고, 무엇인가를 푸시하기를 원한다면,
반드시 주 저장소를 이용해야 합니다.

{% highlight sh %}
$ git clone git@git.ruby-lang.org:ruby.git
{% endhighlight %}

### 패치들로 Ruby 개선하기
{: #patching-ruby}

코어 팀은 패치나 버그 리포트를 [이슈 트래커][10]에서
관리하고 있습니다. 이 리포트들은 토론을 위해
[Ruby-Core 메일링 리스트][mailing-lists]에도 등록됩니다. 그러므로 당신의 리퀘스트가
공지되지 않을 염려는 없습니다. 또한, 메일링 리스트에 직접 패치를 보낼 수도
있습니다. 어떤 방식을 사용하셔도, 계속 토론에 참여하시는 것이 좋습니다.

패치를 다루는 방법에 대해 구체적인 가이드를 원하시면 마츠가 직접 쓴
[패치 작성자를 위한 지침][writing-patches]를 확인하세요.

패치를 만드는 순서를 요약하자면,

1.  GitHub에서 Ruby 소스코드를 체크아웃합니다.
    일반적으로 버그 수정을 위한 패치나 새로운 기능이 이미 Ruby 소스의 트렁크에
    등록되어 있습니다.

        $ git clone https://github.com/ruby/ruby.git

    한 관리 브랜치에서만 일어나는 버그를 수정하려고 한다면, 해당 브랜치를
    체크아웃합니다.

        $ git checkout ruby_X_X

    X_X를 체크아웃하고 싶은 버전으로 변경하세요.

2.  개선된 코드를 추가합니다.

3.  패치를 만듭니다.

        $ git diff > ruby-changes.patch

4.  [이슈 트래커][10]에 티켓을 만들거나
    [Ruby-Core 메일링 리스트][mailing-lists]에 패치와 패치를 설명한
    ChangeLog를 함께 메일로 보냅니다.

5.  패치에 대한 이의가 없으면 커미터들이 적용을 승인해 줄 것입니다.

**주의사항:** 패치는 [unified diff][12]로 등록되어야 합니다. 패치의 머지에 관한
더 자세한 정보는 [the diffutils reference][13]를 확인해 주세요.

Ruby 개발에 관한 토론들은 [Ruby-Core 메일링 리스트][mailing-lists]에
모입니다. 그러므로 당신의 패치가 가치
있는지 알고 싶거나, Ruby의 미래에 관한 토론을 하고 싶으시면 망설이지 말고
참여하세요. 주제와 관련 없거나 논란이 될 만한 토론은 허용되지 않습니다.
주제는 명확해야 하고 잘 생각해서 잘 쓰여야 합니다. 우리는 Ruby의 창조자에게 말을
걸고 있으니 예의를 갖춥시다.

Ruby의 코어 개발자들이 영어를 잘한다고 해도 많은 수가 일본에 살고 있으니 시차가 있습니다.
영어와 동시에 진행되는 일어 개발 메일링 리스트도 있습니다. 클레임이 해결되지
않았을 경우에도 인내심을 가지고 며칠 후에 다시 시도해주시길 바랍니다.

### 브랜치에 대한 안내
{: #branches-ruby}

Ruby의 소스 코드는 2019년 4월 22일까지 서브버전에서 관리되어 왔습니다.
그러므로 몇몇 버전은 그대로 서브버전에서 관리됩니다.
다음 SVN 저장소를 이용할 수 있습니다.

* [&lt;URL:https://git.ruby-lang.org/ruby.git&gt;][svn-viewvc]

그렇지만 (브랜치 유지보수 담당자가 아니라면) 이를 신경쓸 필요는 없습니다.
브랜치를 Git에서 체크아웃 할 수 있습니다.
예를 들어 다음 명령을 실행하세요.

{% highlight sh %}
$ git checkout ruby_X_X
{% endhighlight %}

X_X는 체크아웃 하고 싶은 브랜치 이름으로 변경하세요.

브랜치를 변경하고 싶다면 [이슈 트래커][10]에 이슈를 만들어주세요.
다음 링크도 참고하세요.

[gitrlo]: https://git.ruby-lang.org/ruby.git
[mailing-lists]: /ko/community/mailing-lists/
[writing-patches]: /en/community/ruby-core/writing-patches/
[noncommitterhowto]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[svn-viewvc]: https://git.ruby-lang.org/ruby.git
[7]: https://github.com/ruby/ruby
[10]: https://bugs.ruby-lang.org/
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
