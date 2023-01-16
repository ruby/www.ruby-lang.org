---
layout: page
title: "Official Ruby FAQ"
lang: en

header: |
  <div class="multi-page">
    <a href="../" title="Content">Content</a>
    <span class="separator"> | </span>
    <a href="../1/" title="Part 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Part 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="Part 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Part 6">6</a>
    <span class="separator"> | </span>
    <a href="../7/" title="Part 7">7</a>
    <span class="separator"> | </span>
    <a href="../8/" title="Part 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="Part 9">9</a>
    <span class="separator"> | </span>
    <a href="../10/" title="Part 10">10</a>
    <span class="separator"> | </span>
    <a href="../11/" title="Part 11">11</a>
  </div>
  <h1>Official Ruby FAQ</h1>

---

{% include faq-notice.md %}

## Installing Ruby

For current information on downloading and installing Ruby
see the [Installation](/en/documentation/installation/)
or [Downloads](/en/downloads/) page.

### What operating systems support Ruby?

{% include faq-out-of-date.html %}

Ruby is developed under Linux, and is written in fairly straightforward C.
It runs under Linux and other UNIX-like operating systems, macOS,
Windows, DOS, BeOS, Amiga, Acorn Risc OS, and OS/2.

### Where can I get Ruby sources?

The latest version of Ruby can be downloaded from:
[www.ruby-lang.org/en/downloads/](/en/downloads/).
Mirror sites are also listed on this page.

Also on this page is a link to a nightly snapshot of the development tree.

### Can I get to the development source tree?

{% include faq-out-of-date.html %}

If you have a CVS client, you can check out the current source tree using:

~~~
$ cvs -d :pserver:anonymous@cvs.netlab.co.jp:/home/cvs login
(Logging in to anonymous@cvs.netlab.co.jp)
CVS password: guest
$ cvs -d :pserver:anonymous@cvs.netlab.co.jp:/home/cvs co ruby
~~~

If you do not have CVS you can get a nightly snapshot of the development
source from
[https://cache.ruby-lang.org/pub/ruby/snapshot.tar.gz](https://cache.ruby-lang.org/pub/ruby/snapshot.tar.gz).

### How do I compile Ruby?

Under Unix, Ruby uses the `autoconf` system to configure the build
environment. You don't need the `autoconf` command on your box to build Ruby
from a distribution; just use the commands:

~~~
$ ./configure [configure options]
$ make
$ make test
$ make install
~~~

You may need superuser privileges to install Ruby if you don't override the
default installation location (`/usr/local`). You can get a full list of
`configure` options using:

~~~
$ ./configure --help
~~~

If you are working from the source repository, you may need to run
`autoconf` before running `configure`.

### How do I tell Ruby where my libraries are?

{% include faq-out-of-date.html %}

On some systems, the build process may fail to find libraries used by
extension modules (for example the `dbm` libraries).

You can tell Ruby where to find libraries using options to `configure`.
From [\[ruby-talk:5041\]][ruby-talk:5041]:

~~~
$ ./configure --with-xxx-yyy=DIR
~~~

where xxx is either

~~~
opt           extra software path in general
dbm           path for dbm library
gdbm          path for gdbm library
x11           ...for X11..
tk            ...for Tk...
tcl           ...for Tcl...
~~~

and yyy is either

~~~
dir           specifies -I DIR/include -L DIR/lib
include       specifies -I DIR
lib           specifies -L DIR
~~~

On HP-UX, there may be problems building with `gcc`. Try using the native
compiler instead. WATANABE Tetsuya recommends:

~~~
$ CC="cc -Ae" CFLAGS=-O ./configure --prefix=/opt/gnu
~~~

There may also be problems with HP's native `sed`.
He recommends installing the GNU equivalent.

[ruby-talk:5041]: https://blade.ruby-lang.org/ruby-talk/5401

### Are precompiled binaries available?

A single download that contains everything you need to run Ruby under various
Windows operating systems is available from [RubyInstaller](https://rubyinstaller.org/).

[Reuben Thomas](mailto:Reuben.Thomas@cl.cam.ac.uk) writes:

> You could mention that there's a port to Acorn RISC OS, currently of v1.4.3.
> I made the port, and have no plans to maintain it, but I did send the
> patches to matz, so newer versions may well compile too.

### What's all this “cygwin”, “mingw”, and “djgpp” stuff?

{% include faq-out-of-date.html %}

Ruby is written to take advantage of the rich feature set of a Unix
environment. Unfortunately, Windows is missing some of the functions, and
implements others differently. As a result, some kind of mapping layer is
needed to run Ruby (and other Unix-based programs) under Windows.

You may come across different versions of the Ruby executable that use
different wrapper mapping layers.

The rbdj version is a stand-alone version of the Windows binary of Ruby.
It uses the DJ Delorie tools
([http://www.delorie.com](http://www.delorie.com)).

The rbcw version is a Windows binary of Ruby that requires the cygwin library,
available at [http://www.cygwin.com](http://www.cygwin.com) or from the
Ruby download pages. Cygwin is both an emulation layer and a set of
utilities initially produced by Cygnus Solutions (now part of Redhat).
The cygwin version of Ruby probably has the fullest set of features under
Windows, so most programmers will want to use it.

To use the rbcw version, you will need to install the cygwin .dll separately.
Once you have installed cygwin on your computer, copy `cygwin1.dll` (which
is found in the `bin` subdirectory of the cygwin distribution) to your
`Windows\System32` folder (or somewhere else on your path).

Thanks to Anders Schneiderman for the basis of this description.

### Why doesn't Tk graphics work under Windows?

{% include faq-out-of-date.html %}

Is Tk installed correctly on your Windows box? Go to
[http://dev.scriptics.com/software/tcltk/](http://dev.scriptics.com/software/tcltk/)
to find a precompiled binary Tcl/Tk distribution for your box.

Are the environment variables `TCL_LIBRARY` and `TK_LIBRARY` pointing to the
directories containing tcl and tk?

Is the tk library in your path?
