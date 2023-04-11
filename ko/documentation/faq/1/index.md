---
layout: page
title: "공식 Ruby FAQ"
lang: ko

header: |
  <div class="multi-page">
    <a href="../" title="Content">콘텐츠</a>
    <span class="separator"> | </span>
    <strong>1</strong>
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
    <a href="/en/documentation/faq/8/" title="파트 8">8</a>
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

## 일반적인 질문

### Ruby란?

Ruby는 Yukihiro Matsumoto(이 문서와 메일링 리스트에서 "Matz"라는 핸들을
사용함)가 만든 단순하고 강력한 객체 지향 프로그래밍 언어입니다.

Perl과 마찬가지로 Ruby는 텍스트 처리에 능숙합니다. Smalltalk와 마찬가지로 Ruby의
모든 것은 객체이며 Ruby에는 블록, 이터레이터, 메타 클래스 및 기타 유용한 기능이
있습니다.

Ruby를 사용하여 서버를 작성하고, 프로토타입을 실험하고, 일상적인 프로그래밍 작업을
수행할 수 있습니다. 완전히 통합된 객체 지향 언어인 Ruby는 확장성이 뛰어납니다.

Ruby의 기능:

* 간단한 구문,
* 기본적인 객체 지향 기능(클래스, 메서드, 객체 등),
* 특별한 객체 지향 기능(믹스인, 싱글턴 메서드, 리네이밍 등),
* 연산자 오버로딩,
* 예외 처리,
* 이터레이터와 클로저,
* 가비지 컬렉션,
* 동적 로딩(아키텍처에 따라 다름),
* 높은 이동성(다양한 Unix, Windows, DOS, macOS, OS/2, Amiga 등에서 실행 가능).

### Ruby 코드를 보여주세요!

이름과 나이가 있는 `Person`이라는 클래스를 정의해 봅시다. 몇 명의 사람을 만들고
검사하여 코드를 테스트합니다.

~~~
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age  = age.to_i
  end

  def inspect
    "#{name} (#{age})"
  end
end

p1 = Person.new("Elmo", 4)
p2 = Person.new("Zoe", 7)

p1  # => Elmo (4)
p2  # => Zoe (7)
~~~

이제 다음과 같은 줄이 포함된 파일 `ages`에서 이름과 나이를 읽어서 사람들의
배열을 채웁니다.

~~~
Bert:    8
Cookie: 11
Elmo:    4
Ernie:   8
Zoe:     7
~~~

이 코드는 정규식을 사용하여 입력 파일에서 연속적인 줄을 구문 분석하여 각 일치
항목에 대해 새 `Person` 객체를 만들고 배열 `people`의 맨 뒤에 푸시합니다.

~~~
people = Array.new

File.foreach("ages") do |line|
  people << Person.new($1, $2) if line =~ /(.*):\s+(\d+)/
end

people  # => [Bert (8), Cookie (11), Elmo (4), Ernie (8), Zoe (7)]
~~~

이제 사람의 나이를 기준으로 결과를 정렬해 보겠습니다. 여러 가지 방법으로 이를
수행할 수 있습니다. Ruby에 두 사람을 비교하는 방법을 알려주는 정렬 블록을 정의할
수 있습니다.

~~~
sorted = people.sort {|a, b| a.age <=> b.age }
sorted  # => [Elmo (4), Zoe (7), Bert (8), Ernie (8), Cookie (11)]
~~~

또 다른 방법은 클래스 `Person`에 대한 비교 메서드를 변경하는 것입니다.

~~~
class Person
  def <=>(other)
    age <=> other.age
  end
end
people.sort  # => [Elmo (4), Zoe (7), Bert (8), Ernie (8), Cookie (11)]
~~~

### 이름이 "Ruby"인 이유는 무엇인가요?

Perl의 영향을 받은 Matz는 새로운 언어에 보석 이름을 사용하고 싶었고 동료의
탄생석을 따서 Ruby라는 이름을 지었습니다.

나중에 그는 Ruby가 여러 상황에서 Perl 바로 다음에 오는 것을 깨달았습니다.
탄생석에서 Perl은 6월, Ruby는 7월입니다. 폰트 크기 측정 시 pearl은 5pt, ruby는
5.5pt입니다. 그는 Ruby가 Perl보다 새로운(그리고 바라건대 더 나은) 프로그래밍
언어의 좋은 이름이라고 생각했습니다.

(1999년 6월 11일 [\[ruby-talk:00394\]][ruby-talk:00394]에서 Matz의 설명을
기반으로 합니다.)

[ruby-talk:00394]: https://blade.ruby-lang.org/ruby-talk/394

### Ruby의 역사는?

다음은 1999년 6월 4일 [\[ruby-talk:00382\]][ruby-talk:00382]에 Matz가 작성한
게시물을 요약한 것입니다. (Ruby의 생일은 [\[ruby-list:15977\]][ruby-list:15977]에서
수정되었습니다.)

> Ruby는 1993년 2월 24일에 태어났습니다. 동료와 객체 지향 스크립팅 언어의
> 가능성에 대해 이야기하고 있었습니다. 나는 Perl(Perl5가 아닌 Perl4)을 알고
> 있었지만 장난감 언어의 냄새가 나기 때문에 별로 좋아하지 않았습니다(여전히
> 그렇습니다). 객체 지향 스크립팅 언어는 매우 유망해 보였습니다.

> 저는 그때 Python을 알았습니다. 그러나 나는 그것이 진정한 객체 지향 언어라고
> 생각하지 않았기 때문에 그것을 좋아하지 않았습니다. 객체 지향 기능은 언어에 대한 추가
> 기능으로 나타났습니다. 15년 동안 언어 마니아이자 객체 지향 팬으로서 저는 진정한 객체
> 지향의 사용하기 쉬운 스크립팅 언어를 정말로 원했습니다. 찾아보았지만 찾을 수
> 없었습니다.

> 그래서 만들기로 했습니다. 인터프리터를 가동시키는 데 몇 달이 걸렸습니다.
> 이터레이터, 예외 처리, 가비지 컬렉터 같은 내가 좋아하는 기능을 내 언어에
> 넣었습니다.

> 그런 다음 Perl의 기능을 클래스 라이브러리로 재구성하여 구현했습니다. 1995년
> 12월에 일본 국내 뉴스그룹에 Ruby 0.95를 올렸습니다.

> 그 이후로 활발한 메일링 리스트가 만들어지고 웹 페이지가 형성되었습니다.

[ruby-talk:00382]: https://blade.ruby-lang.org/ruby-talk/382
[ruby-list:15977]: https://blade.ruby-lang.org/ruby-list/15977

### Ruby 홈 페이지는 어디에 있나요?

공식 Ruby 홈 페이지는 [www.ruby-lang.org](https://www.ruby-lang.org)입니다.
영어 및 일본어 버전 외에도 다양한 언어로 번역되어 있습니다.

Ruby 정보를 찾기 위한 좋은 출발점은 [문서](/ko/documentation/) 및
[커뮤니티](/ko/community/) 페이지입니다.

### Ruby 뉴스그룹이 있나요?

comp.lang.ruby는 2000년 5월에 설립되었습니다.
([Conrad Schneiker](mailto:schneiker@jump.net)의 노력에 감사드립니다.)

### Ruby 메일링 리스트가 있나요?

Ruby에 대해 이야기하는 여러 메일링 리스트가 있습니다.
자세한 내용은 [메일링 리스트](/ko/community/mailing-lists/) 페이지를 참조하세요.

<https://ml.ruby-lang.org/mailman3/hyperkitty/list/ruby-talk@ml.ruby-lang.org/>를
사용하여 메일링 리스트 아카이브를 검색할 수 있습니다. (이것은 ruby-talk 메일링 리스트의
URL이며, 다른 메일링 리스트를 원하면 변경해서 사용하세요.)

### mutt에서 메일링 리스트를 쓰려면 어떻게 해야 하나요?

{% include faq-out-of-date.html %}

일부 Ruby 메일링 리스트의 경우 메일링 리스트 소프트웨어는 제목 줄에
`ruby-core:1234`와 같은 접두어를 추가합니다. 이로 인해 일부 메일 사용자
에이전트의 스레딩이 혼동될 수 있습니다.

mutt에서는 다음 변수 설정을 사용하여 스레딩을 작동시킬 수 있습니다.

~~~
# reply regexp, to support MLs like ruby-talk.
set reply_regexp="^(\[[a-z0-9:-]+\][[:space:]]*)?(re([\[0-9\]+])*|aw):[[:space:]]*"
~~~

### "Ruby"와 "ruby" 중 어느 것이 맞습니까?

공식적으로는 언어를 "Ruby"라고 합니다. 대부분의 시스템에서는 `ruby` 명령을
사용하여 호출됩니다. "Ruby" 대신 "ruby"를 사용해도 괜찮습니다.

언어 이름으로 "RUBY"를 사용하지 마십시오.

처음엔, 역사적으로도, "ruby"라고 불렸습니다.

### Ruby 책이 있나요?

{% include faq-out-of-date.html %}

* Ruby 프로그래밍: 실용적인 프로그래머 가이드,
  (곡괭이 책) David Thomas와 Andrew Hunt 저: ISBN 0-20171-089-7,
  Addison-Wesley, 2000년 10월.

* Matz 외의 일본어 Ruby 참고서. 일본에서는 ASCII에서 출판되었습니다(ISBN
  4-7561-3254-5). 영어 번역본인 "The Ruby Programming Language"는 O'Reilly &
  Associates에서 구할 수 있습니다(ISBN 978-0596516178).

* 일본어 "Ruby Pocket Reference"는 O'Reilly Japan에서 출판되었습니다(ISBN
  4-87311-023-8). 번역본을 보고 싶다면 미국에 있는 O'Reilly에게 알려주세요.

* 또한 Jeffrey Friedl의 "정규 표현식 마스터링"(Hip Owl Book): O'Reilly &
  Associates, ISBN 1-56592-257-3은 다양한 프로그래밍 언어에서 정규 표현식의
  기술 및 구현을 다루는 참고서입니다. 대부분 Ruby 정규 표현식과 관련성이
  높습니다.

### 어떤 편집기가 Ruby를 지원하나요?

{% include faq-out-of-date.html %}

* [Emacs](http://www.gnu.org/software/emacs/emacs.html),
  [XEmacs](http://www.xemacs.org/): `ruby-mode.el`이 Ruby 배포판으로 제공됩니다.
  XEmacs의 일부 버전에서는 `.emacs` 파일에 `(load "font-lock")`을 추가해야
  `ruby-mode.el`이 사용 중인 구문 강조 패키지를 감지할 수 있습니다.
* [Vim](http://www.vim.org/): Vim 5.7 이상에는 런타임 패키지의 표준으로 Ruby
  구문 파일이 있습니다. 이전 버전의 경우 Ruby용 구문 파일은
  [http://www.xs4all.nl/~hipster/lib/ruby/ruby.vim](http://www.xs4all.nl/~hipster/lib/ruby/ruby.vim)에서 찾을 수 있습니다.
* [Jedit](http://jedit.sourceforge.net/): Java로 작성된 휴대용 편집기로 Ruby를
  지원합니다.
* [Nedit](http://www.nedit.org): Eric Santonacci는 Nedit에 대한 Ruby 지원을
  작성했습니다.
  [ftp://ftp.talc.fr/pub/ruby/ruby.nedit-0.1.tar.gz](ftp://ftp.talc.fr/pub/ruby/ruby.nedit-0.1.tar.gz)에서 사용 가능합니다.
* Barry Shultz는 TextPad용 Ruby 정의 파일을 작성했습니다.
  [https://www.textpad.com/add-ons/synn2t.html](https://www.textpad.com/add-ons/synn2t.html)에서 사용 가능합니다.

### Ruby 코드의 실행 결과를 주석으로 추가하려면 어떻게 해야하나요?

{% include faq-out-of-date.html %}

사람들은 일반적으로 각 명령문 실행 결과를 해당 명령문에 첨부된 주석으로 표시하여
Ruby 코드에 주석을 답니다. 예를 들어 다음 코드에서는 할당이 문자열 "Billy Bob"을
생성한 다음 일부 부분 문자열을 추출한 결과를 보여줍니다.

~~~
str = "Billy" + " Bob"           # => "Billy Bob"
str[0,1] + str[2,1] + str[-2,2]  # => "Blob"
~~~

Emacs 및 vim 사용자는 이를 편집 환경과 통합할 수 있습니다. 이는 주석이 달린 Ruby
코드가 포함된 이메일을 사람들에게 보내려는 경우에 유용합니다. `xmp`를 설치한
Emacs 사용자는 `.emacs` 파일에 다음을 추가할 수 있습니다.

~~~
(defun ruby-xmp-region (reg-start reg-end)
  "Pipe the region through Ruby's xmp utility and replace the region with
   the result."
  (interactive "r")
  (shell-command-on-region reg-start reg-end
                           "ruby -r xmp -n -e 'xmp($_, \"%l\t\t# %r\n\")'"
                           t))
(global-set-key [(meta f10)] 'ruby-xmp-region)
~~~

Vim 사용자는 매핑을 사용할 수 있습니다(hipster님 감사합니다).

~~~
map <M-F10> :!ruby -r xmp -n -e 'xmp($_, "\%l\t\t\# \%r\n")'<CR>
~~~

두 경우 모두 코드 영역을 강조 표시하고 Meta-F10을 눌러 주석을 추가합니다.

### Ruby 매뉴얼을 읽어도 이해가 안 돼요!

{% include faq-out-of-date.html %}

Ruby의 구문은 Ruby 1.0 이후 상당히 안정적이지만 때때로 새로운 기능이 추가됩니다.
따라서 책과 온라인 설명서가 뒤처질 수 있습니다.

문제가 있는 경우 메일링 리스트([메일링 리스트 페이지](/ko/community/mailing-lists/) 참조)에서
언제든지 질문하십시오.
일반적으로 언어의 작성자인 Matz, 다른 전문가, 자신과 유사한 문제를 해결한
사람들로부터 적절한 답변을 얻을 수 있습니다.

문제가 있는 소스 코드와 함께 `ruby -v`의 출력을 첨부하세요.

[`irb`](/en/documentation/faq/10/#irb)를 사용하는 데 문제가 있는 경우 몇 가지
제한 사항이 있다는 점에 유의하세요. `irb --single-irb`를 사용하거나 `ruby`
명령을 직접 사용하여 스크립트를 사용해 보세요.

메일링 리스트에 비슷한 질문이 있을 수 있으며 질문하기 전에 최근
메일(RFC1855:3.1.1, 3.1.2)을 읽어보는 것이 좋습니다.
하지만 메일링 리스트에서 질문하시면 정답이 곧 나올 것입니다.
