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


### 초보자용 문서

[Try Ruby][1]
: You can try Ruby right in your browser.

[Learn to Program][8] (영문)
: Chris Pine 님이 작성한 초보자를 위한 작고 멋진 튜토리얼입니다.
  프로그래밍을 모르신다면 여기서 시작하세요.

[Learn Ruby the Hard Way][38] (영문)
: 아주 기초적인 내용부터 OOP에서 웹 개발까지 다루는 매우 좋은 설명이
  달린 예제들입니다.

[Ruby in Twenty Minutes][rubyin20]
: A small Ruby tutorial that should take no more than 20 minutes to
  complete.

[The Odin Project][odin]
: An open source full stack curriculum

[excercism][exercism]
: 120 exercises with automatic analysis and personal mentoring.

[Codecademy][codecademy]
: Online code bootcamp with a variety of topics. Freeish.

[Ruby For Impatient Nuby][ko-1]
: 서민구 님이 작성하신 Ruby 초보자를 위한 튜토리얼입니다.

[루비 프로그래밍 언어 FAQ][ko-2]
: 황대산 님이 정리하신 FAQ입니다.

### Manuals / Books

#### Beginner

[Programming Ruby 3.3][pickaxe]
: The seminal work on Ruby in English. Recently updated to Ruby 3.3.

[The Well-Grounded Rubyist][grounded]
: A tutorial that begins with your first Ruby program and takes you all the way to sophisticated topics like reflection, threading, and recursion.

#### Intermediate

[Practical OOD in Ruby (POODR)][poodr]
: A programmer's tale about how to write object-oriented code.

#### Expert

[Metaprogramming][meta]
: Explains metaprogramming in a down-to-earth style.

[Ruby Under a Microscope (RUM)][microscope]
: An illustrated guide to Ruby internals.

### 참조

[공식 API 문서][docs-rlo-en] [(JP)][docs-rlo-jp]
: 아직 릴리스되지 않은 트렁크를 포함한 여러 Ruby 버전의 공식 언어 문서입니다.

[Ruby C API 레퍼런스][extensions] (영문) [(JP)][extensions-jp]
: Ruby의 공식 C API 문서입니다.
  Ruby 개발에 참여하거나, C 확장을 개발할 때 도움이 될 것입니다.

[RubyDoc.info][16] (영문)
: Ruby gem과 GitHub에서 호스팅 되는 Ruby 프로젝트의 레퍼런스 문서들을
  모아놓은 사이트입니다.

[Ruby API][40] (영문)
: Ruby 클래스, 모듈, 메서드를 편하게 찾고 탐색하세요.

[ruby-doc.org][39]
: Online API documentation

[DevDocs.io][40]
: Online API documentation

[Ruby QuickRef][42]
: The Ruby quick reference

[rubyreferences][43]
: A full language reference + detailed language changelog. Fantastic.

### Style Guides

[rubystyle.guide][44]
: RuboCop's Ruby style guide

[RuboCop][45]
: Automated enforcement of their style guide.

[Shopify][46]
: Shopify's Ruby style guide

[GitLab][47]
: Gitlab's Ruby style guide

[Airbnb][48]
: Airbnb's Ruby style guide

[w3resource][49]
: W3's Ruby style guide

# Tools

[IRB][50]
: The interactive Ruby Read-Eval-Print-Loop (REPL)

[Pry][51]
: An alternative Ruby REPL

[Rake][52]
: A make-like build utility for Ruby.

[RI][53]
: (Ruby Information) is the Ruby command-line utility that gives fast and easy on-line access to Ruby documentation.

[RBS][54]
: Type Signature for Ruby

[TypeProf][55]
: An experimental type-level Ruby interpreter for testing and understanding Ruby code.

[Steep][56]
: Static type checker for Ruby.

### 편집기와 IDE

Ruby를 코딩할 때 운영체제의 기본 편집기를 사용할 수 있습니다. 하지만,
더욱 효율적인 코딩을 위해, 기본적으로 Ruby를 지원하는(신택스 하이라이팅,
파일 브라우징 등등) 편집기나 고급 기능(자동완성, 리팩토링, 테스트
지원 등등)이 있는 통합 개발 환경도 생각해 볼 만합니다.

Here is a list of popular editors used by Rubyists, broken up by
learning curve:

* Days
  * [Sublime Text][37] (paid)
  * [Visual Studio Code][vscode]
  * [Zed][zed]
* Months
  * [RubyMine][27] (paid)
* "Years" (as in, you'll spend years still learning things about it)
  * [Emacs][20] with [Ruby mode][21] or [Enhanced Ruby mode][enh-ruby-mode]
  * [Vim][25] with [vim-ruby][26] plugin
  * [NeoVim][neovim]

All of these editors support the Language Server Protocol (LSP),
either by default or through their LSP plugins. Shopify's
[ruby-lsp][ruby-lsp] is one of the most popular language servers for
Ruby and [supports all of the above editors][shopify_lsp].

### Older Reading / Resources

These links were more prominent but haven't been updated in ages.

[Ruby Koans][2]
: The Koans walk you along the path to enlightenment in order to learn
  Ruby. The goal is to learn the Ruby language, syntax, structure, and
  some common functions and libraries. We also teach you culture.

[Ruby Essentials][7]
: A free on-line book designed to provide a concise
  and easy to follow guide to learning Ruby.

[Why’s (Poignant) Guide to Ruby][5]
: An unconventional but interesting book that will teach you Ruby
  through stories, wit, and comics. Originally created by *why the lucky
  stiff*, this guide remains a classic for Ruby learners.

[Learn Ruby the Hard Way][38]
: A very good set of exercises with explanations that guide you from
  the absolute basics of Ruby all the way to OOP and web development.

[Programming Ruby][9]
: The seminal work on Ruby in English, this first edition of the
  [Pragmatic Programmers’ book][10] is available for free online.

[The Ruby Programming Wikibook][12]
: A free online manual with beginner and intermediate content plus a
  thorough language reference.

[1]: https://try.ruby-lang.org/
[2]: https://rubykoans.com/
[5]: https://poignant.guide
[7]: https://www.techotopia.com/index.php/Ruby_Essentials
[8]: https://pine.fm/LearnToProgram/
[9]: https://www.ruby-doc.org/docs/ProgrammingRuby/
[10]: https://pragprog.com/titles/ruby5/programming-ruby-3-3-5th-edition/
[12]: https://en.wikibooks.org/wiki/Ruby_programming_language
[16]: https://www.rubydoc.info/
[20]: https://www.gnu.org/software/emacs/
[21]: https://www.emacswiki.org/emacs/RubyMode
[25]: https://www.vim.org/
[26]: https://github.com/vim-ruby/vim-ruby
[27]: https://www.jetbrains.com/ruby/
[34]: https://ruby-doc.org/
[37]: https://www.sublimetext.com/
[38]: https://learncodethehardway.org/ruby/
[39]: https://www.ruby-doc.org/
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
[docs-rlo-en]: https://docs.ruby-lang.org/en/latest
[docs-rlo-jp]: https://docs.ruby-lang.org/ja/latest
[enh-ruby-mode]: https://github.com/zenspider/enhanced-ruby-mode/
[exercism]: https://exercism.org/tracks/ruby
[extensions-jp]: https://docs.ruby-lang.org/jp/master/extension_rdoc.html
[extensions]: https://docs.ruby-lang.org/en/master/extension_rdoc.html
[grounded]: https://www.manning.com/books/the-well-grounded-rubyist-third-edition
[meta]: https://pragprog.com/titles/ppmetr2/metaprogramming-ruby-2/
[microscope]: https://patshaughnessy.net/ruby-under-a-microscope
[neovim]: https://neovim.io/
[odin]: https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby
[pickaxe]: https://pragprog.com/titles/ruby5/programming-ruby-3-3-5th-edition/
[poodr]: https://www.poodr.com/
[ruby-lsp]: https://github.com/Shopify/ruby-lsp
[rubyapi-org]: https://rubyapi.org/
[rubyin20]: https://www.ruby-lang.org/en/documentation/quickstart/
[shopify_lsp]: https://shopify.github.io/ruby-lsp/editors.html)
[vscode]: https://code.visualstudio.com/docs/languages/ruby
[zed]: https://zed.dev/

[ko-1]: https://docs.google.com/document/d/15yEpi2ZMB2Lld5lA1TANt13SJ_cKygP314cqyKhELwQ/preview
[ko-2]: https://web.archive.org/web/20190521035426/http://beyond.daesan.com/pages/ruby-faq
