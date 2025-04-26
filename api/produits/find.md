---
layout: default
nav_title: 'lister'
title: 'Liste des produits'
parent: 'Catalogue produits'
nav_order: 100
---
{% assign request = site.data.urls.products.find -%}
## {{ request.method }} {{ request.url }}

liste des produits, par groupe de {{ site.api.per_page }} résultats.

## Paramètres optionnels

* `page` : numéro de page
* `ref` : recherche partielle sur la référence produit
* `title` : recherche partielle sur le libellé du produit
* `api_id` : recherche exacte sur le champ api_id
* `api_custom` : recherche partielle sur le champ api_custom

### Tri

Par défaut, les produits sont triés par ordre croissant de libellé.
Vous pouvez trier les résultats selon différentes méthodes en utilisant les paramètres suivants:
* `sort`:
  - asc: tri croissant
  - desc: tri décroissant
* `order` : type de tri
  - ref: tri par référence
  - created: tri par date de création d'un devis (ie date à laquelle l'enregistrement a été créé)
  - updated: tri par date de dernière modification d'un devis (ie date à laquelle l'enregistrement a été modifié pour la dernière fois)

## Requête

{% api_block 'shell' %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'json' %}
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
  },
  {
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
