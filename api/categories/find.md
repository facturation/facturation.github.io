---
layout: default
nav_title: 'lister'
title: 'Liste des catégories'
parent: 'Catégories'
nav_order: 100
---
{% assign request = site.data.urls.categories.find -%}
## {{ request.method }} {{ request.url }}


liste des catégories, par groupe de {{ site.api.per_page }} résultats.

## Paramètres optionnels

* `page` : numéro de page
* `title` : recherche partielle sur le libellé de la catégorie
* `status` : rechercher par type de catégorie (i.e. type d'affectation)

## Requête

{% api_block 'shell' %}
{% curl_cmd %} "{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'json' %}
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
