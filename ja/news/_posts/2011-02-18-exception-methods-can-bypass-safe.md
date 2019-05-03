---
layout: news_post
title: "Exceptionのメソッドの$SAFE機構をバイパス可能な脆弱性について"
author: "Shugo Maeda"
lang: ja
---

Exception#to\_sメソッドに$SAFEによるチェックを回避できる脆弱性が発見されました。この脆弱性により、信頼されないコードによって任意の文字列の変更が可能です。

### 詳細

Rubyの$SAFE機構では、セーフレベル4は信頼されないコードの実行に利用されます。このため、セーフレベル4以上では、サンドボックスの外部のデータを信頼されないコードから保護するため、ある種の操作が制限されます。

Exception#to\_sの処理にこの機構に関する問題が発見されました。このメソッドによりセーフレベル機構が回避され、汚染されていない文字列が汚染された状態に破壊的に変更されます。これによって、以下のように、攻撃者は任意の文字列を変更することができます。

    $secret_path = "foo"

    proc do
        $SAFE = 4
        Exception.new($secret_path).to_s
        $secret_path.replace "/etc/passwd"
    end.call

    open($secret_path) do
      ...
    end

### 影響のあるバージョン

幸い、1.9.x系列にはこの脆弱性はありません。影響のあるバージョンは、以下のバージョンに限定されます。

* Ruby 1.8.6 patchlevel 420 以前のバージョン
* Ruby 1.8.7 patchlevel 330 以前のバージョン
* Ruby 1.8の開発バージョン (1.8.8dev)

### 解決策

新しいバージョンにアップグレードしてください。
