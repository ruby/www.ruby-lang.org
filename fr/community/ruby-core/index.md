---
layout: page
title: "Ruby Core"
lang: fr
---

C’est une période formidable pour suivre le développement de Ruby. Avec
l’attention accrue que Ruby a reçue ces dernières années, il y a un besoin
croissant de talents pour aider à améliorer Ruby et documenter ses
composants. Alors, par où commencer ?
{: .summary}

Cette page couvre les sujets suivants :

* [Utiliser Subversion pour suivre le développement de Ruby](#following-ruby)
* [How to Use Git With the Main Ruby Repository](#git-ruby)
* [Améliorer Ruby, patch par patch](#patching-ruby)
* [Règles et usages à l’attention des développeurs principaux](#coding-standards)

### Utiliser Subversion pour suivre le développement de Ruby
{: #following-ruby}

Pour récupérer la dernière version du code source Ruby, il faut réaliser
un *check out* en se connectant au compte anonyme du dépôt Subversion.
Dans un terminal :

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

Le répertoire `ruby` contient maintenant le code source de Ruby 1.9.x
(tronc) dans sa dernière version. Le tronc a été dupliqué en Janvier
2009 pour donner naissance à la branche stable 1.9.1. Actuellement, les
patchs pour le tronc sont ensuite rétroappliqués à la branche `1_9_1`
(voir détails ci-après).

Si vous êtes plutôt intéressé par le suivi des patchs appliqués à Ruby
1.9.1 plutôt qu’à la branche de développement (tronc instable), il vous
faut récupérer la branche stable par :

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/ruby_1_9_1
{% endhighlight %}

Si vous êtes intéressés par la branche 1.8.6 ou 1.8.7 :

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8_*
{% endhighlight %}

où `*` est `6` ou `7`.

Les développeurs travaillant sur Ruby 1.8 doivent migrer leurs
modifications sur la branche principale, de sorte qu’en général, les
deux branches sont assez similaires, avec la notable exception des
améliorations portées sur le langage lui-même par Matz et Nobu.

Vous pouvez également [parcourir le dépôt Subersion en ligne][1].

Pour des informations sur le logiciel Subversion en lui-même, voyez la
[*Subversion FAQ*][2] et le [*Subversion book*][3]. Un excellent livre
introductif est [Pragmatic Version Control with Subversion][4].

### Utiliser Git
{: #git-ruby}

Pour ceux d’entre-vous qui préfèrent [Git][5], il existe [un miroir de
développement][6] sur GitHub. Des instructions précises et différenciées
sont disponibles pour les développeurs [possédant le droit de commit][7]
et [les autres][8].

### Améliorer Ruby, patch par patch
{: #patching-ruby}

Rubyforge maintient un [système de suivi des bugs][9] permettant de
transmettre patchs et rapports de bugs à Matz et l’équipe de
développement. Ces rapports parviennent également à la liste de
diffusion Ruby-Core, ils ne passent donc pas inaperçus.

Pour résumer, les grandes étapes pour proposer un patch sont :

1.  Récupérer une copie de travail de Ruby 1.8 depuis Subversion, sur la
    branche `ruby_1_8` branch.

         $ svn co https://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8

2.  Ajouter vos améliorations dans le code (dans le répertoire/dossier
    `ruby_1_8` en local).
3.  Créer un patch.

         $ svn diff > ruby-1.8-changes.patch

4.  [Envoyer][10] ce patch.

**Note importante**\: les patchs doivent être au format [*unified
diff*][11]. Pour plus d’informations sur les patchs, leur devenir, voyez
[*the diffutils reference*][12].

Les discussions portant sur le développement de Ruby sont toutes regroupées
sur la [liste de diffusion Ruby-Core][mailing-lists]. Donc, si vous
êtes curieux du devenir de votre patch, ou si vous voulez lancer une
discussion sur le futur de Ruby, n’hésitez pas à venir y faire un tour.
Prenez garde à ne pas lancer des hors-sujets, ils ne sont pas tolérés
sur cette liste dont le niveau de bruit doit rester très bas. Les sujets
doivent être précis, bien rédigés et conçus. Parmi les intervenants
figurent les créateurs de Ruby, le respect mutuel est donc la norme.

Gardez également à l’esprit que les développeurs principaux de Ruby
résident au Japon, et si la plupart parlent un excellent anglais, il y a
un décalage horaire conséquent. Il existe également tout un groupe de
listes de diffusion entièrement en japonais, similaires à leurs
équivalent en anglais. Soyez patients, et n’hésitez pas à intervenir de
nouveau après quelques jours si votre question n’a pas reçu de réponse.

### Règles et usages pour les développeurs principaux
{: #coding-standards}

Les développeurs de Ruby devraient évidemment être à l’aise avec le code source et le style utilisé par l’équipe principale. Les principales règles à vérifier avant tout envoi vers le dépôt Subversion sont :

* tout *check in* doit être décrit dans le `ChangeLog`, en respectant
  les [conventions GNU][13]. Plusieurs développeurs principaux utilisent
  le mode `add-log` d’Emacs à cette fin, mode s’activant par la
  combinaison `C-x 4 a` ;
* les dates de *check in* doivent être données au *Japan Standard Time*
  (UTC+9) ;
* les différents items de votre ChangeLog doivent également être
  mentionnés dans le résumé Subversion, car ce message est
  automatiquement transmis à la liste de diffusion Ruby-CVS après le
  *commit* ;
* les prototypes de fonctions sont utilisés dans l’ensemble
  du code source de Ruby et des extensions liées ;
* pas de commentaire en style C++ (`//`), seul le commentaire multiligne
  est utilisé (`/* .. */`).



[mailing-lists]: /fr/community/mailing-lists/
[1]: https://svn.ruby-lang.org/cgi-bin/viewvc.cgi/
[2]: http://subversion.apache.org/faq.html
[3]: http://svnbook.org
[4]: http://www.pragmaticprogrammer.com/titles/svn/
[5]: http://git-scm.com/
[6]: https://github.com/shyouhei/ruby
[7]: https://github.com/shyouhei/ruby/wiki/committerhowto
[8]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[9]: https://bugs.ruby-lang.org
[10]: http://rubyforge.org/tracker/?func=add&amp;group_id=426&amp;atid=1700
[11]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[13]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
