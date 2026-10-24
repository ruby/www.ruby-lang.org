---
layout: news_post
title: "GitLab의 CVE-2026-89078, CVE-2026-93577, CVE-2026-97229, CVE-2026-110264와 관련된 정규표현식 컴파일 수정"
author: "k0kubun"
translator: "shia"
date: 2026-10-23 03:11:22 +0000
lang: ko
---

Ruby 4.0.9, 3.4.12, 3.3.13을 릴리스했습니다. 이번 릴리스에서는 Ruby의 정규표현식 엔진(Onigmo)에 있는 여러 버그를 수정했습니다. GitLab은 이 버그들을 악용하면 GitLab 서버에서 원격 코드를 실행할 수 있다는 것을 발견했습니다. GitLab은 이 문제들에 대해 CVE 4건을 공개했으며, 이번 Ruby 릴리스에는 그 원인이 된 Ruby 버그의 수정이 포함되어 있습니다.

## 배경

GitLab은 CI 설정의 패턴 등 사용자가 제공한 정규표현식을 `Regexp.new`로 컴파일합니다. GitLab은 의도적으로 조작된 패턴을 Ruby가 컴파일하는 도중 메모리가 손상될 수 있고, 이를 악용하면 GitLab 서버에서 원격 코드를 실행할 수 있다는 것을 발견했습니다. GitLab은 자체 배포하는 Ruby에 패치를 적용한 릴리스로 이 문제들에 대응했으며, 다음 CVE 번호를 할당했습니다.

* [CVE-2026-89078](https://www.cve.org/CVERecord?id=CVE-2026-89078): 정규표현식 파서의 중복 할당 해제 문제([GitLab 19.4.1](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-1-released/))
* [CVE-2026-93577](https://www.cve.org/CVERecord?id=CVE-2026-93577): 정규표현식 컴파일러의 정수 오버플로 문제([GitLab 19.4.1](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-1-released/))
* [CVE-2026-97229](https://www.cve.org/CVERecord?id=CVE-2026-97229): CI/CD 정규표현식 컴파일러의 정수 오버플로 문제([GitLab 19.4.2](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-4-2-released/))
* [CVE-2026-110264](https://www.cve.org/CVERecord?id=CVE-2026-110264): 정규표현식 컴파일러의 정수 오버플로 문제([GitLab 19.5.1](https://docs.gitlab.com/releases/patches/patch-release-gitlab-19-5-1-released/))

## Ruby에서의 수정

다음 표는 각 CVE의 원인이 된 버그를 수정한 Ruby의 변경 사항과, 버전대별로 그 수정이 처음 포함된 릴리스를 정리한 것입니다.

| GitLab CVE | Ruby의 버그 | 변경 사항 | Ruby 4.0 | Ruby 3.4 | Ruby 3.3 |
|---|---|---|---|---|---|
| CVE-2026-89078 | 선택(alternation) 이후 패턴 파싱에 실패할 때 발생하는 중복 할당 해제 | [#13332](https://github.com/ruby/ruby/pull/13332) | 4.0.0 | 3.4.12 | 3.3.13 |
| CVE-2026-93577, CVE-2026-97229 | 컴파일된 패턴 크기의 정수 오버플로 | [#19020](https://github.com/ruby/ruby/pull/19020) | 4.0.8 | 3.4.12 | 3.3.13 |
| CVE-2026-110264 | 반복이 많은 패턴에서 발생하는 내부 ID 오버플로 | [#16801](https://github.com/ruby/ruby/pull/16801) | 4.0.9 | 3.4.12 | 3.3.13 |

Ruby 4.0.9, 3.4.12, 3.3.13은 이 수정을 모두 포함하고 있습니다.

## 영향을 받는 경우

이 버그들은 애플리케이션이 공격자가 조작할 수 있는 문자열로 정규표현식을 컴파일하는 경우에만 발생합니다. 예를 들어 그 문자열을 `Regexp.new`, `Regexp.union`, `Regexp.compile`에 넘기거나, `/#{input}/`과 같은 정규표현식 리터럴에 삽입하는 경우입니다. 개발자가 직접 작성한 정규표현식만 사용하는 애플리케이션은 영향을 받지 않습니다.

`Regexp.timeout`으로는 이 버그들을 막을 수 없습니다. 일부 버그는 짧은 패턴으로도 일으킬 수 있으므로, 패턴 길이를 제한하는 것도 확실한 대책이 되지 못합니다.

## 권장 조치

Ruby 4.0.9, 3.4.12, 3.3.13 또는 그 이후 버전으로 업그레이드하는 것을 권장합니다.

업그레이드할 수 없다면, 신뢰할 수 없는 입력으로 정규표현식을 컴파일하지 마세요.

Ruby 3.3은 보안 유지보수 단계로, 보통은 취약점 수정만 릴리스합니다. 하지만 GitLab이 이 버그들에 기반한 문제에 CVE를 할당했으므로, 예외적으로 Ruby 3.3.13에 이 수정들을 포함했습니다.

## CVE 번호에 대해

적어도 현재로서는 이 수정들에 대해 Ruby에서 CVE 번호를 요청하지 않았습니다.

Ruby는 일반적으로 신뢰할 수 없는 입력으로 만든 정규표현식을 컴파일하고 사용하는 것을 안전하지 않다고 간주해 왔습니다. 이는 [CVE-2022-28738]({% link ko/news/_posts/2022-04-12-double-free-in-regexp-compilation-cve-2022-28738.md %})의 보안 권고에서도 밝힌 바 있지만, 당시에는 종합적인 평가 끝에 정규표현식 컴파일의 중복 할당 해제를 취약점으로 다루었습니다. [CVE-2024-27282]({% link ko/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %})도 마찬가지였습니다.

그러나 현재 [Regexp 문서](https://docs.ruby-lang.org/en/master/Regexp.html#class-Regexp-label-Timeouts)는 신뢰할 수 없는 패턴을 서비스 거부 관점에서만 다루며, 타임아웃 설정을 권장하고 있습니다. 신뢰할 수 없는 패턴을 컴파일하는 것을 Ruby가 지원하는지는 명확히 밝히고 있지 않습니다. 이를 어떻게 문서화할지, 이런 종류의 문제를 Ruby의 취약점으로 다룰지, 그리고 이 수정들에 대해 CVE 번호를 요청할지를 논의할 예정입니다. CVE 번호를 요청하게 되면 이 페이지를 갱신하겠습니다.

그때까지는 보안 스캐너 등에서 이 문제들을 추적할 때 위에 나열한 GitLab의 CVE 번호를 사용해 주세요.

## 도움을 준 사람

GitLab의 버그 바운티 프로그램을 통해 [#19020](https://github.com/ruby/ruby/pull/19020)에서 수정된 정수 오버플로를 발견해 준 Johan Carlsson([joaxcar](https://github.com/joaxcar))과, 이 문제들을 보고하고 수정을 조율해 준 GitLab에 감사를 표합니다.

## 수정 이력

* 2026-10-23 03:11:22 (UTC) 최초 공개
