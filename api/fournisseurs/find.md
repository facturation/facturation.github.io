---
layout: default
nav_title: 'lister'
title: 'Liste des fournisseurs'
parent: 'Fournisseurs'
nav_order: 100
---
{% assign request = site.data.urls.suppliers.find -%}
## {{ request.method }} {{ request.url }}

liste des fournisseurs, par groupe de {{ site.api.per_page }} résultats.

## Paramètres optionnels

* `page` : numéro de page
* `api_id` : recherche exacte sur le champ api_id
* `api_custom` : recherche partielle sur le champ api_custom
* `company` : recherche partielle sur le nom de société
* `category_id`: recherche sur l'ID d'une catégorie spécifique (utiliser l'ID 0 pour retrouver les fournisseurs sans catégorie)
* `with_sepa`: par défaut, les données SEPA ne sont pas exportées. Seule la clé API de l'administrateur de la société permet d'exporter les données SEPA, et vous devez explicitement demander ces informations en utilisant la valeur 1.
* `country` : recherche sur le code pays
* `account_code` : recherche sur une partie du code du compte fournisseur (abonnement Entreprise)
* `accounting_entry` : recherche sur le code d'imputation par défaut (abonnement Entreprise)

### Tri

Par défaut, les fournisseurs sont triés par ordre croissant de nom mnémotechnique.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants
* `sort` :
  - asc: tri croissant
  - desc: tri décroissant
* `order` : type de tri
  - created: tri par date de création
  - updated: tri par date de dernière modification

### Obtention d'enregistrements spécifiques

Vous avez la possibilité d'obtenir un ensemble de fournisseurs spécifiques en transmettant une liste d'ID séparés par une virgule dans le champ `ids` (vous pouvez aussi transmettre un tableau d'ID). Dans ce cas, tous les paramètres optionnels sont ignorés à l'exception des paramètres de tri et de pagination.


## Requête

{% api_block 'shell' %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'json' %}
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
  },
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
]
{% endapi_block %}
