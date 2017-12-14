---
layout: news_post
title: "Ruby 2.5.0-rc1 �����[�X"
author: "naruse"
translator: "usa"
date: 2017-12-14 17:00:00 +0000
lang: en
---

Ruby 2.5.0-rc1 �������[�X�������Ƃ����m�点���܂��B

Ruby 2.5.0-rc1 �́A���� Ruby 2.5.0 �Ɍ����Ă̌��ؗp���O�����[�X�ł��B
����ɂ́A����̐V�����@�\��p�t�H�[�}���X�̉��P���܂܂�Ă��܂��B
�Ⴆ�΁A�ȉ��̂悤�Ȃ��̂�����܂��B

## �V�@�\

* STDERR ���ύX����Ă��炸�A���� tty �ł���ꍇ�A�o�b�N�g���[�X����уG���[���b�Z�[�W���t���ɏo�͂����悤�ɂȂ�܂����B
  [Feature #8661] [experimental]

* �g�b�v���x���̒萔�����͍폜����܂����B[Feature #11547]

* rescue/else/ensure �� do/end �u���b�N���ɂ����ڏ�����悤�ɂȂ�܂����B [Feature #12906]

* yield\_self [Feature #6721]

## �p�t�H�[�}���X�̉��P

* TracePoint �̃t�b�N�ɂ����āA"trace" ���߂����Ă����̂���߂ĕK�v���ɓ��I�Ɏ��������悤�ɂȂ�܂����B�ʏ펞�̃I�[�o�[�w�b�h���y������܂��B [Feature #14104]

* Proc �̊m�ۂ�x�����邱�Ƃɂ��A�u���b�N�����ɂ��u���b�N�n���̃p�t�H�[�}���X�����サ�܂����B [Feature #14045]

* Mutex �����R���p�N�g�������ɏ���������܂����B [Feature #13517]

* SecureRandom �� OpenSSL ���� OS �̒񋟂��闐���\�[�X��D�悷��悤�ɂȂ�܂����B [Bug #9569]

## ���̑��̒��ڂ��ׂ� 2.4 ����̕ύX�_

* Onigmo 6.1.3 ����荞�܂�܂����B
  [���܃I�y���[�^](https://github.com/k-takata/Onigmo/issues/87) ���ǉ�����Ă��܂��B
  �Ȃ��A���̕ύX�� Ruby 2.4.1 �ɂ���荞�܂�܂����B
* bundler ����荞�܂�A�W�����C�u�����ƂȂ�܂����B
* rubygems-2.7.0 ����荞�܂�܂����B
* rdoc-6.0.0.beta3 ����荞�܂�܂����B
  IRB �x�[�X���������@��͊킪 Ripper �x�[�X�ɂȂ��Ă��܂��B
  ����ɂ��A�h�L�������g�������x�����サ�Ă��܂��B
  https://github.com/ruby/rdoc/pull/512
  �܂��A
  * ����10�N�]��ŗݐς��������̃o�O���C������Ă��܂��B
  * �ߔN Ruby �ɒǉ����ꂽ�V�������@���T�|�[�g����Ă��܂��B
* �T�|�[�g���Ă��� Unicode �̃o�[�W������ 10.0.0 �ɍX�V����܂����B

���̑��ڍׂɂ��ẮA[NEWS](https://github.com/ruby/ruby/blob/v2_5_0_rc1/NEWS) �t�@�C���܂��̓R�~�b�g���O���Q�Ƃ��Ă��������B

�Ȃ��A���������ύX�ɂ��ARuby 2.4.0 �ȍ~�ł�
[6162 �̃t�@�C���ɕύX���������A339744 �s�̑}���� 28699 �s�̍폜���s���܂���](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0_rc1)!

Enjoy Ruby 2.5.0-rc1!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.gz>

      SIZE:   31049529 bytes
      SHA1:   15df7e8ff99f360a14f7747a07a3021447d65594
      SHA256: 46c11b347522de174566503d35d2b46e1529b979d292b1f7f7019cfedcd4b07f
      SHA512: 41cd298e99d7a25fe5f2ec42946ae5dbc4421bb18f39350ba8a1b02e999541ec1b21b5f6ce0489b3a159f47e37d409178ba7c21c00e177b0fdb410ca6e9d6142

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.zip>

      SIZE:   35579788 bytes
      SHA1:   b7ae42eb733d4a0e3a2d135c9f8d4af043daa728
      SHA256: 9858e39fd2e7bf207cc9f8846197b11ada5f4424f433ff4df149fe3d48be8e36
      SHA512: 86c93791d312fd2175909020e448a44892740feb809a532ed706c6d850cb92722fb7ca02ecbdf7a1fbeb5b4f42f1338ce9a15b7c0a41055937bd1fdfb4be6f11

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.bz2>

      SIZE:   29238901 bytes
      SHA1:   6aad74ed3d30de63c6ff22048cd0fcbcbe123586
      SHA256: 862a8e9e52432ba383660a23d3e87af11dbc18c863a19ef6367eb8259fc47c09
      SHA512: bf0eb114097f9e505ff846f25e7556a2fb393573b4e8b773f94cf5b47998e221f3962a291db15a3cdbdf4ced5a523812937f80d95f4ee3f7b13c4e37f178d7a7

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.xz>

      SIZE:   26096412 bytes
      SHA1:   05cacd0341b7a23cc68239c2061640643a30da38
      SHA256: a479a1bce69b2cf656821f10104dcb8b426922b56d3d6cbdf48318842fae752c
      SHA512: 9f9040abf69337439a3f31b80d440d97736555b0df6533d9d34c141ce52226bc40c3f4f7e596e74b080c879e933649c17a073c893be1a304d9a883bab02e9494
