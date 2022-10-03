---
layout: default
title: "Outils"
nav_order: 20000
---

1. TOC
{:toc}

## Déboguer
  Pour tester ou déboguer vos requêtes API, nous vous recommandons d'utiliser le service [WebhookApp](https://www.webhookapp.com/) qui vous permet de construire, d'exécuter et de sauvegarder facilement des requêtes API, et d'accéder à l'ensemble des informations retournées pour chaque requête (headers, contenu, etc.). Ce service vous permet aussi de <strong>partager les requêtes qui vous posent problème avec notre support</strong> : nous sommes ainsi en mesure de mieux vous guider lorsque vous rencontrez un problème d'utilisation avec notre API.

  Pour configurer vos tests sur cet outil, vous devez ajouter un nouveau "hook" et le configurer avec le mode "An API, Forward and Track Requests", en utilisant comme valeur pour le champ target `https://www.facturation.pro/` et en cochant la case "Rewrite host"

  Si besoin, il existe des services alternatifs plus ou moins évolués tel que [hookdeck.com](https://hookdeck.com/) ou bien [RequestBin](https://requestbin.com/) pour déboguer vos requêtes.

## Librairies
  Notre API est de type REST, et elle est compatible [ActiveResource](https://github.com/rails/activeresource) :

  * En Ruby ou Rails, vous pouvez utiliser [cette librairie](https://www.facturation.pro/facturation.rb)
  * [Unirest](http://unirest.io/) propose des librairies en PHP, Java, Ruby, Python et Objective-C pour utiliser facilement une API REST telle que la notre.
  * En PHP, il existe des librairies qui permettent de s'interconnecter avec une API de type ActiveResource (cf. [ActiveResource](https://github.com/Indatus/ActiveResource) ou bien [PhpActiveResource](https://github.com/phurni/PhpActiveResource)).

## Librairies tierces

  Voici une liste de librairies et d'extensions développées par des tiers qui peuvent vous aider à vous interconnecter avec MonAE et MaTPE. Cette liste est fournie à titre d'information, sans aucune garantie de notre part, et pour toute question au sujet de l'une de ces librairies (fonctionnement, bugs, commercialisation, ...), vous devez vous adresser directement à l'auteur concerné.

  * [PHPmonAE](https://github.com/Atome-TM/PHPmonAE)  : librairie PHP.
  * Bundle pour [PHP Symfony 3](https://github.com/Tiloweb/tiloweb-matpe) et [Symphony 4](https://github.com/Isoka/monae-symfony4-service)
  * Module [Prestashop](https://store.comexpertise.com/fr/modules/prestashop/module-facturationpro-monaematpe-pour-prestashop)
  * Module [Woocommerce](https://www.symbioseo.fr/boutique/plugins/woocommerce-facturation-matpe-monae/)
  * Package [Laravel](https://github.com/atome-dev/laravel-facturationpro-api)

  Si vous avez construit une librairie ou une extension publique, n'hésitez pas à nous le faire savoir pour qu'elle soit ajoutée sur cette page.
