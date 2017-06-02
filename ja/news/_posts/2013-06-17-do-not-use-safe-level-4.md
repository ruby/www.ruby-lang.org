# $SAFE=4 を使わないでください

`$SAFE=4` は一部の方にサンドボックスとして利用されていますが、ブラックリスト方式であるため潜在的な脆弱性が存在します。
このため、[doc/security.rdoc](http://www.ruby-doc.org/core-2.0/doc/security_rdoc.html) にも記述されているとおり、サンドボックスとしての利用は推奨されていません。
 
また、Ruby 2.1 では [$SAFE=4 の機能は削除](http://bugs.ruby-lang.org/issues/8468)され、`$SAFE` に 4 以上の値を代入すると例外が発生するようになります。
今後は、`$SAFE=4` を使用しないようにお願いします。
