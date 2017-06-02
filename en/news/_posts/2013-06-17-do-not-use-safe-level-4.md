# Don't use $SAFE=4
 
`$SAFE=4` is used for sandboxing by some users, but it's potentially vulnerable because it is blacklist based.
Use of `$SAFE=4` for sandboxing is therefore not recommended as described in [doc/security.rdoc](http://www.ruby-doc.org/core-2.0/doc/security_rdoc.html).
 
In Ruby 2.1, the $SAFE=4 feature [will be removed](http://bugs.ruby-lang.org/issues/8468), and exceptions will be raised when $SAFE is set to 4 or larger.
So DO NOT USE $SAFE=4 any longer.

Thank you.
