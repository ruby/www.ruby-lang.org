---
layout: page
title: "보안"
lang: ko
---

Ruby와 관련한 보안 이슈에 대해 정보를 공유하는 곳입니다.
{: .summary}

## 보안 취약점 알리기

Ruby 프로그래밍 언어의 보안 취약점은 [HackerOne의 바운티 프로그램](https://hackerone.com/ruby)을
통해서 보고해야 합니다. 문제를 보고하기 전에 프로그램의 대상에 포함되는지 확인하세요.
보고된 유효한 문제는 수정 이후에 공개됩니다.

웹 사이트에 영향을 주는 문제를 발견한 경우에는 [GitHub](https://github.com/ruby/www.ruby-lang.org/issues/new)을
통해서 보고하거나 [Google Group](https://groups.google.com/g/ruby-security-ann)의
보안 공지를 확인하세요.

Ruby 커뮤니티의 특정 gem에 영향을 주는 문제를 발견했다면, [RubyGems.org의 안내](http://guides.rubygems.org/security/#reporting-security-vulnerabilities)를 따라주세요.

HackerOne 이외의 방법으로 보안팀에 연락하고 싶다면,
비공개 메일링 리스트인 security@ruby-lang.org ([the PGP public key](/security.asc))로 메일을 보내주십시오.

이 메일링 리스트의 멤버는 Ruby를 제공하는 사람들(Ruby 커미터, Ruby 구현부의
저자, 배포 담당자, PaaS 플랫폼 관리자)입니다.
멤버는 반드시 개인이어야 하며, 메일링 리스트는 허용되지 않습니다.

## 알려진 취약점

다음과 같은 보안 취약점이 보고된 바 있습니다.

{% include security_posts.html %}

좀 더 자세한 사항은 [영문 페이지](/en/security/)를 참조하시기 바랍니다.
