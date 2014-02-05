---
layout: page
title: "Ruby 内核 - Ruby 官方网站"
lang: zh_cn
---

Now is a fantastic time to follow Ruby’s development, with Ruby 2.0
development underway. With the increased attention Ruby has received in
the past few years, there’s a growing need for good talent to help
enhance Ruby and document its parts. So, where do you start?

The topics related to Ruby development covered here are:

* [Using Subversion to Track Ruby Development](#following-ruby)
* [Improving Ruby, Patch by Patch](#patching-ruby)
* and, [Rules for Core Developers](#coding-standards)

### Using Subversion to Track Ruby Development
{: #following-ruby}

Checking out the latest Ruby source code is a matter of logging into the
Subversion anonymous account. From your command line:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

The `ruby` directory will now contain the latest source code for Ruby
1.9 (trunk), which is the development version of Ruby, to be released as
1.9.1 at the end of 2008.

If you’d like to follow patching of Ruby 1.8, you should use the
`ruby_1_8` branch when checking out:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8
{% endhighlight %}

This will check out the Ruby 1.8 development tree into a `ruby_1_8`
directory. Developers working on Ruby 1.8 are expected to migrate their
changes to Ruby’s trunk, so often the two branches are very similiar,
with the exception of improvements made by Matz and Nobu to the language
itself.

If you prefer, you may browse [Ruby’s repository via the web][1].

For information about Subversion, please see [the Subversion FAQ][2] and
[the Subversion book][3]. Alternatively, you may find [Pragmatic Version
Control with Subversion][4] to be a useful introductory book.

### Improving Ruby, Patch by Patch
{: #patching-ruby}

The core team maintains [a bug tracker][5] for submitting patches and
bug reports to Matz and the gang. These reports also get submitted to
the [Ruby-Core mailing list](/en/community/mailing-lists/) for
discussion, so you can be sure your request won’t go unnoticed. You can
also send your patches straight to the mailing list. Either way, you are
encouraged to take part in the discussion that ensues.

To summarize, the steps for building a patch are:

1.  If you are fixing a bug in Ruby 1.8, check out a copy of Ruby 1.8
    from Subversion using the `ruby_1_8` branch.

         $ svn co http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8

    If you wish to add a feature to Ruby, check out the trunk of Ruby’s
    source. Even if you wish to add a feature to Ruby 1.8, it has to be
    proven in the trunk first.

         $ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby

2.  Add your improvements to the code.
3.  Create a patch.

         $ svn diff > ruby-changes.patch

4.  Email your patch to the [Ruby-Core mailing
    list](/en/community/mailing-lists/) with a ChangeLog entry
    describing the patch.
5.  If there are no issues raised about the patch, committers will be
    given the approval to apply it.

**Please note:** patches should be submitted as a [unified diff][6]. For
more on how patches are merged, see [the diffutils reference][7].

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
  [GNU conventions][8]. (Many Ruby core developers use Emacs `add-log`
  mode, which can be accessed with the command `C-x 4 a`.)
* Check-in dates should be given in Japan Standard Time (UTC+9).
* The bulleted points from your ChangeLog should also be placed in the
  Subversion commit message. This message will be automatically mailed
  to the Ruby-CVS list after you commit.
* K&amp;R function declarations are used throughout Ruby’s source code
  and its packaged extensions.
* Please, do not use C++-style comments (`//`), Ruby’s maintainers
  instead prefer the standard C multi-line comment (`/* .. */`).



[1]: http://svn.ruby-lang.org/cgi-bin/viewvc.cgi/
[2]: http://subversion.apache.org/faq.html
[3]: http://svnbook.org
[4]: http://www.pragmaticprogrammer.com/titles/svn/
[5]: https://bugs.ruby-lang.org/
[6]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[7]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[8]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
