---
layout: page
title: "Download Ruby"
lang: vi
---

Bạn có thể lấy phân phối Ruby mới nhất ở đây.
Bản ổn định hiện thời là {{ site.downloads.stable.version }}.
Xin hãy nhớ đọc [Giấy phép Ruby][license].
{: .summary}

### Ba cách để cài Ruby

Bạn có thể lấy một bản sao chép của Ruby với nhiều cách, và mỗi người khác nhau
chọn một trong ba cách sau vì nhiều li do khác nhau. Mỗi cách sẽ có một phân mục
ở dưới, nhưng đây là hướng dẫn tổng quan:

* **Biên dịch từ nguồn** là cách chuẩn mà phần mểm được chuyển giao trong nhiều
  năm qua. Đây là cách quen thuộc nhất cho phần lớn các nhà phát triển phần mềm.
* Một vài **công cụ của bên thứ ba** để giúp cài đặt Ruby. Đây thường là
  cách đơn giản dành cho cả những người ít kinh nghiệm và những người dùng cao cấp.
* Có một vài **hệ thống quản lí gói** hỗ trợ Ruby. Đây sẽ là cách
  thân thuộc nhất cho người nào sử dụng một hệ điều hành để làm mọi thứ, và
  họ thích gắn bó với những kiểu chuẩn cá biệt này.

Cuối cùng nếu bạn muốn chạy nhiều phiên bản của Ruby trên cùng máy, xin hãy
xem mục **công cụ bên thứ ba** và dùng RVM. Nó là cách dễ nhất để làm được
điều này, trừ khi bạn biết chính xác ban đang làm gì.

### Biên dịch Ruby từ mã nguồn

Cài từ mã nguồn là một giải pháp tuyệt vời khi bạn nắm vững các kiến thức hiệu chỉnh
môi trường hệ điều hành bạn đang dùng. Nó cũng là giải pháp nếu không có gói đóng
sẵn cho hạ tầng của bạn.

Nếu bạn gặp vấn đề biên dịch Ruby, bạn nên cân nhắc sử dụng một trong những công
cụ bên thứ ba trong phân mục tiếp theo.

* [Ruby {{ site.downloads.stable.version }}][stable-gz]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }}) Bản ổn định
* [Ruby {{ site.downloads.previous.version }}][previous-gz]
  (md5:&nbsp;{{ site.downloads.previous.md5.gz }}) Bản trước đó
* [Snapshot Ổn định][stable-snapshot-gz] Đây là một tarball snapshot mới nhất của
  nhánh Ổn định (ruby\_2\_0\_0).
* [Snapshot Mỗi đêm][nightly-gz] Đây là một tarball snapshot của mọi thứ có trong
  SVN mỗi đêm. Nó có thể có lỗi và một số vấn đề khác, cẩn thận khi sử dụng!

Để biết thêm thông tin về Ruby Subversion và Git repositories, đọc trang
[Ruby Core](/vi/community/ruby-core/).

### Công cụ của bên thứ ba

Nhiều Rubyist dùng công cụ bên thứ ba để cài Ruby. Chúng có nhiều lợi điểm
nhưng không được hỗ trợ chính thức. Nhưng bạn có thể tìm giúp đỡ từ cộng đồng
của các công cụ này.

#### RVM

Công cụ phổ cập nhất để cài Ruby là **RVM** (“Ruby Version Manager”). Không những
nó giúp bạn cài Ruby dễ dàng, nó còn cho phép bạn cài và quản lí nhiều sao bản
của Ruby trên cùng hệ thống. Thêm vào đó bạn cũng có thể cài những dị bản theo
chuẩn Ruby khác.

RVM có trên Mac OS X, Linux, hoặc bất cứ hệ thống giống UNIX. Người dùng Windows
nên thử [pik][5] hoặc dùng RubyInstaller. Trong phân mục tiếp theo sẽ chỉ cách
cài RubyInstaller.

Ở thời điểm bài viết này, bạn có thể cài RVM với:

{% highlight sh %}
$ \curl -L https://get.rvm.io | bash -s stable --ruby
{% endhighlight %}

Tham khảo tài liệu cài đặt mới RVM mới nhất trên trang [cài đặt RVM][7].
Lệnh trên sẽ cài cả RVM và phiên bản mới nhất của Ruby. RVM cũng có thể cài
tất cả các phiên bản triển khai khác của Ruby. Để xem tất cả phiên bẩn được
hỗ trợ, gõ `rvm list known`.

#### RubyInstaller

Nếu bạn dùng Windows, có một công cụ giúp bạn cài Ruby:
[RubyInstaller][8]. Nó cho bạn mọi thứ bạn cần để thiểt lập một môi trường phát
triển Ruby trên nền tảng Windows.

Để dùng RubyInstaller, download nó từ [trang download RubyInstaller][9]. Rồi
chạy trình cài đặt là xong,

Nếu bạn muốn cài Ruby để dùng Rails, bạn nên dùng [RailsInstaller][10]. Công cụ
này sử dụng RubyInstaller nhưng cho bạn nhiều công cụ có ích cho phát triển Rails.

### Hệ thống quản lí gói

Nếu bạn không thể biên dịch Ruby và bạn không muốn sử dụng các công cụ của bên
thứ ba, bạn có thể sử dụng trình quản lí gói của hệ thống để cài Ruby.

Một vài thành viên của cộng đồng Ruby không tán thành việc sử dụng trình quản lí
gỏi để cài Ruby, thay vào đó bạn nên dùng RVM. Trang này không muốn xoáy sâu vào
mặt lợi, mặt hại về việc các trình quản lý chỉ có những phiên bản cũ của Ruby
trong repositories. Nếu bạn muốn dùng bản Ruby mới nhất, bạn nên dùng đúng tên
gói hoặc dùng RVM.

#### Ruby trên Linux

Debian GNU/Linux hay Ubuntu dùng hệ thống quản lý gói apt.
Bạn có thể dùng nó như sau:

{% highlight sh %}
$ sudo apt-get install ruby1.9.1
{% endhighlight %}

Vâng, nó sẽ cài Ruby 1.9.2 hoặc mới hơn. Nó có một ‘thư viên các phiên bản tương
thích’ của 1.9.1, thế nên tên nó được đặt như vậy.

Nếu bạn cài gói ‘ruby’ và tùy vào bản phân phối bạn có thể cài vào phiên bản cũ hơn, Ruby 1.8 chẳng hạn.

Arch Linux dùng trình quản lý gói tên pacman. Để lấy Ruby, dùng:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Trên các hệ thống khác bạn có thể tìm gói từ repository của trình quản lý gói,
hoặc bạn nên xem xét sử dụng RVM.

#### Ruby trên Mac OS X

Ruby 2.0.0 được hỗ trợ trên Mac OS X Maverick. Ruby 1.8.7 và các gem phổ dụng được
hỗ trợ trên Mac OS X Lion. Để biết thêm chi tiết, xem [Ruby wiki tại Mac OS Forge][11].

Mac OS X Tiger có kèm đóng gói của bản 1.8.2, và Leopard thì kèm bản 1.8.6,
nhưng, nếu ai chưa nâng cấp lên Leopard thì có rất nhiều lựa chọn khác để cài
Ruby mới nhất.

Nhiều người dùng [Homebrew][12] như trình quản lý gói. Để lấy Ruby, chỉ cần:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Bởi vì OS X dựa trên nền UNIX, thế nên việc download và cài đặt từ nguồn cũng
dễ dàng và hiệu quả như các giải pháp khác. Để giúp bạn cài các phiên bản mới
của Ruby trên nền OS X, có lẽ sẽ là ý kiến tốt hơn nếu dùng RVM. Đánh `rvm notes`
để biết thêm thông tin của các hệ thống nhất định.

Nếu bạn tìm cách cài Ruby và (Rails), bài viết của Dan Benjamin [cho Tiger][13],
[cho Leopard][14], và [cho Snow Leopard][15] rất là hữu ích. Còn trên Lion,
[bài này][16] có thể giúp bạn.

#### Ruby trên Solaris và OpenIndiana

Ruby 1.8.7 cũng có cho Solaris 8 cho tới Solaris 10 trên
[Sunfreeware][17] và Ruby 1.8.7 cũng có trên [Blastwave][18].
Ruby 1.9.2p0 có thể tìm tại [Sunfreeware][17], có điều phiên bản này đã lỗi thời.
Sử dụng RVM sẽ giúp bạn chạy phiên bản Ruby mới nhất.

Để cài Ruby trên [OpenIndiana][19], xin dùng trình [Image Packaging System, hay IPS][20].
Nó sẽ cài bản Ruby và RubyGems mới nhất trực tiếp từ repostiory của OpenSolaris.
Đơn giản với lệnh:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Như đã nói ở trên, RVM là cách tốt để lấy phiên bản mới nhất của Ruby.

### Các phiên bản triển khai khác của chuẩn Ruby

Ruby, xem như là một chuẩn ngôn ngữ, có nhiều phiên bản triển khai. Bài hướng
dẫn này chỉ đề cập đến bản triển khai gốc, gọi là **MRI** (“Matz's Ruby
Interpreter”) hay **CRuby**, nhưng cũng có những bản khác trên thị trường.
Những bản khác đấy có lợi cho một số trường hợp nhất định, ví
dụ cung cấp thêm tính kết nối với các ngôn ngữ hay môi trường khác, hay có một
vài công năng đặc biệt mà MRI không có.

Sau đây là danh sách:

* [JRuby][21] là Ruby trên nền JVM (Java Virtual Machine), sử dụng trình biên
  dịch JIT, garbage collectors, concurrent threads, các công cụ và thư viện
  của JVM.
* [Rubinius][22] là ‘Ruby viết trong Ruby’. Xây dựng trên nền LLVM,
  Rubinius cung cấp virtual machine rất tiện dụng để các ngôn ngữ có thể
  dùng làm nền tảng.
* [MacRuby][23] là phiên bản Ruby kết nối chặt với thư viện Cocoa cho OS X
  của Apple. Nó giúp người dùng viết ứng dụng desktop dễ dàng.
* [IronRuby][26] là một triển khai “chặt chẽ trên nền .NET Framework”.
* [MagLev][27] là “một triển khai nhanh và ổn định với integrated
  object persistence và distributed shared cache”.
* [Cardinal][24] là một “trình biên dịch Ruby compiler cho [Parrot][25]
  Virtual Machine” (Perl 6).

Một trong những triển khái đấy, bao gồm cả MRI, đều phải đạt đủ điều kiện của chuẩn [RubySpec][28].
Đấy là một “chuẩn thực thi đầy đủ về ngôn ngữ Ruby”.



[license]: {{ site.license.url }}
[stable-gz]:   {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[5]: https://github.com/vertiginous/pik
[7]: https://rvm.io/rvm/install/
[8]: http://rubyinstaller.org/
[9]: http://rubyinstaller.org/downloads/
[10]: http://railsinstaller.org/
[11]: http://trac.macosforge.org/projects/ruby/wiki
[12]: http://brew.sh/
[13]: http://hivelogic.com/articles/ruby-rails-mongrel-mysql-osx
[14]: http://hivelogic.com/articles/ruby-rails-leopard
[15]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/
[16]: http://intridea.com/2011/7/26/setting-up-ruby-dev-on-lion?blog=company
[17]: http://www.sunfreeware.com
[18]: http://www.blastwave.org
[19]: http://openindiana.org/
[20]: http://opensolaris.org/os/project/pkg/
[21]: http://jruby.org
[22]: http://rubini.us
[23]: http://www.macruby.org
[24]: https://github.com/parrot/cardinal
[25]: http://parrot.org
[26]: http://www.ironruby.net
[27]: http://ruby.gemstone.com
[28]: http://rubyspec.org
