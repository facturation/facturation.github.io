---
layout: default
nav_title: détails
title: Détails d'un suivi commercial
parent: 'Suivis commerciaux'
nav_order: 300
---
{% assign request = site.data.urls.followups.show -%}
## {{ request.method }} {{ request.url }}

Obtenir le détail du suivi commercial n° ID.

## Requête

{% api_block 'shell' %}
{% curl_cmd -%}
"{{ request.url | api_url }}"
{% endapi_block %}

## Réponse

{% api_block 'json' -%}
{
  "id": 1,
  "status": 1,
  "title": "En attente de facturation"
}
{% endapi_block %}
