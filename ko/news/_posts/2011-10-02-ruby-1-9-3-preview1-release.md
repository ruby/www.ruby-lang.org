---
layout: news_post
title: "루비 1.9.3 preview1 릴리스"
author: "Moru"
date: 2011-10-02 04:28:42 +0000
lang: ko
---

루비 1.9.3 preview1이 릴리스되었습니다.

이는 1.9.3으로서는 첫 preview이며 아직까지 자잘한 문제점을 가지고 있습니다. 이러한 문제점은 정식 릴리스인 p0부터는
모두 수정될 예정입니다.

## 내려받기

* https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.bz2
^

    SIZE:   9507455 bytes
    MD5:    7d93dc773c5824f05c6e6630d8c4bf9b
    SHA256: a15d7924d74a45ffe48d5421c5fc4ff83b7009676054fa5952b890711afef6fc

* https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz
^

    SIZE:   12186410 bytes
    MD5:    0f0220be4cc7c51a82c1bd8f6a0969f3
    SHA256: 75c2dd57cabd67d8078a61db4ae86b22dc6f262b84460e5b95a0d8a327b36642

* https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.zip
^

    SIZE:   13696708 bytes
    MD5:    960e08b2dc866c9987f17d0480de63a1
    SHA256: 249483f88156b4ae65cd45742c6f6316660f793b78739657596c63b86f76aaeb

## 1.9.2과의 차이점

아래와 같이 라이센스가 변경되었습니다.

* 기존 루비는 \"GPLv2\"과 \"루비\" 라이센스 하에 배포되어왔습니다.

루비 1.9.3부터는 \"2-clause BSDL\"과 \"루비\" 라이센스로 변경되었습니다.

### 라이브러리

* io/console: 새롭게 추가
* openssl: 새로운 메인테이너의 활약으로 개선되었습니다
* test/unit: 병렬처리가 가능하게 되었습니다

### 기타

* pathname 및 date가 C로 다시 쓰여졌으며, 이에 따라 성능 향상이 이루어지게 되었습니다.
* VM Lock의 전략이 변경되었습니다.

자세한 사항은 아래의 링크를 참조하시기 바랍니다.

* 1: https://github.com/ruby/ruby/blob//v1\_9\_3\_preview1/NEWS
* 2:
  https://github.com/ruby/ruby/blob//v1\_9\_3\_preview1/ChangeLog
