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
    <a href="../8/" title="파트 8">8</a>
    <span class="separator"> | </span>
    <strong>9</strong>
    <span class="separator"> | </span>
    <a href="../10/" title="파트 10">10</a>
    <span class="separator"> | </span>
    <a href="../11/" title="파트 11">11</a>
  </div>
  <h1>공식 Ruby FAQ</h1>

---

{% include faq-notice.md %}

## 내장 라이브러리

### `instance_methods(false)`는 무엇을 반환하나요?

인스턴스 메서드 `instance_methods`는 수신 클래스 또는 모듈의 인스턴스
메서드 이름이 포함된 배열을 반환합니다. 여기에는 슈퍼클래스와 모듈에
믹스인된 메서드가 포함됩니다.

`instance_methods(false)`나 `instance_methods(nil)`는 수신자에 정의된 메소드의
이름만 반환합니다.

### 난수 시드는 어떻게 작동하나요?

`srand`를 미리 호출하지 않고 `rand`가 호출되면, 루비의 의사 난수 생성기는
무엇보다도 OS에서 제공하는 엔트로피 소스를 사용하는 랜덤(에 가까운) 시드를
사용합니다(사용 가능한 경우).
`srand` 를 사용하지 않는 프로그램을 연속적으로 실행하면 다른 난수 시퀀스가
생성됩니다.

테스트 목적으로, 상수 시드를 사용하여 `srand`를 호출하면 프로그램을 실행할
때마다 동일한 일련의 숫자로 예측 가능한 동작을 얻을 수 있습니다.

### 파일을 읽고 변경했지만 디스크의 파일은 변경되지 않았습니다.

~~~
File.open("example", "r+").readlines.each_with_index do |line, i|
  line[0,0] = "#{i+1}: "
end
~~~

이 프로그램은 `example` 파일에 줄 번호를 추가하지 _않습니다_. 파일의 내용을 읽
고 각 줄마다 줄 번호를 앞에 붙이기는 하지만 데이터를 다시 쓰지는 않습니다.
아래 코드는 파일을 _업데이트_합니다(업데이트를 시작하기 전에 백업을 하지 않기
때문에 다소 위험할 수 있습니다).

~~~
File.open("example", "r+") do |f|
  lines = f.readlines
  lines.each_with_index {|line, i| line[0,0] = "#{i+1}: " }
  f.rewind
  f.puts lines
end
~~~

### 파일을 처리하고 내용을 업데이트하려면 어떻게 해야 하나요?

명령줄 옵션 `-i` 또는 내장 변수 `$-i`를 사용하여 파일을 읽고 바꿀 수 있습니다.

파일에 줄 번호를 추가한 이전 질문의 코드는 이 기법을 사용하여 작성하는
것이 가장 좋습니다.

~~~
$ ruby -i -ne 'print "#$.: #$_"' example
~~~

원본 파일을 보존하려면 `-i.bak`을 사용하여 백업을 만드세요.

### 파일을 작성하고 복사했는데 복사본의 끝 부분이 손실된 것 같습니다.

이 코드는 제대로 작동하지 않습니다.

~~~
require "fileutils"

File.open("file", "w").puts "This is a file."
FileUtils.cp("file", "newfile")
~~~

I/O가 버퍼링되어 있기 때문에 `file`의 내용이 디스크에 기록되기 전에 복사되고
있습니다. `newfile`은 아마도 비어 있을 것입니다. 그러나 프로그램이 종료되면
버퍼가 플러시되고 파일에는 예상되는 콘텐츠가 있습니다.

복사하기 전에 '파일'이 닫혀 있는지 확인하면 문제가 발생하지 않습니다.

~~~
require "fileutils"

File.open("file", "w") {|f| f.puts "This is a file." }
FileUtils.cp("file", "newfile")
~~~

### 현재 입력 파일에서 줄 번호를 얻으려면 어떻게 해야 하나요?

파일에서 읽을 때 Ruby는 전역 변수 `$.`의 줄 번호 카운터를 증가시킵니다. 이
기능은 `File` 객체의 `lineno` 속성을 사용하여 사용할 수도 있습니다.

특수 상수 `ARGF`는 명령줄에 지정된 모든 입력 파일(파일이 없는 경우 표준 입력)을
읽는 데 사용할 수 있는 파일과 유사한 객체입니다. `ARGF`는 다음과 같은 코드에서
암시적으로 사용됩니다.

~~~
while gets
  print $_
end
~~~

이 경우 `$.`는 모든 입력 파일에서 읽은 누적 줄 수가 됩니다. 현재 파일에서
줄 번호를 가져오려면 다음 코드를 사용하세요.

~~~
ARGF.file.lineno
~~~

`ARGF.file.path`를 사용하여 현재 파일의 이름을 가져올 수도 있습니다.

### 프로그램 출력을 표시하기 위해 `less`를 사용하려면 어떻게 해야 하나요?

다음을 시도했지만 아무것도 나오지 않았습니다.

~~~
open("|less", "w").puts "abc"
~~~

프로그램이 즉시 종료되어서 `less`는 작성한 내용을 볼 기회를 얻지 못
하며 표시할 수도 없기 때문입니다. IO가 제대로 닫혔는지 확인하고 `less`가 끝날
때까지 기다리세요.

~~~
open("|less", "w") {|f| f.puts "abc" }
~~~

### 더 이상 참조되지 않는 `File` 객체는 어떻게 되나요?

더 이상 참조되지 않는 `File` 객체는 가비지 컬렉션 대상이 됩니다. `File` 객체가
가비지 컬랙션되면 파일은 자동으로 닫힙니다.

### 파일을 닫지 않으면 불안한 기분이 들어요.

파일을 닫는 데는 최소한 네 가지의 좋은 방법이 있습니다.

~~~
# (1)
f = File.open("file")
begin
  f.each {|line| print line }
ensure
  f.close
end

# (2)
File.open("file") do |f|
  f.each {|line| print line }
end

# (3)
File.foreach("file") {|line| print line }

# (4)
File.readlines("file").each {|line| print line }
~~~

### 수정 시간별로 파일을 정렬하려면 어떻게 해야 하나요?

~~~
Dir.glob("*").sort {|a, b| File.mtime(b) <=> File.mtime(a) }
~~~

이 방법은 작동하지만(시간 역순으로 목록을 반환), 비교할 때마다 운영 체제
에서 파일의 수정 시간을 가져오기 때문에 효율적이지 않습니다.

약간의 복잡성을 추가하면 더 효율적일 수 있습니다.

~~~
Dir.glob("*").map {|f| [File.mtime(f), f] }.
  sort {|a, b| b[0] <=> a[0] }.map(&:last)
~~~

### 파일에서 단어의 빈도를 계산하려면 어떻게 해야 하나요?

~~~
freq = Hash.new(0)
File.read("example").scan(/\w+/) {|word| freq[word] += 1 }
freq.keys.sort.each {|word| puts "#{word}: #{freq[word]}" }
~~~

결과:

~~~
and: 1
is: 3
line: 3
one: 1
this: 3
three: 1
two: 1
~~~

### 문자열을 알파벳 순서로 정렬하려면 어떻게 해야 하나요?

문자열을 'AAA', 'BBB', ..., 'ZZZ', 'aaa', 'bbb'로 정렬하려는 경우 추가 구현없이
내장 비교를 사용하는 것으로 충분합니다.

대/소문자 구분을 무시하고 정렬하려면 정렬 블록에서 대/소문자 구분이 없는 문자열
버전을 비교합니다.

~~~
array = %w( z bB Bb bb Aa BB aA AA aa a A )
array.sort {|a, b| a.downcase <=> b.downcase }
  # => ["a", "A", "Aa", "aA", "AA", "aa", "bB", "Bb", "bb", "BB", "z"]
~~~

'A'와 'a'가 함께 나오지만 'a'가 'A'보다 큰 것으로 간주되도록 정렬하려면
(즉, 'Aa'가 'AA' 뒤에 오지만 'AB' 앞에 오도록) 이렇게 하세요.

~~~
array.sort {|a, b| (a.downcase <=> b.downcase).nonzero? || a <=> b }
  # => ["A", "a", "AA", "Aa", "aA", "aa", "BB", "Bb", "bB", "bb", "z"]
~~~

### 탭을 스페이스로 확장하려면 어떻게 해야 하나요?
{: #tab-expansion}

확장할 문자열이 `a`인 경우 다음 중 하나를 사용할 수 있습니다.

~~~
1 while a.sub!(/(^[^\t]*)\t(\t*)/){$1+" "*(8-$1.size%8+8*$2.size)}
# 또는
1 while a.sub!(/\t(\t*)/){" "*(8-$~.begin(0)%8+8*$1.size)}
# 또는
a.gsub!(/([^\t]{8})|([^\t]*)\t/n){[$+].pack("A8")}
~~~

### 정규식에서 백슬래시를 이스케이프하려면 어떻게 해야 하나요?

`Regexp.quote('\\')`는 백슬래시를 이스케이프합니다.

`sub`와 `gsub`를 사용하는 경우 더 까다로워집니다. 백슬래시를 각각
두 개로 바꾸기 위해 `gsub(/\\/, '\\\\')`를 작성한다고 가정해 보겠습니다.
두 번째 인수는 구문 분석에서 `'\\'`로 변환됩니다. 치환이 발생하면 정규식
엔진이 이를 `'\'`로 변환하므로 결과적으로 백슬래시 하나씩을 다른 백슬래시
하나로 대체하게 됩니다. 그래서 `gsub(/\\/, '\\\\\\')`로 작성해야 합니다!

그러나 `\&`는 매칭한 문자열을 포함한다는 사실을 사용하여 `gsub(/\\/, '\&\&')`라
적을 수도 있습니다.

`gsub`의 블록 형식, 즉 `gsub(/\\/) { '\\\\' }`를 사용하면 대체 문자열은 구문
전달 중에 한 번만 분석되며 결과는 사용자가 의도한 대로 나타납니다.

### `sub`와 `sub!`의 차이점은 무엇인가요?

`sub`에서는 수신자의 복사본이 생성되고 치환되어 반환됩니다.

`sub!`에서는 수신자가 변경되고 일치하는 항목이 발견되면 반환됩니다.
그렇지 않으면 `nil`이 반환됩니다.

수신자의 속성을 변경하는 `sub!`와 같은 메서드를
[파괴적 메서드](../7/#destructive-method)라고 합니다. 일반적으로 유사한
메서드가 두 개 있고 하나가 파괴적인 경우, 파괴적인 메서드에는 접미사 `!`가
붙습니다.

~~~
def foo(str)
  str.sub(/foo/, "baz")
end

obj = "foo"
foo(obj)  # => "baz"
obj       # => "foo"

def foo(str)
  str.sub!(/foo/, "baz")
end

foo(obj)  # => "baz"
obj       # => "baz"
~~~

### `\Z`는 어디에 일치하나요?

문자열이 `\n`으로 끝나면 마지막 `\n`(줄 바꿈) 바로 앞에 `\Z`가 일치하고,
그렇지 않으면 문자열 끝에서 일치합니다.

### `thread`와 `fork`의 차이점은 무엇인가요?

{% include warnings/faq_out_of_date.html %}

Ruby 스레드는 인터프리터 내에서 구현되는 반면, `fork`는 운영 체제를 호출하여
별도로 실행되는 서브 프로세스를 생성합니다.

스레드와 `fork`에는 다음과 같은 특징이 있습니다.

* `fork`는 느리지만 `thread`는 그렇지 않습니다.
* `fork`는 메모리 공간을 공유하지 않습니다.
* `thread`는 쓰레싱을 일으키지 않습니다.
* `thread`는 DOS에서 작동합니다.
* `thread`가 교착상태에 빠지면 전체 프로세스가 멈춥니다.
* `fork`는 I/O가 완료되기를 기다리는 일시 중지를 이용할 수 있지만,
  `thread`는 그렇지 않습니다 (적어도 약간의 도움 없이는).

`fork`와 `thread`를 혼용해서는 안 됩니다.

### `Marshal`은 어떻게 사용하나요?

`Marshal`은 객체를 파일이나 문자열에 저장하고 나중에 재구성하는 데 사용됩니다.
객체는 다음을 사용하여 저장할 수 있습니다.

~~~
Marshal.dump( obj [, io ] [, lev] )
~~~

`io`는 쓰기 가능한 `IO` 객체이고, `lev`는 객체가 역참조되어 저장되는 레벨을
지정합니다. `lev` 레벨의 역참조가 완료되고 객체 참조가 여전히 존재하는 경우
`dump`는 참조된 객체가 아닌 참조만 저장합니다. 이렇게 참조된 객체는 나중에
재구성할 수 없으므로 좋지 않습니다.

`io`가 생략되면 마샬링된 객체가 문자열로 반환됩니다.

다음을 사용하여 개체를 다시 로드할 수 있습니다.

~~~
obj = Marshal.load(io)
# 아니면
obj = Marshal.load(str)
~~~

여기서 `io`는 읽을 수 있는 `IO` 객체, `str`은 덤프된 문자열입니다.

### `trap`은 어떻게 사용하나요?

`trap`은 코드 블록을 외부 이벤트(신호)와 연결합니다.

~~~
trap("PIPE") { raise "SIGPIPE" }
~~~
