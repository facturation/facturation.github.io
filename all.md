---
layout: default
title: Documentation 1-page
---

Retrouvez ici toutes les informations sur l'API de facturation en ligne de [MonAE](https://www.monae.fr) et [MaTPE](https://www.matpe.com). Notre service permet de facturer simplement et efficacement vos clients, que ce soit via l'extranet [Facturation.pro](https://www.facturation.pro), ou via vos propres services en vous appuyant sur notre API.


### Introduction

Une API (i.e. Application Programming Interface) est un ensemble normalisé de classes et de méthodes permettant, via n'importe quel langage de programmation, d'interagir avec un service web tel que le notre. Nous mettons à votre disposition une API de type "[REST](http://fr.wikipedia.org/wiki/Representational_state_transfer)", qui vous permet de manipuler les données de votre compte afin d'intégrer dans votre propre application ou site web des modules complémentaires spécifiques s'appuyant sur les données de votre compte. Vous pouvez ainsi utiliser notre API pour par exemple générer des statistiques spécifiques, automatiser votre facturation (en particulier lors de la facturation d'abonnement ou d'objet via un site d'ecommerce), exporter vos données dans un format spécifique non proposé par notre outil web, et plus généralement créer de nouvelles fonctionnalités propres à vos besoins spécifiques.
L'utilisation de notre API nécessite des compétences en développement web. Si vous n'avez pas de telles compétences, vous devrez vous adresser à un prestataire informatique (SSII, studio de développement, développeur indépendant, etc.) afin de voir avec lui s'il peut vous développer ce que vous souhaitez.

### API au format JSON
  Notre API utilise le format JSON, sans élément racine (i.e. "root element") et les noms de champs respectent la syntaxe [snake_case](http://fr.wikipedia.org/wiki/Snake_case). Sauf mention contraire, vous devez utiliser l'extension .json à la fin de chaque URL de l'API.

### Identifiez votre application
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

### Authentification

Notre API supporte deux protocoles d'identification:
* via le protocole OAuth2: cette méthode d'authentification est recommandée dès lors que votre application sera utilisée par de multiples utilisateurs.
* via une clé API: cette méthode d'authentification est destinée essentiellement au développement d'applications pour votre propre usage.

#### Authentification via OAuth2

Lorsque vous développez une application destinée à être publique et à être utilisée par vos propres utilisateurs, nous vous encourageons à authentifier vos requêtes API via le protocole [OAuth 2](http://oauth.net/) pour plus de simplicité et de sécurité pour vos clients. Ce protocole évite à vos utilisateurs d'avoir à communiquer leurs identifiants de connexion API manuellement, et propose donc une expérience utilisateur plus fluide lorsque celui ci souhaite autoriser votre application à accéder à ses données.

Pour pouvoir utiliser le protocole OAuth, vous devez obligatoirement disposer d'un compte sur notre service (un compte gratuit est suffisant) et [enregistrer votre application](https://www.facturation.pro/oauth/applications) sur notre service.

#### Authentification par clé API

Lorsque vous développez une application pour votre propre usage interne, vous pouvez utiliser une authentification par clé API, plus rapide à mettre en oeuvre pour un usage personnel. Dans ce cas, chaque requête API doit être authentifiée à l'aide des informations ci-dessous, via le protocole "[HTTP Basic Authentication](http://www.ietf.org/rfc/rfc2617.txt)".<br/>

Vos codes d'accès à l'API sont disponible dans la rubrique ["Clé API"](https://www.facturation.pro/account/api) de votre compte (i.e. en cliquant sur l'avatar en haut à droite de votre espace client). Si vous venez juste de créer un compte sur notre outil, vous devez activer votre compte via le lien reçu avant de pouvoir récupérer vos codes.

A tout moment, vous pouvez générer un nouveau mot de passe API depuis votre compte.

Vous pouvez utiliser un utilitaire tel que curl pour tester l'accès à l'API.
Exemple:
{% api_block %}
  {% curl_cmd %} "{{ site.data.urls['customers']['find']['url'] | api_url }}"
{% endapi_block %}

### Paramètre FIRM_ID

Comme vous allez le constater en parcourant la documentation de l'API, toutes les requêtes sont préfixées par le chemin /firms/FIRM_ID . Le paramètre FIRM_ID correspond à l'identifiant de l'entreprise sur laquelle vous souhaitez travailler.<br/>
Vous pouvez retrouver la liste des identifiants de votre compte dans la rubrique ["Clé API"](https://www.facturation.pro/account/api) de votre compte (i.e. en cliquant sur l'avatar en haut à droite de votre espace client).


### Test de l'API

Afin de tester votre application, nous vous conseillons de [créer une nouvelle entreprise](https://www.facturation.pro/firms/new) et de ne pas passer cette entreprise en production. Vous disposerez alors d'une entreprise sur laquelle vous pourrez faire vos tests librement, sans que cela n'impacte vos données de production. Vous pouvez à tout moment ré-initialiser cette entreprise si vos données dépassent les limites de la version gratuite.

### Lecture des données

L'API propose généralement deux types d'accès en lecture aux données : liste et détail. Les accès de type "détail" retourne un enregistrement unique, alors que les accès de type "liste" retournent un ensemble d'enregistrements.

Toutes les requêtes de consultation sont faites avec la méthode GET. Lorsque une requête de lecture réussi, vous obtenez une réponse au format JSON accompagné du code HTTP "200 OK". Ce type d'url peut être consulté depuis un navigateur.

### Ecriture des données

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


### Champs disponibles

A la fin de chaque rubrique de la documentation de l'API, nous vous indiquons la liste des champs disponibles pour l'objet concerné, avec pour chaque champs le type de donnée qu'il accepte et si ce champs est accessible en écriture ou non.<br/>
Les dates doivent toujours être transmises au format AAAA-MM-DD (AAAA: année, MM: numéro du mois de 01 à 12, DD: numéro du jour de 01 à 31).<br/>
Certains champs n'acceptent que des valeurs pré-définies, et dans ce cas, la liste des valeurs possibles est précisée dans la documentation.


### Pagination

Les requêtes de type liste (liste de clients, de factures, de devis, ...) retournent les X premiers résultats trouvés, ainsi qu'une entête "X-Pagination" contenant un hash JSON avec les informations de pagination suivantes: nombre total d'enregistrements (total_entries), nombre d'enregistrements par page (per_page), page courante (current_page), nombre total de pages (total_pages).

Exemple:

{% api_block %}
HTTP/1.1 200 OK
...
X-Pagination:{"current_page":1,"total_pages":10,"per_page":30,"total_entries":300}
...
{% endapi_block %}

Vous pouvez accéder aux différentes pages d'une liste en utilisant le paramètre "page=N" dans vos requêtes, ou N est le numéro de page souhaité.


### Gestion des erreurs

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


### Limitations du nombre de requêtes

Notre API vous autorise à réaliser :
* 600 requêtes par période de 5 minutes, soit en moyenne deux requêtes par seconde
* 10000 requêtes par jour

Si vous dépassez l'une ou l'autre de ces limitations, vous receverez un code d'erreur 429, avec un message "Retry later" dans le corps de la réponse.

Afin de suivre vos quotas, vous pouvez consulter les champs d'entête suivant:
* X-RateLimit-Limit: nombre total de requêtes autorisées
* X-RateLimit-Remaining: nombre total de requêtes restantes


Ces limites sont suffisantes pour un usage normal de notre API. Si vous atteignez régulièrement ces limites, alors nous vous invitons à optimiser vos scripts, par exemple :
* en mettant en cache (temporaire ou permanent) les données qui ne changent pas pour ne pas avoir besoin de récupérer ces données en permanence en temps réel
* en évitant de parcourir l'ensemble de vos données, mais uniquement en parcourant les données récemment modifiées (via les paramètres de tri)
* en temporisant vos requêtes pour les étaler dans le temps
* en diminuant la fréquence d'exécution de vos scripts
* en vérifiant que vous n'avez pas des scripts inutiles qui tournent en boucle (anciens tests, boucles infinies, tache cron oubliée, etc)


### Compatibilité JSONP

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



# Achats

## Liste des achats

{% assign request = site.data.urls.purchases.find -%}
### {{ request.method }} {{ request.url }}

Liste des achats, par groupe de {{ site.api.per_page }} résultats.

### Optimisation des requêtes

Par défaut, l'API retourne les informations de chaque achat, sauf les fichiers joints, afin d'optimiser les performances de vos requêtes. Pour obtenir la liste des fichiers joints à un achat spécifique, il vous suffit de faire une requête sur l'achat concerné.

Vous avez la possibilité d'inclure la liste des fichiers joints de chaque achat retourné dans la réponse en utilisant le paramètre `with_details`:
* `with_details` :
  - 1 pour inclure la liste des pièces jointes
  - 0 (par défaut) pour ne pas inclure la liste des pièces jointes

### Paramètres optionnels

* `page` : numéro de page
* `api_id` : recherche exacte sur le champ api_id
* `api_custom` : recherche partielle sur le champ api_custom
* `company` : recherche partielle sur le nom du fournisseur
* `title` : recherche partielle par libellé
* `invoice_ref`: recherche partielle sur le numéro de facture
* `payment_ref`: recherche partielle sur la référence de paiement
* `serial_number` : recherche exact sur le numéro de pièce
* `purchase_type` : recherche sur l'état du règlement. Les valeurs possibles sont:
  {% for item in site.data.specific.purchases_type_choices.data -%}
  {% if item[1] and item[1] != '' -%}- {{ item[1] }} : {{ item[0] }}{% endif %}
  {% endfor %}
* `accounting_entry`: recherche sur le code d'imputation (abonnement Entreprise)

#### Recherche par périodes

Vous pouvez limiter votre recherche à une période spécifique en utilisant les paramètres optionnels suivants:
* `period_start` : période de début
* `period_end` : période de fin
* `period_type` : si ce champ est vide, la recherche par période se fait sur les périodes d'encaissement. Pour faire une recherche par périodes de facturation, utiliser la valeur `billed`

Le format des périodes peut être AAAA-MM (année-mois) ou bien AAAA-MM-JJ (année-mois-jour)

#### Tri

Par défaut, les achats sont triés par ordre décroissant de date d'achat.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants
* `sort` :
  - asc: tri croissant
  - desc: tri décroissant
* `order` : type de tri
  - paid: tri par date de paiement
  - total: tri par montant total de l'achat
  - term: tri par date d'échéance
  - created: tri par date de création d'un achat (ie date à laquelle l'enregistrement a été créé)
  - updated: tri par date de dernière modification d'un achat (ie date à laquelle l'enregistrement a été modifié pour la dernière fois)


### Requête

{% api_block %}
  {% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
  [{
  "api_custom": null,
  "api_id": null,
  "category_id": 4852,
  "id": 125459,
  "supplier_id": 49087,
  "invoiced_on": "2013-07-28",
  "notes": "",
  "paid_on": "2013-07-28",
  "payment_mode": 20,
  "payment_ref": null,
  "prepaid": false,
  "ref": null,
  "term_on": null,
  "title": "H\u00e9bergement Cloud juin 2013",
  "total_with_vat": "231.4",
  "vat_amount": "37.92"
  }, {
  "api_custom": null,
  "api_id": null,
  "category_id": 4860,
  "id": 125474,
  "supplier_id": 49088,
  "invoiced_on": "2013-07-28",
  "notes": "",
  "paid_on": "2013-07-28",
  "payment_mode": 2,
  "payment_ref": null,
  "prepaid": false,
  "ref": null,
  "term_on": null,
  "title": "Domiciliation janvier 2013",
  "total_with_vat": "73.39",
  "vat_amount": "12.03"
  }]
{% endapi_block %}

## Créer un achat

{% assign request = site.data.urls.purchases.create -%}
### {{ request.method }} {{ request.url }}

Création d'un nouvel achat. On obtient en retour le code JSON de l'enregistrement créé, avec l'ID qui lui a été attribué

### Requête

{% api_block %}
{% curl_cmd write: true-%}
-X POST -d '{"supplier_id": 1, "invoiced_on": "2013-06-28","title": "Restaurant","total_with_vat": "100","vat_amount": "16,39"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 201 Created
Location: /firms/FIRM_ID/purchases/ID.json

{
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "id": 125858,
  "invoiced_on": "2013-06-28",
  "notes": null,
  "paid_on": null,
  "payment_mode": 0,
  "payment_ref": null,
  "prepaid": false,
  "ref": null,
  "supplier_id": 1,
  "term_on": null,
  "title": "Restaurant",
  "total_with_vat": "100.0",
  "vat_amount": "16.39"
}
{% endapi_block %}

## Détails d'un achat

{% assign request = site.data.urls.purchases.show -%}
### {{ request.method }} {{ request.url }}

Obtenir le détail de l'achat n° ID

### Requête

{% api_block %}
  {% curl_cmd -%}
  "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
{
  "api_custom": null,
  "api_id": null,
  "category_id": 4852,
  "id": 125459,
  "supplier_id": 1,
  "invoiced_on": "2013-07-28",
  "notes": "",
  "paid_on": "2013-07-28",
  "payment_mode": 20,
  "payment_ref": null,
  "prepaid": false,
  "ref": null,
  "term_on": null,
  "title": "H\u00e9bergement Cloud juin 2013",
  "total_with_vat": "231.4",
  "vat_amount": "37.92"
}
{% endapi_block %}

## Modifier un achat

{% assign request = site.data.urls.purchases.update -%}
### {{ request.method }} {{ request.url }}

Mise à jour d'un achat existant.

### Requête

{% api_block %}
{% curl_cmd write: true -%}
-X PATCH -d '{"title": "Serveur virtuel"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Supprimer un achat

{% assign request = site.data.urls.purchases.destroy -%}
### {{ request.method }} {{ request.url }}

Supprime l'achat identifié par son ID.

### Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Ajouter une pièce jointe

{% assign request = site.data.urls.purchases.upload -%}
### {{ request.method }} {{ request.url }}

Ajouter une pièce jointe à l'achat ID.<br/>

### Paramètres

* Le fichier doit être transmis sous forme de formulaire multipart (ie `multipart/form-data`), à l'aide de la variable `upload_file`.
* Par défaut, le fichier sera stocké avec le nom qu'il avait sur votre système. Si vous le souhaitez, vous pouvez forcer un autre nom de fichier à l'aide de la variable `filename`

### Requête

Cette requête ajoute le fichier stocké dans "/tmp/test.pdf" du poste local à l'achat possédant l'ID 1, avec le nom "achat_123.pdf"

{% api_block %}
{% curl_cmd -%}
-F "upload_file=@/tmp/test.pdf" \
"{{ request.url }}?filename=achat_123.pdf"
{% endapi_block %}

### Réponse

{% api_block %}
  Status: 201 Created
  Location: /firms/FIRM_ID/assets/1.json

  {
  "id": 1,
  "purchase_id": 1,
  "document_name":"achat_123.pdf",
  "document_size":18884,
  "download_url":"https://www.facturation.pro/firms/FIRM_ID/assets/1/download"
  }
{% endapi_block %}

## Gestion des achats récurrents

Les achats récurrents sont gérés uniquement via l'interface web. Cependant, vous pouvez obtenir des informations sommaires sur la liste des achats récurrents configurés à l'aide des méthodes suivantes:

{% assign request = site.data.urls.purchases.recurring_list -%}
### {{ request.method }} {{ request.url }}

Obtenir la liste des achats récurrents

{% assign request = site.data.urls.purchases.recurring_show -%}
### {{ request.method }} {{ request.url }}

Obtenir des informations sur l'achat récurrent ID

## Liste des champs

{% include fields.md fields=site.data.fields.purchase %}



# Catégories

## Liste des catégories

{% assign request = site.data.urls.categories.find -%}
### {{ request.method }} {{ request.url }}


liste des catégories, par groupe de {{ site.api.per_page }} résultats.

### Paramètres optionnels

* `page` : numéro de page
* `title` : recherche partielle sur le libellé de la catégorie
* `status` : rechercher par type de catégorie (i.e. type d'affectation)

### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
[
  {
  "id": 4866,
  "status": 2,
  "title": "Affranchissement"
  }, {
  "id": 4867,
  "status": 1,
  "title": "Publicite"
  }, {
  "id": 4857,
  "status": 2,
  "title": "Banque"
  }, {
  "id": 4848,
  "status": 1,
  "title": "Conseil"
  }
]
{% endapi_block %}

## Créer une catégorie

{% assign request = site.data.urls.categories.create -%}
### {{ request.method }} {{ request.url }}

Création d'une nouvelle catégorie. On obtient en retour le code JSON de la catégorie créé, avec l'ID qui lui a été attribué.

### Requête

{% api_block %}
{% curl_cmd write: true-%}
-X POST -d '{"title":"Prestation de services","status":"1"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
Status: 201 Created
Location: /firms/FIRM_ID/categories/5010.json

{
  "id": 5010,
  "status": 1,
  "title": "Prestation de services"
}
{% endapi_block %}

## Détails d'une catégorie

{% assign request = site.data.urls.categories.show -%}
### {{ request.method }} {{ request.url }}

Obtenir le détail de la catégorie n° ID.

### Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
{
  "id": 1,
  "status": 2,
  "title": "Affranchissement"
}
{% endapi_block %}

## Modifier une catégorie

{% assign request = site.data.urls.categories.update -%}
### {{ request.method }} {{ request.url }}

Mise à jour d'une catégorie existante.

### Requête

{% api_block %}
{% curl_cmd write: true -%}
-X PATCH -d '{"title":"Outil SEO","status":"2"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Supprimer une catégorie

{% assign request = site.data.urls.categories.destroy -%}
### {{ request.method }} {{ request.url }}

Supprime la catégorie identifiée par son ID. Cette opération ne supprime pas les documents rattachés à cette catégorie.

### Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Liste des champs

{% include fields.md fields=site.data.fields.category %}



# Clients

## Liste des clients

{% assign request = site.data.urls.customers.find -%}
### {{ request.method }} {{ request.url }}

Affiche la liste des clients, par groupe de {{ site.api.per_page }} résultats.

### Paramètres optionnels :

* `page` : numéro de page
* `api_id` : recherche exacte sur le champ api_id
* `api_custom` : recherche partielle sur le champ api_custom
* `company` : recherche partielle sur le nom de société
* `last_name` : recherche partielle sur le nom de famille
* `email` : recherche partielle sur l'email
* `category_id` : recherche sur l'ID d'une catégorie spécifique (utiliser l'ID 0 pour retrouver les clients sans catégorie)
* `with_sepa` : par défaut, les données SEPA ne sont pas exportées. Seule la clé API de l'administrateur de la société permet d'exporter les données SEPA, et vous devez explicitement demander ces informations en utilisant la valeur 1.
* `account_code`: recherche sur une partie du code du compte client (abonnement Entreprise)
* `accounting_entry`: recherche sur le code d'imputation par défaut (abonnement Entreprise)
* `mode` : en l'absence de précision, le système retourne uniquement les clients actifs. Vous pouvez utiliser les valeurs suivantes pour retourner différents groupes de clients:
    - `all` : retourne tous les clients (actifs ou archivés)
    - `company` : retourne uniquement les professionnels actifs
    - `individual` : retourne uniquement les particuliers actifs
    - `archived` : retourne uniquement les clients archivés

#### Tri

Par défaut, les clients sont triés par ordre croissant de nom mnémotechnique.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants
* `sort` :
    - `asc` : tri croissant
    - `desc` : tri décroissant
* `order` : type de tri
    - `last_invoice` : tri par date de dernière facture au client
    - `last_paid` : tri par date de dernier paiement du client
    - `created` : tri par date de création
    - `updated` : tri par date de dernière modification


### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
[{
  "account_code": "411PANDORA",
  "api_custom": null,
  "api_id": null,
  "category_id": 4847,
  "city": "Neuilly-sur-Seine",
  "civility": null,
  "company_name": "pandora",
  "country": "FR",
  "currency": "EUR",
  "default_vat": null,
  "discount": null,
  "email": null,
  "fax": "",
  "first_name": "",
  "id": 180371,
  "individual": false,
  "language": null,
  "last_invoiced_on": "2012-07-28",
  "last_name": "",
  "mobile": "",
  "pay_before": "30fm",
  "penalty": null,
  "phone": "",
  "short_name": "pandora",
  "siret": "53165179200016",
  "street": "171 avenue Charles de Gaulle",
  "validity": null,
  "vat_exemption": null,
  "vat_number": "",
  "website": null,
  "zip_code": "92200"
}, {
  "account_code": "411SPOTIFY",
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "city": "Paris",
  "civility": null,
  "company_name": "spotify",
  "country": "FR",
  "currency": "EUR",
  "default_vat": null,
  "discount": null,
  "email": null,
  "fax": "",
  "first_name": "",
  "id": 180369,
  "individual": false,
  "language": null,
  "last_invoiced_on": "2013-02-28",
  "last_name": "",
  "mobile": "",
  "pay_before": "30",
  "penalty": null,
  "phone": "",
  "short_name": "spotify",
  "siret": null,
  "street": "11 bis rue christophe colomb",
  "validity": null,
  "vat_exemption": null,
  "vat_number": "",
  "website": null,
  "zip_code": "75008"
}]
{% endapi_block %}

## Créer un client

{% assign request = site.data.urls.customers.create -%}
### {{ request.method }} {{ request.url }}

Création d'un nouveau client. On obtient en retour le code JSON du client créé, avec l'ID qui lui a été attribué.

#### Remarque

Par défaut, en l'absence d'indication spécifique, chaque client créé est de type professionnel, et si vous n'avez pas indiqué de nom d'entreprise, celui ci est automatiquement dérivé du prénom et du nom du client. Lorsque vous créez un client particulier, vous devez donc le préciser en affectant la valeur `true` au champ `individual`.

### Requête

{% api_block %}
{% curl_cmd write: true-%}
-X POST -d '{"company_name":"A small company","individual":false}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 201 Created
Location: /firms/FIRM_ID/customers/ID.json

{
  "account_code": "411ASMALLCO",
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "city": null,
  "civility": null,
  "company_name": "A small company",
  "country": null,
  "currency": "EUR",
  "default_vat": null,
  "discount": null,
  "email": null,
  "fax": null,
  "first_name": null,
  "id": ID,
  "individual": false,
  "language": null,
  "last_invoiced_on": null,
  "last_name": null,
  "mobile": null,
  "pay_before": null,
  "penalty": null,
  "phone": null,
  "short_name": "A small company",
  "siret": null,
  "street": null,
  "validity": null,
  "vat_exemption": null,
  "vat_number": null,
  "website": null,
  "zip_code": null
}
{% endapi_block %}

## Détails d'un client

{% assign request = site.data.urls.customers.show -%}
### {{ request.method }} {{ request.url }}

Obtenir le détail du client n° ID

### Paramètres optionnels :

* `with_sepa` : par défaut, les données SEPA ne sont pas retournée par l'API. Seule la clé API de l'administrateur de la société permet d'accéder aux données SEPA, et vous devez explicitement demander ces informations en utilisant la valeur 1. Lorsque vous demandez à accéder aux informations SEPA avec une clé API autre que celle de l'administrateur du compte, le système retourne une erreur de type 403

### Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
{
  "account_code": "411PANDORA",
  "api_custom": null,
  "api_id": null,
  "category_id": 4847,
  "city": "Neuilly-sur-Seine",
  "civility": null,
  "company_name": "pandora",
  "country": "FR",
  "currency": "EUR",
  "default_vat": null,
  "discount": null,
  "email": null,
  "fax": "",
  "first_name": "",
  "id": ID,
  "individual": false,
  "language": null,
  "last_invoiced_on": "2012-07-28",
  "last_name": "",
  "mobile": "",
  "pay_before": "30fm",
  "penalty": null,
  "phone": "",
  "short_name": "pandora",
  "siret": "53165179200016",
  "street": "171 avenue Charles de Gaulle",
  "validity": null,
  "vat_exemption": null,
  "vat_number": "",
  "website": null,
  "zip_code": "92200"
}
{% endapi_block %}

## Modifier un client

{% assign request = site.data.urls.customers.update -%}
### {{ request.method }} {{ request.url }}

Mise à jour d'un client existant.

### Requête

{% api_block %}
{% curl_cmd write: true -%}
-X PATCH -d '{"company_name":"A big company","email":"boss@bigcompany.com"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
  Status: 200 OK
{% endapi_block %}

## Supprimer un client

{% assign request = site.data.urls.customers.destroy -%}
### {{ request.method }} {{ request.url }}

Supprime le client identifié par son ID, ainsi que tous les devis associés à ce client.
<strong>Un client ne peut être supprimé que s'il n'a jamais été facturé.</strong>

### Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Archiver un client

{% assign request = site.data.urls.customers.archive -%}
### {{ request.method }} {{ request.url }}

Archive le client identifié par son ID, ce qui permet de le masquer de la liste des clients.

### Requête

{% api_block %}
{% curl_cmd -%}
-X POST "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Restaurer un client

{% assign request = site.data.urls.customers.unarchive -%}
### {{ request.method }} {{ request.url }}

Restaure le client archivé, identifié par son ID. Ce client peut à nouveau être facturé et redevient visible dans la liste des clients.

### Requête

{% api_block %}
{% curl_cmd -%}
-X POST "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Ajouter un fichier

{% assign request = site.data.urls.customers.upload -%}
### {{ request.method }} {{ request.url }}

Ajouter un fichier à la fiche client ID.<br/>

### Paramètres

* Le fichier doit être transmis sous forme de formulaire multipart (ie `multipart/form-data`), à l'aide de la variable `upload_file`.
* Par défaut, le fichier sera stocké avec le nom qu'il avait sur votre système. Si vous le souhaitez, vous pouvez forcer un autre nom de fichier à l'aide de la variable `filename`

### Requête

Cette requête ajoute le fichier stocké dans "/tmp/test.pdf" du poste local, avec le nom "contrat_123.pdf"

{% api_block %}
{% curl_cmd -%}
-F "upload_file=@/tmp/test.pdf" \
"{{ request.url }}?filename=contrat_123.pdf"
{% endapi_block %}

### Réponse

{% api_block %}
Status: 201 Created
Location: /firms/FIRM_ID/assets/1.json

{
  "id": 1,
  "customer_id": 1,
  "document_name":"contrat_123.pdf",
  "document_size":18884,
  "download_url":"https://www.facturation.pro/firms/FIRM_ID/assets/1/download"
}
{% endapi_block %}

## Devis d'un client

{% assign request = site.data.urls.customers.quotes -%}
### {{ request.method }} {{ request.url }}

liste des devis du client ID, par groupe de {{ site.api.per_page }}résultats.

### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

Cette fonction est un raccourci vers la liste des devis, liste restreinte aux devis du client ID.
La réponse est donc une redirection vers la requête à exécuter sur la liste des devis.

{% api_block('json') %}
Status: 302 Redirected
Location: /firms/{FIRM_ID}/quotes.json?customer_id=180371
{% endapi_block %}

## Factures d'un client

{% assign request = site.data.urls.customers.invoices -%}
### {{ request.method }} {{ request.url }}

liste des factures du client ID, par groupe de {{ site.api.per_page }} résultats.

### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

Cette fonction est un raccourci vers la liste des factures, liste restreinte aux factures du client ID.
La réponse est donc une redirection vers la requête à exécuter sur la liste des factures.

{% api_block('json') %}
Status: 302 Redirected
Location: /firms/{FIRM_ID}/invoices.json?customer_id=180371
{% endapi_block %}

## Liste des champs

{% include fields.md fields=site.data.fields.customer %}





# Compte

## Compte utilisateur

{% assign request = site.data.urls.account.show -%}
### {{ request.method }} {{ request.url }}

Affiche les informations sur le compte de l'utilisateur.

### Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
{
  "id":1,
  "email": "moi@google.com",
  "firms" : [
  {
  "id":1,
  "name": "Ma petite entreprise"
  },
  {
  "id":2,
  "name": "Ma grosse entreprise"
  }
  ]
}
{% endapi_block %}

## Liste des commandes d'abonnement

{% assign request = site.data.urls.account.orders -%}
### {{ request.method }} {{ request.url }}

Retourne la liste des factures d'abonnements payées pour la société ID.

### Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
[
  {
  "title": "Abonnement Entreprise - 12 mois",
  "amount": 48.00,
  "payment_date": "2021-01-15",
  "invoice_url": "/firms/ID/orders/11111111-4c0e-455d-9801-6aa2a9afcf34.pdf",
  "refunded": false
  },
  {
  "title": "Abonnement Premium - 12 mois",
  "amount": 30.00,
  "payment_date": "2020-01-15",
  "invoice_url": "/firms/ID/orders/11111111-6acb-479e-937f-2889dc4c3f59.pdf",
  "refunded": false
  }
]
{% endapi_block %}



# Devis

## Liste des devis

{% assign request = site.data.urls.quotes.find -%}

### {{ request.method }} {{ request.url }}

Liste des devis, par groupe de {{ site.api.per_page }} résultats.<br/>
Chaque devis est composé d'un ensemble de lignes de facturation (items).

### Optimisation des requêtes

Par défaut, l'API retourne les informations de chaque devis, sauf les lignes de facturation et les fichiers joints, afin d'optimiser les performances de vos requêtes. Pour obtenir les lignes de facturation d'un devis spécifique (ou bien la liste des pièces jointes), il vous suffit de faire une requête sur le devis concerné.

Vous avez la possibilité d'inclure les lignes de facturation et la liste des fichiers joints de chaque devis retourné dans la réponse en utilisant le paramètre suivant :

- `with_details` :
  - 1 pour inclure les lignes de facturation et la liste des pièces jointes
  - 0 (par défaut) pour ne pas inclure les lignes de facturation et la liste des pièces jointes

### Paramètres optionnels

- `page` : numéro de page
- `api_id` : recherche exacte sur le champ api_id
- `api_custom` : recherche partielle sur le champ api_custom
- `quote_ref` : recherche partielle sur le numéro de devis
- `full_quote_ref` : recherche exacte sur le numéro de devis
- `customer_id` : afficher uniquement les devis d'un client spécifique
- `title` : recherche partielle sur le l'objet du devis
- `company` : recherche partielle sur le nom de société
- `last_name` : recherche partielle sur le nom de famille
- `status`: recherche sur un statut de devis. Les valeurs possibles sont:
  {% for item in site.data.specific.quote_statuses_choices.data -%}
  {% if item[1] and item[1] != '' -%}- {{ item[1] }} : {{ item[0] }}{% endif %}
  {% endfor %}
- `category_id` : recherche sur l'ID d'une catégorie spécifique (utiliser l'ID 0 pour retrouver les devis sans catégorie)
- `followup_id` : recherche sur l'ID d'un suivi commercial spécifique
- `accounting_entry` : recherche par code d'imputation (abonnement Entreprise)
- `user_id` : limiter les résultats aux devis gérés par un collaborateur spécifique

#### Recherche par périodes

Vous pouvez limiter votre recherche à une période spécifique en utilisant les paramètres optionnels suivants:

- `period_start` : période de début
- `period_end` : période de fin

Le format des périodes peut être AAAA-MM (année-mois) ou bien AAAA-MM-JJ (année-mois-jour)

#### Tri

Par défaut, les devis sont triés par ordre décroissant de numéro de devis.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants:

- `sort`:
  - asc: tri croissant
  - desc: tri décroissant
- `order` : type de tri
  - customer: tri par nom mnémotechnique de client
  - total: tri par montant total de facturation
  - billed: tri par date de devis
  - created: tri par date de création d'un devis (ie date à laquelle l'enregistrement a été créé)
  - updated: tri par date de dernière modification d'un devis (ie date à laquelle l'enregistrement a été modifié pour la dernière fois)

### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
[
{
"amount_invoiced": "0.0",
"api_custom": null,
"api_id": null,
"category_id": null,
"currency": "EUR",
"customer_id": 180369,
"discount": "0.0",
"draft": false,
"fully_invoiced": false,
"id": 411583,
"ignore_quote": false,
"information": "",
"invoiced_on": "2013-07-29",
"language": "fr",
"pay_before": "30",
"penalty": "0.0",
"precompte": null,
"quote_ref": 2,
"quote_status": 0,
"rebate_percentage": "0.0",
"service_personne": false,
"tax_percent": null,
"tax_title": null,
"term_on": "2013-08-28",
"title": null,
"total": "459.0",
"vat_exemption": null,
"invoice_ids": [],
"items": [{
"id": 949159,
"nature": 9,
"optional": false,
"position": 1,
"product_id": null,
"quantity": "1.0",
"style": null,
"title": "Affichage publicitaire - Appel \u00e0 facture n\u00b03148",
"total": "459.0",
"unit_price": "459.0",
"vat": "0.200"
}]
}, {
"amount_invoiced": "0.0",
"api_custom": null,
"api_id": null,
"category_id": 4867,
"currency": "EUR",
"customer_id": 180366,
"discount": "0.0",
"draft": false,
"fully_invoiced": false,
"id": 411582,
"ignore_quote": false,
"information": "",
"invoiced_on": "2013-07-29",
"language": "fr",
"pay_before": "60fm",
"penalty": "0.0",
"precompte": null,
"quote_ref": 1,
"quote_status": 0,
"rebate_percentage": "0.0",
"service_personne": false,
"tax_percent": null,
"tax_title": null,
"term_on": "2013-08-28",
"title": null,
"total": "1458.27",
"vat_exemption": null,
"invoice_ids": [],
"items": [{
"id": 949158,
"nature": 9,
"optional": false,
"position": 1,
"product_id": 0,
"quantity": "1.0",
"style": null,
"title": "Affichage de publicit\u00e9 d\u00e9cembre 2012",
"total": "1458.27",
"unit_price": "1458.27",
"vat": "0.200"
}]
}
]
{% endapi_block %}

## Créer un devis

{% assign request = site.data.urls.quotes.create -%}
### {{ request.method }} {{ request.url }}

Création d'un nouveau devis. On obtient en retour le code JSON de l'enregistrement créé, avec l'ID qui lui a été attribué.<br/>
Un devis doit contenir au moins une ligne de facturation (champs `items`)<br/>
Le total de chaque ligne de facturation ainsi que le total du devis sont calculés automatiquement et ne doivent pas être transmis.

### Requête

{% api_block %}
{% curl_cmd write: true-%}
-X POST -d '{
"currency": "EUR",
"customer_id": 1,
"invoiced_on": "2013-07-29",
"language": "fr",
"pay_before": "60fm",
"penalty": "0.0",
"title": "Facturation mensuelle",
"items": [{
"position": 1,
"quantity": "1.0",
"title": "Affichage pub 1",
"unit_price": "500",
"vat": "0.200"
}, {
"position": 2,
"quantity": "1.0",
"title": "Affichage pub 2",
"unit_price": "200",
"vat": "0.200"
}]
}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 201 Created
Location: /firms/FIRM_ID/quotes/411585.json

{
  "amount_invoiced": "0.0",
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "currency": "EUR",
  "customer_id": 1,
  "discount": null,
  "draft": false,
  "fully_invoiced": false,
  "id": 411585,
  "ignore_quote": false,
  "information": null,
  "invoiced_on": "2013-07-29",
  "language": "fr",
  "pay_before": "60fm",
  "penalty": "0.0",
  "precompte": null,
  "quote_ref": 4,
  "quote_status": 0,
  "rebate_percentage": "0.0",
  "service_personne": false,
  "tax_percent": null,
  "tax_title": null,
  "term_on": "2013-08-28",
  "title": "Facturation mensuelle",
  "total": "700.0",
  "vat_exemption": null,
  "items": [
    {
    "id": 949162,
    "nature": 9,
    "optional": false,
    "position": 1,
    "product_id": null,
    "quantity": "1.0",
    "style": null,
    "title": "Affichage pub 1",
    "total": "500.0",
    "unit_price": "500.0",
    "vat": "0.200"
    }, {
    "id": 949163,
    "nature": 9,
    "optional": false,
    "position": 2,
    "product_id": null,
    "quantity": "1.0",
    "style": null,
    "title": "Affichage pub 2",
    "total": "200.0",
    "unit_price": "200.0",
    "vat": "0.200"
    }
  ]
}
{% endapi_block %}

## Détails d'un devis

{% assign request = site.data.urls.quotes.show -%}
### {{ request.method }} {{ request.url }}

Obtenir le détail du devis n° ID<br/>
Chaque devis est composé d'une ou plusieurs lignes de facturation (`items`)

### Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
{
  "amount_invoiced": "0.0",
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "currency": "EUR",
  "customer_id": 1,
  "discount": "0.0",
  "draft": false,
  "fully_invoiced": false,
  "id": 1,
  "ignore_quote": false,
  "information": "",
  "invoiced_on": "2013-07-29",
  "language": "fr",
  "pay_before": "30",
  "penalty": "0.0",
  "precompte": null,
  "quote_ref": 2,
  "quote_status": 0,
  "rebate_percentage": "0.0",
  "service_personne": false,
  "tax_percent": null,
  "tax_title": null,
  "term_on": "2013-08-28",
  "title": null,
  "total": "459.0",
  "vat_exemption": null,
  "invoice_ids": [],
  "items": [{
  "id": 949159,
  "nature": 9,
  "optional": false,
  "position": 1,
  "product_id": null,
  "quantity": "1.0",
  "style": null,
  "title": "Affichage publicitaire - Appel \u00e0 facture n\u00b03148",
  "total": "459.0",
  "unit_price": "459.0",
  "vat": "0.200"
  }]
}
{% endapi_block %}

## Modifier un devis

{% assign request = site.data.urls.quotes.update -%}
### {{ request.method }} {{ request.url }}

Mise à jour d'un devis existant.

Un devis doit toujours contenir au moins une ligne de facturation:
* Pour ajouter une ligne de facturation, l'id de l'item doit être vide.
* Pour modifier une ligne de facturation, l'id de l'item doit être spécifié.
* Pour supprimer une ligne de facturation, il suffit de passer l'id et un champ `_destroy` avec la valeur "1"

### Requête

{% api_block %}
{% curl_cmd write: true -%}
-X PATCH -d '{
"id": "ID",
"api_custom": null,
"api_id": null,
"customer_id": 1,
"title": "Creation internet",
"quote_status": "1",
"discount": "0.0",
"information": "TEST",
"pay_before": "30",
"penalty": "3.0",
"items": [{
"position": "1",
"product_id": "10",
"quantity": "1.0",
"title": "Campagne pub",
"unit_price": "300.0",
"nature": "2"
}, {
"id": "889",
"_destroy": "1"
}]
}'
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
Status: 200 OK
{% endapi_block %}

## Supprimer un devis

{% assign request = site.data.urls.quotes.destroy -%}
### {{ request.method }} {{ request.url }}

Supprime le devis identifié par son ID.

### Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Télécharger un devis

{% assign request = site.data.urls.quotes.download -%}
### {{ request.method }} {{ request.url }}

Télécharger le devis n° ID au format PDF.

### Requête

{% api_block %}
{% curl_cmd -%}
 -o devis.pdf "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

Vous obtenez le fichier PDF du devis demandé.

## Télécharger une facture pro-forma

{% assign request = site.data.urls.quotes.download -%}
### {{ request.method }} {{ request.url }}?proforma=1

Une facture proforma n'est rien d'autre qu'un devis pour lequel vous vous engagez à appliquer les prix indiqués dans ce devis. Cette methode vous permet donc de télécharger le devis n° ID sous forme de facture PDF proforma .

### Requête

{% api_block %}
{% curl_cmd -%}
 -o proforma.pdf "{{ request.url | api_url }}?proforma=1"
{% endapi_block %}

### Réponse

Vous obtenez le fichier PDF de la facture proforma demandée.

## Convertir un devis en facture

{% assign request = site.data.urls.quotes.invoice -%}
### {{ request.method }} {{ request.url }}

Conversion du devis ID en facture.

### Requête

{% api_block %}
{% curl_cmd -%}
 -X POST "{{ request.url | api_url }}"
{% endapi_block %}

#### Réponse

{% api_block('json') %}
Status: 201 Created
Location: /firms/FIRM_ID/invoices/INVOICE_ID.json

{
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "currency": "EUR",
  "customer_id": 1,
  "external_ref": null,
  "discount": null,
  "draft": false,
  "id": 411584,
  "information": null,
  "invoice_ref": "201307-4",
  "invoiced_on": "2013-07-29",
  "language": "fr",
  "paid_on": null,
  "pay_before": "60fm",
  "payment_mode": 0,
  "payment_ref": null,
  "penalty": "0.0",
  "precompte": null,
  "quote_id": null,
  "rebate_percentage": "0.0",
  "service_personne": false,
  "tax_percent": null,
  "tax_title": null,
  "term_on": "2013-09-30",
  "title": "Facturation mensuelle",
  "total": "700.0",
  "vat_exemption": null,
  "items": [{
  "id": 949167,
  "nature": 9,
  "optional": false,
  "position": 1,
  "product_id": null,
  "quantity": "1.0",
  "style": null,
  "title": "Affichage pub 1",
  "total": "500.0",
  "unit_price": "500.0",
  "vat": "0.200"
  }, {
  "id": 949168,
  "nature": 9,
  "optional": false,
  "position": 2,
  "product_id": null,
  "quantity": "1.0",
  "style": null,
  "title": "Affichage pub 2",
  "total": "200.0",
  "unit_price": "200.0",
  "vat": "0.200"
  }]
}
{% endapi_block %}

## Envoyer un devis par courriel

{% assign request = site.data.urls.quotes.email -%}
### {{ request.method }} {{ request.url }}

Permet d'envoyer un devis par courriel.

* Si vous avez définit un modèle d'envoi, ce modèle est utilisé pour générer le mail. Vous pouvez modifier le contenu du mail en précisant son titre et son message.
* Le champ `to` est automatiquement rempli avec l'adresse email enregistrée dans la fiche du client si vous ne précisez rien.
* Les champs `cc` et `bcc` sont automatiquement remplis avec les adresses que vous avez renseignées dans la page Paramètres / Email de votre compte si vous ne précisez rien.

#### Remarques

Cette fonctionnalité n'est accessible que si vous avez configuré votre propre serveur SMTP dans l'onglet "Paramètres" / "Email" de votre entreprise.

### Requête

{% api_block %}
{% curl_cmd write: true -%}
-d '{
"to": "machin@test.com",
"cc": "bidule@test.com",
"bcc": "boss@test.com",
"subject": "Votre devis",
"message": "Comme convenu, veuillez trouver ci-joint le devis pour nos travaux."
}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
Status: 201 Created
{% endapi_block %}

## Ajouter une fichier

{% assign request = site.data.urls.quotes.upload -%}
### {{ request.method }} {{ request.url }}

Ajoute une pièce jointe au devis ID.

### Paramètres

* Le fichier doit être transmis sous forme de formulaire multipart (ie "multipart/form-data"), à l'aide de la variable `upload_file`.
* Par défaut, le fichier sera stocké avec le nom qu'il avait sur votre système. Si vous le souhaitez, vous pouvez forcer un autre nom de fichier à l'aide de la variable `filename`
* Si vous souhaitez rendre visible ce fichier au client, il suffit de l'indiquer en affectant la valeur 1 la variable `visible`

### Requête

Cette requête ajoute le fichier stocké dans "/tmp/test.pdf" du poste local au devis possédant l'ID 1, en le renommant en "justificatif.pdf" et en le rendant visible par le client

{% api_block %}
{% curl_cmd -%}
-F "upload_file=@/tmp/test.pdf" \
"{{ request.url }}?filename=justificatif.pdf&visible=1"
{% endapi_block %}

### Réponse

{% api_block %}
Status: 201 Created
Location: /firms/FIRM_ID/assets/1.json

{
  "id": 1,
  "quote_id": 1,
  "document_name":"justificatif.pdf",
  "document_size":18884,
  "download_url":"https://www.facturation.pro/firms/FIRM_ID/assets/1/download",
  "visible": true
}
{% endapi_block %}

## Liste des champs

{% include fields.md fields=site.data.fields.quote %}


### Ligne de facturation

Les lignes de facturations sont transmises sous forme d'un tableau de lignes, dans le champ ```items``` du devis.

{% include fields.md fields=site.data.fields.item %}



# Factures

## Liste des factures

{% assign request = site.data.urls.invoices.find -%}

### {{ request.method }} {{ request.url }}

Liste des factures, par groupe de {{ site.api.per_page }} résultats.<br/>
Chaque facture est composée d'un ensemble de lignes de facturation (items).

### Optimisation des requêtes

Par défaut, l'API retourne les informations de chaque facture, sauf les lignes de facturation et les fichiers joints, afin d'optimiser les performances de vos requêtes. Pour obtenir les lignes de facturation d'une facture spécifique (ou bien la liste des pièces jointes), il vous suffit de faire une requête sur la facture concernée.

Vous avez la possibilité d'inclure plus ou moins d'informations avec chaque facture retournée dans la réponse en utilisant les paramètres suivants :

- `with_details` :
  - 1 pour inclure les lignes de facturation et la liste des pièces jointes
  - 0 (par défaut) pour ne pas inclure les lignes de facturation et la liste des pièces jointes
- `with_settlements` :
  - 1 pour inclure la liste des règlements partiels enregistrés pour chaque facture
  - 0 (par défaut) pour ne pas inclure la liste des règlements partiels

### Paramètres optionnels

- `page` : numéro de page
- `api_id` : recherche exacte sur le champ api_id
- `api_custom` : recherche partielle sur le champ api_custom
- `invoice_ref` : recherche partielle sur le numéro de facture
- `full_invoice_ref` : recherche exacte sur le numéro de facture (incluant son eventuel prefixe)
- `payment_ref` : recherche partielle sur la référence du paiement
- `title` : recherche partielle sur le l'objet de la facture
- `customer_id` : afficher uniquement les factures d'un client spécifique
- `company` : recherche partielle sur le nom de société
- `last_name` : recherche partielle sur le nom de famille
- `bill_type`: recherche sur un type de facture spécifique. Les valeurs possibles sont :
  {% for item in site.data.specific.bills_type_choices.data -%}
  {% if item[1] and item[1] != '' -%}- {{ item[1] }} : {{ item[0] }}{% endif %}
  {% endfor %}
- `category_id`: recherche sur l'ID d'une catégorie spécifique (utiliser l'ID 0 pour retrouver les factures sans catégorie)
- `followup_id`: recherche sur l'ID d'un suivi commercial spécifique
- `accounting_entry`: recherche par code d'imputation (abonnement Entreprise)
- `user_id` : limiter les résultats aux factures gérées par un collaborateur spécifique

#### Recherche par périodes

Vous pouvez limiter votre recherche à une période spécifique en utilisant les paramètres optionnels suivants:

- `period_start` : période de début
- `period_end` : période de fin
- `period_type` : si ce champ est vide, la recherche par période se fait sur les périodes d'encaissement. Pour faire une recherche par périodes de facturation, utiliser la valeur "billed" (sans guillemets)

Le format des périodes peut être AAAA-MM (année-mois) ou bien AAAA-MM-JJ (année-mois-jour)

#### Tri

Par défaut, les factures sont triées par ordre décroissant de numéro de facture.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants

- `sort` :
  - asc: tri croissant
  - desc: tri décroissant
- `order` : type de tri
  - customer: tri par nom mnémotechnique de client
  - paid: tri par date de paiement
  - total: tri par montant total de facturation
  - billed: tri par date de facturation
  - term: tri par date d'échéance
  - created: tri par date de création d'une facture (ie date à laquelle l'enregistrement a été créé)
  - updated: tri par date de dernière modification d'une facture (ie date à laquelle l'enregistrement a été modifié pour la dernière fois)

### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
[
{
"api_custom": null,
"api_id": null,
"category_id": null,
"currency": "EUR",
"customer_id": 180366,
"customer_name": "Big Corp",
"external_ref": null,
"discount": null,
"draft": false,
"id": 411588,
"information": null,
"invoice_ref": "201307-4",
"invoiced_on": "2013-07-29",
"language": "fr",
"paid_on": null,
"pay_before": "60fm",
"payment_mode": 0,
"payment_ref": null,
"penalty": "0.0",
"precompte": null,
"quote_id": null,
"rebate_percentage": "0.0",
"service_personne": false,
"tax_percent": null,
"tax_title": null,
"term_on": "2013-09-30",
"title": "Facturation mensuelle",
"total": "700.0",
"vat_exemption": null,
"items": [{
"id": 949167,
"nature": 9,
"optional": false,
"position": 1,
"product_id": null,
"quantity": "1.0",
"style": null,
"title": "Affichage pub 1",
"total": "500.0",
"unit_price": "500.0",
"vat": "0.200"
}, {
"id": 949168,
"nature": 9,
"optional": false,
"position": 2,
"product_id": null,
"quantity": "1.0",
"style": null,
"title": "Affichage pub 2",
"total": "200.0",
"unit_price": "200.0",
"vat": "0.200"
}]
}, {
"api_custom": null,
"api_id": null,
"category_id": null,
"currency": "EUR",
"customer_id": 180366,
"customer_name": "Big Corp",
"external_ref": null,
"discount": null,
"draft": false,
"id": 411587,
"information": null,
"invoice_ref": "201307-3",
"invoiced_on": "2013-07-29",
"language": "fr",
"paid_on": null,
"pay_before": "60fm",
"payment_mode": 0,
"payment_ref": null,
"penalty": "0.0",
"precompte": null,
"quote_id": null,
"rebate_percentage": "0.0",
"service_personne": false,
"tax_percent": null,
"tax_title": null,
"term_on": "2013-09-30",
"title": "Facturation mensuelle",
"total": "700.0",
"paid_in_main_currency": null,
"vat_exemption": null,
"items": [{
"id": 949165,
"nature": 9,
"optional": false,
"position": 1,
"product_id": null,
"quantity": "1.0",
"style": null,
"title": "Affichage pub 1",
"total": "500.0",
"unit_price": "500.0",
"vat": "0.200"
}, {
"id": 949166,
"nature": 9,
"optional": false,
"position": 2,
"product_id": null,
"quantity": "1.0",
"style": null,
"title": "Affichage pub 2",
"total": "200.0",
"unit_price": "200.0",
"vat": "0.200"
}]
}
]
{% endapi_block %}

## Créer une facture

{% assign request = site.data.urls.invoices.create -%}
### {{ request.method }} {{ request.url }}

Création d'une nouvelle facture. On obtient en retour le code JSON de l'enregistrement créé, avec l'ID qui lui a été attribué.<br/>
Une facture doit au moins contenir une ligne de facturation (champs items)<br/>
Le total de chaque ligne de facturation ainsi que le total de la facture sont calculés automatiquement et ne doivent pas être transmis.

#### Remarques

* Si vous souhaitez créer une facture en mode brouillon, ajoutez le paramètre `type_doc=draft` à l'url.
* Si vous souhaitez **importer une facture externe** (i.e. enregistrer dans votre compte une **facture créée dans un autre outil**, pour en tenir compte dans les statistiques et les exports de votre entreprise), ajoutez le paramètre `external=1` à l'url. Dans ce cas, vous devez obligatoirement préciser le numéro de la facture d'origine dans le champs "external_ref".

### Requête

{% api_block %}
{% curl_cmd write: true-%}
-X POST -d '{
"currency": "EUR",
"customer_id": 1,
"invoiced_on": "2013-07-29",
"language": "fr",
"pay_before": "60fm",
"penalty": "0.0",
"title": "Facturation mensuelle",
"items": [{
"position": 1,
"quantity": "1.0",
"title": "Affichage pub 1",
"unit_price": "500",
"vat": "0.200"
}, {
"position": 2,
"quantity": "1.0",
"title": "Affichage pub 2",
"unit_price": "200",
"vat": "0.200"
}]
}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 201 Created
Location: /firms/FIRM_ID/invoices/1.json

{
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "currency": "EUR",
  "customer_id": 180366,
  "external_ref": null,
  "discount": null,
  "draft": false,
  "id": 411588,
  "information": null,
  "invoice_ref": "201307-4",
  "invoiced_on": "2013-07-29",
  "language": "fr",
  "paid_on": null,
  "pay_before": "60fm",
  "payment_mode": 0,
  "payment_ref": null,
  "penalty": "0.0",
  "precompte": null,
  "quote_id": null,
  "rebate_percentage": "0.0",
  "service_personne": false,
  "tax_percent": null,
  "tax_title": null,
  "term_on": "2013-09-30",
  "title": "Facturation mensuelle",
  "total": "700.0",
  "vat_exemption": null,
  "items": [{
  "id": 949167,
  "nature": 9,
  "optional": false,
  "position": 1,
  "product_id": null,
  "quantity": "1.0",
  "style": null,
  "title": "Affichage pub 1",
  "total": "500.0",
  "unit_price": "500.0",
  "vat": "0.200"
  }, {
  "id": 949168,
  "nature": 9,
  "optional": false,
  "position": 2,
  "product_id": null,
  "quantity": "1.0",
  "style": null,
  "title": "Affichage pub 2",
  "total": "200.0",
  "unit_price": "200.0",
  "vat": "0.200"
  }]
}
{% endapi_block %}

## Détails d'une facture

{% assign request = site.data.urls.invoices.show -%}
### {{ request.method }} {{ request.url }}

Obtenir le détail de la facture n° ID<br/>
Chaque facture est composée d'une ou plusieurs lignes de facturation (items)

### Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
{
  "api_custom": null,
  "api_id": null,
  "category_id": null,
  "currency": "EUR",
  "customer_id": 1,
  "external_ref": null,
  "discount": null,
  "draft": false,
  "id": 1,
  "information": null,
  "invoice_ref": "201307-4",
  "invoiced_on": "2013-07-29",
  "language": "fr",
  "paid_on": null,
  "pay_before": "60fm",
  "payment_mode": 0,
  "payment_ref": null,
  "penalty": "0.0",
  "precompte": null,
  "quote_id": null,
  "rebate_percentage": "0.0",
  "service_personne": false,
  "tax_percent": null,
  "tax_title": null,
  "term_on": "2013-09-30",
  "title": "Facturation mensuelle",
  "total": "700.0",
  "paid_in_main_currency": null,
  "vat_exemption": null,
  "items": [{
  "id": 949167,
  "nature": 9,
  "optional": false,
  "position": 1,
  "product_id": null,
  "quantity": "1.0",
  "style": null,
  "title": "Affichage pub 1",
  "total": "500.0",
  "unit_price": "500.0",
  "vat": "0.200"
  }, {
  "id": 949168,
  "nature": 9,
  "optional": false,
  "position": 2,
  "product_id": null,
  "quantity": "1.0",
  "style": null,
  "title": "Affichage pub 2",
  "total": "200.0",
  "unit_price": "200.0",
  "vat": "0.200"
  }]
}
{% endapi_block -%}

## Modifier une facture

{% assign request = site.data.urls.invoices.update -%}
### {{ request.method }} {{ request.url }}

Mise à jour d'une facture. Lorsque la facture est un brouillon, l'ensemble des données est modifiable, par contre, une fois la facture finalisée, tout ce qui influe sur le montant de la facturation ne peut plus être modifié. Pour annuler une facture, vous devez faire un avoir.

La mise à jour d'une facture sert essentiellement à enregistrer le règlement de la facture lorsque le règlement est différé, ou bien à mettre à jour le champ d'informations et les conditions de règlement.

### Paramètres

* `type_doc` : par défaut une facture reste dans son état (brouillon ou finalisée) lors de sa mise à jour. Si vous souhaitez changer le status d'une facture brouillon, utilisez la valeur `final` pour finaliser la facture, ou bien `draft` pour rester en mode brouillon. Une facture finalisée ne peut pas changer de status.

#### Remarques

Pour enregistrer différents modes de règlement sur une facture, utilisez le mécanisme des [règlements multiples](/api/reglements). Veuillez noter que le système de règlement multiple est uniquement prévu pour enregistrer les différents modes de règlement d'une facture, il ne s'agit pas d'un système de gestion des paiements en plusieurs fois. Pour un paiement en plusieurs fois, les méthodes légales sont de facturer vos prestations sous forme de X factures d'acompte et d'une facture de solde, ou bien de passer par un organisme de crédit pour mettre en place des solutions de crédit gratuit ou payant pour vos clients.

### Requête

Dans l'exemple ci dessous, on enregistre le règlement de la facture par Paypal le 6 juin 2020

{% api_block %}
{% curl_cmd write: true -%}
-X PATCH -d '{"paid_on":"2020-04-06","payment_mode":1}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
Status: 200 OK
{% endapi_block %}

## Supprimer une facture

{% assign request = site.data.urls.invoices.destroy -%}
### {{ request.method }} {{ request.url }}

Supprime la facture identifiée par son ID à condition que cette facture soit un brouillon.
Si la facture a été finalisée, elle ne sera pas supprimée et vous recevrez un message d'erreur.

### Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Télécharger une facture

{% assign request = site.data.urls.invoices.download -%}
### {{ request.method }} {{ request.url }}

Télécharger la facture n° ID au format PDF

#### Remarques

Lorsqu'une facture est réglée, le système vous retourne par défaut la facture acquittée. Si vous souhaitez obtenir la facture originale (sans les informations de règlement), ajoutez le paramètre `original=1` à l'url.

### Requête

{% api_block %}
{% curl_cmd -%}
 -o facture.pdf "{{ request.url | api_url }}?original=1"
{% endapi_block %}

### Réponse

Vous obtenez le fichier PDF de la facture demandée

## Avoir sur une facture

{% assign request = site.data.urls.invoices.refund -%}
### {{ request.method }} {{ request.url }}

Effectue un avoir de la facture n° ID

### Paramètres optionnels

* `api_id` : mémorisation d'un ID spécifique pour l'avoir
* `api_custom` : mémorisation d'une information libre pour l'avoir

### Requête


{% api_block %}
{% curl_cmd write: true -%}
-X POST "{{ request.url | api_url }}?api_id=32&api_custom=remboursement+suite+plainte+client"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
{
  "api_custom": 'remboursement suite plainte client',
  "api_id": 32,
  "category_id": null,
  "currency": "EUR",
  "customer_id": 180366,
  "external_ref": null,
  "discount": "0.0",
  "draft": false,
  "id": 411589,
  "information": null,
  "invoice_ref": "201307-5",
  "invoiced_on": "2013-07-29",
  "language": "fr",
  "paid_on": "2013-07-29",
  "pay_before": "60fm",
  "payment_mode": 99,
  "payment_ref": null,
  "penalty": "0.0",
  "precompte": null,
  "quote_id": null,
  "rebate_percentage": "0.0",
  "service_personne": false,
  "tax_percent": null,
  "tax_title": null,
  "term_on": "2013-09-30",
  "title": "Facturation mensuelle",
  "total": "-700.0",
  "paid_in_main_currency": "-837.2",
  "vat_exemption": null
}
{% endapi_block %}

## Envoyer une facture par courriel

{% assign request = site.data.urls.invoices.email -%}
### {{ request.method }} {{ request.url }}

Permet d'envoyer une facture finalisée par courriel.

* Si vous avez définit un modèle d'envoi, ce modèle est utilisé pour générer le mail. Le système utilise le modèle "Factures" pour les factures non payées et non échues, le modèle "Relance" pour les factures non payées et échues, et enfin le modèle "Confirmation de règlement" pour les factures réglées.<br/>Vous pouvez modifier le contenu du mail en précisant son titre et son message.
* Le champ `to` est automatiquement rempli avec l'adresse email enregistrée dans la fiche du client si vous ne précisez rien.
* Les champs `cc` et `bcc` sont automatiquement remplis avec les adresses que vous avez renseignées dans la page Paramètres / Email de votre compte si vous ne précisez rien.


#### Remarques

* Cette fonctionnalité n'est accessible que si vous avez configuré votre propre serveur SMTP dans l'onglet "Paramètres" / "Email" de votre entreprise.
* Seules les factures finalisées peuvent être envoyée par courriel: les brouillons ou les factures externes ne peuvent pas être transmise par courriel.

### Requête

{% api_block %}
{% curl_cmd write: true -%}
-d '{
"to": "machin@test.com",
"cc": "bidule@test.com",
"bcc": "boss@test.com",
"subject": "Votre facture",
"message": "Veuillez trouver ci-joint la facture pour nos travaux."
}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
Status: 201 Created
{% endapi_block %}

## Règlements partiels

La liste des règlements partiels enregistrés pour une facture est retournée dans le détail d'une facture, dans la clé `settlements`.
Si vous souhaitez ajouter ou supprimer des règlements partiels, vous pouvez consulter la [documentation disponible ici](/api/reglements/).

## Gestion des factures récurrentes

Les factures récurrentes sont gérées uniquement via l'interface web. Cependant, vous pouvez obtenir des informations sommaires sur la liste des factures récurrentes configurées à l'aide des méthodes suivantes :

{% assign request = site.data.urls.invoices.recurring_list -%}
### {{ request.method }} {{ request.url }}

Obtenir la liste des factures récurrentes

{% assign request = site.data.urls.invoices.recurring_show -%}
### {{ request.method }} {{ request.url }}

Obtenir des informations sur la facture récurrente ID

## Ajouter un fichier

{% assign request = site.data.urls.invoices.upload -%}
### {{ request.method }} {{ request.url }}

Ajoute une pièce jointe à la facture ID.

### Paramètres

* Le fichier doit être transmis sous forme de formulaire multipart (ie "multipart/form-data"), à l'aide de la variable `upload_file`.
* Par défaut, le fichier sera stocké avec le nom qu'il avait sur votre système. Si vous le souhaitez, vous pouvez forcer un autre nom de fichier à l'aide de la variable `filename`
* Si vous souhaitez rendre visible ce fichier au client, il suffit de l'indiquer en affectant la valeur 1 la variable `visible`

### Requête

Cette requête ajoute le fichier stocké dans "/tmp/test.pdf" du poste local à la facture possédant l'ID 1, en le renommant en "justificatif.pdf" et en le rendant visible par le client

{% api_block %}
{% curl_cmd -%}
-F "upload_file=@/tmp/test.pdf" \
"{{ request.url }}?filename=justificatif.pdf&visible=1"
{% endapi_block %}

### Réponse

{% api_block %}
Status: 201 Created
Location: /firms/FIRM_ID/assets/1.json

{
  "id": 1,
  "invoice_id": 1,
  "document_name":"justificatif.pdf",
  "document_size":18884,
  "download_url":"https://www.facturation.pro/firms/FIRM_ID/assets/1/download",
  "visible": true
}
{% endapi_block %}

## Liste des champs

{% include fields.md fields=site.data.fields.invoice %}

### Ligne de facturation

Les lignes de facturations sont transmises sous forme d'un tableau de lignes, dans le champ ```items``` de la facture

{% include fields.md fields=site.data.fields.item %}



# Fichiers

## Liste des pièces jointes aux devis

{% assign request = site.data.urls.files.quotes -%}
### {{ request.method }} {{ request.url }}

Liste de toutes les pièces jointes aux devis, par groupe de {{ site.api.per_page }} résultats.<br/>

### Paramètres optionnels

* `page` : numéro de page
* `quote_id` : ID du devis, cela permet de récupérer la liste des pièces jointes d'un devis spécifique, sachant que cette liste est aussi renvoyée dans la requête permettant d'obtenir le détail d'un devis.

#### Tri

Par défaut, les pièces jointes sont triées par ordre décroissant de création.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants
* `sort`:
  - asc: tri croissant
  - desc: tri décroissant
* `order` : type de tri
  - title: tri par nom de fichier
  - size: tri par taille de fichier
  - updated: tri par date de mise à jour
  - created: tri par date de création

### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
[
  {
  "id": 1,
  "quote_id": 1,
  "document_name": "contrat prestation.pdf",
  "document_size": 18884,
  "download_url": "https://www.facturation.pro/firms/FIRM_ID/assets/1/download",
  "title": "Devis n°1"
  },
  {
  "id": 2,
  "quote_id": 2,
  "document_name": "contrat vente.pdf",
  "document_size": 33442,
  "download_url": "https://www.facturation.pro/firms/FIRM_ID/assets/2/download",
  "title": "Devis n°2"
  }
]
{% endapi_block %}

## Liste des pièces jointes aux factures

{% assign request = site.data.urls.files.invoices -%}
### {{ request.method }} {{ request.url }}

Liste de toutes les pièces jointes aux factures, par groupe de {{ site.api.per_page }} résultats.

### Paramètres optionnels

* `page` : numéro de page
* `invoice_id` : ID de de la facture, cela permet de récupérer la liste des pièces jointes d'une facture spécifique, sachant que cette liste est aussi renvoyée dans la requête permettant d'obtenir le détail d'une facture.

#### Tri

Par défaut, les pièces jointes sont triées par ordre décroissant de création.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants
* `sort`:
  - asc: tri croissant
  - desc: tri décroissant
* `order` : type de tri
  - title: tri par nom de fichier
  - size: tri par taille de fichier
  - updated: tri par date de mise à jour
  - created: tri par date de création

### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
[
  {
  "id": 1,
  "invoice_id": 1,
  "document_name": "contrat prestation.pdf",
  "document_size": 18884,
  "download_url": "https://www.facturation.pro/firms/FIRM_ID/assets/1/download",
  "title": "Facture n°1"
  },
  {
  "id": 2,
  "invoice_id": 2,
  "document_name": "contrat vente.pdf",
  "document_size": 33442,
  "download_url": "https://www.facturation.pro/firms/FIRM_ID/assets/2/download",
  "title": "Facture n°2"
  }
]
{% endapi_block %}

## Liste des fichiers clients

{% assign request = site.data.urls.files.customers -%}
### {{ request.method }} {{ request.url }}

Liste de toutes les pièces jointes aux fiches clients, par groupe de {{ site.api.per_page }} résultats.<br/>

#### Paramètres optionnels

* `page` : numéro de page
* `customer_id` : ID du client, cela permet de récupérer la liste des pièces jointes d'un client spécifique

#### Tri

Par défaut, les pièces jointes sont triées par ordre décroissant de création.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants
* `sort`:
  - asc: tri croissant
  - desc: tri décroissant
* `order` : type de tri
  - title: tri par nom de fichier
  - size: tri par taille de fichier
  - updated: tri par date de mise à jour
  - created: tri par date de création

### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
[
  {
  "id": 1,
  "customer_id": 1,
  "document_name": "contrat prestation.pdf",
  "document_size": 18884,
  "download_url": "https://www.facturation.pro/firms/FIRM_ID/assets/1/download",
  "title": "Facture n°1"
  },
  {
  "id": 2,
  "customer_id": 2,
  "document_name": "contrat vente.pdf",
  "document_size": 33442,
  "download_url": "https://www.facturation.pro/firms/FIRM_ID/assets/2/download",
  "title": "Facture n°2"
  }
]
{% endapi_block %}

## Liste des pièces jointes aux achats

{% assign request = site.data.urls.files.purchases -%}
### {{ request.method }} {{ request.url }}

Liste de toutes les pièces jointes aux achats, par groupe de {{ site.api.per_page }} résultats.<br/>

### Paramètres optionnels

* `page` : numéro de page
* `purchase_id` : ID de l'achat, cela permet de récupérer la liste des pièces jointes d'un achat spécifique, sachant que cette liste est aussi renvoyée dans la requête permettant d'obtenir le détail d'un achat.

#### Tri

Par défaut, les pièces jointes sont triées par ordre décroissant de création.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants
* `sort`:
  - asc: tri croissant
  - desc: tri décroissant
* `order` : type de tri
  - title: tri par nom de fichier
  - size: tri par taille de fichier
  - updated: tri par date de mise à jour
  - created: tri par date de création

### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
[
  {
  "id": 1,
  "purchase_id": 1,
  "document_name": "facture_123.pdf",
  "document_size": 18884,
  "download_url": "https://www.facturation.pro/firms/FIRM_ID/assets/1/download",
  "title": "Location serveur dédié"
  },
  {
  "id": 2,
  "purchase_id": 2,
  "document_name": "bill_321.pdf",
  "document_size": 33442,
  "download_url": "https://www.facturation.pro/firms/FIRM_ID/assets/2/download",
  "title": "Comptabilité 05/2014"
  }
]
{% endapi_block %}

## Ajouter un fichier

Pour ajouter une pièce jointe, consultez la documentation de la fonction `upload` pour chaque type de document:

* [devis](/api/devis/upload.html)
* [facture](/api/factures/upload.html)
* [achat](/api/achats/upload.html)
* [client](/api/clients/upload.html)

## Supprimer un fichier

{% assign request = site.data.urls.files.destroy -%}
### {{ request.method }} {{ request.url }}

Supprime le fichier identifié par son ID.

### Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}



# Fournisseurs

## Liste des fournisseurs

{% assign request = site.data.urls.suppliers.find -%}
### {{ request.method }} {{ request.url }}

liste des fournisseurs, par groupe de {{ site.api.per_page }} résultats.

### Paramètres optionnels

* `page` : numéro de page
* `api_id` : recherche exacte sur le champ api_id
* `api_custom` : recherche partielle sur le champ api_custom
* `company` : recherche partielle sur le nom de société
* `category_id`: recherche sur l'ID d'une catégorie spécifique (utiliser l'ID 0 pour retrouver les fournisseurs sans catégorie)
* `with_sepa`: par défaut, les données SEPA ne sont pas exportées. Seule la clé API de l'administrateur de la société permet d'exporter les données SEPA, et vous devez explicitement demander ces informations en utilisant la valeur 1.
* `country` : recherche sur le code pays
* `account_code` : recherche sur une partie du code du compte fournisseur (abonnement Entreprise)
* `accounting_entry` : recherche sur le code d'imputation par défaut (abonnement Entreprise)

#### Tri

Par défaut, les fournisseurs sont triés par ordre croissant de nom mnémotechnique.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants
* `sort` :
  - asc: tri croissant
  - desc: tri décroissant
* `order` : type de tri
  - created: tri par date de création
  - updated: tri par date de dernière modification

### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
[
  {
  "account_code": "401AMAZON",
  "category_id": 4855,
  "city": "",
  "civility": null,
  "company_name": "amazon",
  "country": null,
  "email": null,
  "fax": "",
  "first_name": "",
  "id": 49091,
  "last_name": "",
  "mobile": "",
  "notes": "",
  "phone": "",
  "short_name": "amazon",
  "siret": null,
  "street": "",
  "vat_number": null,
  "website": null,
  "zip_code": ""
  }, {
  "account_code": "401APPLE",
  "category_id": 4857,
  "city": "",
  "civility": null,
  "company_name": "apple",
  "country": null,
  "email": null,
  "fax": "",
  "first_name": "",
  "id": 49090,
  "last_name": "",
  "mobile": "",
  "notes": "",
  "phone": "",
  "short_name": "apple",
  "siret": null,
  "street": "",
  "vat_number": null,
  "website": null,
  "zip_code": ""
  }
]
{% endapi_block %}

## Créer un fournisseur

{% assign request = site.data.urls.suppliers.create -%}
### {{ request.method }} {{ request.url }}

Création d'un nouveau fournisseur. On obtient en retour le code JSON du fournisseur créé, avec l'ID qui lui a été attribué.

### Requête

{% api_block %}
{% curl_cmd write: true-%}
-X POST -d '{"company_name":"Office Depot"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
Status: 201 Created
Location: /firms/FIRM_ID/suppliers/49097.json

{
"account_code": "401OFFICEDE",
"category_id": null,
"city": null,
"civility": null,
"company_name": "Office Depot",
"country": null,
"email": null,
"fax": null,
"first_name": null,
"id": 49097,
"last_name": null,
"mobile": null,
"notes": null,
"phone": null,
"short_name": "Office Depot",
"siret": null,
"street": null,
"vat_number": null,
"website": null,
"zip_code": null
}
{% endapi_block %}

## Détails d'un fournisseur

{% assign request = site.data.urls.suppliers.show -%}
### {{ request.method }} {{ request.url }}

Obtenir le détail du fournisseur n°ID.

### Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
{
  "account_code": "401APPLE",
  "category_id": 4857,
  "city": "",
  "civility": null,
  "company_name": "apple",
  "country": null,
  "email": null,
  "fax": "",
  "first_name": "",
  "id": 49090,
  "last_name": "",
  "mobile": "",
  "notes": "",
  "phone": "",
  "short_name": "apple",
  "siret": null,
  "street": "",
  "vat_number": null,
  "website": null,
  "zip_code": ""
}
{% endapi_block %}

## Modifier un fournisseur

{% assign request = site.data.urls.suppliers.update -%}
### {{ request.method }} {{ request.url }}

Mise à jour d'un fournisseur existant.

### Requête

{% api_block %}
{% curl_cmd write: true -%}
-X PATCH -d '{"city":"Palo Alto","country":"US","street": "1 infinite loop"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Supprimer un fournisseur

{% assign request = site.data.urls.suppliers.destroy -%}
### {{ request.method }} {{ request.url }}

Supprime le fournisseur identifié par son ID, **ainsi que tous les achats associés** à ce fournisseur.

#### Remarque

Certains fournisseurs sont gérés automatiquement par l'application (RSI, URSSAF, Facturation.pro, ...) et ne peuvent pas être supprimé dès lors que des achats ont été enregistrés pour ce fournisseur. Ces fournisseurs sont créés (ou recréés en cas de suppression) par le système quand c'est nécessaire.

### Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Liste des champs

{% include fields.md fields=site.data.fields.supplier %}



# Catalogue produits

## Liste des produits

{% assign request = site.data.urls.products.find -%}
### {{ request.method }} {{ request.url }}

liste des produits, par groupe de {{ site.api.per_page }} résultats.

### Paramètres optionnels

* `page` : numéro de page
* `ref` : recherche partielle sur la référence produit
* `title` : recherche partielle sur le libellé du produit
* `api_id` : recherche exacte sur le champ api_id
* `api_custom` : recherche partielle sur le champ api_custom

#### Tri

Par défaut, les produits sont triés par ordre croissant de libellé.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants:
* `sort`:
  - asc: tri croissant
  - desc: tri décroissant
* `order` : type de tri
  - ref: tri par référence
  - created: tri par date de création d'un devis (ie date à laquelle l'enregistrement a été créé)
  - updated: tri par date de dernière modification d'un devis (ie date à laquelle l'enregistrement a été modifié pour la dernière fois)

### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
[
  {
  "api_custom": null,
  "api_id": null,
  "category_id": 4868,
  "id": 46125,
  "nature": 9,
  "ref": "PRESTASHOP",
  "title": "Developpement module Prestashop",
  "unit_price": "100.0",
  "vat": "0.200"
  }, {
  "api_custom": null,
  "api_id": null,
  "category_id": 4868,
  "id": 46126,
  "nature": 9,
  "ref": "WORDPRESS",
  "title": "Developpement module Wordpress",
  "unit_price": "150.0",
  "vat": "0.200"
  }
]
{% endapi_block %}

## Créer un produit

{% assign request = site.data.urls.products.create -%}
### {{ request.method }} {{ request.url }}

Création d'un nouveau produit. On obtient en retour le code JSON du produit créé, avec l'ID qui lui a été attribué.

### Requête

{% api_block %}
{% curl_cmd write: true-%}
-X POST -d '{"ref":"PAIMENT","title":"Developpement passerelle de paiement","unit_price":200.0,"vat":0.200}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
Status: 201 Created
Location: /firms/FIRM_ID/products/46127.json

{
  "id": 46127,
  "ref": "PAIMENT",
  "title": "Developpement passerelle de paiement",
  "unit_price": "200.0",
  "vat": "0.200"
}

{% endapi_block %}

## Détails d'un produit

{% assign request = site.data.urls.products.show -%}
### {{ request.method }} {{ request.url }}

Obtenir le détail du produitn° ID.

### Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
{
  "api_custom": null,
  "api_id": null,
  "category_id": 4868,
  "id": 1,
  "nature": 9,
  "ref": "PRESTASHOP",
  "title": "Developpement module Prestashop",
  "unit_price": "100.0",
  "vat": "0.200"
}
{% endapi_block %}

## Modifier un produit

{% assign request = site.data.urls.products.update -%}
### {{ request.method }} {{ request.url }}

Mise à jour d'un produit existant.

### Requête

{% api_block %}
{% curl_cmd write: true -%}
-X PATCH -d '{"title":"Optimisation module Prestashop","api_custom":"CUSTOM_SHOP"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Supprimer un produit

{% assign request = site.data.urls.products.destroy -%}
### {{ request.method }} {{ request.url }}

Supprime le produit identifié par son ID. Cette opération ne supprime pas les lignes de facturation associées à ce produit.

### Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Liste des champs

{% include fields.md fields=site.data.fields.product %}



# Règlements

## Liste des règlements

{% assign request = site.data.urls.settlements.find -%}
### {{ request.method }} {{ request.url }}

Liste les différents règlements enregistrés pour la facture n° INVOICE_ID.

### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
[
  {
  "id": 14064,
  "invoice_id": 1,
  "total": "1000.0",
  "payment_mode": 2,
  "paid_on": "2015-09-07",
  "payment_ref": null
  }, {
  "id": 14065,
  "invoice_id": 1,
  "total": "2000.0",
  "payment_mode": 4,
  "paid_on": "2015-09-03"
  "payement_ref": "ma référence"
  }
]
{% endapi_block %}

## Créer un règlement

{% assign request = site.data.urls.settlements.create -%}
### {{ request.method }} {{ request.url }}

Enregistre un nouveau règlement partiel pour la facture n° INVOICE_ID. On obtient en retour le code JSON du règlement créé, avec l'ID qui lui a été attribué

#### Remarque

Lorsque le règlement enregistré solde la facture, la facture est automatiquement marquée comme payée à la date et avec le mode de règlement du dernier règlement enregistré.

### Requête

{% api_block %}
{% curl_cmd write: true-%}
-X POST -d '{
"invoice_id": 1,
"total": "100.0",
"payment_mode": 1,
"paid_on": "2021-01-15",
"payment_ref": "XYZ"
}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
Status: 201 Created
Location: /firms/FIRM_ID/invoices/1/settlements/1.json

{
  "id": 1,
  "invoice_id": 1,
  "total": "100.0",
  "payment_mode": 1,
  "paid_on": "2021-01-15",
  "payment_ref": "XYZ"
  }
{% endapi_block %}

## Détails d'un règlement

{% assign request = site.data.urls.settlements.show -%}
### {{ request.method }} {{ request.url }}

Obtenir le détail du règlement n° ID pour la facture n° INVOICE_ID

### Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
{
  "id": 14064,
  "invoice_id": 1,
  "total": "1000.0",
  "payment_mode": 2,
  "paid_on": "2015-09-07",
  "payment_ref": null
}
{% endapi_block %}

## Supprimer un règlement

{% assign request = site.data.urls.settlements.destroy -%}
### {{ request.method }} {{ request.url }}

Supprime le règlement identifié par son ID. A noter que la suppression de l'un des règlements d'une facture entièrement soldée remet automatiquement la facture dans l'état "non payée".

### Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}



# Suivis commerciaux

## Liste des suivis commerciaux

{% assign request = site.data.urls.followups.find -%}
### {{ request.method }} {{ request.url }}

liste des suivis commerciaux, par groupe de {{ site.api.per_page }} résultats.

### Paramètres optionnels

* `page` : numéro de page
* `title` : recherche partielle sur le libellé du suivi
* `status` : rechercher par type de suivi (i.e. type d'affectation)

#### Remarques:

Il existe deux codes de suivis gérés par le système, qui sont non modifiables et non supprimables, et qui n'apparaissent donc pas dans la liste des suivis que vous avez défini. Il s'agit des codes suivants:

* En cours (id: 0)
* Terminé (id: -1)

Ces codes s'utilisent sur les devis et les factures comme n'importe lequel de vos suivis personnalisés, en utilisant l'id indiqué ci dessus dans le champs `followup_id` du devis ou de la facture.

### Requête

{% api_block %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
[
  {
  "id": 4866,
  "status": 1,
  "title": "A facturer"
  }, {
  "id": 4867,
  "status": 0,
  "title": "A relancer"
  }, {
  "id": 4857,
  "status": 2,
  "title": "Envoyer produits"
  }
]
{% endapi_block %}

## Créer un suivi commercial

{% assign request = site.data.urls.followups.create -%}
### {{ request.method }} {{ request.url }}

Création d'un nouveau suivi commercial. On obtient en retour le code JSON du suivi créé, avec l'ID qui lui a été attribué.

### Requête

{% api_block %}
{% curl_cmd write: true-%}
-X POST -d '{"title":"En attente de réponse","status":"1"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
Status: 201 Created
Location: /firms/FIRM_ID/followups/1234.json

{
  "id": 1234,
  "status": 1,
  "title": "En attente de réponse"
}
{% endapi_block %}

## Détails d'un suivi commercial

{% assign request = site.data.urls.followups.show -%}
### {{ request.method }} {{ request.url }}

Obtenir le détail du suivi commercial n° ID.

### Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') -%}
{
  "id": 1,
  "status": 1,
  "title": 'En attente de facturation'
}
{% endapi_block %}

## Modifier un suivi commercial

{% assign request = site.data.urls.followups.update -%}
### {{ request.method }} {{ request.url }}

Mise à jour d'un suivi commercial existante.

### Requête

{% api_block %}
{% curl_cmd write: true -%}
-X PATCH -d '{"title":"Relancer le client","status":"2"}' \
"{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Supprimer un suivi commercial

{% assign request = site.data.urls.followups.destroy -%}
### {{ request.method }} {{ request.url }}

Supprime le suivi commercial identifié par son ID. Cette opération ne supprime pas les documents rattachés à ce suivi.

### Requête

{% api_block %}
{% curl_cmd -%}
-X DELETE "{{ request.url | api_url }}"
{% endapi_block %}

### Réponse

{% api_block('json') %}
Status: 200 OK
{% endapi_block %}

## Liste des champs

{% include fields.md fields=site.data.fields.followup %}



# Valeurs spécifiques

## language

{% include values.md entries=site.data.specific.language.data field='language' %}

## currency

Voici la liste des toutes les devises utilisables dans notre outil

{% include values.md entries=site.data.specific.currency.data field='currency' %}

## payment_mode (facture)

Voici les valeurs spécifiques de modes de règlement pour une vente

{% include values.md entries=site.data.specific.payment_mode_bill.data field='payment_mode' %}

## payment_mode (achat)

Voici les valeurs spécifiques de modes de règlement pour un achat

{% include values.md entries=site.data.specific.payment_mode_purchase.data field='payment_mode' %}

## pay_before

Voici les valeurs spécifiques des délais de paiement

{% include values.md entries=site.data.specific.pay_before.data field='pay_before' %}


**Remarque**

Si vous avez définit des valeurs personnalisées de délais de règlement, les valeurs correspondantes sont documentées directement dans la page de gestion des délais personnalisés (i.e. dans la rubrique Paramètres / Facturation)

## nature

Voici les différentes nature possible pour les lignes de facturation lorsque vous gérez une auto-entreprise ou une micro-entreprise

{% include values.md entries=site.data.specific.nature.data field='nature' %}

## status (catégorie)

Voici les valeurs spécifiques d'affectation pour une catégorie

{% include values.md entries=site.data.specific.status_category.data field='status' %}

## status (suivi commercial)

Voici les valeurs spécifiques d'affectation pour un suivi commercial

{% include values.md entries=site.data.specific.status_followup.data field='status' %}

## quote_status

Voici les valeurs spécifiques d'état d'un devis

{% include values.md entries=site.data.specific.quote_status.data field='quote_status' %}



# Personnalisation des contenus

## Facture

Les informations spécifiques à une facture sont disponibles via l'objet `bill`.


| Attribut | Infos |
|:---------|:------|
{% for item in site.data.invoice -%}
| \{\{ bill.{{ item.key }} \}\} | {{ item.title }}|
{% endfor %}

## Devis

Les informations spécifiques à un devis sont disponibles via l'objet `bill`.

| Attribut | Infos |
|:---------|:------|
{% for item in site.data.quote -%}
| \{\{ bill.{{ item.key }} \}\} | {{ item.title }}|
{% endfor %}

## Client

Les informations spécifiques à un client sont disponibles via l'objet `customer`.
Cet objet n'est disponible que dans un contexte où vous manipulez un devis ou une facture.


| Attribut | Infos |
|:---------|:------|
{% for item in site.data.customer -%}
| \{\{ customer.{{ item.key }} \}\} | {{ item.title }}|
{% endfor %}

## Dates

Notre outil vous propose différentes périodes qui sont calculées par rapport à la date de facturation (ou de génération dans le cas d'une facture récurrente ou d'un achat récurrent), via l'objet `period`.

| Attribut | Infos | Exemple |
|:---------|:------|:--------|
{% for item in site.data.dates -%}
| \{\{ period.{{ item.key }} \}\} | {{ item.title }} | {{ item.example }}|
{% endfor %}


### Déboguer

Pour tester ou déboguer vos requêtes API, nous vous recommandons d'utiliser le service [WebhookApp](https://www.webhookapp.com/) qui vous permet de construire, d'exécuter et de sauvegarder facilement des requêtes API, et d'accéder à l'ensemble des informations retournées pour chaque requête (headers, contenu, etc.). Ce service vous permet aussi de <strong>partager les requêtes qui vous posent problème avec notre support</strong> : nous sommes ainsi en mesure de mieux vous guider lorsque vous rencontrez un problème d'utilisation avec notre API.

Pour configurer vos tests sur cet outil, vous devez ajouter un nouveau "hook" et le configurer avec le mode "An API, Forward and Track Requests", en utilisant comme valeur pour le champ target `https://www.facturation.pro/` et en cochant la case "Rewrite host"

Si besoin, il existe des services alternatifs plus ou moins évolués tel que [hookdeck.com](https://hookdeck.com/) ou bien [RequestBin](https://requestbin.com/) pour déboguer vos requêtes.

### Librairies

Notre API est de type REST, et elle est compatible [ActiveResource](https://github.com/rails/activeresource) :

- En Ruby ou Rails, vous pouvez utiliser [cette librairie](https://www.facturation.pro/facturation.rb)
- [Unirest](http://unirest.io/) propose des librairies en PHP, Java, Ruby, Python et Objective-C pour utiliser facilement une API REST telle que la notre.
- En PHP, il existe des librairies qui permettent de s'interconnecter avec une API de type ActiveResource (cf. [ActiveResource](https://github.com/Indatus/ActiveResource) ou bien [PhpActiveResource](https://github.com/phurni/PhpActiveResource)).

### Librairies tierces

Voici une liste de librairies et d'extensions développées par des tiers qui peuvent vous aider à vous interconnecter avec MonAE et MaTPE. Cette liste est fournie à titre d'information, sans aucune garantie de notre part, et pour toute question au sujet de l'une de ces librairies (fonctionnement, bugs, commercialisation, ...), vous devez vous adresser directement à l'auteur concerné.

- Module [Prestashop](https://store.comexpertise.com/modules/prestashop/facturation.pro-monae-matpe/)
- Module [WooCommerce](https://wpfacturationpro.fr/)
- [PHPmonAE](https://github.com/Atome-TM/PHPmonAE) : librairie PHP.
- Bundle pour [PHP Symfony 3](https://github.com/Tiloweb/tiloweb-matpe) et [Symphony 4](https://github.com/Isoka/monae-symfony4-service)
- Package [Laravel](https://github.com/atome-dev/laravel-facturationpro-api)

Si vous avez construit une librairie ou une extension publique, n'hésitez pas à nous le faire savoir pour qu'elle soit ajoutée sur cette page.
