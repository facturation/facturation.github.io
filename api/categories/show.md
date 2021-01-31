---
layout: default
title: détails
custom_title: Détails d'une catégorie
parent: 'Catégories'
nav_order: 300
---
{% assign request = site.data.urls.categories.show -%}
## {{ request.method }} {{ request.url }}

Obtenir le détail de la catégorie n° ID.

## Requête

{% api_block %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block('json') -%}
{
"id": <%= api_category.id %>,
"status": 2,
"title": "Affranchissement"
}
{% endapi_block %}
