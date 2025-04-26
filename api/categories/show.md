---
layout: default
nav_title: détails
title: Détails d'une catégorie
parent: 'Catégories'
nav_order: 300
---
{% assign request = site.data.urls.categories.show -%}
## {{ request.method }} {{ request.url }}

Obtenir le détail de la catégorie n° ID.

## Requête

{% api_block 'shell' %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'json' -%}
{
  "id": 1,
  "status": 2,
  "title": "Affranchissement"
}
{% endapi_block %}
