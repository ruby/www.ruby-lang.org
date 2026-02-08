---
layout: page
title: "Cài đặt Ruby"
lang: vi
---

Với các trình quản lý gói hoặc công cụ của bên thứ ba, bạn có nhiều lựa chọn
để cài đặt và quản lý Ruby.
{: .summary}

Có thể bạn đã cài sẵn Ruby trên máy tính. Bạn có thể kiểm tra
bằng cách mở [trình giả lập terminal][terminal] và gõ:

{% highlight sh %}
ruby -v
{% endhighlight %}

Lệnh này sẽ hiển thị thông tin về phiên bản Ruby đã được cài đặt.

## Chọn phương pháp cài đặt

Có nhiều cách để cài đặt Ruby:

* Trên hệ điều hành tương tự UNIX, sử dụng **trình quản lý gói**
  của hệ thống là cách dễ nhất.
  Tuy nhiên, phiên bản Ruby được đóng gói có thể không phải là phiên bản mới nhất.
* **Trình cài đặt** có thể được dùng để cài đặt một hoặc nhiều
  phiên bản Ruby. Cũng có trình cài đặt dành cho Windows.
* **Trình quản lý phiên bản** giúp bạn chuyển đổi giữa nhiều phiên bản Ruby
  trên hệ thống.
* Cuối cùng, bạn cũng có thể **biên dịch Ruby từ mã nguồn**.

Trên Windows 10, bạn cũng có thể sử dụng [Windows Subsystem for Linux][wsl]
để cài đặt một trong các bản phân phối Linux được hỗ trợ và sử dụng bất kỳ
phương pháp cài đặt nào có sẵn trên hệ thống đó.

Dưới đây là các phương pháp cài đặt có sẵn:

* [Hệ thống quản lý gói](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Snap](#snap)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [FreeBSD](#freebsd)
  * [OpenBSD](#openbsd)
  * [OpenIndiana](#openindiana)
  * [Windows Package Manager](#winget)
  * [Chocolatey package manager cho Windows](#chocolatey)
  * [Các bản phân phối khác](#other-systems)
* [Trình cài đặt](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [Ruby Stack](#rubystack)
* [Trình quản lý phiên bản](#managers)
  * [asdf-vm](#asdf-vm)
  * [chruby](#chruby)
  * [mise-en-place](#mise-en-place)
  * [rbenv](#rbenv)
  * [rbenv cho Windows](#rbenv-for-windows)
  * [RVM](#rvm)
  * [uru](#uru)
* [Biên dịch từ mã nguồn](#building-from-source)


## Hệ thống quản lý gói
{: #package-management-systems}

Nếu bạn không thể tự biên dịch Ruby và không muốn sử dụng công cụ
của bên thứ ba, bạn có thể dùng trình quản lý gói của hệ thống để cài đặt Ruby.

Một số thành viên trong cộng đồng Ruby cho rằng bạn nên tránh sử dụng trình
quản lý gói để cài đặt Ruby và nên dùng các công cụ chuyên dụng thay thế.

Có thể các trình quản lý gói lớn sẽ cài đặt phiên bản Ruby cũ hơn
thay vì bản phát hành mới nhất. Để sử dụng bản phát hành Ruby mới nhất,
hãy kiểm tra xem tên gói có khớp với số phiên bản hay không. Hoặc sử dụng
[trình cài đặt][installers] chuyên dụng.


### apt (Debian hoặc Ubuntu)
{: #apt}

Debian GNU/Linux và Ubuntu sử dụng trình quản lý gói apt. Bạn có thể
sử dụng như sau:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}


### yum (CentOS, Fedora, hoặc RHEL)
{: #yum}

CentOS, Fedora, và RHEL sử dụng trình quản lý gói yum.
Bạn có thể sử dụng như sau:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

Phiên bản được cài đặt thường là phiên bản Ruby mới nhất có sẵn
tại thời điểm phát hành của phiên bản bản phân phối cụ thể đó.


### snap (Ubuntu hoặc các bản phân phối Linux khác)
{: #snap}

Snap là trình quản lý gói được phát triển bởi Canonical.
Nó có sẵn trên Ubuntu, nhưng snap cũng hoạt động
trên nhiều bản phân phối Linux khác.
Bạn có thể sử dụng như sau:

{% highlight sh %}
$ sudo snap install ruby --classic
{% endhighlight %}

Chúng tôi có nhiều kênh cho mỗi dòng phiên bản phụ của Ruby.
Ví dụ, các lệnh sau chuyển sang Ruby 2.3:

{% highlight sh %}
$ sudo snap switch ruby --channel=2.3/stable
$ sudo snap refresh
{% endhighlight %}


### portage (Gentoo)
{: #portage}

Gentoo sử dụng trình quản lý gói portage.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

Để cài đặt một phiên bản cụ thể, hãy thiết lập `RUBY_TARGETS` trong `make.conf`.
Xem [trang web Gentoo Ruby Project][gentoo-ruby] để biết thêm chi tiết.


### pacman (Arch Linux)
{: #pacman}

Arch Linux sử dụng trình quản lý gói có tên pacman.
Để cài đặt Ruby, chỉ cần chạy:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

Lệnh này sẽ cài đặt phiên bản Ruby ổn định mới nhất.


### Homebrew (macOS)
{: #homebrew}

Ruby phiên bản 2.0 trở lên đã được tích hợp sẵn trong các bản phát hành macOS
ít nhất kể từ El Capitan (10.11).

[Homebrew][homebrew] là trình quản lý gói phổ biến trên macOS.
Cài đặt Ruby bằng Homebrew rất đơn giản:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

Lệnh này sẽ cài đặt phiên bản Ruby mới nhất.


### FreeBSD
{: #freebsd}

FreeBSD cung cấp cả phương pháp cài đặt từ gói dựng sẵn và từ mã nguồn.
Các gói dựng sẵn có thể được cài đặt thông qua công cụ pkg:

{% highlight sh %}
$ pkg install ruby
{% endhighlight %}

Phương pháp từ mã nguồn có thể được sử dụng để cài đặt Ruby thông qua
[Ports Collection][freebsd-ports-collection]. Cách này hữu ích nếu bạn muốn
tùy chỉnh các tùy chọn cấu hình biên dịch.

Thông tin thêm về Ruby và hệ sinh thái của nó trên FreeBSD
có thể được tìm thấy tại [trang web FreeBSD Ruby Project][freebsd-ruby].


### OpenBSD
{: #openbsd}

OpenBSD cũng như bản phân phối adJ của nó có các gói cho ba
phiên bản chính của Ruby. Lệnh sau cho phép bạn xem các
phiên bản có sẵn và cài đặt một phiên bản:

{% highlight sh %}
$ doas pkg_add ruby
{% endhighlight %}

Bạn có thể cài đặt nhiều phiên bản chính song song, vì các
tệp nhị phân có tên khác nhau (ví dụ `ruby27`, `ruby26`).

Nhánh `HEAD` của ports collection OpenBSD có thể có phiên bản
Ruby mới nhất cho nền tảng này vài ngày sau khi nó được phát hành,
xem [thư mục lang/ruby trong ports collection mới nhất][openbsd-current-ruby-ports].


### Ruby trên OpenIndiana
{: #openindiana}

Để cài đặt Ruby trên [OpenIndiana][openindiana], vui lòng sử dụng
Image Packaging System (IPS) client.
Lệnh này sẽ cài đặt các tệp nhị phân Ruby và RubyGems trực tiếp
từ kho lưu trữ OpenIndiana. Rất đơn giản:

{% highlight sh %}
$ pkg install runtime/ruby
{% endhighlight %}

Tuy nhiên, các công cụ của bên thứ ba có thể là cách tốt hơn để có được
phiên bản Ruby mới nhất.

### Windows Package Manager
{: #winget}

Trên Windows, bạn có thể sử dụng [Windows Package Manager CLI](https://github.com/microsoft/winget-cli)
để cài đặt Ruby:

{% highlight powershell %}
> winget install RubyInstallerTeam.Ruby.{MAJOR}.{MINOR}
# Example
> winget install RubyInstallerTeam.Ruby.3.2
# To see all versions available
> winget search RubyInstallerTeam.Ruby
# Note: if you are installing ruby for projects, you may want to install RubyWithDevKit
> winget install RubyInstallerTeam.RubyWithDevKit.3.2
{% endhighlight %}

### Chocolatey package manager cho Windows
{: #chocolatey}

Cũng trên Windows, bạn có thể sử dụng [Chocolatey Package Manager](https://chocolatey.org/install)
để cài đặt Ruby:

{% highlight sh %}
> choco install ruby
{% endhighlight %}

Lệnh này sẽ sử dụng lại `msys2` hiện có, hoặc cài đặt riêng để có môi trường phát triển Ruby hoàn chỉnh

### Các bản phân phối khác
{: #other-systems}

Trên các hệ thống khác, bạn có thể tìm kiếm Ruby trong kho gói của trình
quản lý bản phân phối Linux. Ngoài ra, bạn có thể sử dụng
[trình cài đặt của bên thứ ba][installers].


## Trình cài đặt
{: #installers}

Nếu phiên bản Ruby do hệ thống hoặc trình quản lý gói cung cấp đã lỗi thời,
bạn có thể cài đặt phiên bản mới hơn bằng trình cài đặt của bên thứ ba.

Một số trình cài đặt cho phép bạn cài đặt nhiều phiên bản trên cùng
một hệ thống; các trình quản lý liên quan có thể giúp chuyển đổi giữa
các phiên bản Ruby khác nhau.

Nếu bạn dự định sử dụng [RVM](#rvm) làm trình quản lý phiên bản, bạn không
cần trình cài đặt riêng, vì nó đã tích hợp sẵn.


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] là plugin cho [rbenv](#rbenv) cho phép bạn
biên dịch và cài đặt các phiên bản Ruby khác nhau. ruby-build cũng có thể
được sử dụng như một chương trình độc lập mà không cần rbenv. Nó có sẵn cho macOS,
Linux, và các hệ điều hành tương tự UNIX khác.


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] cho phép bạn biên dịch và cài đặt các phiên bản
Ruby khác nhau vào các thư mục tùy ý. [chruby](#chruby) là
công cụ bổ trợ dùng để chuyển đổi giữa các phiên bản Ruby. Nó có sẵn
cho macOS, Linux, và các hệ điều hành tương tự UNIX khác.


### RubyInstaller
{: #rubyinstaller}

Trên Windows, [RubyInstaller][rubyinstaller] cung cấp cho bạn mọi thứ cần thiết
để thiết lập môi trường phát triển Ruby hoàn chỉnh.

Chỉ cần tải về, chạy, và bạn đã hoàn tất!


### Ruby Stack
{: #rubystack}

Nếu bạn cài đặt Ruby để sử dụng Ruby on Rails,
bạn có thể dùng trình cài đặt sau:

* [Bitnami Ruby Stack][rubystack] cung cấp môi trường phát triển
  hoàn chỉnh cho Rails. Nó hỗ trợ macOS, Linux, Windows, máy ảo,
  và cloud image.


## Trình quản lý phiên bản
{: #managers}

Nhiều lập trình viên Ruby sử dụng trình quản lý phiên bản để quản lý nhiều
phiên bản Ruby. Chúng cho phép chuyển đổi giữa các phiên bản Ruby dễ dàng
hoặc thậm chí tự động tùy thuộc vào dự án và có nhiều ưu điểm khác,
nhưng không được hỗ trợ chính thức. Tuy nhiên, bạn có thể tìm được
sự hỗ trợ trong cộng đồng tương ứng của chúng.


### asdf-vm
{: #asdf-vm}

[asdf-vm][asdf-vm] là trình quản lý phiên bản mở rộng được, có thể quản lý nhiều
phiên bản runtime ngôn ngữ theo từng dự án. Bạn sẽ cần plugin
[asdf-ruby][asdf-ruby] (sử dụng [ruby-build](#ruby-build) bên trong)
để cài đặt Ruby.


### chruby
{: #chruby}

[chruby][chruby] cho phép bạn chuyển đổi giữa nhiều phiên bản Ruby. Nó có thể
quản lý các phiên bản Ruby được cài đặt bởi [ruby-install](#ruby-install) hoặc
thậm chí được biên dịch từ mã nguồn.


### mise-en-place
{: #mise-en-place}

[mise-en-place][mise-en-place] cho phép bạn chuyển đổi giữa nhiều phiên bản Ruby mà không cần thêm công cụ nào.
Nó quản lý việc cài đặt tự động và bao gồm [gem backend](https://mise.jdx.dev/dev-tools/backends/gem.html) để quản lý các phiên bản CLI được viết bằng Ruby.
Nó hỗ trợ các hệ điều hành tương tự UNIX và Windows.


### rbenv
{: #rbenv}

[rbenv][rbenv] cho phép bạn quản lý nhiều bản cài đặt Ruby.
Mặc dù mặc định nó không thể cài đặt Ruby, nhưng plugin [ruby-build](#ruby-build)
của nó có thể. Cả hai công cụ đều có sẵn cho macOS, Linux, hoặc
các hệ điều hành tương tự UNIX khác.


### rbenv cho Windows
{: #rbenv-for-windows}

[rbenv cho Windows][rbenv-for-windows] cho phép bạn cài đặt và
quản lý nhiều bản cài đặt Ruby trên Windows. Nó được viết bằng
PowerShell, cung cấp cách sử dụng Ruby tự nhiên cho người dùng Windows.
Ngoài ra, giao diện dòng lệnh tương thích với [rbenv][rbenv]
trên các hệ thống tương tự UNIX.


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] cho phép bạn cài đặt và quản lý nhiều bản cài đặt
Ruby trên hệ thống. Nó cũng có thể quản lý các gemset khác nhau. Nó có sẵn
cho macOS, Linux, hoặc các hệ điều hành tương tự UNIX khác.


### RVM 4 Windows
{: #rvm-windows}

[RVM 4 Windows][rvm-windows] cho phép bạn cài đặt và quản lý nhiều
bản cài đặt Ruby trên Windows. Nó là bản sao của RVM gốc và
hỗ trợ dòng lệnh cổ điển cũng như Powershell bằng cách cung cấp
giao diện dòng lệnh giống như RVM gốc.


### uru
{: #uru}

[Uru][uru] là công cụ dòng lệnh nhẹ, đa nền tảng giúp bạn
sử dụng nhiều phiên bản Ruby trên macOS, Linux, hoặc Windows.


## Biên dịch từ mã nguồn
{: #building-from-source}

Tất nhiên, bạn có thể cài đặt Ruby từ mã nguồn.
[Tải về][download] và giải nén tarball, sau đó chạy:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

Mặc định, lệnh này sẽ cài đặt Ruby vào `/usr/local`.
Để thay đổi, truyền tùy chọn `--prefix=DIR` cho script `./configure`.

Bạn có thể tìm thêm thông tin về biên dịch từ mã nguồn trong
[hướng dẫn biên dịch Ruby][building-ruby].

Tuy nhiên, sử dụng các công cụ của bên thứ ba hoặc trình quản lý gói có thể là
ý tưởng tốt hơn, vì Ruby được cài đặt theo cách này sẽ không được quản lý
bởi bất kỳ công cụ nào.


[rvm]: http://rvm.io/
[rvm-windows]: https://github.com/magynhard/rvm-windows#readme
[rbenv]: https://github.com/rbenv/rbenv#readme
[rbenv-for-windows]: https://github.com/RubyMetric/rbenv-for-windows#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: https://rubyinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[openindiana]: http://openindiana.org/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[freebsd-ruby]: https://wiki.freebsd.org/Ruby
[freebsd-ports-collection]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/ports-using.html
[homebrew]: http://brew.sh/
[terminal]: https://en.wikipedia.org/wiki/List_of_terminal_emulators
[download]: /vi/downloads/
[installers]: /vi/documentation/installation/#installers
[building-ruby]: https://github.com/ruby/ruby/blob/master/doc/contributing/building_ruby.md
[wsl]: https://docs.microsoft.com/en-us/windows/wsl/about
[asdf-vm]: https://asdf-vm.com/
[asdf-ruby]: https://github.com/asdf-vm/asdf-ruby
[mise-en-place]: https://mise.jdx.dev
[mise-en-place-ruby]: https://mise.jdx.dev/lang/ruby.html
[openbsd-current-ruby-ports]: https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/lang/ruby/?only_with_tag=HEAD
