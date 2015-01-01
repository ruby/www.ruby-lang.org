---
layout: page
title: "RubyGem 패키지 빌드"
lang: ko
---

## Gem 패키지 작성하기

### 0. 들어가기

이 문서는 rubygems를 이용한 패키징 방법을 설명한다. rubygems는 아마도 Ruby에 있어 가장 유명하면서 강력한
패키지 관리 시스템일 것이다. 이외에도 ruby extension을 이용하거나 Rake를 이용하는 방법, site\_ruby
디렉터리에 스크립트 파일을 복사하는 등의 방법이 있겠으나, 체계적이고 편리한 관리 시스템을 제공하는 rubygems가 가장
효율적이지 않을까 싶다. 물론 용도 자체가 다른 entension의 경우는 이에 해당하지 않을 수 있다.

아래에서 제시하고 있는 것은 매우 간략한 방법일 뿐이므로 참고용도로만 사용하기 바란다.

### 1. Manifest

일반적인 구조(Manifest)는 아래와 같을 것이다.

    CHANGELOG
    README
    doc/
    lib/
    Rakefile
    test/

* CHANGELOG: 추가/변경과 같은 이력
* README
* doc: RDocTask로 생성한 문서
* lib: 소스 코드
* Rakefile: RakeTask를 정의한 스크립트
* test: 테스트 코드

간략히 위에서 정리한 대로 사용자를 위한 문서로서 CHANGELOG와 README가 필요할 것이다. 이들 파일의 경우 RDoc의
형식을 취해주는 것이 일반적일 것이며, 문서의 양이 길어질 경우 :include:를 이용하여 몇 개의 문서로 나누어 두는 것도
좋은 방법이다.

doc의 경우 RDockTask를 정의해 두었을 경우에 유효할 것이며, 사용자에게 있어서 API로서 활용될 수 있을 것이다.
배포의 용이성을 위해 이를 삭제시켜 두는 것도 하나의 방법이다. gem 빌드시 소스 코드에 기술된 코멘트가 RDoc으로 자동
변환되기에 반드시 필요한 것도 아니기 때문이다.

lib은 실제 소스 코드를 담고 있는 디렉터리이다. 이름을 반드시 lib으로 지정할 필요는 없지만, 일반적으로 lib이란 이름을
선호하는 듯 하다.

Rakefile의 경우 포함시키지 않아도 별 문제는 되지 않지만, rubygems을 사용하지 않는 환경이나 build 이외의
기능(RDoc 생성, 테스트 등)을 위해 유용하게 사용되므로 포함시켜두는 것을 추천한다.

이외에도 bin과 같은 실행시 사용될 파일을 넣어두는 디렉터리 등을 추가해줄 수 있다. Manifest라고는 했지만
Rakefile을 제외하고는 자유롭게 이름을 지어줄 수 있다. 하지만 일반적인 관습을 따르는 것이 사용자의 혼동을 줄이는데 더
도움이 될 것이다.

### 2. Gem Spec 파일의 작성

Gem Spec 파일은 패키지를 작성하는데 필요한 내용을 기술한 파일이다. RPM을 빌드할 때 사용되는 Spec파일을 생각하면
좋을 것 같다. 이 파일에 기술되는 내용은 이름, 설명, 버젼과 같은 정보를 비롯하여 의존성이나 빌드시 포함되어야할 파일 리스트
등을 포함한다. 그러므로 작성하고자 하는 패키지의 모든 정보를 담고 있다고 해도 과언이 아니다. Spec 파일을 작성함으로써
패키지의 전반적인 구조와 의존관계 등 밑그림을 그려둘수도 있기에, 실제 소스를 작성하기 전 Spec파일부터 작성해 두는 것도
하나의 방법이다.

아래는 예시인 Hello World의 Gem Spec파일의 내용이다.

hello\_world.gemspec

        Gem::Specification.new do |s|
          s.name    = 'hello_world'
          s.version = '0.0.1'
          s.date    = '2010-03-01'
          s.summary = 'Hello World.'
          s.description = 'Print out Hellow World.'

          s.author   = 'author'
          s.email    = 'mail@test.com'
          s.homepage = 'http://test.com/'

          s.files = ["README", "CHANGELOG", "lib/hello_world.rb"]
        end

대략적인 내용은 Gem::Specification의 인스턴스를 참고하면 알 수 있을 것이다. 이에 대한 자세한 내용은
[docs.rubygems.org][1]에서 찾아볼 수 있다.

### 3. 소스 코드 작성

Manifest와 Gem Spec이 구체적으로 결정되었다면 실제로 동작을 담당하게 될 소스 코드(rb스크립트)를 작성한다.

lib/hello\_world.rb

        module HelloWorld
          def self.hello
            puts 'Hello World'
          end
        end

### 4. Gem 빌드하기 &amp; 설치하기

이 과정에서는 2, 3번 과정에서 작성한 결과물을 빌드하여 gem 파일을 생성한다. Gem 파일은 gemspec에서 기술한 모든
내용이 포함되는 바이너리이다. gem install 커맨드를 실행할 때 설치에 이용되는 파일이기도 하다.

        $ gem build example hello_world.gemspec
        Successfully built RubyGem
        ...

빌드에 성공했다는 메시지가 뜨면 hello\_world-0.0.1.gem이 동일한 디렉터리에 생성이 되어 있을 것이다.
#\{name}-#\{version}.gem 과 같은 형식은 Spec 파일에 기술된 내용을 토대로 한다.

    $ gem install hello_world-0.0.1.gem

무사히 설치까지 마쳤다면 irb 등을 통해 동작여부를 확인해 볼 수 있다.

        require 'rubygems' if 1.9 > VERSION.to_f
        require 'hello_world'

        HelloWorld.hello #=> "Hello World"

### 5. 마무리

위에서 설명한 것 이외에도 Gem Spec과 Rake 등을 이용하여 원하는대로 패키징할 수 있는 많은 방법이 있을 것이다. 실제로
lib이나 README, Rakefile 등을 제외하고는 관습에 얽매이지 않는 경우도 많이 보아왔기 때문이다. 이 문서를 통해
대체적인 gem 빌드 방법을 알게 되었다면 그것으로 충분할 것이다.

*작성자: Moru(2010.03.29)*



[1]: http://docs.rubygems.org/read/chapter/20#page85
