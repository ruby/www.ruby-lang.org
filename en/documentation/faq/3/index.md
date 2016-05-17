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

## Installing Ruby

### What operating systems support Ruby?

Ruby is developed under Linux, and is written in fairly straightforward C.
It runs under UNIX, DOS, Windows 95/98/NT/2000, Mac OSX, BeOS, Amiga,
Acorn Risc OS, and OS/2.

August 2002:

MacOSX 10.2 now comes with ruby installed by default.
(ruby 1.6.7 (2002-03-01) [powerpc-darwin6.0])
See http://developer.apple.com/technotes/tn2002/tn2053.html.

H Morita notes:

> There's a MacOS (not X) port of Ruby, by Hisakuni FUJIMOTO at
> http://www.imasy.or.jp/~hisa/ruby/macruby.html. However it's based on
> Ruby 1.1b7, and hasn't been updated since December 1999. It's highly
> experimental. It may crash and sometimes freeze the OS, even with the
> sample scripts included in the Ruby distribution. (Sounds like fun ;-).

Rob tells us that there's Ruby 1.6.4 for OS/2 at
http://www.aminet.org/systems/os2/dev/misc/.
However, that link seems broken: can anyone give us something that works?

### Where can I get Ruby sources?

The latest version of Ruby can be downloaded from:
http://www.ruby-lang.org/en/download.html
Mirror sites are also listed on this page.

Also on this page is a link to a nightly snapshot of the development tree.

### Can I get to the development source tree?

If you have a CVS client, you can check out the current source tree using:

~~~
% cvs -d :pserver:anonymous@cvs.netlab.co.jp:/home/cvs login
(Logging in to anonymous@cvs.netlab.co.jp)
CVS password: guest
% cvs -d :pserver:anonymous@cvs.netlab.co.jp:/home/cvs co ruby
~~~

If you do not have CVS you can get a nightly snapshot of the development
source from ftp://ftp.netlab.co.jp/pub/lang/ruby/snapshot.tar.gz.

### How do I compile Ruby?

Under Unix, Ruby uses the autoconf system to configure the build environment.
You don't need the autoconf command on your box to build Ruby from a
distribution; just use the commands:

~~~
% ./configure  [configure options]
% make
% make test
% make install
~~~

You may need superuser privileges to install Ruby if you don't override the
default installation location (/usr/local). You can get a full list of
configure options using:

~~~
% ./configure --help
~~~

If you are working from the CVS archive, you may need to run autoconf before
running configure.

### How do I tell Ruby where my libraries are?

On some systems, the build process may fail to find libraries used by
extension modules (for example the dbm libraries).

You can tell Ruby where to find libraries using options to configure.
From [ruby-talk:5041]:

~~~
./configure --with-xxx-yyy=DIR
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

On HP-UX, there may be problems building with gcc. Try using the native
compiler instead. WATANABE Tetsuya recommends:

~~~
CC="cc -Ae" CFLAGS=-O ./configure --prefix=/opt/gnu
~~~

There may also be problems with HP's native sed. He recommends installing the
GNU equivalent.

### Are precompiled binaries available?

A single download that contains everything you need to run Ruby under various
Windows operating systems. is available from RubyCentral's One-click Windows
installer. This installation uses cygwin, and includes Tk support.

If you want other installation options, precompiled binaries for Windows are
also available from http://www.os.rim.or.jp/~eban/. If you download the
ruby-1.x.y-yyyymmdd-i386-cygwin.tar.gz package (which is a good choice),
you'll also need to download the cygwin DLL, available from the same page.

Reuben Thomas writes:

> You could mention that there's a port to Acorn RISC OS, currently of v1.4.3.
> I made the port, and have no plans to maintain it, but I did send the
> patches to matz, so newer versions may well compile too.

> I do provide a binary distribution of 1.4.3 for the Acorn at
> http://www.cl.cam.ac.uk/users/rrt1001/ruby.zip.

### What's all this “cygwin”, “mingw”, and “djgpp” stuff?

Ruby is written to take advantage of the rich feature set of a Unix
environment. Unfortunately, Windows is missing some of the functions, and
implements others differently. As a result, some kind of mapping layer is
needed to run Ruby (and other Unix-based programs) under windows.

You may come across different versions of the Ruby executable that use
different wrapper mapping layers.

The rbdj version is a stand-alone version of the Windows binary of Ruby.
It uses the DJ Delorie tools ( http://www.delorie.com).

The rbcw version is a Windows binary of Ruby that requires the cygwin library,
available at http://www.cygwin.com or from the Ruby download pages. Cygwin is
a both an emulation layer and a set of utilities initially produced by Cygnus
Solutions (now part of Redhat). The Cygwin version of Ruby probably has the
fullest set of features under Windows, so most programmers will want to use
it.

To use the rbcw version, you will need to install the cygwin .dll separately.
Once you have installed cygwin on your computer, copy cygwin1.dll (which is
found in the bin subdirectory of the cygwin distribution) to your
Windows\System32 folder (or somewhere else on your path).

Thanks to Anders Schneiderman for the basis of this description

### Why doesn't Tk graphics work under Windows?

Is Tk installed correctly on your Windows box? Go to
http://dev.scriptics.com/software/tcltk/ to find a precompiled binary
Tcl/Tk distribution for your box.

Are the environment variables TCL_LIBRARY and TK_LIBRARY pointing to the
directories containing tcl and tk?

Is the tk library in your path?
