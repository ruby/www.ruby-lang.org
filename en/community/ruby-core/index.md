---
layout: page
title: "Ruby Core"
lang: en
---

Now is a fantastic time to follow Ruby’s development. With the increased
attention Ruby has received in the past few years, there’s a growing need
for good talent to help enhance Ruby and document its parts.
So, where do you start?

The topics related to Ruby development covered here are:

* [Using Subversion to Track Ruby Development](#following-ruby)
* [How to Use Git With the Main Ruby Repository](#git-ruby)
* [Improving Ruby, Patch by Patch](#patching-ruby)
* and, [Rules for Core Developers](#coding-standards)

### Using Subversion to Track Ruby Development
{: #following-ruby}

Getting the latest Ruby source code is a matter of an anonymous checkout
from the [Subversion][1] repository. From your command line:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

The `ruby` directory will now contain the latest source code
for the development version of Ruby (ruby-trunk).
Currently patches applied to the trunk are backported to the
stable 2.0.0 and 1.9.3 branches (see below).

If you’d like to follow patching of Ruby 2.0.0, you should use the
`ruby_2_0_0` branch when checking out:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/branches/ruby_2_0_0
{% endhighlight %}

If you’d like to follow patching of Ruby 1.9.3, you should use the
`ruby_1_9_3` branch when checking out:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_9_3
{% endhighlight %}

This will check out the Ruby 1.9.3 development tree into a `ruby_1_9_3`
directory. Developers working on Ruby 1.9.3 are expected to migrate their
changes to Ruby’s trunk, so often the two branches are very similar,
with the exception of improvements made by Matz and Nobu to the language
itself.

If you prefer, you may browse [Ruby’s Subversion repository via the web][2].

For information about Subversion, please see [the Subversion FAQ][3] and
[the Subversion book][4]. Alternatively, you may find [Pragmatic Version
Control with Subversion][5] to be a useful introductory book.

### How to Use Git With the Main Ruby Repository
{: #git-ruby}

Those who prefer to use [Git][6] over Subversion can find instructions
with [the mirror on GitHub][7], both for [those with commit access][8]
and [everybody else][9].

### Improving Ruby, Patch by Patch
{: #patching-ruby}

The core team maintains an [issue tracker][10] for submitting patches and
bug reports to Matz and the gang. These reports also get submitted to
the [Ruby-Core mailing list](/en/community/mailing-lists/) for
discussion, so you can be sure your request won’t go unnoticed. You can
also send your patches straight to the mailing list. Either way, you are
encouraged to take part in the discussion that ensues.

Please look over the [Patch Writer’s Guide][11] for some tips, straight
from Matz, on how to get your patches considered.

To summarize, the steps for building a patch are:

1.  Check out a copy of the Ruby source code from Subversion.
    Usually patches for bugfixes or new features should be submitted
    for the trunk of Ruby’s source. Even if you wish to add a feature
    to Ruby 1.9.3, it has to be proven in the trunk first.

        $ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby

    If you are fixing a bug that is specific to only one maintenance branch,
    check out a copy of the respective branch, e.g. `ruby_1_9.3`.

        $ svn co http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_9_3

2.  Add your improvements to the code.

3.  Create a patch.

        $ svn diff > ruby-changes.patch

4.  Create a ticket in the [issue tracker][10] or
    email your patch to the [Ruby-Core mailing
    list](/en/community/mailing-lists/) with a ChangeLog entry
    describing the patch.

5.  If there are no issues raised about the patch, committers will be
    given the approval to apply it.

**Please note:** patches should be submitted as a [unified diff][12].
For more on how patches are merged, see [the diffutils reference][13].

Discussion of Ruby’s development converges on the [Ruby-Core mailing
list](/en/community/mailing-lists/). So, if you are curious
about whether your patch is worthwhile or you want to spark a discussion
about Ruby’s future, don’t hesitate to come aboard. Be warned that
off-topic discussions are not tolerated on this list, the noise level
should be very low, topics should be pointed, well-conceived and
well-written. Since we’re addressing Ruby’s creator, let’s have some
reverence.

Keep in mind that Ruby’s core developers live in Japan and, while many
speak very good English, there is a significant timezone difference.
They also have an entire body of Japanese development lists happening
alongside the English counterparts. Be patient, if your claim isn’t
resolved, be persistent—give it another shot a few days later.

### Rules for Core Developers
{: #coding-standards}

Generally, the developers of Ruby should be familiar with the source
code and the style of development used by the team. To be clear, the
following guidelines should be honored when checking into Subversion:

* All check-ins should be described in the `ChangeLog`, following the
  [GNU conventions][14]. (Many Ruby core developers use Emacs `add-log`
  mode, which can be accessed with the command `C-x 4 a`.)
* Check-in dates should be given in Japan Standard Time (UTC+9).
* The bulleted points from your ChangeLog should also be placed in the
  Subversion commit message. This message will be automatically mailed
  to the Ruby-CVS list after you commit.
* Function prototypes are used throughout Ruby’s source code and its
  packaged extensions.
* Please, do not use C++-style comments (`//`), Ruby’s maintainers
  instead prefer the standard C multi-line comment. (`/* .. */`)

See also the information in [Ruby’s issue tracker][10].



[1]: http://subversion.apache.org/
[2]: http://svn.ruby-lang.org/cgi-bin/viewvc.cgi/
[3]: http://subversion.apache.org/faq.html
[4]: http://svnbook.org
[5]: http://www.pragmaticprogrammer.com/titles/svn/
[6]: http://git-scm.com/
[7]: http://github.com/ruby/ruby
[8]: http://wiki.github.com/shyouhei/ruby/committerhowto
[9]: http://wiki.github.com/shyouhei/ruby/noncommitterhowto
[10]: https://bugs.ruby-lang.org/
[11]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-core/25139
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[14]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
