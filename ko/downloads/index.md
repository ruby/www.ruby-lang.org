---
layout: page
title: "Ruby 다운로드"
lang: ko
---

자신이 선호하는 방식으로 최신 루비 배포판을 설치할 수 있습니다.
현재 안정 버전은 {{ site.downloads.stable.version }} 입니다.
[Ruby 라이센스][license]를 읽어 보십시오.
{: .summary}

### 루비를 설치하는 방법

각 주요 플랫폼에서 루비를 설치할 수 있는 몇 가지 도구들이 있습니다.

* Linux/UNIX에서는 시스템에 포함된 패키지 관리 시스템이나
  서드파티 도구(rbenv나 RVM)를 사용할 수 있습니다.
* OS X에서는 서드파티 도구(rbenv나 RVM)를 사용할 수 있습니다.
* Windows에서는 RubyInstaller를 사용할 수 있습니다.

패키지 관리 시스템이나 서드파티 도구에 대한 좀 더 자세한
설명은 [설치][installation] 페이지를 보세요.

물론, 주요 플랫폼에서 소스코드로부터 설치할 수도 있습니다.

### 루비 컴파일하기 - 소스 코드

소스 코드로 설치하기는 당신이 자신의 플랫폼에 충분히 익숙하고
자신의 환경을 위한 특별한 설정이 필요할 때 훌륭한 솔루션입니다.
또한 이 방법은 자신의 플랫폼을 위해 미리 만들어진 패키지가
없을 때에도 좋은 솔루션입니다.

루비를 소스에서 빌드하는 하시려면 [설치][installation] 페이지에서
자세한 내용을 보실 수 있습니다. 루비를 컴파일하는데 문제가 있다면,
밑에서 소개하는 서드파티 도구 중 하나를 이용해볼 것을 고려해 보십시오.
도움이 될 것입니다.

* **안정버전:**
  [Ruby {{ site.downloads.stable.version }}][stable-gz]<br>
  sha256: {{ site.downloads.stable.sha256.gz }}

* **이전버전:**
  [Ruby {{ site.downloads.previous.version }}][previous-gz]<br>
  sha256: {{ site.downloads.previous.sha256.gz }}

* **낡은버전 (2.0.0 시리즈):**
  [Ruby {{ site.downloads.previous20.version }}][previous20-gz]<br>
  sha256: {{ site.downloads.previous20.sha256.gz }}

* **낡은버전 (1.9.3 시리즈):**
  [Ruby {{ site.downloads.previous19.version }}][previous19-gz]<br>
  sha256: {{ site.downloads.previous19.sha256.gz }}

* **스냅샷:**
  * [Stable Snapshot][stable-snapshot-gz]:
    안정 브랜치의 최신 스냅샷을 타르볼로 압축한 것.
  * [Nightly Snapshot][nightly-gz]:
    나이틀리로 제작된 SVN 상의 모든 것을 타르볼로 압축한 것.
    본 스냅샷은 버그 혹은 기타 이슈를 포함하고 있을 수 있으니 주의하여 사용하십시오!

루비 서브버전과 Git 저장소에 대한 정보는, [루비 코어](/ko/community/ruby-core/) 페이지를 읽어 보십시오.

루비 소스는 전세계의 [미러 사이트][mirrors]에서 사용하실 수 있습니다.
자신과 가까운 곳의 미러를 이용해 주십시오.



[license]: {{ site.license.url }}
[installation]: /ko/documentation/installation/
[stable-gz]: {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[previous20-gz]: {{ site.downloads.previous20.url.gz }}
[previous19-gz]: {{ site.downloads.previous19.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[mirrors]: /en/downloads/mirrors/
