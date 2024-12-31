---
layout: page
title: "Documentation"
lang: en
---

Guides, tutorials, and reference material to help you learn more about Ruby
{: .summary}

### Installing Ruby

Although you can easily [try Ruby in your browser][1], you can also read
the [installation guide](installation/) for help on installing Ruby.

### Official Ruby Documentation

[docs.ruby-lang.org/en][docs-rlo]: List of documentation for all Ruby versions released after 2.1.

[docs.ruby-lang.org/en/3.4][docs-rlo-3.4]: Documentation for Ruby 3.4.

[docs.ruby-lang.org/en/master][docs-rlo-master]: Documentation for the latest Ruby version (master).

[C Extension Guide][docs-rlo-extension]: In-depth guide for creating C extensions for Ruby.

### Getting Started

[Try Ruby][1]
: You can try Ruby right in your browser.

[Learn to Program][8]
: A wonderful little tutorial by Chris Pine for programming newbies. If
  you don’t know how to program, start here.

[Ruby in Twenty Minutes][rubyin20]
: A small Ruby tutorial that should take no more than 20 minutes to
  complete.

[The Odin Project][odin]
: An open source full stack curriculum

[excercism][exercism]
: 120 exercises with automatic analysis and personal mentoring.

[Codecademy][codecademy]
: Online code bootcamp with a variety of topics.

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

### Community Documentation

These documentation sites are maintained by the Ruby community.

[RubyDoc.info][16]
: The one-stop web site for reference documentation about Ruby gems and
  GitHub-hosted Ruby projects.

[RubyAPI.org][rubyapi-org]
: Easily find and browse Ruby classes, modules, and methods.

[ruby-doc.org][39]
: Online API documentation

[DevDocs.io][40]
: Online API documentation

[Ruby QuickRef][42]
: The Ruby quick reference

[rubyreferences][43]
: A full language reference + detailed language changelog.

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

### Editors and IDEs

For coding in Ruby, you can use the default editor of your operating
system. By the way, to be more effective in coding, it is worth choosing a source code editor with basic Ruby support (e.g.
syntax-highlighting, file browsing) or an integrated development
environment with advanced features (e.g. code completion, refactoring,
testing support).

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
[rubyapi-org]: https://rubyapi.org/
[rubyin20]: https://www.ruby-lang.org/en/documentation/quickstart/
[shopify_lsp]: https://shopify.github.io/ruby-lsp/editors.html)
[vscode]: https://code.visualstudio.com/docs/languages/ruby
[zed]: https://zed.dev/
