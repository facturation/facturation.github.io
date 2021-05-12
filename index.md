---
layout: default
title: "Accueil"
nav_order: 1
description: "API JSON de facturation pour facturer automatiquement les clients de votre entreprise, à partir de votre site ou de votre système d'information."
---
Retrouvez ici toutes les informations sur l'API de facturation en ligne de [MonAE](https://www.monae.fr) et [MaTPE](https://www.matpe.com). Notre service permet de facturer simplement et efficacement vos clients, que ce soit via l'extranet [Facturation.pro](https://www.facturation.pro), ou via vos propres services en vous appuyant sur notre API.

1. TOC
{:toc}

## Introduction

Une API (i.e. Application Programming Interface) est un ensemble normalisé de classes et de méthodes permettant, via n'importe quel langage de programmation, d'interagir avec un service web tel que le notre. Nous mettons à votre disposition une API de type "[REST](http://fr.wikipedia.org/wiki/Representational_state_transfer)", qui vous permet de manipuler les données de votre compte afin d'intégrer dans votre propre application ou site web des modules complémentaires spécifiques s'appuyant sur les données de votre compte. Vous pouvez ainsi utiliser notre API pour par exemple générer des statistiques spécifiques, automatiser votre facturation (en particulier lors de la facturation d'abonnement ou d'objet via un site d'ecommerce), exporter vos données dans un format spécifique non proposé par notre outil web, et plus généralement créer de nouvelles fonctionnalités propres à vos besoins spécifiques.
L'utilisation de notre API nécessite des compétences en développement web. Si vous n'avez pas de telles compétences, vous devrez vous adresser à un prestataire informatique (SSII, studio de développement, développeur indépendant, etc.) afin de voir avec lui s'il peut vous développer ce que vous souhaitez.

## API au format JSON
  Notre API utilise le format JSON, sans élément racine (i.e. "root element") et les noms de champs respectent la syntaxe [snake_case](http://fr.wikipedia.org/wiki/Snake_case). Sauf mention contraire, vous devez utiliser l'extension .json à la fin de chaque URL de l'API.

## Identifiez votre application
Nous vous recommandons **d'inclure dans les entêtes de vos requêtes un User-Agent** avec le nom de votre application et un lien vers un formulaire de contact ou bien votre adresse email, afin que nous puissions vous contacter si nous constatons un problème dans l'utilisation que vous faites de notre API. En l'absence d'informations valides de contact, votre accès à l'API pourra être suspendu sans préavis en cas d'utilisation abusive de l'API.

**Voici des exemples de User-Agent:**

* User-Agent: MonAppli (http://monappli.com/contact.php)
* User-Agent: Appli de Patrick (patrick@camping.test)

**Remarques :**

* pour éviter toute erreur d'encodage de caractères, veuillez à ne pas utiliser de caractères accentués dans le champ User-Agent.
* si vous n'êtes pas en mesure de changer le User-Agent transmis par le client que vous utilisez pour faire vos requêtes, vous pouvez transmettre un User-Agent conforme en envoyant dans votre requête une entête X-User-Agent. Par exemple:

{% api_block %}
{% curl_cmd user_agent: 'X-User-Agent' %} "{{ site.data.urls['customers']['find']['url'] | api_url }}"
{% endapi_block %}

## Authentification

Notre API supporte deux protocoles d'identification:
* via le protocole OAuth2: cette méthode d'authentification est recommandée dès lors que votre application sera utilisée par de multiples utilisateurs.
* via une clé API: cette méthode d'authentification est destinée essentiellement au développement d'applications pour votre propre usage.

### Authentification via OAuth2

Lorsque vous développez une application destinée à être publique et à être utilisée par vos propres utilisateurs, nous vous encourageons à authentifier vos requêtes API via le protocole [OAuth 2](http://oauth.net/) pour plus de simplicité et de sécurité pour vos clients. Ce protocole évite à vos utilisateurs d'avoir à communiquer leurs identifiants de connexion API manuellement, et propose donc une expérience utilisateur plus fluide lorsque celui ci souhaite autoriser votre application à accéder à ses données.

Pour pouvoir utiliser le protocole OAuth, vous devez obligatoirement disposer d'un compte sur notre service (un compte gratuit est suffisant) et [enregistrer votre application](https://www.facturation.pro/oauth/applications) sur notre service.

### Authentification par clé API

Lorsque vous développez une application pour votre propre usage interne, vous pouvez utiliser une authentification par clé API, plus rapide à mettre en oeuvre pour un usage personnel. Dans ce cas, chaque requête API doit être authentifiée à l'aide des informations ci-dessous, via le protocole "[HTTP Basic Authentication](http://www.ietf.org/rfc/rfc2617.txt)".<br/>

Vos codes d'accès à l'API sont disponible dans la rubrique ["Clé API"](https://www.facturation.pro/account/api) de votre compte (i.e. en cliquant sur l'avatar en haut à droite de votre espace client). Si vous venez juste de créer un compte sur notre outil, vous devez activer votre compte via le lien reçu avant de pouvoir récupérer vos codes.

A tout moment, vous pouvez générer un nouveau mot de passe API depuis votre compte.

Vous pouvez utiliser un utilitaire tel que curl pour tester l'accès à l'API.
Exemple:
{% api_block %}
  {% curl_cmd %} "{{ site.data.urls['customers']['find']['url'] | api_url }}"
{% endapi_block %}

## Paramètre FIRM_ID

Comme vous allez le constater en parcourant la documentation de l'API, toutes les requêtes sont préfixées par le chemin /firms/FIRM_ID . Le paramètre FIRM_ID correspond à l'identifiant de l'entreprise sur laquelle vous souhaitez travailler.<br/>
Vous pouvez retrouver la liste des identifiants de votre compte dans la rubrique ["Clé API"](https://www.facturation.pro/account/api) de votre compte (i.e. en cliquant sur l'avatar en haut à droite de votre espace client).


## Test de l'API

Afin de tester votre application, nous vous conseillons de [créer une nouvelle entreprise](https://www.facturation.pro/firms/new) et de ne pas passer cette entreprise en production. Vous disposerez alors d'une entreprise sur laquelle vous pourrez faire vos tests librement, sans que cela n'impacte vos données de production. Vous pouvez à tout moment ré-initialiser cette entreprise si vos données dépassent les limites de la version gratuite.

## Lecture des données

L'API propose généralement deux types d'accès en lecture aux données : liste et détail. Les accès de type "détail" retourne un enregistrement unique, alors que les accès de type "liste" retournent un ensemble d'enregistrements.

Toutes les requêtes de consultation sont faites avec la méthode GET. Lorsque une requête de lecture réussi, vous obtenez une réponse au format JSON accompagné du code HTTP "200 OK". Ce type d'url peut être consulté depuis un navigateur.

## Ecriture des données

La création, la modification et la suppression de données est facile a implémenter, mais ne peut pas être réalisée directement depuis un navigateur. Quel que soit le langage de développement que vous utilisez, un utilitaire tel que "curl" vous permet de faire facilement des essais et explorer l'API.

Lorsque vous créez ou modifiez des données, vous transmettez du code JSON, et vous devez le faire savoir au système en ajoutant à vos requêtes l'entête:
`Content-type: application/json; charset=utf-8`. Il vous suffit alors d'inclure vos données au format JSON dans le corps de votre requête pour que l'API effectue l'opération demandée.

Voici un exemple de création à l'aide de curl :

{% api_block %}
{% curl_cmd write: true %} -d '{"company_name":"WORLD INC"}' \
"{{ site.data.urls['customers']['find']['url'] | api_url }}"
{% endapi_block %}

Si la création réussi, le code HTTP de retour est "201 Created" et les entêtes de la réponse contiennent une entrée "Location" indiquant l'url d'accès au nouvel élément créé. De plus, le résultat contient le détail JSON de la ressource créée.

Sur un principe similaire, la mise à jour des enregistrements se fait à l'aide d'une requête de type PATCH. Par exemple:

{% api_block %}
{% curl_cmd write: true %} -X PATCH \
 -d '{"company_name":"BIG CORP S.A.S"}' \
 "{{ site.data.urls['customers']['update']['url'] | api_url }}"
{% endapi_block %}

Lorsque la mise à jour réussie, vous obtenez en retour le code HTTP "200 OK".
A noter que lors d'une requête de modification, vous n'avez besoin de transmettre que les données que vous souhaitez modifier, il n'est pas nécessaire de reprendre tous les champs.

Enfin, pour supprimer un enregistrement (si cette fonction est disponible), vous devez utiliser une requête de type DELETE. Par exemple:

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ site.data.urls['customers']['destroy']['url'] | api_url }}"
{% endapi_block %}

Les requêtes de suppression ne nécessitent pas de "Content-Type" puisqu'elles ne contiennent pas de JSON. Si la suppression réussie, vous obtenez le code HTTP "200 OK"


## Champs disponibles

A la fin de chaque rubrique de la documentation de l'API, nous vous indiquons la liste des champs disponibles pour l'objet concerné, avec pour chaque champs le type de donnée qu'il accepte et si ce champs est accessible en écriture ou non.<br/>
Les dates doivent toujours être transmises au format AAAA-MM-DD (AAAA: année, MM: numéro du mois de 01 à 12, DD: numéro du jour de 01 à 31).<br/>
Certains champs n'acceptent que des valeurs pré-définies, et dans ce cas, la liste des valeurs possibles est précisée dans la documentation.


## Pagination

Les requêtes de type liste (liste de clients, de factures, de devis, ...) retournent les X premiers résultats trouvés, ainsi qu'une entête "X-Pagination" contenant un hash JSON avec les informations de pagination suivantes: nombre total d'enregistrements (total_entries), nombre d'enregistrements par page (per_page), page courante (current_page), nombre total de pages (total_pages).

Exemple:

{% api_block %}
HTTP/1.1 200 OK
...
X-Pagination:{"current_page":1,"total_pages":10,"per_page":30,"total_entries":300}
...
{% endapi_block %}

Vous pouvez accéder aux différentes pages d'une liste en utilisant le paramètre "page=N" dans vos requêtes, ou N est le numéro de page souhaité.


## Gestion des erreurs

Si une requête échoue, vous obtiendrez des codes d'erreur HTTP spécifiques, accompagnés d'un message d'erreur.
Par exemple, pour un enregistrement non trouvé, la réponse peut ressembler à:

{% api_block %}
HTTP/1.1 404 The record could not be found
Date: 2020-01-26 11:24:20 +0100
...
{% endapi_block %}

A noter que lorsqu'une requête est à l'origine d'une création d'enregistrement (création d'un client, d'un produit, etc), vous obtenez un code HTTP "201 Created" en cas de succès. Les autres opérations utilisent généralement le code "200 OK" pour indiquer que l'opération a réussie.

Voici quelques erreurs spécifiques:

* Si vous obtenez une erreur 501 lorsque vous créez ou modifiez un enregistrement, vérifiez que vous avez bien transmis votre demande avec le bon "Content-Type" (cf. plus haut)
* Une erreur 400 ou 422 indique que les données que vous transmettez sont mal formatées (i.e. JSON ou entêtes invalides). Dans ce cas, la réponse associée à ces codes d'erreur peut vous indiquer plus précisément ou se trouve l'erreur dans vos données. Dans tous les cas, lorsque vous obtenez ces codes d'erreur, nous vous invitons à vérifier les données que vous transmettez pour identifier votre problème.
* Pour les autres codes d'erreurs, consultez la réponse retournée par le système qui contient généralement plus d'informations sur les erreurs rencontrées dans le champ "errors"


## Limitations du nombre de requêtes

Notre API vous autorise à réaliser :
* 600 requêtes par période de 5 minutes, soit en moyenne deux requêtes par seconde
* 10000 requêtes par jour

Si vous dépassez l'une ou l'autre de ces limitations, vous receverez un code d'erreur 429, avec un message "Retry later" dans le corps de la réponse.

Afin de suivre vos quotas, vous pouvez consulter les champs d'entête suivant:
* X-RateLimit-Limit: nombre total de requêtes autorisées
* X-RateLimit-Remaining: nombre total de requêtes restantes


Ces limites sont suffisante pour un usage normal de notre API. Si vous atteignez régulièrement ces limites, alors nous vous invitons à optimiser vos scripts, par exemple :
* en évitant de parcourir l'ensemble de vos données, mais uniquement en parcourant les données récemment modifiées (via les paramètres de tri)
* en mettant en cache (temporaire ou permanent) les données qui ne changent pas pour ne pas avoir besoin de récupérer ces données en permanence en temps réel
* en temporisant vos requêtes pour les étaler dans le temps
* en diminuant la fréquence d'exécution de vos scripts


## Compatibilité JSONP

L'API est compatible avec le format JSONP, vous permettant d'accéder aux méthodes de type "GET" via du javascript. Il vous suffit d'indiquer votre callback en ajoutant le paramètre "callback=monCallBack" à l'url demandée.

Exemple de requête:

{% api_block %}
  {% curl_cmd %} "{{ site.data.urls['customers']['show']['url'] | api_url }}?callback=afficherInfo"
{% endapi_block %}

Résultat:

{% api_block 'js' %}
afficherInfo({
  "account_code": "411004",
  "city": "Dublin 4",
  "civility": null,
  "company_name": "Google AdSense Payments - VAT",
  "country": "IE",
  "currency": "EUR",
  "id": 1,
  "individual": false,
  "street": "Gordon House\r\nBarrow Street",
  "vat_number": "IE6388047V"
})
{% endapi_block %}
