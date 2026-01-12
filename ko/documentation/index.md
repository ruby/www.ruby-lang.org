---
layout: page
title: "문서"
lang: ko
---

Ruby를 배울 수 있는 매뉴얼과 튜토리얼, 코딩할 때 도움이 되는 레퍼런스를
정리했습니다.

아직은 한국어 문서가 많지 않습니다. 다른 언어로 된 문서를 번역해주시면 큰
도움이 됩니다. 여기 언급되지 않은 좋은 문서가 있다면 알려주시기 바랍니다.
{: .summary}

### Ruby 설치하기

[Ruby를 브라우저에서 시험해 볼 수도 있지만][1], Ruby를 설치하기 위해서
[설치 설명서](installation/)를 읽어보아도 좋습니다.

### 공식 Ruby 문서

[docs.ruby-lang.org/en][docs-rlo]: Ruby 2.1 이후의 모든 버전에 대한 문서 목록입니다.

[docs.ruby-lang.org/en/3.4][docs-rlo-3.4]: Ruby 3.4 버전에 대한 문서입니다.

[docs.ruby-lang.org/en/master][docs-rlo-master]: Ruby의 master 브랜치의 문서입니다.

[C Extension Guide][docs-rlo-extension]: Ruby의 C 확장을 만드는 방법에 대한 상세 가이드입니다.

### 초보자용 문서

[Try Ruby][1]
: 브라우저에서 Ruby를 시험해 볼 수 있습니다.

[Learn to Program][8]
: Chris Pine 님이 작성한 초보자를 위한 작고 멋진 튜토리얼입니다.
  프로그래밍을 모르신다면 여기서 시작하세요.

[Ruby in Twenty Minutes][rubyin20]
: 20분 이내에 끝낼 수 있는 작은 Ruby 튜토리얼입니다.

[The Odin Project][odin]
: 오픈소스 풀스택 커리큘럼입니다.

[Exercism][exercism]
: 자동 분석과 개인 멘토링이 포함된 120개의 연습문제가 제공됩니다.

[Codecademy][codecademy]
: 다양한 주제를 다루는 온라인 코드 부트캠프입니다.

[Ruby For Impatient Nuby][ko-1]
: 서민구 님이 작성하신 Ruby 초보자를 위한 튜토리얼입니다.

[루비 프로그래밍 언어 FAQ][ko-2]
: 황대산 님이 정리하신 FAQ입니다.

### 매뉴얼 / 책

#### 초보자

[Programming Ruby 3.3][pickaxe]
: 영어로 된 독창적인 Ruby 책입니다. 최근에 Ruby 3.3으로 업데이트되었습니다.

[The Well-Grounded Rubyist][grounded]
: 첫 Ruby 프로그램부터 리플렉션, 스레딩, 재귀 등과 같은 고급 주제까지 다루는 튜토리얼입니다.

#### 중급자

[Practical OOD in Ruby (POODR)][poodr]
: 객체지향 코드를 작성하는 방법에 대한 프로그래머의 이야기입니다.

#### 전문가

[Metaprogramming][meta]
: 메타 프로그래밍을 실용적인 방식으로 설명합니다.

[Ruby Under a Microscope (RUM)][microscope]
: Ruby 내부를 설명하는 그림이 포함된 가이드입니다.

### 커뮤니티 문서

다음은 Ruby 커뮤니티에 의해 유지되고 있는 문서입니다.

[RubyDoc.info][16]
: Ruby gem과 GitHub에서 호스팅 되는 Ruby 프로젝트의 레퍼런스 문서들을
  모아놓은 사이트입니다.

[Ruby API][40]
: Ruby 클래스, 모듈, 메서드를 편하게 찾고 탐색하세요.

[ruby-doc.org][39]
: 온라인 API 문서입니다.

[DevDocs.io][40]
: 온라인 API 문서입니다.

[Ruby QuickRef][42]
: 빠른 Ruby 참조 문서입니다.

[rubyreferences][43]
: 완전한 언어 레퍼런스와 상세한 언어 변경 로그입니다.

### 스타일 가이드

[rubystyle.guide][44]
: RuboCop의 Ruby 스타일 가이드

[RuboCop][45]
: RuboCop의 스타일 가이드를 자동으로 적용합니다.

[Shopify][46]
: Shopify의 Ruby 스타일 가이드

[GitLab][47]
: GitLab의 Ruby 스타일 가이드

[Airbnb][48]
: Airbnb의 Ruby 스타일 가이드

[w3resource][49]
: W3의 Ruby 스타일 가이드

# 도구

[IRB][50]
: 대화형 Ruby 셸(Read-Eval-Print-Loop, REPL)입니다.

[Pry][51]
: 또 다른 Ruby REPL입니다.

[Rake][52]
: Ruby의 make와 비슷한 빌드 유틸리티입니다.

[RI][53]
: RI(Ruby Information)는 Ruby의 명령줄 유틸리티로 Ruby 문서에 빠르고 쉽게 접근할 수 있습니다.

[RBS][54]
: Ruby의 타입 시그니처입니다.

[TypeProf][55]
: Ruby 코드를 테스트하고 이해하기 위한 실험적인 타입 수준의 Ruby 인터프리터입니다.

[Steep][56]
: Ruby의 정적 타입 검사기입니다.

### 편집기와 IDE

Ruby를 코딩할 때 운영체제의 기본 편집기를 사용할 수 있습니다. 하지만,
더욱 효율적인 코딩을 위해, 기본적으로 Ruby를 지원하는(신택스 하이라이팅,
파일 브라우징 등등) 편집기나 고급 기능(자동완성, 리팩토링, 테스트
지원 등등)이 있는 통합 개발 환경도 생각해 볼 만합니다.

루비스트가 사용하는 인기 있는 편집기 목록을
학습 곡선에 따라 나누어 놓았습니다.
* 며칠 안에 익힐 수 있는 편집기
  * [Sublime Text][37] (유료)
  * [Visual Studio Code][vscode]
  * [Zed][zed]
* 몇 개월 정도 걸리는 편집기
  * [RubyMine][27] (유료)
* "몇 년" (즉, 몇 년 동안 새로운 것을 계속 배울 수 있는 에디터)
  * [Ruby 모드][21]나 [향상된 Ruby 모드][enh-ruby-mode]를 사용하는 [Emacs][20]
  * [vim-ruby][26] 플러그인을 사용하는 [Vim][25]
  * [NeoVim][neovim]

위에서 언급한 모든 편집기는 기본으로 또는 LSP 플러그인을 통해
언어 서버 프로토콜(LSP)을 지원합니다. Shopify의 [ruby-lsp][ruby-lsp]는
Ruby를 위한 가장 인기 있는 언어 서버 중 하나이며,
[위에서 언급한 모든 편집기를 지원합니다][ruby-lsp-supported-editors].

### 오래된 문서 / 리소스

다음 링크들은 한때 더 주목받았지만 오랫동안 업데이트되지 않았습니다.

[Ruby Koans][2]
: Koans는 Ruby를 배우는 깨달음의 길로 여러분을 안내합니다. Koans의 목표는
  Ruby 언어, 문법, 구조, 일반적인 함수들과 라이브러리를 배우는 것입니다.
  Koans에서는 문화도 가르칩니다.

[Ruby Essentials][7]
: 간결하고 따라 하기 쉬운 Ruby 가이드를 제공하는
  무료 온라인 책입니다.

[Why’s (Poignant) Guide to Ruby][5]
: 이야기, 재치, 만화를 통해 Ruby를 가르쳐주는 틀에 얽매이지 않는 재미있는
  책입니다. *Why the Lucky Stiff*의 저작물로 Ruby를 배우는 사람을 위한
  고전입니다.

[Learn Ruby the Hard Way][38]
: 아주 기초적인 내용부터 OOP에서 웹 개발까지 다루는 매우 좋은 설명이
  달린 예제들입니다.

[Programming Ruby][9]
: 영어로 된 독창적인 Ruby 책입니다. [Pragmatic Programmers의 책][10]
  1판이 무료로 온라인에 공개되어 있습니다.

[The Ruby Programming Wikibook][12]
: 초보자와 중급자를 위한 무료 온라인 매뉴얼과
  언어 전체 레퍼런스입니다.

[1]: https://try.ruby-lang.org/
[2]: https://rubykoans.com/
[5]: https://poignant.guide
[7]: https://www.techotopia.com/index.php/Ruby_Essentials
[8]: https://pine.fm/LearnToProgram/
[9]: https://web.archive.org/web/20250512022451/https://ruby-doc.com/docs/ProgrammingRuby/
[10]: https://pragprog.com/titles/ruby5/programming-ruby-3-3-5th-edition/
[12]: https://en.wikibooks.org/wiki/Ruby_programming_language
[16]: https://www.rubydoc.info/
[20]: https://www.gnu.org/software/emacs/
[21]: https://www.emacswiki.org/emacs/RubyMode
[25]: https://www.vim.org/
[26]: https://github.com/vim-ruby/vim-ruby
[27]: https://www.jetbrains.com/ruby/
[37]: https://www.sublimetext.com/
[38]: https://learncodethehardway.org/ruby/
[39]: https://ruby-doc.org/
[40]: https://devdocs.io/ruby/
[42]: https://www.zenspider.com/ruby/quickref.html
[43]: https://rubyreferences.github.io/
[44]: https://rubystyle.guide/
[45]: https://github.com/rubocop/ruby-style-guide
[46]: https://ruby-style-guide.shopify.dev/
[47]: https://docs.gitlab.com/ee/development/backend/ruby_style_guide.html
[48]: https://github.com/airbnb/ruby
[49]: https://www.w3resource.com/ruby/ruby-style-guide.php
[50]: https://github.com/ruby/irb
[51]: https://github.com/pry/pry
[52]: https://github.com/ruby/rake
[53]: https://ruby.github.io/rdoc/RI_md.html
[54]: https://github.com/ruby/rbs
[55]: https://github.com/ruby/typeprof
[56]: https://github.com/soutaro/steep
[codecademy]: https://www.codecademy.com/learn/learn-ruby
[docs-rlo]: https://docs.ruby-lang.org/en
[docs-rlo-3.4]: https://docs.ruby-lang.org/en/3.4
[docs-rlo-master]: https://docs.ruby-lang.org/en/master
[docs-rlo-extension]: https://docs.ruby-lang.org/en/master/extension_rdoc.html
[enh-ruby-mode]: https://github.com/zenspider/enhanced-ruby-mode/
[exercism]: https://exercism.org/tracks/ruby
[grounded]: https://www.manning.com/books/the-well-grounded-rubyist-third-edition
[meta]: https://pragprog.com/titles/ppmetr2/metaprogramming-ruby-2/
[microscope]: https://patshaughnessy.net/ruby-under-a-microscope
[neovim]: https://neovim.io/
[odin]: https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby
[pickaxe]: https://pragprog.com/titles/ruby5/programming-ruby-3-3-5th-edition/
[poodr]: https://www.poodr.com/
[ruby-lsp]: https://github.com/Shopify/ruby-lsp
[ruby-lsp-supported-editors]: https://shopify.github.io/ruby-lsp/editors.html
[rubyapi-org]: https://rubyapi.org/
[rubyin20]: https://www.ruby-lang.org/ko/documentation/quickstart/
[vscode]: https://code.visualstudio.com/docs/languages/ruby
[zed]: https://zed.dev/

[ko-1]: https://docs.google.com/document/d/15yEpi2ZMB2Lld5lA1TANt13SJ_cKygP314cqyKhELwQ/preview
[ko-2]: https://web.archive.org/web/20190521035426/http://beyond.daesan.com/pages/ruby-faq
