---
layout: news_post
title: "RAA 교체"
author: "Unknown Author"
lang: ko
---

www-admin@ruby-lang.org이 다소 노후화된 기존 [RAA][1]를 새로 작성했습니다.

변경 사항:

* 가벼워진 상단 페이지
* iso8859-1 =&gt; UTF-8
* 간단한 키워드 검색 추가
* 지정한 소유자의 프로젝트 표시

SOAP 및 XML-RPC 인터페이스도 업데이트될 예정입니다. RAA SOAP 및 XML-RPC
인터페이스 사용자는 문제가 발생하면 알려 주시기 바랍니다. 와이어 포맷이
약간 변경되었습니다. 자세한 내용은 아래를 참고하세요:

* 각 항목에 id 및 owner\_id 요소가 추가되었습니다. 두 요소에는 양의 정수가
  포함됩니다.
* SOAP 인터페이스 사용자 한정: url, download, email 요소가 xsd:anyURI
  형식으로 지정됩니다. 클라이언트 측에서 해당 요소는 String 객체가 아닌
  URI 객체로 언마샬링됩니다.

SOAP 및 XML-RPC 외에도 RAA 정보를 담은 일반 XML 또는 RDF 파일도 제공합니다.
파일의 위치는 http://raa.ruby-lang.org/xml.xml과
http://raa.ruby-lang.org/rdf.xml입니다. 최신 정보는 RDF 형식으로
http://raa.ruby-lang.org/since.mrb에서도 확인할 수 있습니다.

pragdave의 XML/RDF 피드 인터페이스 사용자는 당분간 위의 주소를 이용해
주세요. pragdave의 기존 인터페이스는 RAA DB 교체로 인해 현재 업데이트되지
않습니다. 또한 이 인터페이스에도 일부 변경 사항이 있으니 참고해 주세요:

* \*.xml 파일은 실시간이 아닌 15분마다 업데이트됩니다.
* 문자 인코딩이 iso-8859-1에서 UTF-8로 변경되었습니다.
* XML 인스턴스 형식이 사용 편의를 위해 변경되었습니다.



[1]: http://raa.ruby-lang.org/
