---
layout: page
title: "Tài liệu"
lang: vi
---

Hướng dẫn, bài học và tài liệu tham khảo giúp bạn tìm hiểu thêm về Ruby
{: .summary}

### Cài đặt Ruby

Mặc dù bạn có thể dễ dàng [thử Ruby ngay trên trình duyệt][1], bạn cũng có thể
đọc [hướng dẫn cài đặt](installation/) để được trợ giúp về việc cài đặt Ruby.

### Tài liệu Ruby chính thức

[docs.ruby-lang.org/en][docs-rlo]: Danh sách tài liệu cho tất cả các phiên bản Ruby được phát hành sau 2.1.

[docs.ruby-lang.org/en/4.0][docs-rlo-4.0]: Tài liệu cho Ruby 4.0.

[docs.ruby-lang.org/en/master][docs-rlo-master]: Tài liệu cho nhánh master của Ruby.

[C Extension Guide][docs-rlo-extension]: Hướng dẫn chuyên sâu về cách tạo C extension cho Ruby.

### Bắt đầu

[Try Ruby][1]
: Bạn có thể thử Ruby ngay trên trình duyệt.

[Learn to Program][8]
: Một bài hướng dẫn nhỏ tuyệt vời của Chris Pine dành cho người mới học lập trình.
  Nếu bạn chưa biết lập trình, hãy bắt đầu từ đây.

[Ruby in Twenty Minutes][rubyin20]
: Một bài hướng dẫn Ruby ngắn gọn chỉ mất không quá 20 phút để
  hoàn thành.

[The Odin Project][odin]
: Chương trình giảng dạy full stack mã nguồn mở

[Exercism][exercism]
: 120 bài tập với phân tích tự động và hướng dẫn cá nhân.

[Codecademy][codecademy]
: Khóa học lập trình trực tuyến với đa dạng chủ đề.

### Sách hướng dẫn / Sách

#### Cơ bản

[Programming Ruby 3.3][pickaxe]
: Tác phẩm nền tảng về Ruby bằng tiếng Anh. Mới được cập nhật cho Ruby 3.3.

[The Well-Grounded Rubyist][grounded]
: Một bài hướng dẫn bắt đầu từ chương trình Ruby đầu tiên của bạn và đưa bạn đến những chủ đề nâng cao như reflection, threading và recursion.

#### Trung cấp

[Practical OOD in Ruby (POODR)][poodr]
: Câu chuyện của một lập trình viên về cách viết mã hướng đối tượng.

#### Nâng cao

[Metaprogramming][meta]
: Giải thích metaprogramming theo phong cách dễ hiểu và thực tế.

[Ruby Under a Microscope (RUM)][microscope]
: Hướng dẫn có minh họa về cơ chế bên trong của Ruby.

### Tài liệu cộng đồng

Các trang tài liệu này được duy trì bởi cộng đồng Ruby.

[RubyDoc.info][16]
: Trang web tham khảo tài liệu toàn diện về các Ruby gem và
  các dự án Ruby trên GitHub.

[RubyAPI.org][rubyapi-org]
: Dễ dàng tìm kiếm và duyệt các class, module và method của Ruby.

[ruby-doc.org][39]
: Tài liệu API trực tuyến

[DevDocs.io][40]
: Tài liệu API trực tuyến

[Ruby QuickRef][42]
: Tham khảo nhanh về Ruby

[rubyreferences][43]
: Tham khảo ngôn ngữ đầy đủ + nhật ký thay đổi ngôn ngữ chi tiết.

### Hướng dẫn về phong cách viết mã

[rubystyle.guide][44]
: Hướng dẫn phong cách Ruby của RuboCop

[RuboCop][45]
: Công cụ tự động áp dụng hướng dẫn phong cách viết mã của họ.

[Shopify][46]
: Hướng dẫn phong cách Ruby của Shopify

[GitLab][47]
: Hướng dẫn phong cách Ruby của GitLab

[Airbnb][48]
: Hướng dẫn phong cách Ruby của Airbnb

[w3resource][49]
: Hướng dẫn phong cách Ruby của W3

# Công cụ

[IRB][50]
: Vòng lặp Read-Eval-Print-Loop (REPL) tương tác của Ruby

[Pry][51]
: Một REPL thay thế cho Ruby

[Rake][52]
: Công cụ build tương tự make dành cho Ruby.

[RI][53]
: (Ruby Information) là tiện ích dòng lệnh của Ruby giúp truy cập nhanh chóng và dễ dàng vào tài liệu Ruby.

[RBS][54]
: Chữ ký kiểu dữ liệu cho Ruby

[TypeProf][55]
: Trình thông dịch Ruby thử nghiệm ở mức kiểu dữ liệu để kiểm tra và hiểu mã Ruby.

[Steep][56]
: Trình kiểm tra kiểu dữ liệu tĩnh cho Ruby.

### Trình soạn thảo và IDE

Để lập trình Ruby, bạn có thể sử dụng trình soạn thảo mặc định của hệ
điều hành. Tuy nhiên, để lập trình hiệu quả hơn, bạn nên chọn một trình soạn thảo mã nguồn có hỗ trợ Ruby cơ bản (ví dụ:
tô sáng cú pháp, duyệt tệp) hoặc một môi trường phát triển tích hợp
với các tính năng nâng cao (ví dụ: tự động hoàn thành mã, tái cấu trúc,
hỗ trợ kiểm thử).

Dưới đây là danh sách các trình soạn thảo phổ biến được các lập trình viên Ruby
sử dụng, phân loại theo độ khó học:

* Vài ngày
  * [Sublime Text][37] (trả phí)
  * [Visual Studio Code][vscode]
  * [Zed][zed]
* Vài tháng
  * [RubyMine][27] (trả phí)
* "Vài năm" (nghĩa là bạn sẽ mất nhiều năm vẫn còn học thêm được điều mới)
  * [Emacs][20] với [Ruby mode][21] hoặc [Enhanced Ruby mode][enh-ruby-mode]
  * [Vim][25] với plugin [vim-ruby][26]
  * [NeoVim][neovim]

Tất cả các trình soạn thảo trên đều hỗ trợ Language Server Protocol (LSP),
mặc định hoặc thông qua các plugin LSP. [ruby-lsp][ruby-lsp] của Shopify
là một trong những language server phổ biến nhất cho
Ruby và [hỗ trợ tất cả các trình soạn thảo nêu trên][ruby-lsp-supported-editors].

### Tài liệu / Tài nguyên cũ

Các liên kết này từng nổi bật nhưng đã không được cập nhật từ lâu.

[Ruby Koans][2]
: Koans dẫn dắt bạn trên con đường giác ngộ để học
  Ruby. Mục tiêu là học ngôn ngữ Ruby, cú pháp, cấu trúc và
  một số hàm và thư viện phổ biến. Chúng tôi cũng dạy bạn về văn hóa.

[Ruby Essentials][7]
: Một cuốn sách trực tuyến miễn phí được thiết kế để cung cấp hướng dẫn
  ngắn gọn và dễ theo dõi để học Ruby.

[Why's (Poignant) Guide to Ruby][5]
: Một cuốn sách độc đáo và thú vị sẽ dạy bạn Ruby
  thông qua những câu chuyện, sự hài hước và truyện tranh. Được tạo bởi *why the lucky
  stiff*, hướng dẫn này vẫn là một tác phẩm kinh điển cho người học Ruby.

[Learn Ruby the Hard Way][38]
: Một bộ bài tập rất tốt với các giải thích hướng dẫn bạn từ
  những kiến thức cơ bản nhất của Ruby cho đến OOP và phát triển web.

[Programming Ruby][9]
: Tác phẩm nền tảng về Ruby bằng tiếng Anh, phiên bản đầu tiên của
  [cuốn sách Pragmatic Programmers][10] có sẵn miễn phí trực tuyến.

[The Ruby Programming Wikibook][12]
: Sách hướng dẫn trực tuyến miễn phí với nội dung cho người mới bắt đầu
  và trung cấp cùng với tài liệu tham khảo ngôn ngữ chi tiết.

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
[docs-rlo-4.0]: https://docs.ruby-lang.org/en/4.0
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
[rubyin20]: https://www.ruby-lang.org/vi/documentation/quickstart/
[vscode]: https://code.visualstudio.com/docs/languages/ruby
[zed]: https://zed.dev/
