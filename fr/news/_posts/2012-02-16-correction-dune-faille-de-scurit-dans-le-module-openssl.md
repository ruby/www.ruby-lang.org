---
layout: news_post
title: "Correction d'une faille de sécurité dans le module OpenSSL : \"0/n splitting\" comme mesure préventive contre l'attaque TLS BEAST."
author: "Jean-Denis Vauguet"
lang: fr
---

Dans OpenSSL, l\'option `SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS` pour les
connections SSL est utilisée pour se prémunir d\'une [vulnérabilité de
TLS-CBC-IV][1]. Il s\'agit d\'une faille bien connue de TLSv1/SSLv3, qui
est revenue sur le devant de la scène sous le nom d\'[attaque BEAST][2]
(CVE-2011-3389). Les discussions à ce sujet sont consultables sur le
[Ruby Bug Tracker][3].

Jusqu\'à présent, l\'extension OpenSSL de Ruby utilisait l\'option
`SSL_OP_ALL`, qui correspond à un ensemble d\'options apportés par des
correctifs successifs, la plupart mineurs. Cette option s\'applique à
toutes les connections SSL par défaut. Les utilisateurs ne peuvent
qu\'ajouter de nouvelles options à cette base, mais jamais retirer des
options de la palette `SSL_OP_ALL`, notamment l\'option
`SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS`. Il s\'agit d\'un choix établi,
visant entre autre à ne pas exposer des options telles que
`SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS`. Toutefois, pour contrer l\'attaque
BEAST, il s\'avère que Ruby doit laisser la possibilité aux utilisateurs
de désactiver cette option `SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS` en
particulier, pour permettre à Ruby OpenSSL d\'insérer des fragments
vides à début des connections SSL (le fameux \"0/n splitting\").

[Ce correctif][4] définit des constantes supplémentaires et autorise les
utilisateurs à désactiver des options de `SSL_OP_ALL`. Par défault,
l\'état est toujours celui de `SSL_OP_ALL`, mais vous pouvez configurer
`SSLSocket` pour réaliser le \"0/n splitting\" en prévention de
l\'attaque BEAST, comme ceci :

    ctx = SSLContext.new
    ctx.options = OP_ALL & ~OP_DONT_INSERT_EMPTY_FRAGMENTS
    ctx.verify_mode = OpenSSL::SSL::VERIFY_PEER
    SSLSocket.new(socket, ctx)

Merci à Apple d\'avoir rapporté ce problème.

NOTE : certains endpoints SSL sont connus pour ne pas gérer correctement
le \"0/n splitting\". En réaction, OpenSSL et l\'implémentation Ruby ont
décidé de ne pas l\'activer *par défaut*. Il vous est conseillé de
tester votre connectivité SSL avant de l\'activer en production. Si
l\'autre endpoint de connection ne supporte pas le \"0/n splitting\",
vous devrez utiliser un autre correctif, par exemple forcer
l\'utilisation de RC4 pour le cipher. Pour plus de détails,
renseignez-vous sur CVE-2011-3389.



[1]: http://www.openssl.org/~bodo/tls-cbc.txt
[2]: https://www.cve.org/CVERecord?id=CVE-2011-3389
[3]: https://bugs.ruby-lang.org/5353
[4]: http://mla.n-z.jp/?ruby-talk=393484
