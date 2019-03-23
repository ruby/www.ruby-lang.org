---
layout: page
title: "Cài đặt Ruby"
lang: vi
---

Bạn có thể cài đặt Ruby bằng nhiều công cụ khác nhau.
Bài viết này hướng dẫn sử dụng các hệ thống quản lý gói
và các công cụ của bên thứ 3 để quản lý, cài đặt Ruby
và cách biên dịch Ruby từ mã nguồn.
{: .summary}


## Chọn phương thức cài đặt của bạn

Bạn có thể cài đặt Ruby bằng một trong những cách sau:

* Nếu bạn đang dùng hệ điều hành giống UNIX, sử dụng
  **trình quản lý gói** sẵn có là cách dễ nhất.
  Tuy nhiên, phiên bản Ruby được đóng gói thường không phải là bản mới nhất.
* **Installer** có thể được sử dụng để cài đặt một hoặc một số
  phiên bản Ruby. Installer cũng có sẵn trên Windows.
* **Trình quản lý** giúp bạn chuyển đổi giữa các bản cài đặt Ruby
  trên hệ điều hành của bạn.
* Và cuối cùng, bạn cũng có thể **biên dịch Ruby từ mã nguồn**.

Tổng quan các phương thức cài đặt có sẵn
theo nhu cầu và nền tảng khác nhau.

* [Hệ thống quản lý gói](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [Solaris, OpenIndiana](#solaris)
  * [Các bản phân phối khác](#other-systems)
* [Installers](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [RailsInstaller và Ruby Stack](#railsinstaller)
* [Trình quản lý](#managers)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [Biên dịch từ mã nguồn](#building-from-source)


## Hệ thống quản lý gói
{: #package-management-systems}

Nếu bạn không thể tự biên dịch Ruby và bạn không muốn sử dụng một
công cụ của bên thứ ba, bạn có thể sử dụng trình quản lý gói
của hệ điều hành để cài đặt Ruby.

Một số thành viên trong cộng đồng Ruby khuyên rằng bạn không nên sử dụng
một trình quản lý gói để cài đặt Ruby mà bạn nên sử dụng các công cụ
thay thế khác. Trong khi danh sách đầy đủ các ưu, nhược điểm nằm ngoài phạm vi
của trang này thì lý do cơ bản nhất là hầu hết các trình quản lý gói có chứa các
phiên bản cũ của Ruby trong repository chính thức. Nếu bạn muốn sử dụng phiên
bản Ruby mới nhất, hãy chắc chắn rằng bạn sử dụng tên gói đúng,
hoặc sử dụng các công cụ được mô tả chi tiết ở dưới đây để thay thế.


### apt (Debian và Ubuntu)
{: #apt}

Debian GNU/Linux và Ubuntu sử dụng trình quản lý gói apt.
Bạn có thể sử dụng như sau:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

`ruby-full` ở lệnh trên cung cấp Ruby 2.3.1, một bản phân phối ổn định cũ,
trên Debian và Ubuntu.


### yum (CentOS, Fedora, và RHEL)
{: #yum}

CentOS, Fedora, và RHEL sử dụng trình quản lý gói yum.
Bạn có thể sử dụng như sau:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

Phiên bản được cài đặt thường là phiên bản mới nhất của Ruby ở thời gian
phát hành bản phân phối của hệ điều hành đó.


### portage (Gentoo)
{: #portage}

Gentoo sử dụng trình quản lý gói portage.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Mặc định, lệnh trên sẽ cài đặt các phiên bản 1.9 và 2.0,
nhưng các phiên bản khác cũng có sẵn.
Để cài đặt một phiên bản nhất định, đặt giá trị cho `RUBY_TARGETS`
trong `make.conf`.
Xem chi tiết tại [Gentoo Ruby Project website][gentoo-ruby]


### pacman (Arch Linux)
{: #pacman}

Arch Linux sử dụng trình quản lý gói pacman.
Bạn có thể sử dụng như sau:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Lệnh trên sẽ cài đặt phiên bản ổn định mới nhất của Ruby.


### Homebrew (macOS)
{: #homebrew}

Trên Yosemite và Mavericks, Ruby 2.0 có sẵn trong homebrew
Đối với OS X Mountain Lion, Lion, và Snow Leopard thì là Ruby 1.8.7.

Nhiều người sử dụng [Homebrew][homebrew] trên macOS như một trình quản lý gói.
Rất dễ để cài đặt phiên bản mới nhất của Ruby bằng Homebrew:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Lệnh trên sẽ cài đặt phiên bản mới nhất của Ruby.


### Ruby trên Solaris và OpenIndiana
{: #solaris}

Ruby 1.8.7 có sẵn từ Solaris 8 đến Solaris 10 trên
[Sunfreeware][sunfreeware] và Ruby 1.8.7 có sẵn ở
Blastwave.
Ruby 1.9.2p0 cũng có sẵn tại [Sunfreeware][sunfreeware],
nhưng đây là phiên bản đã lỗi thời.

Để cài đặt Ruby trên [OpenIndiana][openindiana], vui lòng sử dụng
[Image Packaging System (IPS)][opensolaris-pkg] client.
Nó sẽ cài đặt các gói nhị phân mới nhất của Ruby và RubyGems trực tiếp
từ repository của OpenSolaris cho Ruby 1.9. Thật dễ dàng:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

Tuy nhiên, các công cụ của bên thứ ba cũng là một cách tốt để có được
phiên bản mới nhất của Ruby.


### Các bản phân phối khác
{: #other-systems}

Trên các hệ điều hành khác, bạn có thể tìm các gói bằng trình quản lý có sẵn
hoặc các công cụ của bên thứ ba.


## Installers
{: #installers}

Nếu phiên bản của Ruby được cung cấp bởi hệ điều hành hoặc trình quản lý
bị lỗi thời, bạn có thể sử dụng một installer của bên thứ ba để cài đặt
phiên bản mới nhất.
Một số installer cho phép bạn có thể cài đặt nhiều phiên bản Ruby trên cùng
hệ điều hành; các trình quản lý đi kèm có thể giúp bạn chuyển đổi giữa
các phiên bản Ruby khác nhau.
Nếu bạn đang có ý định sử dụng [RVM](#rvm) như một trình quản lý phiên bản
thì bạn không cần thêm installer nữa vì RVM đã có một installer riêng.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] là một plugin cho [rbenv](#rbenv)
cho phép bạn có thể biên dịch và cài đặt các phiên bản khác nhau của Ruby
trong các thư mục tuỳ ý.
ruby-build có thể được sử dụng như một chương trình độc lập mà không cần rbenv.
Có sẵn trên macOS, Linux, và các hệ điều hành giống UNIX khác.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] cho phép bạn biên dịch và cài đặt các
phiên bản khác nhau của Ruby trong các thư mục tuỳ ý.
Người anh em của nó là [chruby](#chruby), dùng để chuyển đổi giữa các
phiên bản Ruby.
Có sẵn trên macOS, Linux, và các hệ điều hành giống UNIX khác.


### RubyInstaller
{: #rubyinstaller}

Nếu bạn đang sử dụng Windows, có một dự án tuyệt vời giúp bạn cài đặt Ruby:
[RubyInstaller][rubyinstaller]. Nó cung cấp cho bạn mọi thứ cần thiết để cài
đặt một môi trường phát triển đầy đủ trên Windows.

Chỉ việc tải xuống và chạy là xong!


### RailsInstaller và Ruby Stack
{: #railsinstaller}

Nếu bạn đang cài đặt Ruby để sử dụng Ruby on Rails,
bạn có thể sử dụng các installers sau đây:

* [RailsInstaller][railsinstaller],
  sử dụng RubyInstaller nhưng cung cấp cho bạn
  thêm nhiều công cụ trợ giúp để phát triển Rails.
  Có sẵn trên OS X và Windows.
* [Bitnami Ruby Stack][rubystack],
  cung cấp một môi trường phát triển hoàn chỉnh cho Rails.
  Có sẵn trên macOS, Linux, Windows, các máy ảo và các cloud image.


## Trình quản lý
{: #managers}

Nhiều Rubyist sử dụng các trình quản lý Ruby để quản lý các phiên bản Ruby.
Mặc dù, chúng có nhiều điểm mạnh nhưng lại không được hỗ trợ chính thức.
Tuy nhiên, các cộng đồng của họ cũng rất hữu ích.


### chruby
{: #chruby}

[chruby][chruby] cho phép bạn chuyển đổi giữa các phiên bản Ruby.
chruby có thể quản lý các phiên bản Ruby được cài đặt bằng
[ruby-install](#ruby-install)
hoặc thậm chí là các phiên bản được biên dịch từ mã nguồn.


### rbenv
{: #rbenv}

[rbenv][rbenv] cho phép bạn quản lý nhiều bản cài đặt của Ruby.
Nó không hỗ trợ cài đặt Ruby, nhưng bạn có thể dùng plugin
[ruby-build](#ruby-build) để cài đặt Ruby.
Cả hai công cụ trên đều có sẵn trên macOS, Linux,
và các hệ điều hành giống UNIX khác.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] cho phép bạn cài đặt và quản lý nhiều bản cài đặt của Ruby.
Nó cũng có thể quản lý các gemset khác nhau.
Có sẵn trên macOS, Linux, và các hệ điều hành giống UNIX khác.


### uru
{: #uru}

[Uru][uru] là một công cụ dòng lệnh đa nền tảng, gọn nhẹ giúp bạn
sử dụng nhiều phiên bản Ruby trên macOS, Linux, hoặc Windows.


## Biên dịch từ mã nguồn
{: #building-from-source}

Bạn hoàn toàn có thể cài đặt Ruby từ mã nguồn.
[Tải về](/vi/downloads/) và giải nén tarball, sau đó:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

Mặc định, lệnh trên sẽ cài đặt Ruby vào `/usr/local`.
Để thay đổi, thêm lựa chọn `--prefix=DIR` vào script `./configure`.

Sử dụng các công cụ của bên thứ ba hoặc các trình quản lý gói có thể là một
ý tưởng hay hơn, tuy nhiên, Ruby được cài đặt sẽ không được quản lý bởi
bất kỳ công cụ nào.


[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: https://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[sunfreeware]: http://www.sunfreeware.com
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
